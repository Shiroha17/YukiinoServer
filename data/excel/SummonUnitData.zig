const enums = @import("enums");

const SummonUnitData = @This();

pub const files = [_][]const u8{"SummonUnitData.json"};

ID: u32 = 0,
JsonPath: []const u8 = "",
UniqueGroup: enums.SummonUnitUniqueGroup = .None,
DestroyOnEnterBattle: bool = false,
RemoveMazeBuffOnDestroy: bool = false,
IsClient: bool = false,

pub fn key(row: *const SummonUnitData) u32 {
    return row.ID;
}
