const std = @import("std");
const Io = std.Io;
const Allocator = std.mem.Allocator;
const zqlite = @import("zqlite");

pub const account = @import("account.zig");

const log = std.log.scoped(.database);

const db_dir = "database";
const db_path = "database/yukiino.db";

var pool: ?*zqlite.Pool = null;

pub fn init(allocator: Allocator, io: Io) !void {
    try Io.Dir.cwd().createDirPath(io, db_dir);

    pool = try zqlite.Pool.init(allocator, .{
        .size = 5,
        .path = db_path,
        .flags = zqlite.OpenFlags.Create | zqlite.OpenFlags.EXResCode,
        .on_first_connection = &onFirstConnection,
        .on_connection = &onEachConnection,
    });

    log.info("sqlite database initialized at {s}", .{db_path});
}

pub fn initMemory(allocator: Allocator) !void {
    pool = try zqlite.Pool.init(allocator, .{
        .size = 1,
        .path = ":memory:",
        .flags = zqlite.OpenFlags.Create | zqlite.OpenFlags.EXResCode,
        .on_first_connection = &onFirstConnection,
        .on_connection = &onEachConnection,
    });
}

pub fn deinit() void {
    const p = pool orelse return;
    p.deinit();
    pool = null;
}

pub fn acquire(io: Io) !zqlite.Conn {
    const p = pool orelse return error.DatabaseNotInitialized;
    return try p.acquire(io);
}

fn onFirstConnection(conn: zqlite.Conn, _: ?*anyopaque) !void {
    try conn.execNoArgs("PRAGMA journal_mode=WAL;");
    try account.initTable(conn);
}

fn onEachConnection(conn: zqlite.Conn, _: ?*anyopaque) !void {
    try conn.busyTimeout(5000);
}
