const AchievementData = @This();

pub const files = [_][]const u8{"AchievementData.json"};

QuestID: u32 = 0,
AchievementID: u32 = 0,

pub fn key(row: *const AchievementData) u32 {
    return row.AchievementID;
}
