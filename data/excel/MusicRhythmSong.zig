const MusicRhythmSong = @This();

pub const files = [_][]const u8{"MusicRhythmSong.json"};

ID: u32 = 0,

pub fn key(row: *const MusicRhythmSong) u32 {
    return row.ID;
}
