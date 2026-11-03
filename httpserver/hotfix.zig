const std = @import("std");
const Io = std.Io;
const json = std.json;
const Allocator = std.mem.Allocator;

const proto = @import("protocol");
const log = std.log.scoped(.httpserver);

pub const Hotfix = struct {
    asset_bundle_url: []const u8 = "",
    ex_resource_url: []const u8 = "",
    lua_url: []const u8 = "",
    ifix_url: []const u8 = "",
};

const HotfixInfo = struct {
    Region: []const u8 = "None",
    HotfixData: json.ArrayHashMap(Hotfix) = .{},
};

pub fn GetLocalHotfix(io: Io, allocator: Allocator, version: []const u8) !?Hotfix {
    const file_bytes = try std.Io.Dir.cwd().readFileAlloc(io, "config/hotfix.json", allocator, .unlimited);
    defer allocator.free(file_bytes);

    const parsed_hotfix = try json.parseFromSliceLeaky(HotfixInfo, allocator, file_bytes, .{
        .ignore_unknown_fields = true,
        .allocate = .alloc_always,
    });

    const hotfix = parsed_hotfix.HotfixData.map.get(version) orelse return null;
    if (hotfix.asset_bundle_url.len == 0) return null;

    return hotfix;
}

pub fn PutHotfix(io: Io, allocator: Allocator, version: []const u8, hotfix: Hotfix) !void {
    const file_bytes = try std.Io.Dir.cwd().readFileAlloc(io, "config/hotfix.json", allocator, .unlimited);
    defer allocator.free(file_bytes);

    var parsed_hotfix = try json.parseFromSliceLeaky(HotfixInfo, allocator, file_bytes, .{
        .ignore_unknown_fields = true,
        .allocate = .alloc_always,
    });

    try parsed_hotfix.HotfixData.map.put(allocator, version, hotfix);

    var out: Io.Writer.Allocating = .init(allocator);
    try json.Stringify.value(parsed_hotfix, .{ .whitespace = .indent_4 }, &out.writer);

    try Io.Dir.cwd().writeFile(io, .{
        .sub_path = "config/hotfix.json",
        .data = out.written(),
    });
}

pub fn FetchHotfix(
    io: Io,
    allocator: Allocator,
    version: []const u8,
    dispatch_seed: []const u8,
) !?Hotfix {
    if (version.len == 0) return null;

    const base_url = GetGateWayUrl(version) orelse return null;
    const full_url = try std.fmt.allocPrint(allocator, "{s}?version={s}&dispatch_seed={s}&language_type=1&platform_type=2&channel_id=1&sub_channel_id=1&is_need_url=1&account_type=1", .{ base_url, version, dispatch_seed });

    log.info("fetching hotfix from {s}", .{version});

    var client: std.http.Client = .{ .allocator = allocator, .io = io };
    defer client.deinit();

    var body: Io.Writer.Allocating = .init(allocator);
    const result = try client.fetch(.{
        .location = .{ .url = full_url },
        .response_writer = &body.writer,
    });

    if (result.status != .ok) {
        log.warn("gateway status: {t}", .{result.status});
        return null;
    }

    const encoded = std.mem.trim(u8, body.written(), "\r\n\t");
    if (encoded.len == 0) return null;

    const decoder = std.base64.standard.Decoder;
    const decoded_bytes = try allocator.alloc(u8, try decoder.calcSizeForSlice(encoded));
    try decoder.decode(decoded_bytes, encoded);

    var reader: Io.Reader = .fixed(decoded_bytes);
    const gateway = try proto.GateServer.decode(&reader, allocator);

    if (gateway.asset_bundle_url.len == 0) return null;

    const hotfix: Hotfix = .{
        .asset_bundle_url = gateway.asset_bundle_url,
        .ex_resource_url = gateway.ex_resource_url,
        .lua_url = gateway.lua_url,
        .ifix_url = gateway.ifix_url,
    };

    try PutHotfix(io, allocator, version, hotfix);
    return hotfix;
}

fn GetGateWayUrl(version: []const u8) ?[]const u8 {
    if (std.ascii.startsWithIgnoreCase(version, "CNPROD")) {
        return "https://prod-gf-cn-dp01.bhsr.com/query_gateway";
    }
    if (std.ascii.startsWithIgnoreCase(version, "CNBETA")) {
        return "https://beta-release01-cn.bhsr.com/query_gateway";
    }
    if (std.ascii.startsWithIgnoreCase(version, "OSPROD")) {
        return "https://prod-official-asia-dp01.starrails.com/query_gateway";
    }
    if (std.ascii.startsWithIgnoreCase(version, "OSBETA")) {
        return "https://beta-release01-asia.starrails.com/query_gateway";
    }

    return null;
}
