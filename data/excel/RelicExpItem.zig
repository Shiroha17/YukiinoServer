const RelicExpItem = @This();

pub const files = [_][]const u8{"RelicExpItem.json"};

ItemID: u32 = 0,
ExpProvide: u32 = 0,
CoinCost: u32 = 0,

pub fn key(row: *const RelicExpItem) u32 {
    return row.ItemID;
}
