const MainMissionSchedule = @This();

pub const files = [_][]const u8{"MainMissionSchedule.json"};

MainMissionID: u32 = 0,
ActivityModuleID: u32 = 0,

pub fn key(row: *const MainMissionSchedule) u32 {
    return row.MainMissionID;
}
