const enums = @import("enums");

const InteractConfig = @This();

pub const files = [_][]const u8{"InteractConfig.json"};

InteractID: u32 = 0,
SrcState: enums.PropState = .Closed,
TargetState: enums.PropState = .Closed,

pub fn key(row: *const InteractConfig) u32 {
    return row.InteractID;
}
