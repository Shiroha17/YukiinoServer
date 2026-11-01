const AdventurePlayer = @This();

pub const files = [_][]const u8{
    "AdventurePlayer.json",
    "ActivityAdventurePlayer.json",
    "AdventurePlayerLD.json",
};

ID: u32 = 0,
AvatarID: u32 = 0,
MazeSkillIdList: []const u32 = &.{},
PlayerJsonPath: []const u8 = "",

pub fn key(row: *const AdventurePlayer) u32 {
    return row.ID;
}
