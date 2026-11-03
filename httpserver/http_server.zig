const std = @import("std");
const Io = std.Io;
const httpz = @import("httpz");

const proto = @import("protocol");
const http_server = @import("http_server.zig");
const hotfix = @import("hotfix.zig");
const login = @import("login.zig");
const log = std.log.scoped(.httpserver);

const Address = "127.0.0.1";
const Port = 1017;

pub fn run(io: Io, allocator: std.mem.Allocator) !void {
    var server = try httpz.Server(Io).init(io, allocator, .{ .address = .localhost(Port) }, io);
    defer {
        server.stop();
        server.deinit();
    }

    var router = try server.router(.{});

    router.get("/query_dispatch", queryDispatch, .{});
    router.get("/query_gateway", queryGateWay, .{});

    router.post("/account/risky/api/check", login.riskyCheck, .{});
    router.post("/:game_key/mdk/shield/api/login", login.shieldLogin, .{});
    router.post("/:game_key/mdk/shield/api/verify", login.shieldVerify, .{});
    router.post("/:game_key/account/ma-passport/api/appLoginByPassword", login.passportLogin, .{});
    router.post("/account/ma-cn-passport/app/loginByPassword", login.passportLogin, .{});
    router.post("/account/ma-cn-session/app/verify", login.sessionVerify, .{});
    router.post("/:game_key/combo/granter/login/v2/login", login.comboTokenLogin, .{});

    log.info("httpserver is listening at localhost:{d}", .{Port});
    try server.listen();
}

pub fn queryDispatch(_: Io, req: *httpz.Request, res: *httpz.Response) !void {
    log.info("{s}", .{req.url.path});

    var dispatch: proto.Dispatch = .{};

    const dispatch_url = try std.fmt.allocPrint(res.arena, "http://{s}:{d}/query_gateway", .{ Address, Port });

    try dispatch.region_list.append(res.arena, .{
        .name = "yukiino",
        .dispatch_url = dispatch_url,
        .env_type = "9",
        .display_name = "YukiinoServer",
    });

    res.body = try encodeMessage(res.arena, dispatch);
}

pub fn queryGateWay(io: Io, req: *httpz.Request, res: *httpz.Response) !void {
    log.info("{s}", .{req.url.path});

    var gate_way: proto.GateServer = .{
        .ip = Address,
        .port = 23301,
        .enable_design_data_bundle_version_update = true,
    };

    const query = try req.query();
    const version = query.get("version") orelse "";
    const dispatch_seed = query.get("dispatch_seed") orelse "";

    const hotfixs = (try hotfix.GetLocalHotfix(io, res.arena, version)) orelse
        (try hotfix.FetchHotfix(io, res.arena, version, dispatch_seed));

    if (hotfixs) |info| {
        gate_way.asset_bundle_url = info.asset_bundle_url;
        gate_way.ex_resource_url = info.ex_resource_url;
        gate_way.lua_url = info.lua_url;
        gate_way.ifix_url = info.ifix_url;
    } else {
        log.warn("no suitable hotfix found for version: {s}", .{version});
    }

    res.body = try encodeMessage(res.arena, gate_way);
}

fn encodeMessage(allocator: std.mem.Allocator, message: anytype) ![]const u8 {
    var encoded: Io.Writer.Allocating = .init(allocator);
    try message.encode(&encoded.writer, allocator);

    const bytes = encoded.written();
    const encoder = std.base64.standard.Encoder;
    const text = try allocator.alloc(u8, encoder.calcSize(bytes.len));

    return encoder.encode(text, bytes);
}

test {
    _ = login;
}
