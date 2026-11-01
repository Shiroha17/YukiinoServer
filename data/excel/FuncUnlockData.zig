const enums = @import("enums");

const FuncUnlockData = @This();

pub const files = [_][]const u8{"FuncUnlockData.json"};

UnlockID: u32 = 0,
Conditions: []const FuncUnlockCondition = &.{},

pub fn key(row: *const FuncUnlockData) u32 {
    return row.UnlockID;
}

pub const FuncUnlockCondition = struct {
    Type: enums.ConditionType = .None,
    Param: []const u8 = "",
};
