const util = @import("util");

const RollShopConfig = @This();

pub const files = [_][]const u8{"RollShopConfig.json"};

RollShopID: u32 = 0,
CostItemID: u32 = 0,
CostItemNum: u32 = 0,
T1GroupID: u32 = 0,
T2GroupID: u32 = 0,
T3GroupID: u32 = 0,
T4GroupID: u32 = 0,
SecretGroupID: u32 = 0,
RollShopType: []const u8 = "",
IntroduceID: u32 = 0,
ShopName: util.HashName = .{},

pub fn key(row: *const RollShopConfig) u32 {
    return row.RollShopID;
}
