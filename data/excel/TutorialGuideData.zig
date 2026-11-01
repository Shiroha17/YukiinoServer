const TutorialGuideData = @This();

pub const files = [_][]const u8{"TutorialGuideData.json"};

ID: u32 = 0,

// PS variants reuse the ID: only the first row is indexed, like TryAdd in ShirohaDH.
pub fn key(row: *const TutorialGuideData) u32 {
    return row.ID;
}
