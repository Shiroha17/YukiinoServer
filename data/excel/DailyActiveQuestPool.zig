const DailyActiveQuestPool = @This();

pub const files = [_][]const u8{"DailyActiveQuestPool.json"};

QuestID: u32 = 0,
Type: u32 = 0,

pub fn key(row: *const DailyActiveQuestPool) u32 {
    return row.QuestID;
}
