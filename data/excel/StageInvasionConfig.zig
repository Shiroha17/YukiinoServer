const StageInvasionConfig = @This();

pub const files = [_][]const u8{"StageInvasionConfig.json"};

StageID: u32 = 0,
InvasionID: u32 = 0,

pub fn key(row: *const StageInvasionConfig) u32 {
    return row.StageID;
}
