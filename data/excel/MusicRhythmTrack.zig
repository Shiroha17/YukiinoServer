const MusicRhythmTrack = @This();

pub const files = [_][]const u8{"MusicRhythmTrack.json"};

ID: u32 = 0,

pub fn key(row: *const MusicRhythmTrack) u32 {
    return row.ID;
}
