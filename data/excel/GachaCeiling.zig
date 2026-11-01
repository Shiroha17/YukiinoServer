const enums = @import("enums");

const GachaCeiling = @This();

pub const files = [_][]const u8{"GachaCeiling.json"};

GachaType: enums.GachaType = .Unknown,
CeilingNum: u32 = 0,
CeilingItemList: []const u32 = &.{},

pub fn key(row: *const GachaCeiling) enums.GachaType {
    return row.GachaType;
}
