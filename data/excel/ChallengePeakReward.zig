const ChallengePeakReward = @This();

pub const files = [_][]const u8{"ChallengePeakReward.json"};

ID: u32 = 0,
RewardGroupID: u32 = 0,
RewardType: []const u8 = "",
TypeValue: u32 = 0,
RewardID: u32 = 0,

pub fn key(row: *const ChallengePeakReward) u32 {
    return row.ID;
}
