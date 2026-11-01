const RechargeConfig = @This();

pub const files = [_][]const u8{"RechargeConfig.json"};

TierID: []const u8 = "",
ProductID: []const u8 = "",
GiftType: u32 = 0,
ListOrder: u32 = 0,

pub fn key(row: *const RechargeConfig) []const u8 {
    return row.ProductID;
}
