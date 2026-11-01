const enums = @import("enums");

const RaidConfig = @This();

pub const files = [_][]const u8{"RaidConfig.json"};

RaidID: u32 = 0,
HardLevel: u32 = 0,
FinishEntranceID: u32 = 0,
TeamType: enums.RaidTeamType = .None,
TrialAvatarList: []const u32 = &.{},
MainMissionIDList: []const u32 = &.{},
LockCaptain: bool = false,
LockCaptainAvatarID: u32 = 0,

pub fn key(row: *const RaidConfig) struct { u32, u32 } {
    return .{ row.RaidID, row.HardLevel };
}
