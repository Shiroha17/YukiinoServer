const BlindBoxPet = @This();

pub const files = [_][]const u8{"BlindBoxPet.json"};

PBLDLDIEFNC: u32 = 0, // PetID
Type: []const u8 = "", // PetType

pub fn key(row: *const BlindBoxPet) u32 {
    return row.PBLDLDIEFNC;
}
