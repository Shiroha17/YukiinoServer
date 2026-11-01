const ContentPackageConfig = @This();

pub const files = [_][]const u8{"ContentPackageConfig.json"};

ContentID: u32 = 0,

pub fn key(row: *const ContentPackageConfig) u32 {
    return row.ContentID;
}
