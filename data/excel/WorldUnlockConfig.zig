const WorldUnlockConfig = @This();

pub const files = [_][]const u8{"WorldUnlockConfig.json"};

ID: u32 = 0,
InitMainMissionList: []const u32 = &.{},

pub fn key(row: *const WorldUnlockConfig) u32 {
    return row.ID;
}
