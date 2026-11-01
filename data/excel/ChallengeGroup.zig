const ChallengeGroup = @This();

pub const files = [_][]const u8{
    "ChallengeGroupConfig.json",
    "ChallengeStoryGroupConfig.json",
    "ChallengeBossGroupConfig.json",
};

GroupID: u32 = 0,
RewardLineGroupID: u32 = 0,

pub fn key(row: *const ChallengeGroup) u32 {
    return row.GroupID;
}
