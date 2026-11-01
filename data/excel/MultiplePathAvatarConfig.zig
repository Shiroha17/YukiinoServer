const enums = @import("enums");

const MultiplePathAvatarConfig = @This();

pub const files = [_][]const u8{"MultiplePathAvatarConfig.json"};

UnlockConditions: []const Condition = &.{},
ChangeConfigPath: []const u8 = "",
Gender: enums.GenderType = .GENDER_NONE,
AvatarID: u32 = 0,
BaseAvatarID: u32 = 0,

pub fn key(row: *const MultiplePathAvatarConfig) u32 {
    return row.AvatarID;
}

pub const Condition = struct {
    Param: []const u8 = "",
    Type: enums.ConditionType = .None,
};
