const enums = @import("enums");
const util = @import("util");

const MappingInfo = @This();

pub const files = [_][]const u8{"MappingInfo.json"};

ID: u32 = 0,
WorldLevel: u32 = 0,
FarmType: enums.FarmType = .None,
DisplayItemList: []const util.MappingInfoItem = &.{},

pub fn key(row: *const MappingInfo) struct { u32, u32 } {
    return .{ row.ID, row.WorldLevel };
}
