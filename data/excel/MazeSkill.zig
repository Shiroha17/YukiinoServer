const MazeSkill = @This();

pub const files = [_][]const u8{
    "MazeSkill.json",
    "MazeSkillLD.json",
};

MazeSkillId: u32 = 0,
MPCost: u32 = 0,
MazeSkilltype: u32 = 0,

pub fn key(row: *const MazeSkill) u32 {
    return row.MazeSkillId;
}
