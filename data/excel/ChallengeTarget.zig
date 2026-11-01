const ChallengeTarget = @This();

pub const files = [_][]const u8{
    "ChallengeTargetConfig.json",
    "ChallengeStoryTargetConfig.json",
    "ChallengeBossTargetConfig.json",
};

ID: u32 = 0,
ChallengeTargetType: ChallengeType = .None,
ChallengeTargetParam1: u32 = 0,

pub fn key(row: *const ChallengeTarget) u32 {
    return row.ID;
}

pub const ChallengeType = enum {
    None,
    ROUNDS,
    DEAD_AVATAR,
    KILL_MONSTER,
    AVATAR_BASE_TYPE_MORE,
    AVATAR_BASE_TYPE_LESS,
    ROUNDS_LEFT,
    TOTAL_SCORE,
};
