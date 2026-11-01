const ActivityConfig = @This();

pub const files = [_][]const u8{"ActivityConfig.json"};

ActivityID: u32 = 0,
ActivityModuleIDList: []const u32 = &.{},
ResidentModuleList: []const u32 = &.{},

pub fn key(row: *const ActivityConfig) u32 {
    return row.ActivityID;
}
