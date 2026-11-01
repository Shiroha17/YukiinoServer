const MapEntrance = @This();

pub const files = [_][]const u8{"MapEntrance.json"};

ID: u32 = 0,
PlaneID: u32 = 0,
FloorID: u32 = 0,
StartGroupID: u32 = 0,
StartAnchorID: u32 = 0,
FinishMainMissionList: []const u32 = &.{},
FinishSubMissionList: []const u32 = &.{},

pub fn key(row: *const MapEntrance) u32 {
    return row.ID;
}
