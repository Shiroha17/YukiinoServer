const enums = @import("enums");

const UpgradeAvatarSubType = @This();

pub const files = [_][]const u8{"UpgradeAvatarSubType.json"};

AvatarID: u32 = 0,
AMAPBCEEKFP: enums.UpgradeAvatarSubRelicType = .None, // SubType

pub fn key(row: *const UpgradeAvatarSubType) u32 {
    return row.AvatarID;
}
