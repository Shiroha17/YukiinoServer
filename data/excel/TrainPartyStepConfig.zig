const TrainPartyStepConfig = @This();

pub const files = [_][]const u8{"TrainPartyStepConfig.json"};

ID: u32 = 0,
CoinCost: u32 = 0,
GroupID: u32 = 0,
SortID: u32 = 0,
StaticPropIDList: []const u32 = &.{},

pub fn key(row: *const TrainPartyStepConfig) u32 {
    return row.ID;
}
