const enums = @import("enums");

const RelicMainAffixConfig = @This();

pub const files = [_][]const u8{"RelicMainAffixConfig.json"};

GroupID: u32 = 0,
AffixID: u32 = 0,
Property: enums.AvatarPropertyType = .Unknown,

pub fn key(row: *const RelicMainAffixConfig) struct { u32, u32 } {
    return .{ row.GroupID, row.AffixID };
}
