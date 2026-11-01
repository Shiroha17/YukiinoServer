const enums = @import("enums");
const util = @import("util");

const FinishWay = @This();

pub const files = [_][]const u8{
    "FinishWay.json",
    "FinishWayRogue.json",
    "RogueDLCFinishWay.json",
};

ParamIntList: []const u32 = &.{},
ParamStr1: []const u8 = "",
ParamItemList: []const util.MappingInfoItem = &.{},
MazeFloorID: u32 = 0,
Progress: u32 = 0,
ID: u32 = 0,
ParamType: enums.QuestParaType = .Unknown,
ParamInt1: u32 = 0,
ParamInt2: u32 = 0,
MazePlaneID: u32 = 0,
FinishType: []const u8 = "",
ParamInt3: u32 = 0,
IsBackTrack: bool = false,

pub fn key(row: *const FinishWay) u32 {
    return row.ID;
}
