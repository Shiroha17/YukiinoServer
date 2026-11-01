const TrainPartyAreaConfig = @This();

pub const files = [_][]const u8{"TrainPartyAreaConfig.json"};

ID: u32 = 0,
RequireAreaID: u32 = 0,
FirstStep: u32 = 0,

pub fn key(row: *const TrainPartyAreaConfig) u32 {
    return row.ID;
}
