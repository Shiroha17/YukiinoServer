const GachaBasicInfo = @This();

pub const files = [_][]const u8{"GachaBasicInfo.json"};

GachaID: u32 = 0,

pub fn key(row: *const GachaBasicInfo) u32 {
    return row.GachaID;
}
