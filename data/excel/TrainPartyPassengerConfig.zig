const TrainPartyPassengerConfig = @This();

pub const files = [_][]const u8{"TrainPartyPassengerConfig.json"};

PassengerID: u32 = 0,

pub fn key(row: *const TrainPartyPassengerConfig) u32 {
    return row.PassengerID;
}
