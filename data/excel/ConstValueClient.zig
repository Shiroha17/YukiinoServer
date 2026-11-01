const util = @import("util");

const ConstValueClient = @This();

pub const files = [_][]const u8{"ConstValueClient.json"};

ConstValueName: []const u8 = "",
Value: util.ConstValue = .{},

pub fn key(row: *const ConstValueClient) []const u8 {
    return row.ConstValueName;
}
