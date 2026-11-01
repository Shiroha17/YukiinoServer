const enums = @import("enums");

const EquipmentConfig = @This();

pub const files = [_][]const u8{"EquipmentConfig.json"};

EquipmentID: u32 = 0,
Release: bool = false,
ExpType: u32 = 0,
MaxPromotion: u32 = 0,
MaxRank: u32 = 0,
ExpProvide: u32 = 0,
Rarity: enums.Rarity,

pub fn key(row: *const EquipmentConfig) u32 {
    return row.EquipmentID;
}
