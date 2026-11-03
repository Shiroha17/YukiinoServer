const std = @import("std");
const Io = std.Io;
const json = std.json;
const httpz = @import("httpz");
const database = @import("database");

const account = database.account;
const log = std.log.scoped(.httpserver);

const default_email = "Yukiino@StarRail.com";

const ShieldLoginReq = struct {
    account: []const u8 = "",
    password: []const u8 = "",
    is_crypto: bool = false,
};

const PassportLoginReq = struct {
    account: []const u8 = "",
    password: []const u8 = "",
};

const ShieldVerifyReq = struct {
    uid: []const u8 = "",
    token: []const u8 = "",
};

const SessionVerifyReq = struct {
    mid: []const u8 = "",
    token: ?struct {
        token: []const u8 = "",
    } = null,
};

const ComboLoginReq = struct {
    app_id: i32 = 0,
    channel_id: i32 = 0,
    data: []const u8 = "",
    device: []const u8 = "",
    sign: []const u8 = "",
};

const ComboLoginData = struct {
    uid: []const u8 = "",
    token: []const u8 = "",
    guest: bool = false,
};

const ShieldLoginRes = struct {
    message: []const u8,
    retcode: i32,
    data: ?VerifyData = null,

    pub const VerifyData = struct {
        account: VerifyAccountData,
        device_grant_required: bool = false,
        realname_operation: []const u8 = "NONE",
        realperson_required: bool = false,
        safe_mobile_required: bool = false,
    };

    pub const VerifyAccountData = struct {
        uid: []const u8 = "",
        name: []const u8 = "",
        email: []const u8 = default_email,
        mobile: []const u8 = "",
        is_email_verify: []const u8 = "1",
        realname: []const u8 = "",
        identity_card: []const u8 = "",
        token: []const u8 = "",
        safe_mobile: []const u8 = "",
        facebook_name: []const u8 = "",
        twitter_name: []const u8 = "",
        game_center_name: []const u8 = "",
        google_name: []const u8 = "",
        apple_name: []const u8 = "",
        sony_name: []const u8 = "",
        tap_name: []const u8 = "",
        country: []const u8 = "US",
        reactivate_ticket: []const u8 = "",
        area_code: []const u8 = "**",
        device_grant_ticket: []const u8 = "",
    };
};

const PassportLoginRes = struct {
    message: []const u8,
    retcode: i32,
    data: ?VerifyData = null,

    pub const VerifyData = struct {
        user_info: UserInfoData,
        token: TokenData,
    };

    pub const UserInfoData = struct {
        account_name: []const u8 = "",
        aid: []const u8 = "",
        area_code: []const u8 = "",
        country: []const u8 = "",
        email: []const u8 = default_email,
        is_email_verify: i32 = 1,
        identity_code: []const u8 = "",
        links: []const LinkData = &.{.{}},
        mid: []const u8 = "",
        mobile: []const u8 = "",
        realname: []const u8 = "",
        rebind_area_code: []const u8 = "",
        rebind_mobile: []const u8 = "",
        rebind_mobile_time: []const u8 = "",
        safe_area_code: []const u8 = "",
        safe_mobile: []const u8 = "",
    };

    pub const TokenData = struct {
        token: []const u8 = "",
        token_type: i32 = 1,
    };

    pub const LinkData = struct {
        nickname: []const u8 = "",
        thirdparty: []const u8 = "",
        union_id: []const u8 = "",
    };
};

const SessionVerifyRes = struct {
    message: []const u8,
    retcode: i32,
    data: ?SessionVerifyData = null,

    pub const SessionVerifyData = struct {
        tokens: TokenData,
        user_info: UserInfoData,
    };

    pub const TokenData = struct {
        token: []const u8 = "",
        token_type: i32 = 1,
    };

    pub const UserInfoData = struct {
        aid: []const u8 = "",
        mid: []const u8 = "",
        is_email_verify: i32 = 1,
        area_code: []const u8 = "",
        country: []const u8 = "",
        is_adult: i32 = 1,
        email: []const u8 = default_email,
    };
};

const ComboTokenRes = struct {
    message: []const u8,
    retcode: i32,
    data: ?LoginData = null,

    pub const LoginData = struct {
        account_type: i32 = 1,
        heartbeat: bool = false,
        combo_id: []const u8 = "",
        combo_token: []const u8 = "",
        open_id: []const u8 = "",
        data: []const u8 = "{\"guest\":false}",
        fatigue_remind: ?[]const u8 = null,
    };
};

pub fn riskyCheck(_: Io, req: *httpz.Request, res: *httpz.Response) !void {
    log.info("{s}", .{req.url.path});

    try res.json(.{
        .retcode = 0,
        .message = "OK",
        .data = .{
            .id = "none",
            .action = "ACTION_NONE",
            .geetest = @as(?[]const u8, null),
        },
    }, .{});
}

pub fn shieldLogin(io: Io, req: *httpz.Request, res: *httpz.Response) !void {
    log.info("{s}", .{req.url.path});

    const body = (try parseBodyJson(ShieldLoginReq, req)) orelse ShieldLoginReq{};
    if (!account.isValidUsername(body.account)) {
        try res.json(ShieldLoginRes{
            .retcode = -201,
            .message = "Use a plaintext account name (1-64 characters); apply the SDK account patch",
            .data = null,
        }, .{});
        return;
    }

    const acc = try account.getOrCreateByUsername(io, res.arena, body.account);
    const token = try account.generateDispatchToken(io, res.arena, acc.uid);
    const uid_str = try std.fmt.allocPrint(res.arena, "{d}", .{acc.uid});

    try res.json(ShieldLoginRes{
        .retcode = 0,
        .message = "OK",
        .data = .{
            .account = .{
                .uid = uid_str,
                .name = acc.username,
                .token = token,
            },
        },
    }, .{});
}

pub fn passportLogin(io: Io, req: *httpz.Request, res: *httpz.Response) !void {
    log.info("{s}", .{req.url.path});

    const body = (try parseBodyJson(PassportLoginReq, req)) orelse PassportLoginReq{};
    if (!account.isValidUsername(body.account)) {
        try res.json(PassportLoginRes{
            .retcode = -201,
            .message = "Use a plaintext account name (1-64 characters); apply the SDK account patch",
            .data = null,
        }, .{});
        return;
    }

    const acc = try account.getOrCreateByUsername(io, res.arena, body.account);
    const token = try account.generateDispatchToken(io, res.arena, acc.uid);
    const uid_str = try std.fmt.allocPrint(res.arena, "{d}", .{acc.uid});

    try res.json(PassportLoginRes{
        .retcode = 0,
        .message = "OK",
        .data = .{
            .user_info = .{
                .account_name = acc.username,
                .aid = uid_str,
                .mid = uid_str,
            },
            .token = .{
                .token = token,
            },
        },
    }, .{});
}

pub fn shieldVerify(io: Io, req: *httpz.Request, res: *httpz.Response) !void {
    log.info("{s}", .{req.url.path});

    const body = (try parseBodyJson(ShieldVerifyReq, req)) orelse ShieldVerifyReq{};
    const uid = std.fmt.parseInt(u32, body.uid, 10) catch 0;
    const acc = if (uid > 0) try account.getByUid(io, res.arena, uid) else null;

    if (acc == null or body.token.len == 0 or !std.mem.eql(u8, acc.?.dispatch_token, body.token)) {
        try res.json(ShieldLoginRes{
            .retcode = -201,
            .message = "Game account cache information error",
            .data = null,
        }, .{});
        return;
    }

    const uid_str = try std.fmt.allocPrint(res.arena, "{d}", .{acc.?.uid});
    try res.json(ShieldLoginRes{
        .retcode = 0,
        .message = "OK",
        .data = .{
            .account = .{
                .uid = uid_str,
                .name = acc.?.username,
                .token = body.token,
            },
        },
    }, .{});
}

pub fn sessionVerify(io: Io, req: *httpz.Request, res: *httpz.Response) !void {
    log.info("{s}", .{req.url.path});

    const body = (try parseBodyJson(SessionVerifyReq, req)) orelse SessionVerifyReq{};
    const req_token = if (body.token) |t| t.token else "";
    const uid = std.fmt.parseInt(u32, body.mid, 10) catch 0;
    const acc = if (uid > 0) try account.getByUid(io, res.arena, uid) else null;

    if (acc == null or req_token.len == 0 or !std.mem.eql(u8, acc.?.dispatch_token, req_token)) {
        try res.json(SessionVerifyRes{
            .retcode = -100,
            .message = "Login expired, please log in again",
            .data = null,
        }, .{});
        return;
    }

    const uid_str = try std.fmt.allocPrint(res.arena, "{d}", .{acc.?.uid});
    try res.json(SessionVerifyRes{
        .retcode = 0,
        .message = "OK",
        .data = .{
            .tokens = .{
                .token = req_token,
            },
            .user_info = .{
                .aid = uid_str,
                .mid = uid_str,
            },
        },
    }, .{});
}

pub fn comboTokenLogin(io: Io, req: *httpz.Request, res: *httpz.Response) !void {
    log.info("{s}", .{req.url.path});

    const body = (try parseBodyJson(ComboLoginReq, req)) orelse ComboLoginReq{};
    if (body.data.len == 0) {
        try res.json(ComboTokenRes{
            .retcode = -202,
            .message = "Invalid login data",
            .data = null,
        }, .{});
        return;
    }

    const token_data = json.parseFromSliceLeaky(ComboLoginData, res.arena, body.data, .{
        .ignore_unknown_fields = true,
    }) catch {
        try res.json(ComboTokenRes{
            .retcode = -202,
            .message = "Invalid login data",
            .data = null,
        }, .{});
        return;
    };

    const uid = std.fmt.parseInt(u32, token_data.uid, 10) catch 0;
    const acc = if (uid > 0) try account.getByUid(io, res.arena, uid) else null;

    if (acc == null or token_data.token.len == 0 or
        (!std.mem.eql(u8, token_data.token, acc.?.dispatch_token) and
            !std.mem.eql(u8, token_data.token, acc.?.combo_token)))
    {
        try res.json(ComboTokenRes{
            .retcode = -201,
            .message = "Game account cache information error",
            .data = null,
        }, .{});
        return;
    }

    const combo_token = try account.generateComboToken(io, res.arena, acc.?.uid);
    const uid_str = try std.fmt.allocPrint(res.arena, "{d}", .{acc.?.uid});

    try res.json(ComboTokenRes{
        .retcode = 0,
        .message = "OK",
        .data = .{
            .combo_id = uid_str,
            .open_id = uid_str,
            .combo_token = combo_token,
        },
    }, .{});
}

fn parseBodyJson(comptime T: type, req: *httpz.Request) !?T {
    const raw_body = req.body() orelse return null;
    if (raw_body.len == 0) {
        return null;
    }
    return try json.parseFromSliceLeaky(T, req.arena, raw_body, .{
        .ignore_unknown_fields = true,
    });
}

test "http login and account persistence flow" {
    const io = std.testing.io;
    try database.initMemory(std.testing.allocator);
    defer database.deinit();

    // 1. Shield login (auto-creates account 10001)
    var dispatch_token: []const u8 = "";
    {
        var ht = httpz.testing.init(.{});
        defer ht.deinit();

        ht.url("/hkrpg_cn/mdk/shield/api/login");
        ht.json(.{ .account = "yukiino", .password = "123", .is_crypto = true });

        try shieldLogin(io, ht.req, ht.res);
        try ht.expectStatus(200);

        const body = try ht.getBody();
        const parsed = try json.parseFromSliceLeaky(ShieldLoginRes, ht.arena, body, .{
            .ignore_unknown_fields = true,
        });
        try std.testing.expectEqual(@as(i32, 0), parsed.retcode);
        try std.testing.expectEqualStrings("10001", parsed.data.?.account.uid);
        try std.testing.expectEqualStrings("yukiino", parsed.data.?.account.name);
        try std.testing.expect(parsed.data.?.account.token.len > 0);
        dispatch_token = try std.testing.allocator.dupe(u8, parsed.data.?.account.token);
    }
    defer std.testing.allocator.free(dispatch_token);

    // 2. Shield verify with valid token
    {
        var ht = httpz.testing.init(.{});
        defer ht.deinit();

        ht.url("/hkrpg_cn/mdk/shield/api/verify");
        ht.json(.{ .uid = "10001", .token = dispatch_token });

        try shieldVerify(io, ht.req, ht.res);
        try ht.expectStatus(200);

        const body = try ht.getBody();
        const parsed = try json.parseFromSliceLeaky(ShieldLoginRes, ht.arena, body, .{
            .ignore_unknown_fields = true,
        });
        try std.testing.expectEqual(@as(i32, 0), parsed.retcode);
        try std.testing.expectEqualStrings("10001", parsed.data.?.account.uid);
    }

    // 3. Combo token v2 login
    {
        var ht = httpz.testing.init(.{});
        defer ht.deinit();

        const nested = try std.fmt.allocPrint(
            ht.arena,
            "{{\"uid\":\"10001\",\"token\":\"{s}\",\"guest\":false}}",
            .{dispatch_token},
        );
        ht.url("/hkrpg_cn/combo/granter/login/v2/login");
        ht.json(.{
            .app_id = 1,
            .channel_id = 1,
            .data = nested,
            .device = "dev",
            .sign = "sig",
        });

        try comboTokenLogin(io, ht.req, ht.res);
        try ht.expectStatus(200);

        const body = try ht.getBody();
        const parsed = try json.parseFromSliceLeaky(ComboTokenRes, ht.arena, body, .{
            .ignore_unknown_fields = true,
        });
        try std.testing.expectEqual(@as(i32, 0), parsed.retcode);
        try std.testing.expectEqualStrings("10001", parsed.data.?.open_id);
        try std.testing.expect(parsed.data.?.combo_token.len > 0);
    }
}
