const enums = @import("enums");
const util = @import("util");

const MainMission = @This();

pub const files = [_][]const u8{"MainMission.json"};

MainMissionID: u32 = 0,
Name: util.HashName = .{},
TakeOperation: enums.Operation = .And,
BeginOperation: enums.Operation = .And,
TakeParam: []const MissionParam = &.{},
BeginParam: []const MissionParam = &.{},
RewardID: u32 = 0,
SubRewardList: []const u32 = &.{},

pub fn key(row: *const MainMission) u32 {
    return row.MainMissionID;
}

pub const MissionParam = struct {
    Type: enums.MissionTakeType = .MultiSequence,
    Value: u32 = 0,
};
