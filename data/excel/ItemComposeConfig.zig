const util = @import("util");

const ItemComposeConfig = @This();

pub const files = [_][]const u8{"ItemComposeConfig.json"};

ID: u32 = 0,
ItemID: u32 = 0,
CoinCost: u32 = 0,
MaterialCost: []const util.MaterialItem = &.{},
FormulaType: []const u8 = "",
SpecialMaterialCost: []const u32 = &.{},
SpecialMaterialCostNumber: u32 = 0,
RelicList: []const u32 = &.{},

pub fn key(row: *const ItemComposeConfig) u32 {
    return row.ID;
}
