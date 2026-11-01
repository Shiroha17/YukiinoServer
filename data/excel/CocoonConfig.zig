const CocoonConfig = @This();

pub const files = [_][]const u8{"CocoonConfig.json"};

ID: u32 = 0,
MappingInfoID: u32 = 0,
WorldLevel: u32 = 0,
PropID: u32 = 0,
StaminaCost: u32 = 0,
MaxChallengeCnt: u32 = 0,
StageIDList: []const u32 = &.{},
DropList: []const u32 = &.{},

pub fn key(row: *const CocoonConfig) struct { u32, u32 } {
    return .{ row.ID, row.WorldLevel };
}
