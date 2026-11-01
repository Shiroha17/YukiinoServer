const MusicRhythmPhase = @This();

pub const files = [_][]const u8{"MusicRhythmPhase.json"};

Phase: u32 = 0,
SongID: u32 = 0,

pub fn key(row: *const MusicRhythmPhase) u32 {
    return row.Phase;
}
