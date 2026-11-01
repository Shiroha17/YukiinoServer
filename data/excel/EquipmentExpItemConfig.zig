const EquipmentExpItemConfig = @This();

pub const files = [_][]const u8{"EquipmentExpItemConfig.json"};

ItemID: u32 = 0,
ExpProvide: u32 = 0,

pub fn key(row: *const EquipmentExpItemConfig) u32 {
    return row.ItemID;
}
