const enums = @import("enums");

const AvatarRelicRecommend = @This();

pub const files = [_][]const u8{"AvatarRelicRecommend.json"};

AvatarID: u32 = 0,
Set4IDList: []const u32 = &.{},
Set2IDList: []const u32 = &.{},
ScoreRankList: []const u32 = &.{},
PropertyList: []const AvatarRelicRecommendMainAffix = &.{},

pub fn key(row: *const AvatarRelicRecommend) u32 {
    return row.AvatarID;
}

pub const AvatarRelicRecommendMainAffix = struct {
    RelicType: enums.RelicType = .Unknow,
    PropertyType: enums.AvatarPropertyType = .Unknown,
};
