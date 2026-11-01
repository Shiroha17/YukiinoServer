const ShopConfig = @This();

pub const files = [_][]const u8{"ShopConfig.json"};

ShopID: u32 = 0,
ShopType: u32 = 0,

pub fn key(row: *const ShopConfig) u32 {
    return row.ShopID;
}
