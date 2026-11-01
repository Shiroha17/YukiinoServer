const util = @import("util");

const BattleCollegeConfig = @This();

pub const files = [_][]const u8{"BattleCollegeConfig.json"};

TrialAvatarList: []const u32 = &.{},
VideoCoverPath: []const u8 = "",
AimList: []const u32 = &.{},
TutorialID: u32 = 0,
BattleAreaGroupID: u32 = 0,
StageIntroDescIDList: u32 = 0,
BattleAreaID: u32 = 0,
FloorID: u32 = 0,
RewardID: u32 = 0,
TutorialTypeGroupID: u32 = 0,
StageID: u32 = 0,
PlaneID: u32 = 0,
VideoAssetID: u32 = 0,
StageIntroTitle: util.HashName = .{},
SortID: u32 = 0,
ID: u32 = 0,

pub fn key(row: *const BattleCollegeConfig) u32 {
    return row.ID;
}
