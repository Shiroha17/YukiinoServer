const PlayerLevelConfig = @This();

pub const files = [_][]const u8{"PlayerLevelConfig.json"};

Level: u32 = 0,
PlayerExp: u32 = 0,
StaminaLimit: u32 = 0,
LevelRewardID: u32 = 0,

pub fn key(row: *const PlayerLevelConfig) u32 {
    return row.Level;
}
