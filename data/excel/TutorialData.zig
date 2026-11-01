const TutorialData = @This();

pub const files = [_][]const u8{"TutorialData.json"};

TutorialID: u32 = 0,
Priority: u32 = 0,

pub fn key(row: *const TutorialData) u32 {
    return row.TutorialID;
}
