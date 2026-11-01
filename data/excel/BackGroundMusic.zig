const BackGroundMusic = @This();

pub const files = [_][]const u8{"BackGroundMusic.json"};

ID: u32 = 0,
GroupID: u32 = 0,

pub fn key(row: *const BackGroundMusic) u32 {
    return row.ID;
}
