const enums = @import("enums");

const MazeChest = @This();

pub const files = [_][]const u8{"MazeChest.json"};

WorldID: u32 = 0,
ID: u32 = 0,
ChestType: []const enums.ChestType = &.{},

pub fn key(row: *const MazeChest) u32 {
    return row.ID;
}
