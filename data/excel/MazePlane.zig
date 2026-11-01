const enums = @import("enums");
const util = @import("util");

const MazePlane = @This();

pub const files = [_][]const u8{"MazePlane.json"};

PlaneID: u32 = 0,
WorldID: u32 = 0,
StartFloorID: u32 = 0,
PlaneName: util.HashName = .{},
PlaneType: enums.PlaneType = .Unknown,

pub fn key(row: *const MazePlane) u32 {
    return row.PlaneID;
}
