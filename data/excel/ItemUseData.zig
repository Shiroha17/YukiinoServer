const ItemUseData = @This();

pub const files = [_][]const u8{"ItemUseData.json"};

UseDataID: u32 = 0,
UseMultipleMax: u32 = 0,
UseParam: []const u32 = &.{},
IsAutoUse: bool = false,

pub fn key(row: *const ItemUseData) u32 {
    return row.UseDataID;
}
