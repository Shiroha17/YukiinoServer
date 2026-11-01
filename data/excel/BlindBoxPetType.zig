const BlindBoxPetType = @This();

pub const files = [_][]const u8{"BlindBoxPetType.json"};

Type: []const u8 = "", // PetType
AOBEAMFDGGC: u32 = 0, // RecycleDust

pub fn key(row: *const BlindBoxPetType) []const u8 {
    return row.Type;
}
