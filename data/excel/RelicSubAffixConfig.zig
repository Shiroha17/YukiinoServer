const enums = @import("enums");

const RelicSubAffixConfig = @This();

pub const files = [_][]const u8{"RelicSubAffixConfig.json"};

GroupID: u32 = 0,
AffixID: u32 = 0,
StepNum: u32 = 0,
Property: enums.AvatarPropertyType = .Unknown,

pub fn key(row: *const RelicSubAffixConfig) struct { u32, u32 } {
    return .{ row.GroupID, row.AffixID };
}
