const BadgeConfig = @This();

pub const files = [_][]const u8{"BadgeConfig.json"};

BadgeID: u32 = 0,
ItemID: u32 = 0,
Type: []const u8 = "",
Param: u32 = 0,
BadgeLevel: []const u8 = "",

pub fn key(row: *const BadgeConfig) u32 {
    return row.BadgeID;
}
