const MonsterTemplateConfig = @This();

pub const files = [_][]const u8{
    "MonsterTemplateConfig.json",
    "MonsterTemplateUniqueConfig.json",
};

MonsterTemplateID: u32 = 0,
NPCMonsterList: []const u32 = &.{},
MonsterCampID: u32 = 0,

pub fn key(row: *const MonsterTemplateConfig) u32 {
    return row.MonsterTemplateID;
}
