const StageInvasionBuff = @This();

pub const files = [_][]const u8{"StageInvasionBuff.json"};

InvasionID: u32 = 0,
MazeBuffID: u32 = 0,

pub fn key(row: *const StageInvasionBuff) u32 {
    return row.InvasionID;
}
