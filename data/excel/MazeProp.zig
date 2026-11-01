const enums = @import("enums");
const util = @import("util");

const MazeProp = @This();

pub const files = [_][]const u8{"MazeProp.json"};

ID: u32 = 0,
PropName: util.HashName = .{},
JsonPath: []const u8 = "",
PropType: enums.PropType = .PROP_NONE,
PropStateList: []const enums.PropState = &.{},

pub fn key(row: *const MazeProp) u32 {
    return row.ID;
}
