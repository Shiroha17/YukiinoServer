const util = @import("util");

const AvatarExRankConfig = @This();

pub const files = [_][]const u8{"AvatarExRankConfig.json"};

AvatarID: u32 = 0,
ID: u32 = 0,
UnlockCost: util.MaterialItem = .{},

pub fn key(row: *const AvatarExRankConfig) u32 {
    return row.ID;
}
