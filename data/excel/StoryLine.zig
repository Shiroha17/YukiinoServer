const enums = @import("enums");

const StoryLine = @This();

pub const files = [_][]const u8{"StoryLine.json"};

StoryLineID: u32 = 0,
BeginCondition: StoryLineCondition = .{},
EndCondition: StoryLineCondition = .{},
InitEntranceID: u32 = 0,
InitGroupID: u32 = 0,
InitAnchorID: u32 = 0,

pub fn key(row: *const StoryLine) u32 {
    return row.StoryLineID;
}

pub const StoryLineCondition = struct {
    Type: ?enums.StoryLineConditionType = null,
    Param: u32 = 0,
};
