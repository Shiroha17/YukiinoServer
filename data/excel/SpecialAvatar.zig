const enums = @import("enums");

const SpecialAvatar = @This();

pub const files = [_][]const u8{"SpecialAvatar.json"};

SpecialAvatarID: u32 = 0,
WorldLevel: u32 = 0,
AvatarID: u32 = 0,
PlayerID: u32 = 0,
Type: enums.SpecialAvatarType = .TYPE_NONE,
Level: u32 = 0,
Promotion: u32 = 0,
Rank: u32 = 0,
EquipmentID: u32 = 0,
EquipmentLevel: u32 = 0,
EquipmentPromotion: u32 = 0,
EquipmentRank: u32 = 0,

pub fn key(row: *const SpecialAvatar) struct { u32, u32 } {
    return .{ row.SpecialAvatarID, row.WorldLevel };
}
