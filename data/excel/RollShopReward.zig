const RollShopReward = @This();

pub const files = [_][]const u8{"RollShopReward.json"};

GroupID: u32 = 0,
RewardID: u32 = 0,

pub fn key(row: *const RollShopReward) u32 {
    return row.RewardID;
}
