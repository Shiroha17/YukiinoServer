const TalkReward = @This();

pub const files = [_][]const u8{"TalkReward.json"};

ID: u32 = 0,
NPCConfigID: u32 = 0,
RewardID: u32 = 0,

pub fn key(row: *const TalkReward) u32 {
    return row.ID;
}
