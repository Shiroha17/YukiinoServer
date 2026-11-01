const AvatarGlobalBuffConfig = @This();

pub const files = [_][]const u8{"AvatarGlobalBuffConfig.json"};

AvatarID: u32 = 0,
SkillID: u32 = 0,
MazeBuffID: u32 = 0,

pub fn key(row: *const AvatarGlobalBuffConfig) u32 {
    return row.MazeBuffID;
}
