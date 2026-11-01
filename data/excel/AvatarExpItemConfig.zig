const AvatarExpItemConfig = @This();

pub const files = [_][]const u8{"AvatarExpItemConfig.json"};

ItemID: u32 = 0,
Exp: u32 = 0,

pub fn key(row: *const AvatarExpItemConfig) u32 {
    return row.ItemID;
}
