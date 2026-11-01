const OptionalRewardQuest = @This();

pub const files = [_][]const u8{"OptionalRewardQuest.json"};

QuestID: u32 = 0,
OptionalGiftItemID: u32 = 0,

pub fn key(row: *const OptionalRewardQuest) u32 {
    return row.QuestID;
}
