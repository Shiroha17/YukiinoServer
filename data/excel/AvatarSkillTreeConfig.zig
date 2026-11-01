const AvatarSkillTreeConfig = @This();

pub const files = [_][]const u8{
    "AvatarSkillTreeConfig.json",
    "AvatarSkillTreeConfigLD.json",
};

PointID: u32 = 0,
Level: u32 = 0,
AvatarID: u32 = 0,
EnhancedID: u32 = 0,
DefaultUnlock: bool = false,
MaxLevel: u32 = 0,
AnchorType: []const u8 = "",

pub fn key(row: *const AvatarSkillTreeConfig) struct { u32, u32 } {
    return .{ row.PointID, row.Level };
}
