const ChallengeBossExtra = @This();

pub const files = [_][]const u8{"ChallengeBossMazeExtra.json"};

ID: u32 = 0,
MonsterID1: u32 = 0,
MonsterID2: u32 = 0,

pub fn key(row: *const ChallengeBossExtra) u32 {
    return row.ID;
}
