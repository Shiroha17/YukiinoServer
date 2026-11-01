const GroupSystemUnlockData = @This();

pub const files = [_][]const u8{"GroupSystemUnlockData.json"};

GroupSystemUnlockID: u32 = 0,
UnlockID: u32 = 0,

pub fn key(row: *const GroupSystemUnlockData) u32 {
    return row.GroupSystemUnlockID;
}
