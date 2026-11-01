const RewardData = @This();

pub const files = [_][]const u8{"RewardData.json"};

RewardID: u32 = 0,
Hcoin: u32 = 0,
ItemID_1: u32 = 0,
Count_1: u32 = 0,
ItemID_2: u32 = 0,
Count_2: u32 = 0,
ItemID_3: u32 = 0,
Count_3: u32 = 0,
ItemID_4: u32 = 0,
Count_4: u32 = 0,
ItemID_5: u32 = 0,
Count_5: u32 = 0,
ItemID_6: u32 = 0,
Count_6: u32 = 0,

pub fn key(row: *const RewardData) u32 {
    return row.RewardID;
}
