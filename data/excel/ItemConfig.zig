const enums = @import("enums");
const util = @import("util");

const ItemConfig = @This();

pub const files = [_][]const u8{
    "ItemConfig.json",
    "ItemConfigAvatar.json",
    "ItemConfigAvatarPlayerIcon.json",
    "ItemConfigAvatarRank.json",
    "ItemConfigBook.json",
    "ItemConfigDisk.json",
    "ItemConfigEquipment.json",
    "ItemConfigRelic.json",
    "ItemPlayerCard.json",
    "ItemConfigPlayerRoomDynamic.json",
    "ItemConfigBadge.json",
    "ItemConfigAvatarSkin.json",
};

ID: u32 = 0,
ItemName: util.HashName = .{},
ItemMainType: enums.ItemMainType = .Unknown,
ItemSubType: enums.ItemSubType = .Unknown,
Rarity: enums.ItemRarity = .Unknown,
PileLimit: u32 = 0,
PurposeType: u32 = 0,
UseMethod: enums.ItemUseMethod = .Unknown,
ReturnItemIDList: []const util.MappingInfoItem = &.{},

pub fn key(row: *const ItemConfig) u32 {
    return row.ID;
}
