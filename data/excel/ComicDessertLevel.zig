const ComicDessertLevel = @This();

pub const files = [_][]const u8{"ComicDessertLevel.json"};

ID: u32 = 0,
RequiredCoin: u32 = 0,

pub fn key(row: *const ComicDessertLevel) u32 {
    return row.ID;
}
