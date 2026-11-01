const std = @import("std");
const Io = std.Io;

const YukiinoServer = @import("YukiinoServer");

const logger = @import("logger");
pub const std_options: std.Options = .{ .logFn = logger.logFn };

pub fn main(init: std.process.Init) !void {
    const arena: std.mem.Allocator = init.arena.allocator();
    const io = init.io;

    const begin_time = Io.Clock.awake.now(io);

    logger.init(io) catch |err| std.log.warn("log file disabled: {t}", .{err});
    defer logger.deinit(io);

    const game_data = try YukiinoServer.GameData.load(arena, init.gpa, io, "Resources");

    const castorice = game_data.excel.avatar_skin.get(1140701).?;
    std.log.info("avatar {d}", .{castorice.AvatarID});

    const end_time = Io.Clock.awake.now(io);
    const total_time = @as(f64, @floatFromInt(begin_time.durationTo(end_time).toMilliseconds()));
    std.log.info("cost {d:.2} seconds\n", .{total_time});
}
