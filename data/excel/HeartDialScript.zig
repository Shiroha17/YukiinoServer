const enums = @import("enums");

const HeartDialScript = @This();

pub const files = [_][]const u8{"HeartDialScript.json"};

ScriptID: u32 = 0,
DefaultEmoType: enums.HeartDialEmoType = .Peace,
StepList: []const enums.HeartDialStepType = &.{},
MissingEmoList: []const enums.HeartDialEmoType = &.{},

pub fn key(row: *const HeartDialScript) u32 {
    return row.ScriptID;
}
