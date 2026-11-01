const ComicDessertDish = @This();

pub const files = [_][]const u8{"ComicDessertDish.json"};

ID: u32 = 0,
UnlockCycle: u32 = 0,

pub fn key(row: *const ComicDessertDish) u32 {
    return row.ID;
}
