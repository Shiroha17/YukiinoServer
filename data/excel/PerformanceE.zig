const PerformanceE = @This();

pub const files = [_][]const u8{"PerformanceE.json"};

PerformanceID: u32 = 0,
PerformancePath: []const u8 = "",

pub fn key(row: *const PerformanceE) u32 {
    return row.PerformanceID;
}
