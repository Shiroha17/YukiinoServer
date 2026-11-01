const StroyLineTrialAvatarData = @This();

pub const files = [_][]const u8{"StroyLineTrialAvatarData.json"};

StoryLineID: u32 = 0,
TrialAvatarList: []const u32 = &.{},
InitTrialAvatarList: []const u32 = &.{},
CaptainAvatarID: u32 = 0,

pub fn key(row: *const StroyLineTrialAvatarData) u32 {
    return row.StoryLineID;
}
