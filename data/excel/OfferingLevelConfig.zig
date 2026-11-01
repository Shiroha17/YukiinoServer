const OfferingLevelConfig = @This();

pub const files = [_][]const u8{"OfferingLevelConfig.json"};

ItemCost: u32 = 0,
Level: u32 = 0,
RewardID: u32 = 0,
TypeID: u32 = 0,
UnlockID: u32 = 0,

pub fn key(row: *const OfferingLevelConfig) struct { u32, u32 } {
    return .{ row.TypeID, row.Level };
}
