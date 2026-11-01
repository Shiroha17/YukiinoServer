const std = @import("std");
const Io = std.Io;
const json = std.json;
const Allocator = std.mem.Allocator;
const log = std.log.scoped(.excel);

pub const Excels = struct {
    // avatar
    adventure_player: Excel(@import("AdventurePlayer.zig")),
    avatar_config: Excel(@import("AvatarConfig.zig")),
    avatar_demo_config: Excel(@import("AvatarDemoConfig.zig")),
    avatar_exp_item_config: Excel(@import("AvatarExpItemConfig.zig")),
    avatar_ex_rank_config: Excel(@import("AvatarExRankConfig.zig")),
    avatar_global_buff_config: Excel(@import("AvatarGlobalBuffConfig.zig")),
    avatar_promotion_config: Excel(@import("AvatarPromotionConfig.zig")),
    avatar_relic_recommend: Excel(@import("AvatarRelicRecommend.zig")),
    avatar_skill_config: Excel(@import("AvatarSkillConfig.zig")),
    avatar_skill_tree_config: Excel(@import("AvatarSkillTreeConfig.zig")),
    avatar_skin: Excel(@import("AvatarSkin.zig")),
    exp_type: Excel(@import("ExpType.zig")),
    multiple_path_avatar_config: Excel(@import("MultiplePathAvatarConfig.zig")),
    special_avatar: Excel(@import("SpecialAvatar.zig")),
    upgrade_avatar_equipment: Excel(@import("UpgradeAvatarEquipment.zig")),
    upgrade_avatar_sub_relic: Excel(@import("UpgradeAvatarSubRelic.zig")),
    upgrade_avatar_sub_type: Excel(@import("UpgradeAvatarSubType.zig")),

    // item
    equipment_config: Excel(@import("EquipmentConfig.zig")),
    equipment_exp_item_config: Excel(@import("EquipmentExpItemConfig.zig")),
    equipment_exp_type: Excel(@import("EquipmentExpType.zig")),
    equipment_promotion_config: Excel(@import("EquipmentPromotionConfig.zig")),
    item_compose_config: Excel(@import("ItemComposeConfig.zig")),
    item_config: Excel(@import("ItemConfig.zig")),
    item_use_buff_data: Excel(@import("ItemUseBuffData.zig")),
    item_use_data: Excel(@import("ItemUseData.zig")),
    relic_config: Excel(@import("RelicConfig.zig")),
    relic_exp_item: Excel(@import("RelicExpItem.zig")),
    relic_exp_type: Excel(@import("RelicExpType.zig")),
    relic_main_affix_config: Excel(@import("RelicMainAffixConfig.zig")),
    relic_sub_affix_config: Excel(@import("RelicSubAffixConfig.zig")),
    reward_data: Excel(@import("RewardData.zig")),

    // shop
    gacha_basic_info: Excel(@import("GachaBasicInfo.zig")),
    gacha_ceiling: Excel(@import("GachaCeiling.zig")),
    recharge_config: Excel(@import("RechargeConfig.zig")),
    roll_shop_config: Excel(@import("RollShopConfig.zig")),
    roll_shop_reward: Excel(@import("RollShopReward.zig")),
    shop_config: Excel(@import("ShopConfig.zig")),
    shop_goods_config: Excel(@import("ShopGoodsConfig.zig")),
    stamina_sale_config: Excel(@import("StaminaSaleConfig.zig")),

    // mission
    achievement_data: Excel(@import("AchievementData.zig")),
    daily_active_config: Excel(@import("DailyActiveConfig.zig")),
    daily_active_quest_pool: Excel(@import("DailyActiveQuestPool.zig")),
    daily_quest: Excel(@import("DailyQuest.zig")),
    finish_way: Excel(@import("FinishWay.zig")),
    main_mission: Excel(@import("MainMission.zig")),
    main_mission_schedule: Excel(@import("MainMissionSchedule.zig")),
    optional_reward_quest: Excel(@import("OptionalRewardQuest.zig")),
    performance_d: Excel(@import("PerformanceD.zig")),
    performance_e: Excel(@import("PerformanceE.zig")),
    quest_data: Excel(@import("QuestData.zig")),
    raid_config: Excel(@import("RaidConfig.zig")),
    sub_mission: Excel(@import("SubMission.zig")),
    talk_reward: Excel(@import("TalkReward.zig")),

    // story
    heart_dial_dialogue: Excel(@import("HeartDialDialogue.zig")),
    heart_dial_script: Excel(@import("HeartDialScript.zig")),
    message_contacts_config: Excel(@import("MessageContactsConfig.zig")),
    message_group_config: Excel(@import("MessageGroupConfig.zig")),
    message_item_config: Excel(@import("MessageItemConfig.zig")),
    message_section_config: Excel(@import("MessageSectionConfig.zig")),
    story_line: Excel(@import("StoryLine.zig")),
    story_line_floor_data: Excel(@import("StoryLineFloorData.zig")),
    stroy_line_trial_avatar_data: Excel(@import("StroyLineTrialAvatarData.zig")),

    // scene
    back_ground_music: Excel(@import("BackGroundMusic.zig")),
    cocoon_config: Excel(@import("CocoonConfig.zig")),
    farm_element_config: Excel(@import("FarmElementConfig.zig")),
    interact_config: Excel(@import("InteractConfig.zig")),
    map_entrance: Excel(@import("MapEntrance.zig")),
    mapping_info: Excel(@import("MappingInfo.zig")),
    maze_buff: Excel(@import("MazeBuff.zig")),
    maze_chest: Excel(@import("MazeChest.zig")),
    maze_plane: Excel(@import("MazePlane.zig")),
    maze_prop: Excel(@import("MazeProp.zig")),
    maze_puzzle_switch_hand: Excel(@import("MazePuzzleSwitchHand.zig")),
    maze_skill: Excel(@import("MazeSkill.zig")),
    npc_data: Excel(@import("NPCData.zig")),
    npc_monster_data: Excel(@import("NPCMonsterData.zig")),
    plane_event: Excel(@import("PlaneEvent.zig")),
    summon_unit_data: Excel(@import("SummonUnitData.zig")),
    world_unlock_config: Excel(@import("WorldUnlockConfig.zig")),

    // battle
    battle_college_config: Excel(@import("BattleCollegeConfig.zig")),
    battle_target_config: Excel(@import("BattleTargetConfig.zig")),
    challenge_boss_extra: Excel(@import("ChallengeBossExtra.zig")),
    challenge_config: Excel(@import("ChallengeConfig.zig")),
    challenge_group: Excel(@import("ChallengeGroup.zig")),
    challenge_peak_boss_config: Excel(@import("ChallengePeakBossConfig.zig")),
    challenge_peak_config: Excel(@import("ChallengePeakConfig.zig")),
    challenge_peak_group_config: Excel(@import("ChallengePeakGroupConfig.zig")),
    challenge_peak_reward: Excel(@import("ChallengePeakReward.zig")),
    challenge_reward: Excel(@import("ChallengeReward.zig")),
    challenge_story_extra: Excel(@import("ChallengeStoryExtra.zig")),
    challenge_target: Excel(@import("ChallengeTarget.zig")),
    challenge_tierce: Excel(@import("ChallengeTierce.zig")),
    monster_config: Excel(@import("MonsterConfig.zig")),
    monster_drop: Excel(@import("MonsterDrop.zig")),
    monster_template_config: Excel(@import("MonsterTemplateConfig.zig")),
    stage_config: Excel(@import("StageConfig.zig")),
    stage_invasion_buff: Excel(@import("StageInvasionBuff.zig")),
    stage_invasion_config: Excel(@import("StageInvasionConfig.zig")),

    // activity
    activity_config: Excel(@import("ActivityConfig.zig")),
    activity_reality_show_config: Excel(@import("ActivityRealityShowConfig.zig")),
    activity_voracity_invasion_buf: Excel(@import("ActivityVoracityInvasionBuf.zig")),
    blind_box_pet: Excel(@import("BlindBoxPet.zig")),
    blind_box_pet_type: Excel(@import("BlindBoxPetType.zig")),
    blind_box_pool_item: Excel(@import("BlindBoxPoolItem.zig")),
    comic_dessert_cycle: Excel(@import("ComicDessertCycle.zig")),
    comic_dessert_device_upgrade: Excel(@import("ComicDessertDeviceUpgrade.zig")),
    comic_dessert_dish: Excel(@import("ComicDessertDish.zig")),
    comic_dessert_level: Excel(@import("ComicDessertLevel.zig")),
    expedition_harvest_data: Excel(@import("ExpeditionHarvestData.zig")),
    music_rhythm_group: Excel(@import("MusicRhythmGroup.zig")),
    music_rhythm_level: Excel(@import("MusicRhythmLevel.zig")),
    music_rhythm_phase: Excel(@import("MusicRhythmPhase.zig")),
    music_rhythm_song: Excel(@import("MusicRhythmSong.zig")),
    music_rhythm_sound_effect: Excel(@import("MusicRhythmSoundEffect.zig")),
    music_rhythm_track: Excel(@import("MusicRhythmTrack.zig")),
    offering_level_config: Excel(@import("OfferingLevelConfig.zig")),
    offering_type_config: Excel(@import("OfferingTypeConfig.zig")),
    train_party_area_config: Excel(@import("TrainPartyAreaConfig.zig")),
    train_party_area_goal_config: Excel(@import("TrainPartyAreaGoalConfig.zig")),
    train_party_passenger_config: Excel(@import("TrainPartyPassengerConfig.zig")),
    train_party_step_config: Excel(@import("TrainPartyStepConfig.zig")),

    // other
    badge_config: Excel(@import("BadgeConfig.zig")),
    const_value_client: Excel(@import("ConstValueClient.zig")),
    const_value_common: Excel(@import("ConstValueCommon.zig")),
    content_package_config: Excel(@import("ContentPackageConfig.zig")),
    func_unlock_data: Excel(@import("FuncUnlockData.zig")),
    group_system_unlock_data: Excel(@import("GroupSystemUnlockData.zig")),
    pam_skin_config: Excel(@import("PamSkinConfig.zig")),
    player_level_config: Excel(@import("PlayerLevelConfig.zig")),

    // chat
    chat_bubble_config: Excel(@import("ChatBubbleConfig.zig")),

    // pet
    pet: Excel(@import("Pet.zig")),

    // tutorial
    tutorial_data: Excel(@import("TutorialData.zig")),
    tutorial_guide_data: Excel(@import("TutorialGuideData.zig")),

    pub fn load(arena: Allocator, gpa: Allocator, io: Io, res_dir: Io.Dir) !Excels {
        var excel_dir = try res_dir.openDir(io, "ExcelOutput", .{});
        defer excel_dir.close(io);

        var excel: Excels = undefined;
        const excel_info = @typeInfo(Excels).@"struct"; // get each excel

        inline for (excel_info.field_names, excel_info.field_types) |name, excelType| {
            @field(excel, name) = try excelType.load(arena, gpa, io, excel_dir);
        }

        return excel;
    }
};

pub fn Excel(comptime Row: type) type {
    const Key = @typeInfo(@TypeOf(Row.key)).@"fn".return_type.?;

    const name = @typeName(Row);
    @setEvalBranchQuota(10000);
    const excel_name = name[std.mem.findScalarLast(u8, name, '.').? + 1 ..];

    const Index = if (Key == []const u8)
        std.StringHashMapUnmanaged(u32) // string key
    else
        std.AutoHashMapUnmanaged(Key, u32);

    return struct {
        const Self = @This();

        pub const RowType = Row;

        rows: []const Row,
        rows_index: Index, // key to excel row index

        pub fn get(self: *const Self, key: Key) ?*const Row {
            const index = self.rows_index.get(key) orelse return null;

            return &self.rows[index];
        }

        pub fn load(arena: Allocator, gpa: Allocator, io: Io, excel_dir: Io.Dir) !Self {
            var rows: std.ArrayList(Row) = .empty;
            for (Row.files) |file_name| {
                const excel_rows = try LoadExcel(Row, arena, gpa, io, excel_dir, file_name);
                try rows.appendSlice(arena, excel_rows);
            }

            var row_index: Index = .empty;
            try row_index.ensureTotalCapacity(arena, @intCast(rows.items.len));

            for (rows.items, 0..) |*row, index| {
                const entry = row_index.getOrPutAssumeCapacity(row.key());

                // if (entry.found_existing) {
                //  log.warn("{s}: duplicate key at row {d}", .{ @typeName(Row), index });
                //  continue;
                // }
                entry.value_ptr.* = @intCast(index);
            }

            log.info("loaded {d} {s} excels", .{ rows.items.len, excel_name });

            return .{
                .rows = rows.items,
                .rows_index = row_index,
            };
        }
    };
}

pub fn LoadExcel(
    comptime Row: type,
    arena: Allocator,
    gpa: Allocator,
    io: Io,
    excel_dir: Io.Dir,
    file_name: []const u8,
) ![]const Row {
    const file_bytes = excel_dir.readFileAlloc(io, file_name, gpa, .unlimited) catch |err| {
        log.err("{s}: read fail: {s}", .{ file_name, @errorName(err) });
        return err;
    };
    defer gpa.free(file_bytes);

    var scanner: json.Scanner = .initCompleteInput(gpa, file_bytes);
    defer scanner.deinit();

    var diagnostics: json.Diagnostics = .{};
    scanner.enableDiagnostics(&diagnostics);

    return json.parseFromTokenSourceLeaky([]const Row, arena, &scanner, .{
        .ignore_unknown_fields = true, // skip unnecessaty fields
        .allocate = .alloc_always, // copy string to arena
    }) catch |err| {
        log.err("{s}:{d}:{d}: {s}", .{
            file_name,
            diagnostics.getLine(),
            diagnostics.getColumn(),
            @errorName(err),
        });
        return err;
    };
}
