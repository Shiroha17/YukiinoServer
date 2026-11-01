const ActivityRealityShowConfig = @This();

pub const files = [_][]const u8{"ActivityRealityShowConfig.json"};

ID: u32 = 0,
ModuleID: u32 = 0,
EventID1: u32 = 0,
EventID2: u32 = 0,
SpecialAvatarList: []const u32 = &.{},
BuffIDList: []const u32 = &.{},
BuffUpNumList: []const u32 = &.{},

pub fn key(row: *const ActivityRealityShowConfig) u32 {
    return row.ID;
}
