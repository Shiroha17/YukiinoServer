const ChatBubbleConfig = @This();

pub const files = [_][]const u8{"ChatBubbleConfig.json"};

ID: u32 = 0,

pub fn key(row: *const ChatBubbleConfig) u32 {
    return row.ID;
}
