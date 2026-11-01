const enums = @import("enums");
const util = @import("util");

const QuestData = @This();

pub const files = [_][]const u8{"QuestData.json"};

QuestID: u32 = 0,
QuestType: u32 = 0,
QuestTitle: util.HashName = .{},
RewardID: u32 = 0,
FinishWayID: u32 = 0,
UnlockType: enums.QuestUnlockType = .Unknown,
UnlockParamList: []const u32 = &.{},

pub fn key(row: *const QuestData) u32 {
    return row.QuestID;
}
