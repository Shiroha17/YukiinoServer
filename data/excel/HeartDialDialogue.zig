const HeartDialDialogue = @This();

pub const files = [_][]const u8{"HeartDialDialogue.json"};

ID: u32 = 0,

pub fn key(row: *const HeartDialDialogue) u32 {
    return row.ID;
}
