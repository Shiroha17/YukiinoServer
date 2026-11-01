const util = @import("util");

const StageConfig = @This();

pub const files = [_][]const u8{
    "StageConfig.json",
    "StageTestConfig.json",
};

StageID: u32 = 0,
StageName: util.HashName = .{},
MonsterList: []const StageMonsterList = &.{},
StageConfigData: []const StageConfigInfo = &.{},
TrialAvatarList: []const u32 = &.{},

pub fn key(row: *const StageConfig) u32 {
    return row.StageID;
}

pub const StageConfigInfo = struct {
    Key: []const u8 = "",
    Value: []const u8 = "",
};

pub const StageMonsterList = struct {
    Monster0: u32 = 0,
    Monster1: u32 = 0,
    Monster2: u32 = 0,
    Monster3: u32 = 0,
    Monster4: u32 = 0,
};
