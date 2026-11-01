const enums = @import("enums");
const util = @import("util");

const AvatarConfig = @This();

pub const files = [_][]const u8{
    "AvatarConfig.json",
    "AvatarConfigTrial.json",
    "AvatarConfigLD.json",
};

AvatarID: u32 = 0,
AdventurePlayerID: u32 = 0,
AvatarName: util.HashName = .{},
ExpGroup: u32 = 0,
MaxPromotion: u32 = 0,
MaxRank: u32 = 0,
RankIDList: []const u32 = &.{},
SPNeed: util.FixedValue = .{},
JsonPath: []const u8 = "",
Rarity: enums.Rarity,
DamageType: enums.DamageType,
AvatarBaseType: enums.AvatarBaseType = .Unknown,

pub fn key(row: *const AvatarConfig) u32 {
    return row.AvatarID;
}
