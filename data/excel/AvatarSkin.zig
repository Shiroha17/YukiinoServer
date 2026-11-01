const AvatarSkin = @This();

pub const files = [_][]const u8{"AvatarSkin.json"};

ID: u32 = 0,
AvatarID: u32 = 0,

pub fn key(row: *const AvatarSkin) u32 {
    return row.ID;
}
