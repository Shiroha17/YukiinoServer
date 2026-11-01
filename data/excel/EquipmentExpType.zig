const EquipmentExpType = @This();

pub const files = [_][]const u8{"EquipmentExpType.json"};

ExpType: u32 = 0,
Level: u32 = 0,
Exp: u32 = 0,

pub fn key(row: *const EquipmentExpType) struct { u32, u32 } {
    return .{ row.ExpType, row.Level };
}
