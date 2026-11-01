const MusicRhythmGroup = @This();

pub const files = [_][]const u8{"MusicRhythmGroup.json"};

ID: u32 = 0,
Index: u32 = 0,
Phase: u32 = 0,

pub fn key(row: *const MusicRhythmGroup) u32 {
    return row.ID;
}
