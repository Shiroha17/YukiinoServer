const ChallengeReward = @This();

pub const files = [_][]const u8{
    "ChallengeMazeRewardLine.json",
    "ChallengeStoryRewardLine.json",
};

GroupID: u32 = 0,
StarCount: u32 = 0,
RewardID: u32 = 0,

pub fn key(row: *const ChallengeReward) struct { u32, u32 } {
    return .{ row.GroupID, row.StarCount };
}
