const PlaneEvent = @This();

pub const files = [_][]const u8{"PlaneEvent.json"};

EventID: u32 = 0,
WorldLevel: u32 = 0,
Reward: u32 = 0,
DropList: []const u32 = &.{},
StageID: u32 = 0,

pub fn key(row: *const PlaneEvent) struct { u32, u32 } {
    return .{ row.EventID, row.WorldLevel };
}
