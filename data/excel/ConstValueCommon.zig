const util = @import("util");

const ConstValueCommon = @This();

pub const files = [_][]const u8{"ConstValueCommon.json"};

ConstValueName: []const u8 = "",
Value: util.ConstValue = .{},

pub fn key(row: *const ConstValueCommon) []const u8 {
    return row.ConstValueName;
}
