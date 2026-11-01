const ActivityVoracityInvasionBuf = @This();

pub const files = [_][]const u8{"ActivityVoracityInvasionBuf.json"};

BuffID: u32 = 0,
BuffLevel: u32 = 0,
ProgressPercent: f64 = 0,

pub fn key(row: *const ActivityVoracityInvasionBuf) u32 {
    return row.BuffLevel;
}
