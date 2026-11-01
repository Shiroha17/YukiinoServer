const enums = @import("enums");

const RelicConfig = @This();

pub const files = [_][]const u8{"RelicConfig.json"};

ID: u32 = 0,
SetID: u32 = 0,
Type: enums.RelicType = .Unknow,
MainAffixGroup: u32 = 0,
SubAffixGroup: u32 = 0,
MaxLevel: u32 = 0,
ExpType: u32 = 0,
ExpProvide: u32 = 0,
CoinCost: u32 = 0,
Rarity: enums.Rarity,

pub fn key(row: *const RelicConfig) u32 {
    return row.ID;
}
