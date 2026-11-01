const NPCData = @This();

pub const files = [_][]const u8{"NPCData.json"};

ID: u32 = 0,

pub fn key(row: *const NPCData) u32 {
    return row.ID;
}
