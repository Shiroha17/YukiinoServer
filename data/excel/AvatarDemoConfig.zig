const AvatarDemoConfig = @This();

pub const files = [_][]const u8{"AvatarDemoConfig.json"};

StageID: u32 = 0,
AvatarID: u32 = 0,
TrialAvatarList: []const u32 = &.{},
RewardID: u32 = 0,
MazeGroupID1: u32 = 0,
RaidID: u32 = 0,
MapEntranceID: u32 = 0,
ConfigList1: []const u32 = &.{},
NpcMonsterIDList1: []const u32 = &.{},
EventIDList1: []const u32 = &.{},
EnableMazeSkillEffect: bool = false,

pub fn key(row: *const AvatarDemoConfig) u32 {
    return row.StageID;
}
