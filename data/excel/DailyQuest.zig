const DailyQuest = @This();

pub const files = [_][]const u8{"DailyQuest.json"};

DailyID: u32 = 0,
QuestList: []const u32 = &.{},
MinLevel: u32 = 0,
MaxLevel: u32 = 0,
IsDelete: bool = false,

pub fn key(row: *const DailyQuest) u32 {
    return row.DailyID;
}
