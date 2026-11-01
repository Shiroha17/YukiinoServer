const enums = @import("enums");
const util = @import("util");

const NPCMonsterData = @This();

pub const files = [_][]const u8{"NPCMonsterData.json"};

ID: u32 = 0,
NPCName: util.HashName = .{},
JsonPath: []const u8 = "",
ConfigEntityPath: []const u8 = "",
Rank: enums.MonsterRank = .Unknown,

pub fn key(row: *const NPCMonsterData) u32 {
    return row.ID;
}
