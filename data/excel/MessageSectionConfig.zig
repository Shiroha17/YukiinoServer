const MessageSectionConfig = @This();

pub const files = [_][]const u8{"MessageSectionConfig.json"};

ID: u32 = 0,
StartMessageItemIDList: []const u32 = &.{},
IsPerformMessage: bool = false,
MainMissionLink: u32 = 0,

pub fn key(row: *const MessageSectionConfig) u32 {
    return row.ID;
}
