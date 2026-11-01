const MonsterDrop = @This();

pub const files = [_][]const u8{"MonsterDrop.json"};

MonsterTemplateID: u32 = 0,
WorldLevel: u32 = 0,
AvatarExpReward: u32 = 0,
DisplayItemList: []const MonsterDropItem = &.{},

pub fn key(row: *const MonsterDrop) struct { u32, u32 } {
    return .{ row.MonsterTemplateID, row.WorldLevel };
}

pub const MonsterDropItem = struct {
    ItemID: u32 = 0,
};
