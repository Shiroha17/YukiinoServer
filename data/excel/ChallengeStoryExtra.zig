const ChallengeStoryExtra = @This();

pub const files = [_][]const u8{"ChallengeStoryMazeExtra.json"};

ID: u32 = 0,
TurnLimit: u32 = 0,
ClearScore: u32 = 0,
BattleTargetID: []const u32 = &.{},

pub fn key(row: *const ChallengeStoryExtra) u32 {
    return row.ID;
}
