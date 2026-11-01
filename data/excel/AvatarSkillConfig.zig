const util = @import("util");

const AvatarSkillConfig = @This();

pub const files = [_][]const u8{
    "AvatarSkillConfig.json",
    "AvatarSkillConfigLD.json",
};

SkillID: u32 = 0,
Level: u32 = 0,
SkillTriggerKey: []const u8 = "",
ParamList: []const util.FixedValue = &.{},

pub fn key(row: *const AvatarSkillConfig) struct { u32, u32 } {
    return .{ row.SkillID, row.Level };
}
