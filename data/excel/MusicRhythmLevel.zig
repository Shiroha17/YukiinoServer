const MusicRhythmLevel = @This();

pub const files = [_][]const u8{"MusicRhythmLevel.json"};

ID: u32 = 0,

pub fn key(row: *const MusicRhythmLevel) u32 {
    return row.ID;
}
