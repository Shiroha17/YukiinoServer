const MessageGroupConfig = @This();

pub const files = [_][]const u8{"MessageGroupConfig.json"};

ID: u32 = 0,
MessageContactsID: u32 = 0,
MessageSectionIDList: []const u32 = &.{},

pub fn key(row: *const MessageGroupConfig) u32 {
    return row.ID;
}
