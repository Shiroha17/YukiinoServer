const std = @import("std");

const StaminaSaleConfig = @This();

pub const files = [_][]const u8{"StaminaSaleConfig.json"};

Times: u32 = 0,
Price: std.json.ArrayHashMap(u32) = .{},
ToStamina: u32 = 0,

pub fn key(row: *const StaminaSaleConfig) u32 {
    return row.Times;
}
