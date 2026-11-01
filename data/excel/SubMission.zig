const util = @import("util");

const SubMission = @This();

pub const files = [_][]const u8{"SubMission.json"};

SubMissionID: u32 = 0,
TargetText: util.HashName = .{},

pub fn key(row: *const SubMission) u32 {
    return row.SubMissionID;
}
