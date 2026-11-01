const DailyActiveConfig = @This();

pub const files = [_][]const u8{"DailyActiveConfig.json"};

Level: u32 = 0,
WorldLevel: u32 = 0,
DailyActivePoint: u32 = 0,
DailyActiveReward: u32 = 0,

pub fn key(row: *const DailyActiveConfig) struct { u32, u32 } {
    return .{ row.WorldLevel, row.Level };
}
