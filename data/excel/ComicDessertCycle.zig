const ComicDessertCycle = @This();

pub const files = [_][]const u8{"ComicDessertCycle.json"};

ID: u32 = 0,
LevelIDList: []const u32 = &.{},

pub fn key(row: *const ComicDessertCycle) u32 {
    return row.ID;
}
