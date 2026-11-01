const util = @import("util");

const EquipmentPromotionConfig = @This();

pub const files = [_][]const u8{"EquipmentPromotionConfig.json"};

EquipmentID: u32 = 0,
Promotion: u32 = 0,
MaxLevel: u32 = 0,
WorldLevelRequire: u32 = 0,
PromotionCostList: []const util.MaterialItem = &.{},

pub fn key(row: *const EquipmentPromotionConfig) struct { u32, u32 } {
    return .{ row.EquipmentID, row.Promotion };
}
