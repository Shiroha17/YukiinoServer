const MessageItemConfig = @This();

pub const files = [_][]const u8{"MessageItemConfig.json"};

ID: u32 = 0,
NextItemIDList: []const u32 = &.{},
SectionID: u32 = 0,

pub fn key(row: *const MessageItemConfig) u32 {
    return row.ID;
}
