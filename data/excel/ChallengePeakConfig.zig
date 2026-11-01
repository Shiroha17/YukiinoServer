const ChallengePeakConfig = @This();

pub const files = [_][]const u8{"ChallengePeakConfig.json"};

ID: u32 = 0,
TagList: []const u32 = &.{},
HPProgressValueList: []const u32 = &.{},
ProgressValueList: []const u32 = &.{},
EventIDList: []const u32 = &.{},
NormalTargetList: []const u32 = &.{},

pub fn key(row: *const ChallengePeakConfig) u32 {
    return row.ID;
}
