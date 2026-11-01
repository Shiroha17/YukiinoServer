const ExpType = @This();

pub const files = [_][]const u8{"ExpType.json"};

TypeID: u32 = 0,
Level: u32 = 0,
Exp: u32 = 0,

pub fn key(row: *const ExpType) struct { u32, u32 } {
    return .{ row.TypeID, row.Level };
}
