const enums = @import("enums");

const UpgradeAvatarSubRelic = @This();

pub const files = [_][]const u8{"UpgradeAvatarSubRelic.json"};

FAONKFODAHF: u32 = 0, // RelicLevel
AMAPBCEEKFP: enums.UpgradeAvatarSubRelicType = .None, // SubType
GMNJOHLBFDA: enums.Rarity, // Rarity
EMLJEDBDDDM: enums.RelicType = .Unknow, // Type
HHBEAPOCLPC: []const UpgradeAvatarSubAffixInfo = &.{}, // SubAffixes

pub fn key(row: *const UpgradeAvatarSubRelic) struct {
    enums.UpgradeAvatarSubRelicType,
    enums.Rarity,
    u32,
    enums.RelicType,
} {
    return .{ row.AMAPBCEEKFP, row.GMNJOHLBFDA, row.FAONKFODAHF, row.EMLJEDBDDDM };
}

pub const UpgradeAvatarSubAffixInfo = struct {
    EAFFHGKLALP: u32 = 0, // AffixCount
    FODBMMCKAEN: enums.AvatarPropertyType = .Unknown, // AffixProperty
};
