const PerformanceD = @This();

pub const files = [_][]const u8{"PerformanceD.json"};

PerformanceID: u32 = 0,
PerformancePath: []const u8 = "",

pub fn key(row: *const PerformanceD) u32 {
    return row.PerformanceID;
}
