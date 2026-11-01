const ChallengePeakGroupConfig = @This();

pub const files = [_][]const u8{"ChallengePeakGroupConfig.json"};

ID: u32 = 0,
ActivityModule: u32 = 0,
RewardGroupID: u32 = 0,
BossLevelID: u32 = 0,
PreLevelIDList: []const u32 = &.{},

pub fn key(row: *const ChallengePeakGroupConfig) u32 {
    return row.ID;
}
