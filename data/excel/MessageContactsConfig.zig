const MessageContactsConfig = @This();

pub const files = [_][]const u8{"MessageContactsConfig.json"};

ID: u32 = 0,

pub fn key(row: *const MessageContactsConfig) u32 {
    return row.ID;
}
