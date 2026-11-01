const ItemUseBuffData = @This();

pub const files = [_][]const u8{"ItemUseBuffData.json"};

UseDataID: u32 = 0,
PreviewSkillPoint: f64 = 0,
PreviewHPRecoveryPercent: f64 = 0,
PreviewHPRecoveryValue: f64 = 0,
MazeBuffID: u32 = 0,
MazeBuffID2: u32 = 0,
PreviewPowerPercent: f64 = 0,

pub fn key(row: *const ItemUseBuffData) u32 {
    return row.UseDataID;
}
