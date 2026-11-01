const FarmElementConfig = @This();

pub const files = [_][]const u8{"FarmElementConfig.json"};

ID: u32 = 0,
WorldLevel: u32 = 0,
MappingInfoID: u32 = 0,
StaminaCost: u32 = 0,
MaxChallengeCnt: u32 = 0,
StageID: u32 = 0,

pub fn key(row: *const FarmElementConfig) struct { u32, u32 } {
    return .{ row.ID, row.WorldLevel };
}
