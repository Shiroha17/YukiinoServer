pub const AvatarConfig = struct {
    pub const files = [_][]const u8{
        "AvatarConfig.json",
        "AvatarConfigTrial.json",
        "AvatarConfigLD.json",
    };

    AvatarID: u32 = 0,
    AdventurePlayerID: u32 = 0,
    AvatarName: HashName = .{},
    ExpGroup: u32 = 0,
    MaxPromotion: u32 = 0,
    MaxRank: u32 = 0,
    RankIDList: []const u32 = &.{},
    JsonPath: []const u8 = "",
    Rarity: Rarity,
    DamageType: DamageType,
    AvatarBaseType: AvatarBaseType,

    pub fn key(row: *const AvatarConfig) u32 {
        return row.AvatarID;
    }
};

pub const Rarity = enum {
    CombatPowerAvatarRarityType4,
    CombatPowerAvatarRarityType5,
    CombatPowerLightconeRarity3,
    CombatPowerLightconeRarity4,
    CombatPowerLightconeRarity5,
    CombatPowerRelicRarity2,
    CombatPowerRelicRarity3,
    CombatPowerRelicRarity4,
    CombatPowerRelicRarity5,
};

pub const DamageType = enum(u32) {
    Physical = 1000111,
    Fire = 1000112,
    Ice = 1000113,
    Thunder = 1000114,
    Wind = 1000115,
    Quantum = 1000116,
    Imaginary = 1000117,
};

pub const AvatarBaseType = enum {
    Unknown,
    Warrior,
    Rogue,
    Mage,
    Shaman,
    Warlock,
    Knight,
    Priest,
    Memory,
    Elation,
};

pub const HashName = struct {
    Hash: i32 = 0,
    Hash64: u64 = 0,
};
