const ChallengeConfig = @This();

pub const files = [_][]const u8{
    "ChallengeMazeConfig.json",
    "ChallengeStoryMazeConfig.json",
    "ChallengeBossMazeConfig.json",
};

ID: u32 = 0,
GroupID: u32 = 0,
MapEntranceID: u32 = 0,
MapEntranceID2: u32 = 0,
StageNum: u32 = 0,
ChallengeCountDown: u32 = 0,
MazeBuffID: u32 = 0,
Floor: u32 = 0,
ChallengeTargetID: []const u32 = &.{},
MazeGroupID1: u32 = 0,
ConfigList1: []const u32 = &.{},
NpcMonsterIDList1: []const u32 = &.{},
EventIDList1: []const u32 = &.{},
MazeGroupID2: u32 = 0,
ConfigList2: []const u32 = &.{},
NpcMonsterIDList2: []const u32 = &.{},
EventIDList2: []const u32 = &.{},

pub fn key(row: *const ChallengeConfig) u32 {
    return row.ID;
}
