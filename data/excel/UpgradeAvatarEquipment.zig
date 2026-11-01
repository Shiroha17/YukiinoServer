const enums = @import("enums");

const UpgradeAvatarEquipment = @This();

pub const files = [_][]const u8{"UpgradeAvatarEquipment.json"};

NBFOFKGNNIO: u32 = 0, // EquipmentId
AvatarBaseType: enums.AvatarBaseType = .Unknown, // BaseType

pub fn key(row: *const UpgradeAvatarEquipment) enums.AvatarBaseType {
    return row.AvatarBaseType;
}
