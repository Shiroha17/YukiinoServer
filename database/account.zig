const std = @import("std");
const Io = std.Io;
const Allocator = std.mem.Allocator;
const zqlite = @import("zqlite");

const database = @import("database.zig");
const log = std.log.scoped(.database);

pub const initial_uid: u32 = 10001;

pub const Account = struct {
    uid: u32,
    username: []const u8,
    dispatch_token: []const u8,
    combo_token: []const u8,
};

pub fn initTable(conn: zqlite.Conn) !void {
    try conn.execNoArgs(
        \\CREATE TABLE IF NOT EXISTS account (
        \\    uid INTEGER PRIMARY KEY,
        \\    username TEXT NOT NULL UNIQUE,
        \\    dispatch_token TEXT NOT NULL DEFAULT '',
        \\    combo_token TEXT NOT NULL DEFAULT ''
        \\);
    );
}

pub fn isValidUsername(username: []const u8) bool {
    const trimmed = std.mem.trim(u8, username, " \t\r\n");
    if (trimmed.len == 0 or username.len > 64) {
        return false;
    }

    for (username) |ch| {
        if (std.ascii.isControl(ch)) {
            return false;
        }
    }

    return true;
}

pub fn getByUsername(io: Io, allocator: Allocator, username: []const u8) !?Account {
    const conn = try database.acquire(io);
    defer conn.release(io);

    return try queryByUsername(conn, allocator, username);
}

pub fn getByUid(io: Io, allocator: Allocator, uid: u32) !?Account {
    const conn = try database.acquire(io);
    defer conn.release(io);

    const row = (try conn.row(
        "SELECT uid, username, dispatch_token, combo_token FROM account WHERE uid = ?1",
        .{uid},
    )) orelse return null;
    defer row.deinit();

    return try cloneRowAccount(allocator, row);
}

pub fn getOrCreateByUsername(io: Io, allocator: Allocator, username: []const u8) !Account {
    const conn = try database.acquire(io);
    defer conn.release(io);

    if (try queryByUsername(conn, allocator, username)) |existing| {
        return existing;
    }

    try conn.transaction();
    errdefer conn.rollback();

    if (try queryByUsername(conn, allocator, username)) |existing| {
        try conn.commit();
        return existing;
    }

    const next_uid = try getNextUid(conn);
    try conn.exec(
        "INSERT INTO account (uid, username) VALUES (?1, ?2)",
        .{ next_uid, username },
    );

    try conn.commit();
    log.info("created account: {s} (uid: {d})", .{ username, next_uid });

    return .{
        .uid = next_uid,
        .username = try allocator.dupe(u8, username),
        .dispatch_token = "",
        .combo_token = "",
    };
}

pub fn generateDispatchToken(io: Io, allocator: Allocator, uid: u32) ![]const u8 {
    const token = try createSessionToken(io, allocator);

    const conn = try database.acquire(io);
    defer conn.release(io);

    try conn.exec(
        "UPDATE account SET dispatch_token = ?1 WHERE uid = ?2",
        .{ token, uid },
    );

    return token;
}

pub fn generateComboToken(io: Io, allocator: Allocator, uid: u32) ![]const u8 {
    const token = try createSessionToken(io, allocator);

    const conn = try database.acquire(io);
    defer conn.release(io);

    try conn.exec(
        "UPDATE account SET combo_token = ?1 WHERE uid = ?2",
        .{ token, uid },
    );

    return token;
}

fn queryByUsername(conn: zqlite.Conn, allocator: Allocator, username: []const u8) !?Account {
    const row = (try conn.row(
        "SELECT uid, username, dispatch_token, combo_token FROM account WHERE username = ?1",
        .{username},
    )) orelse return null;
    defer row.deinit();

    return try cloneRowAccount(allocator, row);
}

fn getNextUid(conn: zqlite.Conn) !u32 {
    const row = (try conn.row(
        "SELECT COALESCE(MAX(uid) + 1, ?1) FROM account",
        .{initial_uid},
    )) orelse return initial_uid;
    defer row.deinit();

    const uid_val = row.int(0);
    if (uid_val < initial_uid) {
        return initial_uid;
    }
    return @intCast(uid_val);
}

fn cloneRowAccount(allocator: Allocator, row: zqlite.Row) !Account {
    return .{
        .uid = @intCast(row.int(0)),
        .username = try allocator.dupe(u8, row.text(1)),
        .dispatch_token = try allocator.dupe(u8, row.text(2)),
        .combo_token = try allocator.dupe(u8, row.text(3)),
    };
}

fn createSessionToken(io: Io, allocator: Allocator) ![]const u8 {
    var random_bytes: [32]u8 = undefined;
    io.random(&random_bytes);

    const hex = std.fmt.bytesToHex(random_bytes, .lower);
    return try allocator.dupe(u8, &hex);
}
