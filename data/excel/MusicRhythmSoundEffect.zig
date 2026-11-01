const MusicRhythmSoundEffect = @This();

pub const files = [_][]const u8{"MusicRhythmSoundEffect.json"};

ID: u32 = 0,

pub fn key(row: *const MusicRhythmSoundEffect) u32 {
    return row.ID;
}
