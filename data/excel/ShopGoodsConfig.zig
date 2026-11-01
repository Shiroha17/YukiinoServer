const ShopGoodsConfig = @This();

pub const files = [_][]const u8{"ShopGoodsConfig.json"};

GoodsID: u32 = 0,
ShopID: u32 = 0,
ItemID: u32 = 0,
ItemCount: u32 = 0,
CurrencyList: []const u32 = &.{},
CurrencyCostList: []const u32 = &.{},

pub fn key(row: *const ShopGoodsConfig) u32 {
    return row.GoodsID;
}
