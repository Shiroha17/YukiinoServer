const ChallengePeakBossConfig = @This();

pub const files = [_][]const u8{"ChallengePeakBossConfig.json"};

ID: u32 = 0,
HardTarget: u32 = 0,
ColorMedalTarget: u32 = 0,
HardEventIDList: []const u32 = &.{},
HardTagList: []const u32 = &.{},
BuffList: []const u32 = &.{},

pub fn key(row: *const ChallengePeakBossConfig) u32 {
    return row.ID;
}
