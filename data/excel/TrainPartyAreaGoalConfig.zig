const TrainPartyAreaGoalConfig = @This();

pub const files = [_][]const u8{"TrainPartyAreaGoalConfig.json"};

AreaID: u32 = 0,
ID: u32 = 0,
StepGroupList: []const u32 = &.{},

pub fn key(row: *const TrainPartyAreaGoalConfig) u32 {
    return row.ID;
}
