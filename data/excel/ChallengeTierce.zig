const ChallengeTierce = @This();

pub const files = [_][]const u8{
    "ChallengeMazeTierce.json",
    "ChallengeStoryMazeTierce.json",
    "ChallengeBossMazeTierce.json",
};

ID: u32 = 0,
DLCKKJFMJOB: u32 = 0, // PreChallengeMazeID
EMNJGCPDIFF: u32 = 0, // MapEntranceID
PHOIICMCGIH: u32 = 0, // MazeGroupID
MLMEGBLDFKE: []const u32 = &.{}, // ConfigList
JEBMBCLBIOI: []const u32 = &.{}, // NpcMonsterIDList
HFIAAGAKFMD: []const u32 = &.{}, // EventIDList
GNOOAGPBNLD: u32 = 0, // ChallengeCountDown
OGEOMCGNNMP: []const u32 = &.{}, // ChallengeTargetID
GNGENMHNLAH: u32 = 0, // ChallengeTierceTargetID
IMCMJHAMMKK: u32 = 0, // RewardID

pub fn key(row: *const ChallengeTierce) u32 {
    return row.ID;
}
