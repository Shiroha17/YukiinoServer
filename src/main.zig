const std = @import("std");
const Io = std.Io;

const YukiinoServer = @import("YukiinoServer");

pub fn main(init: std.process.Init) !void {
    const arena: std.mem.Allocator = init.arena.allocator();
    const io = init.io;

    const game_data = try YukiinoServer.GameData.load(arena, init.gpa, io, "Resources");
    const march_7th = game_data.excel.avatar_config.get(1001).?;
    std.log.info("avatar {d}: {s}", .{ march_7th.AvatarID, march_7th.JsonPath });
}
