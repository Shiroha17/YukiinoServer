const Pet = @This();

pub const files = [_][]const u8{"PetConfig.json"};

PBLDLDIEFNC: u32 = 0, // PetID

pub fn key(row: *const Pet) u32 {
    return row.PBLDLDIEFNC;
}
