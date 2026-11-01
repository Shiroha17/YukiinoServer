const OfferingTypeConfig = @This();

pub const files = [_][]const u8{"OfferingTypeConfig.json"};

MaxLevel: u32 = 0,
ItemID: u32 = 0,
ActivityModuleID: u32 = 0,
LongTailLimit: u32 = 0,
ID: u32 = 0,
UnlockID: u32 = 0,
IsAutoOffer: bool = false,

pub fn key(row: *const OfferingTypeConfig) u32 {
    return row.ID;
}
