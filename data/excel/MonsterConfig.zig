const MonsterConfig = @This();

pub const files = [_][]const u8{
    "MonsterConfig.json",
    "MonsterUniqueConfig.json",
};

MonsterID: u32 = 0,
MonsterTemplateID: u32 = 0,
HardLevelGroup: u32 = 0,
SummonIDList: []const u32 = &.{},

pub fn key(row: *const MonsterConfig) u32 {
    return row.MonsterID;
}
