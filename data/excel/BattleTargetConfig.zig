const BattleTargetConfig = @This();

pub const files = [_][]const u8{"BattleTargetConfig.json"};

ID: u32 = 0,
TargetParam: u32 = 0,

pub fn key(row: *const BattleTargetConfig) u32 {
    return row.ID;
}
