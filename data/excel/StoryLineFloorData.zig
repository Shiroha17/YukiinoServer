const StoryLineFloorData = @This();

pub const files = [_][]const u8{"StoryLineFloorData.json"};

FloorID: u32 = 0,
StoryLineID: u32 = 0,
DimensionID: u32 = 0,

pub fn key(row: *const StoryLineFloorData) struct { u32, u32 } {
    return .{ row.StoryLineID, row.FloorID };
}
