const MazePuzzleSwitchHand = @This();

pub const files = [_][]const u8{"MazePuzzleSwitchHand.json"};

SwitchID: u32 = 0,
PlaneID: u32 = 0,
FloorID: u32 = 0,
SwitchHandID: []const u32 = &.{},

pub fn key(row: *const MazePuzzleSwitchHand) u32 {
    return row.SwitchID;
}
