const BlindBoxPoolItem = @This();

pub const files = [_][]const u8{"BlindBoxPoolItem.json"};

PoolID: u32 = 0,
ItemID: u32 = 0, // PetID
IODLAAIECIG: u32 = 0, // AppearanceID
FCOKEIGNAIN: u32 = 0, // ModelID

// ShirohaDH keeps this table as a plain list; these three fields are unique per row.
pub fn key(row: *const BlindBoxPoolItem) struct { u32, u32, u32 } {
    return .{ row.PoolID, row.ItemID, row.IODLAAIECIG };
}
