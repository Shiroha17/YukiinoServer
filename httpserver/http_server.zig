const std = @import("std");
const Io = std.Io;

const proto = @import("protocol");
const log = std.log.scoped(.httpserver);

const Address = "127.0.0.1";
const Port = 1017;

pub fn run(io: Io, gpa: std.mem.Allocator) !void {
    const address = try Io.net.IpAddress.parseIp4(Address, Port);
    var server = try address.listen(io, .{ .reuse_address = true });
    defer server.deinit(io);

    log.info("httpserver is listening on {s}: {d}", .{ Address, Port });

    var group: Io.Group = .init;
    defer group.cancel(io);

    while (true) {
        const stream = try server.accept(io);

        try group.concurrent(io, handleConnection, .{ io, stream, gpa });
    }
}

fn handleConnection(io: Io, stream: Io.net.Stream, gpa: std.mem.Allocator) void {
    defer stream.close(io);

    var write_buffer: [8192]u8 = undefined;
    var read_buffer: [8192]u8 = undefined;

    var writer = stream.writer(io, &write_buffer);
    var reader = stream.reader(io, &read_buffer);

    var http_server = std.http.Server.init(&reader.interface, &writer.interface);
    while (true) {
        var request = http_server.receiveHead() catch |err| switch (err) {
            error.HttpConnectionClosing => return,
            else => {
                log.warn("receive head fail: {t}", .{err});
                return;
            },
        };

        var arena: std.heap.ArenaAllocator = .init(gpa);
        defer arena.deinit();

        handleRequest(arena.allocator(), &request) catch |err| {
            log.warn("handle request fail: {t}", .{err});
            request.respond("", .{ .status = .internal_server_error }) catch return;
        };
    }
}

pub fn handleRequest(arena: std.mem.Allocator, request: *std.http.Server.Request) !void {
    const path, _ = std.mem.cutScalar(u8, request.head.target, '?') orelse .{ request.head.target, "" };

    log.info("{t}: {s}", .{ request.head.method, request.head.target });

    if (std.mem.eql(u8, path, "/query_dispatch")) {
        try request.respond(try queryDispatch(arena), .{});
        return;
    }

    log.warn("unknow request: {s}", .{path});
    try request.respond("", .{ .status = .not_found });
}

pub fn queryDispatch(arena: std.mem.Allocator) ![]const u8 {
    var dispatch: proto.Dispatch = .{};

    const dispatch_url = try std.fmt.allocPrint(arena, "http://{s}:{d}/query_gateway", .{ Address, Port });

    try dispatch.region_list.append(arena, .{
        .name = "yukiino",
        .dispatch_url = dispatch_url,
        .env_type = "9",
        .display_name = "YukiinoServer",
    });

    return encodeMessage(arena, dispatch);
}

fn encodeMessage(arena: std.mem.Allocator, message: anytype) ![]const u8 {
    var encoded: Io.Writer.Allocating = .init(arena);
    try message.encode(&encoded.writer, arena);

    const bytes = encoded.written();
    const encoder = std.base64.standard.Encoder;
    const text = try arena.alloc(u8, encoder.calcSize(bytes.len));

    return encoder.encode(text, bytes);
}
