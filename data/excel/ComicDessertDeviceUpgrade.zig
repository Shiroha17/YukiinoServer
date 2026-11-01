const ComicDessertDeviceUpgrade = @This();

pub const files = [_][]const u8{"ComicDessertDeviceUpgrade.json"};

ID: u32 = 0,
Level: u32 = 0,
UpgradeCost: u32 = 0,
UnlockCycle: u32 = 0,

pub fn key(row: *const ComicDessertDeviceUpgrade) struct { u32, u32 } {
    return .{ row.ID, row.Level };
}
