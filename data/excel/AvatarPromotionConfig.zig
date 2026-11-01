const util = @import("util");

const AvatarPromotionConfig = @This();

pub const files = [_][]const u8{
    "AvatarPromotionConfig.json",
    "AvatarPromotionConfigLD.json",
};

AvatarID: u32 = 0,
Promotion: u32 = 0,
MaxLevel: u32 = 0,
PlayerLevelRequire: u32 = 0,
WorldLevelRequire: u32 = 0,
PromotionCostList: []const util.MaterialItem = &.{},

pub fn key(row: *const AvatarPromotionConfig) struct { u32, u32 } {
    return .{ row.AvatarID, row.Promotion };
}
