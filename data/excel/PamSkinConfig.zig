const PamSkinConfig = @This();

pub const files = [_][]const u8{"PamSkinConfig.json"};

SkinID: u32 = 0,

pub fn key(row: *const PamSkinConfig) u32 {
    return row.SkinID;
}
