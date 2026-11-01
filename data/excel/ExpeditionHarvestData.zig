const ExpeditionHarvestData = @This();

pub const files = [_][]const u8{"ExpeditionHarvestData.json"};

ExpeditionID: u32 = 0,
RewardID: u32 = 0,

pub fn key(row: *const ExpeditionHarvestData) u32 {
    return row.ExpeditionID;
}
