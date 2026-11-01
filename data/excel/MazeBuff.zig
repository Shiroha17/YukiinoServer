const MazeBuff = @This();

pub const files = [_][]const u8{
    "MazeBuff.json",
    "AvatarMazeBuff.json",
    "AvatarMazeBuffLD.json",
};

ID: u32 = 0,
Lv: u32 = 0,
ModifierName: []const u8 = "",

pub fn key(row: *const MazeBuff) struct { u32, u32 } {
    return .{ row.ID, row.Lv };
}
