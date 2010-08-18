-- Icecrown Citadel
-- Db version requirement
ALTER TABLE db_version CHANGE COLUMN required_2_world_fixes required_3_world_icecrown_citadel bit;

-- Cleaning scripts names for npc and bosses
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (37813,38508,36626,36855,38222,36672,36612,38711,36678,37697,36853,36597,38995,36633,36609,37695,38757,36701,36725,37011,36724,37012,37007,36811,36807,36829,36844,36808,38135,37949,36627,36897,36899,37973,37970,37972,36789,38429,38068,38369,38332,38454,38422,38451);
UPDATE `gameobject_template` SET `ScriptName`='' WHERE `entry` IN (202235,202242,202244,202243,202245,202246,202182,202181);
DELETE FROM `creature` WHERE `id`=38995;

-- Some npcs adjustment i put first cos maybe can be deleted or uptade with d following lines
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37006, 0, 0, 0, 0, 0, 11686, 11686, 11686, 0, 'Sticky Ooze', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 2, 2, 0, 24, 1, 2000, 2000, 1, 2, 8, 0, 0, 0, 0, 0, 1, 1, 0, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 201786289, 0, 'npc_sticky_ooze');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37013, 0, 0, 0, 0, 0, 11686, 11686, 11686, 0, 'Puddle Stalker', '', '', 0, 1, 1, 0, 14, 14, 0, 1, 0, 2, 2, 0, 24, 1, 2000, 2000, 1, 33554432, 8, 0, 0, 0, 0, 0, 1, 1, 100, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2067619643, 0, 'npc_flood_ooze');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`,  `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38068, 0, 0, 0, 0, 0, 169, 11686, 169, 0, 'Mana Void', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 307, 459, 0, 115, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 246, 367, 92, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100677675, 0, 'npc_manavoid_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (34606, 0, 0, 0, 0, 0, 25144, 25144, 25144, 25144, 'Frost Sphere', '', '', 0, 80, 80, 2, 15, 15, 0, 1, 0, 420, 630, 0, 157, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 8, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66193, 67855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.238095, 1, 0, 0, 0, 0, 0, 0, 0, 721, 1, 0, 536961024, 0, 'frost_sphere');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38159, 0, 0, 0, 0, 0, 27823, 27823, 27823, 0, 'Choking Gas Bomb', '', '', 0, 80, 80, 2, 2068, 2068, 0, 1, 0, 422, 586, 0, 642, 1.4, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 345, 509, 103, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 4.71733, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 118429499, 0, 'npc_choke_bomb');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38332, 0, 0, 0, 0, 0, 26767, 19725, 26767, 0, 'Ball of Flame', '', '', 0, 1, 1, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 162, 1, 0, 0, 0, 'npc_fireball_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38451, 0, 0, 0, 0, 0, 26767, 19725, 26767, 0, 'Ball of Inferno Flame', '', '', 0, 1, 1, 2, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 162, 1, 0, 0, 0, 'npc_empfireball_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38004, 0, 0, 0, 0, 0, 31093, 31093, 31093, 0, 'Blood-Queen Lana\'thel', '', '', 0, 80, 80, 2, 14, 14, 0, 1, 3, 1, 1, 0, 1, 2, 2000, 2000, 2, 16777220, 8, 0, 0, 0, 0, 0, 1, 1, 1, 6, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 861, 1, 0, 0, 0, 0, 0, 0, 0, 150, 1, 0, 1610612735, 0, 'lanathel_intro');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38422, 0, 0, 0, 0, 0, 23258, 23258, 23258, 0, 'Shock Vortex', '', '', 0, 80, 80, 2, 16, 16, 0, 1, 1, 1, 1, 0, 1, 2, 2000, 2000, 1, 524290, 8, 0, 0, 0, 0, 0, 1, 1, 1, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 116345719, 0, 'npc_vortex_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38454, 0, 0, 0, 0, 0, 19725, 19725, 19725, 0, 'Kinetic Bomb', '', '', 0, 82, 82, 2, 14, 14, 0, 1, 1, 452, 678, 0, 169, 17.6, 2000, 2000, 1, 2, 8, 0, 0, 0, 0, 0, 362, 542, 135, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.074179, 1, 0, 0, 0, 0, 0, 0, 0, 64, 1, 0, 805306367, 0, 'npc_bomb_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37985, 0, 0, 0, 0, 0, 30877, 30877, 30877, 0, 'Dream Cloud', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 1, 1, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 400, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2128592795, 0, 'npc_dreamcloud_icc');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37690, 0, 0, 0, 0, 0, 24719, 24719, 24719, 0, 'Growing Ooze Puddle', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 262146, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.238095, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2304, 0, 'npc_puddle_ooze');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (37813, 38402, 38582, 38583, 0, 0, 30790, 0, 30790, 0, 'Deathbringer Saurfang', '', 'vehichleCursor', 0, 83, 83, 2, 2212, 2212, 0, 1, 3, 468, 702, 0, 175, 47.2, 2000, 2000, 4, 0, 0, 0, 0, 0, 0, 0, 374, 562, 140, 6, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26662, 72378, 73058, 72385, 0, 0, 0, 0, 0, 639, 0, 0, '', 0, 3, 630, 1, 0, 0, 0, 0, 0, 0, 0, 150, 1, 2064, 650854399, 1, 'boss_saurfang');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38285, 0, 0, 0, 0, 0, 31008, 0, 31008, 0, 'Mutated Abomination', '', 'vehichleCursor', 0, 82, 82, 2, 14, 14, 0, 1, 1, 488, 642, 0, 782, 8.5, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 363, 521, 121, 6, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72508, 72527, 70539, 70542, 0, 0, 0, 0, 0, 591, 0, 0, '', 0, 3, 167.345, 1, 0, 0, 0, 0, 0, 0, 0, 170, 1, 0, 609320197, 0, 'npc_abomination');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38556, 0, 0, 0, 0, 0, 12349, 12349, 12349, 0, 'Malleable Ooze Stalker', '', '', 0, 81, 81, 2, 14, 14, 0, 1, 0, 436, 654, 0, 163, 1, 2000, 2000, 1, 262146, 8, 0, 0, 0, 0, 0, 349, 523, 130, 10, 16777218, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_malleable_goo');

DELETE FROM `creature_template` WHERE (`entry`=36823);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (36823, 0, 0, 0, 0, 0, 31021, 0, 0, 0, 'Terenas Menethil', '', '', 0, 80, 80, 2, 35, 35, 0, 1, 1, 391, 585, 0, 146, 2.2, 2000, 2000, 2, 524288, 0, 0, 0, 0, 0, 0, 313, 468, 117, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69382, 72595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 25, 15, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_terenas_menethil');

DELETE FROM `creature_template` WHERE (`entry`=36824);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (36824, 39296, 0, 0, 0, 38121, 31471, 0, 0, 0, 'Spirit Warden', '', '', 0, 80, 80, 2, 14, 14, 0, 1, 1, 391, 585, 0, 146, 2, 2000, 2000, 2, 524288, 0, 0, 0, 0, 0, 0, 313, 468, 117, 6, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69383, 74086, 69397, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 20, 15, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1758157559, 0, 'npc_spirit_warden');


-- No scriptnames npcs
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (36610, 0, 0, 0, 0, 0, 1126, 11686, 1126, 0, 'Exploding Orb', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69019, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'TotemAI', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38458, 0, 0, 0, 0, 0, 19725, 19725, 19725, 19725, 'Kinetic Bomb Target', '', '', 0, 80, 80, 2, 14, 14, 0, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 2, 8, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 439306935, 128, '');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500200, 0, 0, 0, 0, 0, 31962, 31962, 31962, 0, 'Andu', 'Awesome Developer - IMMA FIRING MY LAZER', '', 0, 82, 82, 2, 14, 14, 0, 0.8, 3, 391, 744, 0, 192, 69, 1340, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 362, 542, 135, 7, 0, 500200, 0, 0, 155, 155, 155, 155, 155, 155, 40859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8934, 8934, 'EventAI', 0, 3, 260.5, 20, 0, 0, 0, 0, 0, 0, 0, 179, 1, 2013, 670007231, 1, '');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500202, 0, 0, 0, 0, 0, 17312, 0, 0, 0, 'Andu', '', '', 0, 83, 83, 0, 16, 16, 0, 1, 1, 3000, 7000, 0, 0, 1, 2.7, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500202, 0, 0, 0, 0, 0, 0, 0, 0, 59971, 68147, 0, 0, 0, 0, 0, 0, 0, 0, 30, 60, 'EventAI', 0, 1, 500000, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500203, 0, 0, 0, 0, 0, 20047, 0, 0, 0, 'Wrathkeeper', '', '', 0, 80, 82, 0, 16, 16, 0, 1.5, 1, 7000, 12000, 0, 0, 1, 2000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500203, 0, 0, 0, 0, 0, 0, 0, 0, 13009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 100, 'EventAI', 1, 1, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38879, 0, 0, 0, 0, 0, 11686, 11686, 11686, 0, 'Putricide\'s Trap', '', '', 0, 80, 80, 2, 2212, 2212, 0, 1, 0, 420, 630, 0, 157, 1, 2000, 2000, 1, 33816578, 8, 0, 0, 0, 0, 0, 336, 504, 126, 10, 1048576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, '');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500201, 0, 0, 0, 0, 0, 12345, 12345, 12345, 0, 'Rikimarus Impilus', 'Narcisus Handsomus Gmus - HESA FIRING ZE LAZER', '', 0, 81, 81, 2, 14, 14, 0, 1.3, 1, 452, 678, 0, 133, 44, 3000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 362, 542, 135, 4, 0, 500201, 0, 0, 30, 30, 30, 30, 30, 30, 66532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8934, 8934, 'EventAI', 0, 3, 69.5, 20, 0, 0, 0, 0, 0, 0, 0, 179, 2, 2013, 646922239, 1, '');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500204, 0, 0, 0, 0, 0, 10691, 0, 0, 0, 'Dreadcaller', '', '', 0, 80, 82, 0, 16, 16, 0, 1.2, 1, 3000, 5000, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500204, 0, 0, 0, 0, 0, 0, 0, 0, 70281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 1, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');DELETE FROM `creature_template` WHERE (`entry`=500205);

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500205, 0, 0, 0, 0, 0, 20214, 0, 0, 0, 'Mistress of Pain', '', '', 0, 80, 82, 0, 16, 6, 0, 1.1, 1, 3000, 5000, 0, 0, 1, 1700, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 500205, 0, 0, 0, 0, 0, 0, 0, 0, 71289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 60, 'EventAI', 0, 3, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=500206);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500206, 0, 0, 0, 0, 0, 19200, 0, 0, 0, 'Terrormaster', '', '', 0, 80, 82, 0, 16, 16, 0, 1.2, 1, 10000, 15000, 0, 0, 1, 3000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 130, 'EventAI', 0, 3, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=500207);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500207, 0, 0, 0, 0, 0, 18654, 0, 0, 0, 'Felguard Summoner', '', '', 0, 80, 82, 0, 16, 16, 0, 1.2, 1, 4000, 10000, 0, 0, 1, 2000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 00, 'EventAI', 0, 1, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=500208);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (500208, 0, 0, 0, 0, 0, 6173, 0, 0, 0, 'Felpuppy', '', '', 0, 80, 82, 0, 16, 16, 0, 1.1, 1, 1000, 5000, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 30, 'EventAI', 0, 1, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

-- Wrong type class
-- Not sure if class is 1 need to check this on game to see if need it to have mana
UPDATE `creature_template` SET `unit_class`='1' WHERE `entry` IN (38285,438700,500202,500203,500204,500205,500206,500207,500208);

-- Can be equipet some items like robe, etc in a mob, who use this entries?
UPDATE `creature_equip_template`SET `equipentry1`='0', `equipentry2`='0', `equipentry3`='0' WHERE `entry`='500203';

-- Wrong faction
UPDATE `creature_template` SET `faction_A`='16', `faction_H`='16' WHERE `entry`='27805'; 
UPDATE `creature_template` SET `faction_A`='1801', `faction_H`='1801' WHERE `entry`='27826'; 

-- Wrong move generation
UPDATE `creature_template` SET `MovementType`='1'WHERE `entry`='438700'; 
UPDATE `creature` SET `MovementType`='1'WHERE `guid`='54575'; 

-- Declaring instance
UPDATE `instance_template` SET `script`='instance_icecrown_citadel' WHERE (`map`='631');

-- Some gameobjet for ICC (teleporters)
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_teleporter' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202223;
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202242;

DELETE FROM `gameobject_scripts` WHERE `id`=201584;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`) VALUES
(201584, 0, 15, 70308, 0, '0'), -- transformation
(201584, 5000, 15, 70311, 0, '0'), -- transformation end
(201584, 5000, 13, 201584, 0, '0'); -- spawn

DELETE FROM `gameobject` WHERE `id`=203624;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2151041, 203624, 724, 1, 32, 3154.56, 535.418, 72.8889, 5.53401, 0, 0, 0.36589, -0.930658, 3000, 0, 1);

REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES (202796, 10, 1327, 'Twilight Portal', '', '', '', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `gameobject_scripts` WHERE `id`=201584;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`) VALUES
(201584, 0, 15, 70308, 0, '0'), -- transformation
(201584, 5000, 15, 70311, 0, '0'), -- transformation end
(201584, 5000, 13, 201584, 0, '0'); -- spawn

DELETE FROM `gameobject_template` WHERE (`entry`=202078);
INSERT INTO `gameobject_template` VALUES (202078, 14, 9256, 'Arthas Precipice', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
DELETE FROM `gameobject_template` WHERE (`entry`=202161);
INSERT INTO `gameobject_template` VALUES (202161, 14, 9276, 'Arthas Platform',  '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
INSERT INTO `gameobject_template` VALUES (409227, 5, 9227, 'IceCrown_FT_Spike', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
INSERT INTO `gameobject_template` VALUES (409256, 14, 9256, 'IceCrown_FT_Structure', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
INSERT INTO `gameobject_template` VALUES (409257, 14, 9257, 'IceCrown_FT_Platform_Phase1', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
INSERT INTO `gameobject_template` VALUES (409258, 14, 9258, 'IceCrown_FT_Platform_Phase2', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
INSERT INTO `gameobject_template` VALUES (409259, 14, 9259, 'IceCrown_FT_Platform_Phase3', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
INSERT INTO `gameobject_template` VALUES (409276, 14, 9276, 'IceCrown_FT_Platform_Edge', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);
INSERT INTO `gameobject_template` VALUES (409331, 5, 9331, 'IceCrown_FT_Bolvar_Sitting', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);

-- Some creature_ai_scripts
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34606);
INSERT INTO `creature_ai_scripts` VALUES 
(270000, 34606, 6, 0, 100, 7, 0, 0, 0, 0, 11, 66193, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Force Cast');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=38879);
INSERT INTO `creature_ai_scripts` VALUES 
(3887900, 38879, 9, 0, 100, 6, 1, 25, 15000, 20000, 11, 70460, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Putricide Trap Trigger');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500200);
INSERT INTO `creature_ai_scripts` VALUES 
( 5002004, 500200, 0, 0, 100, 6, 18000, 28000, 38000, 39000, 11, 33525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'LAZER4'),
( 5002003, 500200, 0, 0, 100, 6, 6000, 18000, 8000, 11000, 11, 40860, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'LAZER3'),
( 5002001, 500200, 0, 0, 100, 0, 9000, 12000, 4000, 8000, 11, 40861, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'LAZER2'),
( 5002000, 500200, 0, 0, 100, 0, 4000, 4000, 2000, 2000, 11, 40859, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Awesome'),
( 5002002, 500200, 0, 0, 100, 7, 17000, 17000, 32000, 32000, 11, 64766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'LAZER1'),
(5002005, 500200, 0, 0, 100, 6, 18000, 28000, 38000, 39000, 12, 500201, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SUMMON!');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500201);
INSERT INTO `creature_ai_scripts` VALUES 
( 5002011, 500201, 0, 0, 100, 6, 4000, 6000, 3000, 5000, 11, 69405, 0, 1, 5, 3, 0, 0, 0, 0, 0, 0, '0'),
( 5002012, 500201, 0, 0, 100, 6, 2000, 3000, 10000, 15000, 11, 74648, 0, 1, 5, 3, 0, 0, 0, 0, 0, 0, '0'),
( 5002013, 500201, 0, 0, 100, 6, 8000, 12000, 4000, 9000, 11, 51074, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(5002014, 500201, 0, 0, 100, 6, 30000, 50000, 45000, 90000, 11, 45717, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500205);
INSERT INTO `creature_ai_scripts` VALUES 
(50020501, 500205, 0, 0, 100, 7, 10000, 10000, 10000, 10000, 11, 71289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Possess');

REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (5002005, 500200, 0, 0, 100, 6, 30000, 36000, 100000, 140000, 12, 500201, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SUMMON!');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500207);
INSERT INTO `creature_ai_scripts` VALUES 
(50020701, 500207, 4, 0, 100, 7, 0, 0, 0, 0, 12, 500208, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summon Felpuppy');

-- Some spell_linked_spell
DELETE FROM `spell_linked_spell` where `spell_trigger`='-69290' AND `spell_effect`='72103';
REPLACE INTO `spell_linked_spell` VALUES (-69290, 72103, 0, 'Festergut: Spores end => Inoculated');

DELETE FROM `spell_linked_spell` where `spell_trigger` IN ('70157','70117',69785,71340,65684,65686);
DELETE FROM `spell_linked_spell` where `spell_trigger`='-71224';
DELETE FROM `spell_linked_spell` where `spell_trigger`='-73022';
DELETE FROM `spell_linked_spell` where `spell_trigger`='-69783';
DELETE FROM `spell_linked_spell` where `spell_trigger`='-70308';

REPLACE INTO `spell_linked_spell` VALUES (70117, 70122, 1, 'Sindragosa: Icy Grip Trigger => Icy Grip');
REPLACE INTO `spell_linked_spell` VALUES (-71224, 69706, 0, 'Rotface: Mutated Infection => Little Ooze');
REPLACE INTO `spell_linked_spell` VALUES (-73022, 69706, 0, 'Rotface: Mutated Infection HC => Little Ooze');
REPLACE INTO `spell_linked_spell` VALUES (-69783, 69785, 0, 'Rotface: Flood => Flood1');
REPLACE INTO `spell_linked_spell` VALUES (69785, 69788, 2, 'Rotface: Flood1 => Flood2');
REPLACE INTO `spell_linked_spell` VALUES (71340, 71341, 2, 'Lanathel: Darkfallen1 => Darkfallen2');
REPLACE INTO `spell_linked_spell` VALUES (-70308, 70311, 0, 'Abomination Transformation');
REPLACE INTO `spell_linked_spell` VALUES (65684, -65686, 0, 'Light Essence -> Dark Essence '); 
REPLACE INTO `spell_linked_spell` VALUES (65686, -65684, 0, 'Dark Essence -> Light Essence');
REPLACE INTO `spell_linked_spell` VALUES (-74562, 74610, 0, 'Fiery Combustion removed -> Combustion');
REPLACE INTO `spell_linked_spell` VALUES (-74792, 74800, 0, 'Soul Consumption removed -> Consumption');
REPLACE INTO `spell_linked_spell` VALUES (-72372, 73655, 0, 'LichKing: Frostmourn effect add for tele into blade!');
REPLACE INTO `spell_linked_spell` VALUES (-74326, 73655, 0, 'LichKing: Frostmourn effect add for tele into blade( H )!');
REPLACE INTO `spell_linked_spell` VALUES (-74086, 68090, 0, 'Soul Rip damage!');

-- Some fix for NPCs 
-- I did before replacament for no miss anyone
UPDATE `creature_template` set `minlevel` = 80,`maxlevel` = 80,`faction_A` = 16,`Faction_H` = 16,`unit_flags` = 2 where `entry` in (36672);
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35', `unit_flags` = '8', `type_flags` = '67113038' WHERE `entry` IN(36789,10067,10068,10069);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 30090; -- Vortex 'Arcane Overload', 'Hover Disk');
UPDATE `creature_template` SET `flags_extra` = 2, `faction_A` = 35, `faction_H` = 35, `VehicleId` = 165 WHERE `entry` IN (30234, 30248); -- Hover Disk
UPDATE `creature_template` SET `flags_extra` = 2, `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 30118; -- Portal (Malygos)
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 30282;
UPDATE `creature_template` SET `mechanic_immune_mask` = 634339327 WHERE `entry` = 36855;
UPDATE `creature_ai_scripts` SET `action1_param1` = 71258 WHERE `id` = 26021102;
DELETE FROM `creature_template_addon` where `entry` IN (5542668,5542667);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES ('5542668', '36476', '4097');
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES ('5542667', '36661', '4097');
UPDATE `creature_template` SET `baseattacktime` = 3000, `Health_mod` = 100, `Mana_mod` = 100 WHERE `entry` = 500202;
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500202;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500202);
INSERT INTO `creature_ai_scripts` VALUES 
( 50020211, 500202, 0, 0, 100, 7, 10000, 20000, 15000, 30000, 11, 59971, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rain of fire'),
(50020212, 500202, 2, 0, 100, 7, 10, 10, 0, 0, 11, 59971, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Hellfire');
DELETE FROM `creature_equip_template` WHERE (`entry`=500203);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500203, 20033, 20009, 9060);
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500203;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500203);
INSERT INTO `creature_ai_scripts` VALUES 
(50020301, 500203, 0, 0, 100, 7, 10000, 10000, 10000, 10000, 11, 13009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Knockback');
UPDATE `creature_template` SET `type` = 3 WHERE `entry` = 500204;
UPDATE `creature_template` SET `spell2` = 69389 WHERE `entry` = 500204;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500204);
INSERT INTO `creature_ai_scripts` VALUES 
(50020401, 500204, 0, 0, 100, 7, 1000, 2000, 3000, 3000, 11, 70281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emp Shadow Bolt');
UPDATE `creature_template` SET `mindmg` = 20000, `maxdmg` = 25000 WHERE `entry` = 500206;
DELETE FROM `creature_equip_template` WHERE (`entry`=500206);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500206, 19352, 0, 0);
UPDATE `creature_template` SET `spell1` = 17012 WHERE `entry` = 500208;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=500208);
INSERT INTO `creature_ai_scripts` VALUES 
(50020801, 500208, 0, 0, 100, 7, 10000, 10000, 10000, 15000, 11, 17012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Devour Magic');

-- Equip templates
DELETE FROM `creature_equip_template` WHERE (`entry`=500207);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (500207, 25210, 0, 0);
UPDATE `creature_template` SET `mindmg` = 15000, `maxdmg` = 20000 WHERE `entry` = 500207;

-- Fix for vehicles
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '37813';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38402';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38582';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38583';
UPDATE `creature_template` SET `VehicleId` = '639' WHERE `entry` = '38583';
UPDATE `creature_template` SET `VehicleId` = '591' WHERE `entry` = '38583';

-- Some loots
DELETE FROM `creature_loot_template` WHERE (`entry`=500209) AND (`item`=50307);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES (500209, 50307, 100,  '1', '1');
UPDATE `creature_template` SET `lootid` = '500209' WHERE `entry` = '38248';

-- First declaring scripts names
# Boss
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel' WHERE (`entry`='37955');
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_keleset_icc' WHERE `entry` = 37972;
UPDATE `creature_template` SET `ScriptName`='boss_blood_elf_taldaram_icc' WHERE `entry` = 37973;
UPDATE `creature_template` SET `ScriptName`='boss_blood_council' WHERE (`entry`='37970');
UPDATE `creature_template` SET `ScriptName`='boss_festergut' WHERE (`entry`='36626');
UPDATE `creature_template` SET `ScriptName`='boss_saurfang' WHERE (`entry`='37813');
UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwisper' WHERE (`entry`='36855');
UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide' WHERE (`entry`='36678');
UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE (`entry`='36853');
UPDATE `creature_template` SET `ScriptName`='boss_valithria' WHERE `entry` = 36789;
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king' WHERE (`entry`='36597');
UPDATE `creature_template` SET `ScriptName`='boss_rotface' WHERE `entry`= 36627;
UPDATE `creature_template` SET `ScriptName`='boss_lord_marrowgar' WHERE (`entry`='36612');

# Mobs
UPDATE `creature_template` SET `ScriptName`='npc_tirion_icc' WHERE (`entry`='38995');
UPDATE `creature_template` SET `ScriptName`='npc_swarming_shadows' WHERE (`entry`='38163');
UPDATE `creature_template` SET `ScriptName`='npc_bloodbeast' WHERE (`entry`='38508');
UPDATE `creature_template` SET `ScriptName`='npc_cold_flame' WHERE (`entry`='36672');
UPDATE `creature_template` SET `ScriptName`='npc_bone_spike' WHERE (`entry`='38711'); 
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze' WHERE (`entry`='37697');  
UPDATE `creature_template` SET `ScriptName`='npc_ice_puls_icc' WHERE (`entry`='36633');
UPDATE `creature_template` SET `ScriptName`='npc_valkyr_icc' WHERE (`entry`='36609');
UPDATE `creature_template` SET `ScriptName`='npc_ghoul_icc' WHERE (`entry`='37695');
UPDATE `creature_template` SET `ScriptName`='npc_defile_icc' WHERE (`entry`='38757');
UPDATE `creature_template` SET `ScriptName`='npc_raging_spirit_icc' WHERE (`entry`='36701');
UPDATE `creature_template` SET `ScriptName`='npc_ooze_little' WHERE `entry`= 36897;
UPDATE `creature_template` SET `ScriptName`='npc_ooze_big' WHERE `entry`= 36899;
UPDATE `creature_template` SET `ScriptName`='npc_nerubar_brood_keeper' WHERE `entry` = 36725;
UPDATE `creature_template` SET `ScriptName`='npc_the_damned' WHERE `entry` = 37011;
UPDATE `creature_template` SET `ScriptName`='npc_servant_of_the_throne' WHERE `entry` = 36724;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_skeletal_soldier' WHERE `entry` = 37012;
UPDATE `creature_template` SET `ScriptName`='npc_death_bound_ward' WHERE `entry` = 37007;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_attedant' WHERE `entry` = 36811;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_disciple' WHERE `entry` = 36807;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_high_priest' WHERE `entry` = 36829;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_servant' WHERE `entry` = 36844;
UPDATE `creature_template` SET `ScriptName`='npc_death_speaker_zealot' WHERE `entry` = 36808;
UPDATE `creature_template` SET `ScriptName`='npc_cult_fanatic' WHERE `entry` = 38135;
UPDATE `creature_template` SET `ScriptName`='npc_cult_adherent' WHERE `entry` = 37949;
UPDATE `creature_template` SET `ScriptName`='npc_shade' WHERE `entry` = 38222;
UPDATE `creature_template` SET `ScriptName`='npc_skellmage_icc' WHERE `entry` = 37868;
UPDATE `creature_template` SET `ScriptName`='npc_fireskell_icc' WHERE `entry` = 36791;
UPDATE `creature_template` SET `ScriptName`='npc_suppressor_icc' WHERE `entry` = 37863;
UPDATE `creature_template` SET `ScriptName`='npc_manavoid_icc' WHERE `entry` = 38068;
UPDATE `creature_template` SET `ScriptName`='npc_glutabomination_icc' WHERE `entry` = 37886;
UPDATE `creature_template` SET `ScriptName`='npc_blistzombie_icc' WHERE `entry` = 37934;
UPDATE `creature_template` SET `ScriptName`='npc_dreamcloud_icc' WHERE `entry` = 37985;
UPDATE `creature_template` SET `ScriptName`='npc_dreamportal_icc' WHERE `entry` = 37945;
UPDATE `creature_template` SET `ScriptName`='npc_nucleus_icc' WHERE `entry`=38369;
UPDATE `creature_template` SET `ScriptName`='npc_fireball_icc' WHERE `entry`=38332;
UPDATE `creature_template` SET `ScriptName`='npc_bomb_icc' WHERE `entry`=38454;
UPDATE `creature_template` SET `ScriptName`='npc_vortex_icc' WHERE `entry`=38422;
UPDATE `creature_template` SET `ScriptName`='npc_empfireball_icc' WHERE `entry`=38451;
UPDATE `creature_template` SET `ScriptName`='npc_precious' WHERE (`entry`='37217');
UPDATE `creature_template` SET `ScriptName`='npc_stinky' WHERE (`entry`='37025');
UPDATE `creature_template` SET `ScriptName`='npc_puddle_ooze' WHERE (`entry`='37690');
UPDATE `creature_template` SET `ScriptName`='npc_malleable_goo' WHERE (`entry`='38556');
UPDATE `creature_template` SET `ScriptName`='npc_abomination' WHERE (`entry`='37672');
UPDATE `creature_template` SET `ScriptName`='npc_spinestalker' WHERE (`entry`='37534');
UPDATE `creature_template` SET `ScriptName`='npc_rimefang' WHERE (`entry`='37533');
UPDATE `creature_template` SET `ScriptName`='npc_ice_tomb' WHERE (`entry`='36980');
UPDATE `creature_template` SET `ScriptName`='npc_frost_bomb' WHERE (`entry`='37186');
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror_icc' WHERE (`entry`='37698');
UPDATE `creature_template` SET `ScriptName`='npc_terenas_menethil' WHERE (`entry`='36823');
UPDATE `creature_template` SET `ScriptName`='npc_spirit_warden' WHERE (`entry`='36824');
UPDATE `creature_template` SET `ScriptName`='npc_sister_svalna' WHERE `entry` = '37126';
UPDATE `creature_template` SET `ScriptName` = 'npc_impaling_spear' WHERE `entry` = '38248';
UPDATE `creature_template` SET `ScriptName` = 'npc_gas_cloud' WHERE `entry` = '37562';
UPDATE `creature_template` SET `ScriptName`='lanathel_intro' WHERE (`entry`='38004');

-- Inserting NPC's on world
DELETE FROM `creature` WHERE `id`=38004;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(1084973, 38004, 631, 1, 128, 0, 0, 4689.4, 2766.9, 383.049, 3.47957, 300, 0, 0, 861, 60, 0, 0);

DELETE FROM `creature` WHERE `id`=37985;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5498489, 37985, 631, 15, 16, 0, 0, 4214.66, 2463.52, 364.869, 1.98975, 100, 0, 0, 2136800, 0, 0, 0),
(506554, 37985, 631, 15, 16, 0, 0, 4243.66, 2484.51, 364.872, 5.31148, 100, 0, 0, 2136800, 0, 0, 0),
(506475, 37985, 631, 15, 16, 0, 0, 4236.5, 2497.72, 364.535, 3.20033, 100, 0, 0, 2136800, 0, 0, 0),
(506471, 37985, 631, 15, 16, 0, 0, 4239.48, 2490.41, 364.872, 0.948594, 100, 0, 0, 2136800, 0, 0, 0),
(506327, 37985, 631, 15, 16, 0, 0, 4237.79, 2475.92, 364.869, 3.54434, 100, 0, 0, 2136800, 0, 0, 0),
(506325, 37985, 631, 15, 16, 0, 0, 4245.1, 2482.25, 364.872, 4.08862, 100, 0, 0, 2136800, 0, 0, 0),
(506323, 37985, 631, 30, 16, 0, 0, 4244.52, 2491.03, 364.872, 6.0474, 30, 0, 0, 2136800, 0, 0, 0),
(506321, 37985, 631, 30, 16, 0, 0, 4236.34, 2488.13, 364.872, 0.706694, 30, 0, 0, 2136800, 0, 0, 0),
(506317, 37985, 631, 30, 16, 0, 0, 4241.98, 2477.28, 364.87, 3.73676, 30, 0, 0, 2136800, 0, 0, 0),
(506139, 37985, 631, 30, 16, 0, 0, 4241.86, 2480.43, 364.872, 3.91191, 100, 0, 0, 2136800, 0, 0, 0),
(506126, 37985, 631, 30, 16, 0, 0, 4236.94, 2484.88, 364.872, 0.995723, 30, 0, 0, 2136800, 0, 0, 0),
(506124, 37985, 631, 30, 16, 0, 0, 4229.62, 2477.61, 364.87, 0.64465, 100, 0, 0, 2136800, 0, 0, 0),
(505946, 37985, 631, 30, 16, 0, 0, 4237.64, 2478.52, 364.87, 3.28595, 30, 0, 0, 2136800, 0, 0, 0),
(505944, 37985, 631, 30, 16, 0, 0, 4240.9, 2487.19, 364.872, 5.73168, 100, 0, 0, 2136800, 0, 0, 0),
(505938, 37985, 631, 30, 16, 0, 0, 4227.1, 2477.02, 364.87, 1.58242, 30, 0, 0, 2136800, 0, 0, 0),
(505840, 37985, 631, 30, 16, 0, 0, 4230.65, 2481.4, 364.871, 3.54199, 100, 0, 0, 2136800, 0, 0, 0),
(505838, 37985, 631, 30, 16, 0, 0, 4237.12, 2482.58, 364.871, 2.84455, 30, 0, 0, 2136800, 0, 0, 0),
(505802, 37985, 631, 30, 16, 0, 0, 4238.74, 2478.33, 364.871, 3.19641, 100, 0, 0, 2136800, 0, 0, 0),
(505799, 37985, 631, 30, 16, 0, 0, 4247.38, 2481.94, 364.871, 4.96513, 30, 0, 0, 2136800, 0, 0, 0),
(505795, 37985, 631, 30, 16, 0, 0, 4233.26, 2488.56, 364.871, 1.29889, 100, 0, 0, 2136800, 0, 0, 0),
(504691, 37985, 631, 30, 16, 0, 0, 4219.19, 2501.9, 379.283, 6.00789, 30, 0, 0, 2136800, 0, 0, 0);

DELETE FROM `creature` WHERE `id`=36658;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5542667, 36658, 658, 3, 64, 0, 2013, 819.895, 193.352, 558.051, 5.11291, 300, 0, 0, 653829, 0, 0, 0),
(5543011, 36658, 658, 3, 64, 0, 2013, 969.309, 180.069, 628.156, 5.95328, 300, 0, 0, 653829, 0, 0, 0);

DELETE FROM `creature` WHERE `id`=36661;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5543609, 36661, 658, 1, 64, 0, 0, 967.121, 181.192, 639.719, 5.84175, 300, 0, 0, 3235440, 41690, 0, 0);

DELETE FROM `creature` WHERE `id`=36823;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5566038, 36823, 631, 1, 64, 0, 0, 505.56, -2522.96, 1249.87, 3.12086, 300, 0, 0, 315000, 59910, 0, 0);

DELETE FROM `creature` WHERE `id`=36824;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(5565952, 36824, 631, 1, 64, 0, 0, 482.812, -2523.32, 1249.87, 6.24047, 300, 0, 0, 252000, 59910, 0, 0);

-- -------------------------
-- End NPCs working on texts
-- -------------------------

-- Deleting scripts text
DELETE FROM script_texts WHERE entry <= -1665892 AND entry >= -1666080;
DELETE FROM script_texts WHERE entry <= -1810001 AND entry >= -1810031;

-- Scripts texts

# 1
INSERT INTO `script_texts` VALUES ('36612', '-1665892', 'This is the beginning AND the end, mortals. None may enter the master''s sanctum!', '', '', '', '', '', '', '', '', '16950', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('36612', '-1665893', 'The Scourge will wash over this world as a swarm of death and destruction!', '', '', '', '', '', '', '', '', '16941', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('36612', '-1665894', 'BONE STORM!', '', '', '', '', '', '', '', '', '16946', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('36612', '-1665895', 'Bound by bone!', '', '', '', '', '', '', '', '', '16947', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665896', 'Stick Around!', '', '', '', '', '', '', '', '', '16948', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665897', 'The only escape is death!', '', '', '', '', '', '', '', '', '16949', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665898', 'More bones for the offering!', '', '', '', '', '', '', '', '', '16942', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665899', 'Languish in damnation!', '', '', '', '', '', '', '', '', '16943', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665900', 'I see... only darkness...', '', '', '', '', '', '', '', '', '16944', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36612', '-1665901', 'THE MASTER''S RAGE COURSES THROUGH ME!', '', '', '', '', '', '', '', '', '16945', '1', '0', '0', '');

# 2
INSERT INTO `script_texts` VALUES ('36855', '-1665902', 'You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness!', '', '', '', '', '', '', '', '', '17272', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665903', 'You can see through the fog that hangs over this world like a shroud and grasp where true power lies!', '', '', '', '', '', '', '', '', '17273', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665904', 'Fix your eyes upon your crude hands! The sinew, the soft meat, the dark blood coursing within!', '', '', '', '', '', '', '', '', '16878', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665905', 'It is a weakness! A crippling flaw! A joke played by the creators upon their own creations!', '', '', '', '', '', '', '', '', '17268', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665906', 'The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it!', '', '', '', '', '', '', '', '', '17269', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665907', 'Through our master all things are possible! His power is without limit, and his will unbending!', '', '', '', '', '', '', '', '', '17270', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665908', 'Those who oppose him will be destroyed utterly! And those who serve, who serve wholly, unquestioningly, with utter devotion of mind and soul? Elevated! To heights beyond your ken!', '', '', '', '', '', '', '', '', '17271', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665909', 'What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.', '', '', '', '', '', '', '', '', '16868', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665910', 'Enough! I see I must take matters into my own hands!', '', '', '', '', '', '', '', '', '16877', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665911', 'Take this blessing and show these intruders a taste of our master''s power.', '', '', '', '', '', '', '', '', '16873', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665912', 'I release you from the curse of flesh!', '', '', '', '', '', '', '', '', '16874', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665913', 'Arise and exalt in your pure form!', '', '', '', '', '', '', '', '', '16875', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665914', 'You are weak, powerless to resist my will!', '', '', '', '', '', '', '', '', '16876', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665915', 'This charade has gone on long enough.', '', '', '', '', '', '', '', '', '16872', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665916', 'All part of the masters plan! Your end is... inevitable!', '', '', '', '', '', '', '', '', '16871', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665917', 'Do you yet grasp of the futility of your actions?', '', '', '', '', '', '', '', '', '16869', '1', '0', '0', '');
INSERT INTO `script_texts` VALUES ('36855', '-1665918', 'Embrace the darkness... Darkness eternal!', '', '', '', '', '', '', '', '', '16870', '1', '0', '0', '');

# 3
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665919,'Thank the spirits for you, brothers and sisters. The Skybreaker has already left. Quickly now, to Orgrim''s Hammer! If you leave soon, you may be able to catch them.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,''),
(0,-1665920,'This should be helpin''ya!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,''),
(0,-1665921,'Aka''Magosh, brave warriors. The alliance is in great number here.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665922,'Captain Saurfang will be pleased to see you aboard Orgrim''s Hammer. Make haste, we will secure the area until you are ready for take-off.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665923,'A screeching cry pierces the air above!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665924,'A Spire Frostwyrm lands just before Orgrim''s Hammer.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665925,'Rise up, sons and daughters of the Horde! Today we battle a hated enemy of the Horde! LOK''TAR OGAR! Kor''kron, take us out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665926,'What is that?! Something approaching in the distance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665927,'ALLIANCE GUNSHIP! ALL HANDS ON DECK!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665928,'Move yer jalopy or we''ll blow it out of the sky, orc! The Horde''s got no business here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665929,'You will know our business soon! KOR''KRON, ANNIHILATE THEM!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665930,'Marines, Sergeants, attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665931,'You DARE board my ship? Your death will come swiftly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665932,'Riflemen, shoot faster!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665933,'Mortar team, reload!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665934,'We''re taking hull damage, get a sorcerer out here to shut down those cannons!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665935,'The Alliance falter. Onward to the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665936,'Damage control! Put those fires out! You haven''t seen the last of the Horde!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665937,'Thank goodness you arrived when you did, heroes. Orgrim''s Hammer has already left. Quickly now, to The Skybreaker! If you leave soon, you may be able to catch them.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665938,'This ought to help!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665939,'Skybreaker Sorcerer summons a Skybreaker Battle Standard.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665940,'You have my thanks. We were outnumbered until you arrived.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665941,'Captain Muradin is waiting aboard The Skybreaker. We''ll secure the area until you are ready for take off.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665942,'Skybreaker infantry, hold position!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665943,'A screeching cry pierces the air above!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665944,'A Spire Frostwyrm lands just before The Skybreaker. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665945,'Fire up the engines! We got a meetin with destiny, lads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665946,'Hold on to yer hats!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665947,'What in the world is that? Grab me spyglass, crewman!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665948,'By me own beard! HORDE SAILIN IN FAST N HOT!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665949,'EVASIVE ACTION! MAN THE GUNS!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665950,'Cowardly dogs! Ye blindsighted us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665951,'This is not your battle, dwarf. Back down or we will be forced to destroy your ship.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665952,'Not me battle? I dunnae who ye? think ye are, mister, but I got a score to settle with Arthas and yer not gettin in me way! FIRE ALL GUNS! FIRE! FIRE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665953,'Reavers, Sergeants, attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665954,'What''s this then?! Ye won''t be takin this son o Ironforge''s vessel without a fight!.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665955,'Axethrowers, hurl faster!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665956,'Rocketeers, reload!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665957,'We''re taking hull damage, get a battle-mage out here to shut down those cannons!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665958,'Don''t say I didn''t warn ya, scoundrels! Onward, brothers and sisters!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665959,'Captain Bartlett, get us out of here! We''re taken too much damage to stay afloat!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'');

# 4
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665960,'For every Horde soldier that you killed, for every Alliance dog that fell, the Lich King''s armies grew. Even now the Val''kyr work to raise your fallen... As Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665961,'Things are about to get much worse. Come, taste the power that the Lich King has bestowed upon me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665962,'A lone orc, against the might of the Alliance? Charge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665963,'Hahahaha! Dwarves.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665964,'Kor''kron, move out! Champions, watch your backs! The Scourge have been...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665965,'Join me, father. Join me and we will crush this world in the name of the Scourge. For the glory of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665966,'My boy died at the Wrathgate. I am here only to collect his body!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665967,'Stubborn and old. What chance do you have? I am stronger and more powerful than you ever were!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665968,'We named him Dranosh. It means "Heart of Draenor" in Orcish. I would not let the warlocks take him. My boy would be safe, hidden away by the elders of Garadar.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665969,'I made a promise to his mother before she died: that I would cross the Dark Portal alone - whether I lived or died, my son would be safe. Untainted...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665970,'Today, I fulfill that promise.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665971,'High Overlord Saurfang charges!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665972,'Pathetic old orc. Come then heroes, come and face the might of the Scourge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665973,'BY THE MIGHT OF THE LICH KING!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16694,1,0,0,''),
(0,-1665974,'The ground runs red with your blood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16699,1,0,0,''),
(0,-1665975,'Feast, my minions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16700,1,0,0,''),
(0,-1665976,'You are nothing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16695,1,0,0,''),
(0,-1665977,'Your soul will find no redemption here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16696,1,0,0,''),
(0,-1665978,'I have become...DEATH!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16698,1,0,0,''),
(0,-1665979,'I... Am... Released.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16697,1,0,0,''),
(0,-1665980,'Muradin Bronzebeard gasps for air.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665981,'That was Saurfang''s boy - the Horde commander at the Wrath Gate. Such a tragic end...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665982,'What in the... There, in the distance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665983,'A Horde Zeppelin flies up to the rise',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665984,'Soldiers, fall in! Looks like the Horde are comin in to take another shot!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665985,'The Zeppelin docks, and High Overlord Saurfang hops out, confronting the Alliance soldiers and Muradin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665986,'Don''t force my hand, orc. We can''t let you pass.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665987,'Behind you lies the body of my only son. Nothing will keep me from him.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665988,'He... I can''t do it. Get back on your ship and we''ll spare your life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665989,'Stand down, Muradin. Let a grieving father pass.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665990,'High Overlord Saurfang kneels over his son''s body.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665991,'[Orcish] No''ku kil zil''nok ha tar.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665992,'Higher Overlord Saurfang picks up the body of his son and walks over towards Varian',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665993,'I will not forget this kindess. I thank you, highness.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665994,'I... I was not at the Wrathgate. But the soldiers who survived told me much of what happened. Your son fought with honor. He died a hero''s death. He deserves a hero''s burial.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665995,'Lady Jaina Proudmoore cries.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665996,'Jaina, why are you crying?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665997,'It was nothing, your majesty. Just... I''m proud of my king.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665998,'Muradin, secure the deck and prepare our soldiers for an assault on the Upper Citadel. I''ll send out another regiment from Stormwind.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665999,'Let''s get the move then. Move out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666000,'High Overlord Saurfang coughs.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666001,'High Overlord Saurfang weeps over the corpse of his son.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666002,'You will have a proper ceremony in Nagrand next to the pyres of your mother and ancestors.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1666003,'Honor, young heroes... no matter how dire the battle... Never forsake it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'');

# 5
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666004,'NOOOO! You kill Stinky! You pay!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16907,1,0,0,''),
(0,-1666005,'Fun time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16901,1,0,0,''),
(0,-1666006,'Just an ordinary gas cloud. But watch out, because that''s no ordinary gas cloud!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17119,1,0,0,''),
(0,-1666007,'Festergut farts.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16911,4,0,0,''),
(0,-1666008,'Gyah! Uhhh, I not feel so good...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16906,1,0,0,''),
(0,-1666009,'I not feel so good!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16906,1,0,0,''),
(0,-1666010,'Daddy, I did it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16902,1,0,0,''),
(0,-1666011,'Dead, dead, dead! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16903,1,0,0,''),
(0,-1666012,'Fun time over!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16905,1,0,0,''),
(0,-1666013,'Da...Daddy...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16904,1,0,0,''),
(0,-1666014,'Oh, Festergut. You were always my favorite. Next to Rotface. The good news is you left behind so much gas, I can practically taste it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17124,1,0,0,'');

# 6
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666015,'What? Precious? Noooooooooo!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16993,1,0,0,''),
(0,-1666016,'WEEEEEE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16986,1,0,0,''),
(0,-1666017,'Icky sticky.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16991,1,0,0,''),
(0,-1666018,'I think I made an angry poo-poo. It gonna blow! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16992,1,0,0,''),
(0,-1666019,'Great news, everyone! The slime is flowing again!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17126,1,0,0,''),
(0,-1666020,'Good news, everyone! I''ve fixed the poison slime pipes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17123,1,0,0,''),
(0,-1666021,'Daddy make toys out of you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16988,1,0,0,''),
(0,-1666022,'I brokes-ded it...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16987,1,0,0,''),
(0,-1666023,'Sleepy Time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16990,1,0,0,''),
(0,-1666024,'Bad news daddy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16989,1,0,0,''),
(0,-1666025,' Terrible news, everyone, Rotface is dead! But great news everyone, he left behind plenty of ooze for me to use! Whaa...? I''m a poet, and I didn''t know it? Astounding!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17146,1,0,0,'');

# 7
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666026,'Good news, everyone! I think I perfected a plague that will destroy all life on Azeroth!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17114,1,0,0,''),
(0,-1666027,'You can''t come in here all dirty like that! You need that nasty flesh scrubbed off first!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17125,1,0,0,''),
(0,-1666028,'Two oozes, one room! So many delightful possibilities...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17122,1,0,0,''),
(0,-1666029,'Hmm. I don''t feel a thing. Whaa...? Where''d those come from?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17120,1,0,0,''),
(0,-1666030,'Tastes like... Cherry! Oh! Excuse me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17121,1,0,0,''),
(0,-1666031,'Hmm... Interesting...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17115,1,0,0,''),
(0,-1666032,'That was unexpected!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17116,1,0,0,''),
(0,-1666033,'Great news, everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17118,1,0,0,''),
(0,-1666034,'Bad news, everyone! I don''t think I''m going to make it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17117,1,0,0,'');

# 8
DELETE FROM `script_texts` where `entry` IN (-2500000);
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666035,'Foolish mortals. You thought us defeated so easily? The San''layn are the Lich King''s immortal soldiers! Now you shall face their might combined!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16795,1,0,0,''),
(0,-1666036,'Rise up, brothers, and destroy our enemies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16797,1,0,0,''),
(0,-1666037,'Such wondrous power! The Darkfallen Orb has made me INVINCIBLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16727,1,0,0,''),
(0,-1666038,'Blood will flow!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16728,1,0,0,''),
(0,-1666039,'Were you ever a threat?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16723,1,0,0,''),
(0,-1666040,'Truth is found in death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16724,1,0,0,''),
(0,-1666041,'Prince Keleseth cackles maniacally!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16726,2,0,0,''),
(0,-1666042,'My queen... they come...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16725,1,0,0,''),
(0,-1666043,'Tremble before Taldaram, mortals, for the power of the orb flows through me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16857,1,0,0,''),
(0,-1666044,'Delight in the pain!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16858,1,0,0,''),
(0,-1666045,'Worm food.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16853,1,0,0,''),
(0,-1666046,'Beg for mercy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16854,1,0,0,''),
(0,-1666047,'Prince Taldaram laughs.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16856,2,0,0,''),
(0,-1666048,'Prince Taldaram gurgles and dies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16855,2,0,0,''),
(0,-1666049,'Naxxanar was merely a setback! With the power of the orb, Valanar will have his vengeance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16685,1,0,0,''),
(0,-2500000,'My cup runneth over.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16686,1,0,0,''),
(0,-1666050,'Dinner... is served.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16681,1,0,0,''),
(0,-1666051,'Do you see NOW the power of the Darkfallen?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16682,1,0,0,''),
(0,-1666052,'BOW DOWN BEFORE THE SAN''LAYN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16684,1,0,0,''),
(0,-1666053,'...why...?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16683,1,0,0,'');

# 9
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666054,'You have made an... unwise... decision.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16782,1,0,0,''),
(0,-1666055,'Just a taste...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16783,1,0,0,''),
(0,-1666056,'Know my hunger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16784,1,0,0,''),
(0,-1666057,'SUFFER!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16786,1,0,0,''),
(0,-1666058,'Can you handle this?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16787,1,0,0,''),
(0,-1666059,'Yes... feed my precious one! You''re mine now! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16790,1,0,0,''),
(0,-1666060,'Here it comes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16788,1,0,0,''),
(0,-1666061,'THIS ENDS NOW!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16793,1,0,0,''),
(0,-1666062,'But... we were getting along... so well...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16794,1,0,0,'');

# 10
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666063,'Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17064,1,0,0,''),
(0,-1666064,'I have opened a portal into the Emerald Dream. Your salvation lies within, heroes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17068,1,0,0,''),
(0,-1666065,'My strength is returning! Press on, heroes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17070,1,0,0,''),
(0,-1666066,'I will not last much longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17069,1,0,0,''),
(0,-1666067,'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17072,1,0,0,''),
(0,-1666068,'A tragic loss...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17066,1,0,0,''),
(0,-1666069,'FAILURES!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17067,1,0,0,''),
(0,-1666070,'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17071,1,0,0,'');

# 11
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1666071,'You are fools who have come to this place! The icy winds of Northrend will consume your souls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17007,1,0,0,''),
(0,-1666072,'Suffer, mortals, as your pathetic magic betrays you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17014,1,0,0,''),
(0,-1666073,'Can you feel the cold hand of death upon your heart?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17013,1,0,0,''),
(0,-1666074,'Aaah! It burns! What sorcery is this?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17015,1,0,0,''),
(0,-1666075,'Your incursion ends here! None shall survive!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17012,1,0,0,''),
(0,-1666076,'Now feel my master''s limitless power and despair!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17016,1,0,0,''),
(0,-1666077,'Perish!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17008,1,0,0,''),
(0,-1666078,'A flaw of mortality...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17009,1,0,0,''),
(0,-1666079,'Enough! I tire of these games!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17011,1,0,0,''),
(0,-1666080,'Free...at last...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17010,1,0,0,'');

# 12
INSERT INTO script_texts (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
(-1810001, 'So...the Light''s vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?',null,null,null,null,null,null,null,null,17349,1,0,0,''),
(-1810002, 'We will grant you a swift death, Arthas. More than can be said for the thousands you''ve tortured and slain.',null,null,null,null,null,null,null,null,17390,1,0,0,''),
(-1810003, 'You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.',null,null,null,null,null,null,null,null,17350,1,0,0,''),
(-1810004, 'So be it. Champions, attack!',null,null,null,null,null,null,null,null,17391,1,0,0,''),
(-1810005, 'I''ll keep you alive to witness the end, Fordring. I would not want the Light''s greatest champion to miss seeing this wretched world remade in my image.',null,null,null,null,null,null,null,null,17351,1,0,0,''),
(-1810006, 'Come then champions, feed me your rage!',null,null,null,null,null,null,null,null,17352,1,0,0,''),
(-1810007, 'I will freeze you from within until all that remains is an icy husk!',null,null,null,null,null,null,null,null,17369,1,0,0,''),
(-1810008, 'Apocalypse!',null,null,null,null,null,null,null,null,17371,1,0,0,''),
(-1810009, 'Bow down before your lord and master!',null,null,null,null,null,null,null,null,17372,1,0,0,''),
(-1810010, 'Hope wanes!',null,null,null,null,null,null,null,null,17363,1,0,0,''),
(-1810011, 'The end has come!',null,null,null,null,null,null,null,null,17364,1,0,0,''),
(-1810012, 'Face now your tragic end!',null,null,null,null,null,null,null,null,17365,1,0,0,''),
(-1810013, 'No question remains unanswered. No doubts linger. You are Azeroth''s greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury... Is it truly righteousness that drives you? I wonder.',null,null,null,null,null,null,null,null,17353,1,0,0,''),
(-1810014, 'You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.',null,null,null,null,null,null,null,null,17355,1,0,0,''),
(-1810015, 'Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth''s fall will come at their hands -- and you will be the first to die.',null,null,null,null,null,null,null,null,17356,1,0,0,''),
(-1810016, 'I delight in the irony.',null,null,null,null,null,null,null,null,17357,1,0,0,''),
(-1810017, 'LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!',null,null,null,null,null,null,null,null,17392,1,0,0,''),
(-1810018, 'Impossible...',null,null,null,null,null,null,null,null,17358,1,0,0,''),
(-1810019, '',null,null,null,null,null,null,null,null,17360,1,0,0,''),
(-1810020, 'No more, Arthas! No more lives will be consumed by your hatred!',null,null,null,null,null,null,null,null,17393,1,0,0,''),
(-1810021, 'Free at last! It is over, my son. This is the moment of reckoning.',null,null,null,null,null,null,null,null,17397,1,0,0,''),
(-1810022, 'The Lich King must fall!',null,null,null,null,null,null,null,null,17389,1,0,0,''),
(-1810023, 'Rise up, champions of the Light!',null,null,null,null,null,null,null,null,17398,1,0,0,''),
(-1810024, 'Now I stand, the lion before the lambs... and they do not fear.',null,null,null,null,null,null,null,null,17361,1,0,0,''),
(-1810025, 'They cannot fear.',null,null,null,null,null,null,null,null,17362,1,0,0,''),
(-1810026, 'Argh... Frostmourne, obey me!',null,null,null,null,null,null,null,null,17367,1,0,0,''),
(-1810027, 'Frostmourne hungers...',null,null,null,null,null,null,null,null,17366,1,0,0,''),
(-1810028, 'Frostmourne feeds on the soul of your fallen ally!',null,null,null,null,null,null,null,null,17368,1,0,0,''),
(-1810029, 'Val''kyr, your master calls!',null,null,null,null,null,null,null,null,17373,1,0,0,''),
(-1810030, 'Watch as the world around you collapses!',null,null,null,null,null,null,null,null,17370,1,0,0,''),
(-1810031, 'You gnats actually hurt me! Perhaps I''ve toyed with you long enough, now taste the vengeance of the grave!',null,null,null,null,null,null,null,null,17359,1,0,0,'');

# 13
DELETE FROM script_texts where `entry` in (-1900001,-1900002,-1900003,-1900004,-1900005,-1900006,-1900007);
INSERT INTO script_texts (entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
(-1900001, 'You may have once fought beside me, Crok, but now you are nothing more than a traitor. Come, your second death approaches!',null,null,null,null,null,null,null,null,17017,1,0,0,''),
(-1900002, 'Miserable creatures, Die!',null,null,null,null,null,null,null,null,17018,1,0,0,''),
(-1900003, 'Foolish Crok, you brought my reinforcements with you! Arise Argent Champions and serve the Lich King in death!',null,null,null,null,null,null,null,null,17019,1,0,0,''),
(-1900004, 'Come Scourgebane, I''ll show the Lich King which one of us is truly worthy of the title, champion!',null,null,null,null,null,null,null,null,17020,1,0,0,''),
(-1900005, 'What a pitiful choice of an ally Crok.',null,null,null,null,null,null,null,null,17021,1,0,0,''),
(-1900006, 'What? They died so easily? No matter.',null,null,null,null,null,null,null,null,17022,1,0,0,''),
(-1900007, 'Perhaps... you were right... Crok.',null,null,null,null,null,null,null,null,17023,1,0,0,'');

-- Archivement criteria for ICC
-- 10 Normal
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11684,11685,11686,11687,11688,12281,12280,11804,11803,12258,11778,12116,11838,11861,11802,11779);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Crusade (10 player)
(11684,12,0,0),
(11685,12,0,0),
(11686,12,0,0),
(11687,12,0,0),
(11688,12,0,0),
-- Not One, But Two Jormungars (10 player)
(12281,12,0,0),
(12280,12,0,0),
-- Resilience Will Fix It (10 player)
(11804,12,0,0),
(11803,12,0,0),
-- Salt and Pepper (10 player)
(12258,12,0,0),
(11778,12,0,0),
-- The Traitor King (10 player)
(12116,12,0,0),
-- Three Sixty Pain Spike (10 player)
(11838,12,0,0),
(11861,12,0,0),
-- Upper Back Pain (10 player)
(11802,12,0,0),
(11779,12,0,0);

-- 10 Hero
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11690,11689,11682,11693,11691,12345,12346,12344,12347,12348,12349,12360);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Grand Crusade (10 player)
(11690,12,2,0),
(11689,12,2,0),
(11682,12,2,0),
(11693,12,2,0),
(11691,12,2,0),
-- A Tribute to Skill (10 player)
(12345,12,2,0),
(12346,12,2,0),
(12344,12,2,0),
-- A Tribute to Mad Skill (10 player)
(12347,12,2,0),
(12348,12,2,0),
-- A Tribute to Insanity (10 player)
(12349,12,2,0),
-- A Tribute to Dedicated Insanity
(12360,12,2,0);

-- 25 normal
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11679,11683,11680,11682,11681,12278,12279,11800,11799,11860,11818,12198,11839,11862,11801,11780);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Crusade (25 player)
(11679,12,1,0),
(11683,12,1,0),
(11680,12,1,0),
(11682,12,1,0),
(11681,12,1,0),
-- Not One, But Two Jormungars (25 player)
(12278,12,1,0),
(12279,12,1,0),
-- Resilience Will Fix It (25 player)
(11800,12,1,0),
(11799,12,1,0),
-- Salt and Pepper (25 player)
(11860,12,1,0),
(11818,12,1,0),
-- The Traitor King (25 player)
(12198,12,1,0),
-- Three Sixty Pain Spike (25 player)
(11839,12,1,0),
(11862,12,1,0),
-- Upper Back Pain (25 player)
(11801,12,1,0),
(11780,12,1,0);

-- 25 Hero
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11542,11546,11547,11549,11678,12340,12338,12339,12342,12341,12343,12359,12358,12350);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Grand Crusade (25 player)
(11542,12,3,0),
(11546,12,3,0),
(11547,12,3,0),
(11549,12,3,0),
(11678,12,3,0),
-- A Tribute to Skill (25 player)
(12340,12,3,0),
(12338,12,3,0),
(12339,12,3,0),
-- A Tribute to Mad Skill (25 player)
(12342,12,3,0),
(12341,12,3,0),
-- A Tribute to Insanity (25 player)
(12343,12,3,0),
-- A Tribute to Immortality
(12359,12,3,0),
-- A Tribute to Immortality
(12358,12,3,0),
-- Realm First! Grand Crusader
(12350,12,3,0);


-- Creatures AI scripts I did at the end after every changes
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('20021001','37012','13','0','100','31','10000','20000','0','0','11','70964','1','0','0','0','0','0','0','0','0','0','Ancient Skeletal Soldier - Cast Shield Bash When player casts a spell'),
('20021002','37928','4','0','100','30','0','0','0','0','11','53625','1','0','0','0','0','0','0','0','0','0','Argent Champion - Casts Defensive Stance on Aggro'),
('20021003','36899','2','0','100','31','50','0','12300','14900','11','69760','0','0','0','0','0','0','0','0','0','0','Big Ooze - Casts Radiating Ooze at 50% HP'),
('20021004','36899','0','0','100','31','8000','12000','17000','22000','11','69774','4','0','0','0','0','0','0','0','0','0','Big Ooze - Casts Sticky Ooze'),
('20021005','36899','0','0','100','31','10000','10000','28000','28000','11','69558','0','1','0','0','0','0','0','0','0','0','Big Ooze - Casts Unstable Ooze'),
('20021006','36899','0','0','100','31','25000','25000','34000','34000','11','69839','0','0','0','0','0','0','0','0','0','0','Big Ooze - Casts Unstable Ooze Explosion'),
('20021007','36791','0','0','100','7','8000','8000','22000','25000','11','69325','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton - Casts Lay Waste'),
('20021008','36791','0','0','100','25','8000','8000','22000','25000','11','71730','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton - Casts Lay Waste'),
('20021009','36791','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Stop Movement on Aggro'),
('20021010','36791','4','0','100','6','0','0','0','0','11','70754','1','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball and Set Phase 1 on Aggro'),
('20021011','36791','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Blazing Skeleton - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021012','36791','0','6','100','7','0','0','1500','3000','11','70754','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball above 15% Mana (Phase 1)'),
('20021013','36791','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021014','36791','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Movement Beyond 30 Yards'),
('20021015','36791','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - On Evade set Phase to 0'),
('20021016','36791','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Stop Movement on Aggro'),
('20021017','36791','4','0','100','24','0','0','0','0','11','71748','1','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball and Set Phase 1 on Aggro'),
('20021018','36791','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Blazing Skeleton - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021019','36791','0','6','100','25','0','0','1500','3000','11','71748','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball above 15% Mana (Phase 1)'),
('20021020','36791','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021021','36791','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Movement Beyond 30 Yards'),
('20021022','36791','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - On Evade set Phase to 0'),
('20021023','37022','0','0','100','31','8000','12000','17000','22500','11','40504','4','0','0','0','0','0','0','0','0','0','Blighted Abomination - Casts Cleave'),
('20021024','37022','4','0','100','30','0','0','0','0','11','71140','4','1','0','0','0','0','0','0','0','0','Blighted Abomination - Casts Scourge Hook on Aggro'),
('20021025','37022','0','0','100','31','15000','15000','35000','35500','11','71150','0','0','0','0','0','0','0','0','0','0','Blighted Abomination - Casts Plague Cloud'),
('20021026','37934','2','0','100','7','10','0','12300','14900','11','70744','0','0','0','0','0','0','0','0','0','0','Blistering Zombie - Casts Acid Burst at 10% HP'),
('20021027','37934','2','0','100','25','10','0','12300','14900','11','71733','0','0','0','0','0','0','0','0','0','0','Blistering Zombie - Casts Acid Burst at 10% HP'),
('20021028','38508','0','0','100','31','5000','7000','12000','18000','11','72176','0','1','0','0','0','0','0','0','0','0','Blood Beast - Casts Blood Link'),
('20021029','38508','1','0','100','31','1500','1500','1850000','1850000','11','72723','0','0','0','0','0','0','0','0','0','0','Blood Beast - Casts Resistant Skin on Spawn'),
('20021030','37122','0','0','100','31','15000','17000','35000','38000','11','14515','4','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Dominate Mind'),
('20021031','37122','14','0','90','6','320','40','0','0','11','71595','6','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Healing Wave on Friendlies'),
('20021032','37122','14','0','90','24','320','40','0','0','11','71783','6','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Healing Wave on Friendlies'),
('20021033','37122','0','0','100','7','10000','10000','38000','48000','11','71548','0','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Power Word: Shield'),
('20021034','37122','0','0','100','25','10000','10000','38000','48000','11','71780','0','1','0','0','0','0','0','0','0','0','Captain Arnath - Casts Power Word: Shield'),
('20021035','37122','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Stop Movement on Aggro'),
('20021036','37122','4','0','100','6','0','0','0','0','11','71546','1','0','22','6','0','0','0','0','0','0','Captain Arnath - Cast Smite and Set Phase 1 on Aggro'),
('20021037','37122','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Captain Arnath - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021038','37122','0','6','100','7','0','0','1500','3000','11','71546','1','0','0','0','0','0','0','0','0','0','Captain Arnath - Cast Smite above 15% Mana (Phase 1)'),
('20021039','37122','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Captain Arnath - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021040','37122','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Start Movement Beyond 30 Yards'),
('20021041','37122','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - On Evade set Phase to 0'),
('20021042','37122','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Stop Movement on Aggro'),
('20021043','37122','4','0','100','24','0','0','0','0','11','71547','1','0','22','6','0','0','0','0','0','0','Captain Arnath - Cast Smite and Set Phase 1 on Aggro'),
('20021044','37122','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Captain Arnath - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021045','37122','0','6','100','25','0','0','1500','3000','11','71547','1','0','0','0','0','0','0','0','0','0','Captain Arnath - Cast Smite above 15% Mana (Phase 1)'),
('20021046','37122','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Captain Arnath - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021047','37122','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Start Movement Beyond 30 Yards'),
('20021048','37122','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - On Evade set Phase to 0'),
('20021049','37122','0','0','100','31','12000','16000','24000','28000','11','70089','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Casts Undeath'),
('20021050','37123','0','0','100','31','12000','16000','24000','28000','11','70089','0','0','0','0','0','0','0','0','0','0','Captain Brandon - Casts Undeath'),
('20021051','37123','0','0','80','31','8000','14000','21000','29000','11','71551','4','0','0','0','0','0','0','0','0','0','Captain Brandon - Casts Judgement of Command'),
('20021052','37123','0','0','100','31','15000','19000','27000','35000','11','71784','4','0','0','0','0','0','0','0','0','0','Captain Brandon - Casts Hammer of Betrayal'),
('20021053','37123','2','0','100','31','20','0','10300','12900','11','71550','0','0','0','0','0','0','0','0','0','0','Captain Brandon - Cast Divine Shield When Below 20% HP'),
('20021054','37123','0','0','100','31','5000','6000','14500','18800','11','71549','1','0','0','0','0','0','0','0','0','0','Captain Brandon - Casts Crusader Strike'),
('20021055','37124','0','0','100','31','12000','16000','24000','28000','11','70089','0','0','0','0','0','0','0','0','0','0','Captain Grondel - Casts Undeath'),
('20021056','37124','0','0','70','31','7000','11000','14000','18000','11','71554','1','0','0','0','0','0','0','0','0','0','Captain Grondel - Casts Sunder Armor'),
('20021057','37124','0','0','50','31','5000','5000','10000','15000','11','71552','1','0','0','0','0','0','0','0','0','0','Captain Grondel - Casts Mortal Strike'),
('20021058','37124','0','0','80','31','15000','15000','25000','25000','11','71785','4','0','0','0','0','0','0','0','0','0','Captain Grondel - Casts Conflagration'),
('20021059','37124','4','0','100','30','0','0','0','0','11','71553','1','0','0','0','0','0','0','0','0','0','Captain Grondel - Cast Charge on Aggro'),
('20021060','37125','0','0','100','31','12000','16000','24000','28000','11','70089','0','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Undeath'),
('20021061','37125','0','0','80','7','14000','15000','20000','25000','11','71590','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Rocket Launch'),
('20021062','37125','0','0','80','25','14000','15000','20000','25000','11','71786','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Rocket Launch'),
('20021063','37125','0','0','100','7','11000','17000','19000','28000','11','71592','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Fel Iron Bomb'),
('20021064','37125','0','0','100','25','11000','17000','19000','28000','11','71787','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Fel Iron Bomb'),
('20021065','37125','0','0','90','7','8000','12000','17000','22000','11','71594','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Machine Gun'),
('20021066','37125','0','0','90','25','8000','12000','17000','22000','11','71788','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Casts Machine Gun'),
('20021067','37129','0','0','100','31','5000','7000','12000','15000','11','71785','4','0','0','0','0','0','0','0','0','0','Crok Scourgebane - Casts Death Coil'),
('20021068','37129','0','0','80','31','9000','11000','17000','19000','11','71489','1','0','0','0','0','0','0','0','0','0','Crok Scourgebane - Casts Death Strike'),
('20021069','37129','0','0','60','31','13000','13000','21000','22000','11','71488','1','0','0','0','0','0','0','0','0','0','Crok Scourgebane - Casts Scourge Strike'),
('20021070','37129','0','0','100','31','20000','20000','7000','7000','11','70714','0','0','0','0','0','0','0','0','0','0','Crok Scourgebane - Casts Icebound Armor'),
('20021071','37949','0','0','100','31','8000','9000','21000','25000','11','71237','4','0','0','0','0','0','0','0','0','0','Cult Adherent - Casts Curse of Torpor'),
('20021072','37949','0','0','100','31','3000','4000','250000','250000','11','70901','0','1','0','0','0','0','0','0','0','0','Cult Adherent - Casts Dark Empowerment'),
('20021073','37949','0','0','100','7','15000','15000','25000','25000','11','70903','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Casts Dark Martyrdom'),
('20021074','37949','0','0','100','25','15000','15000','25000','25000','11','72498','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Casts Dark Martyrdom'),
('20021075','37949','2','0','100','31','50','0','12300','14900','11','70768','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Casts Shroud of the Occult at 50% HP'),
('20021076','37949','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Stop Movement on Aggro'),
('20021077','37949','4','0','100','6','0','0','0','0','11','70594','1','0','22','6','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt and Set Phase 1 on Aggro'),
('20021078','37949','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Cult Adherent - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021079','37949','0','6','100','7','0','0','1500','3000','11','70594','1','0','0','0','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt above 15% Mana (Phase 1)'),
('20021080','37949','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Cult Adherentn - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021081','37949','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Start Movement Beyond 30 Yards'),
('20021082','37949','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Cult Adherent - On Evade set Phase to 0'),
('20021083','37949','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Stop Movement on Aggro'),
('20021084','37949','4','0','100','24','0','0','0','0','11','72005','1','0','22','6','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt and Set Phase 1 on Aggro'),
('20021085','37949','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Cult Adherent - Start Movement and Set Phase 2 when Mana is at 15%'),
('20021086','37949','0','6','100','25','0','0','1500','3000','11','72005','1','0','0','0','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt above 15% Mana (Phase 1)'),
('20021087','37949','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Cult Adherent - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('20021088','37949','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Start Movement Beyond 30 Yards'),
('20021089','37949','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Cult Adherent - On Evade set Phase to 0'),
('20021090','37890','0','0','100','7','15000','15000','25000','25000','11','71236','0','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Dark Martyrdom'),
('20021091','37890','0','0','100','25','15000','15000','25000','25000','11','72495','0','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Dark Martyrdom'),
('20021092','37890','2','0','100','31','20','0','12300','14900','11','70900','0','1','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Dark Transformation at 20% HP'),
('20021093','37890','0','0','100','7','5000','8000','14000','21000','11','70659','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Necrotic Strike'),
('20021094','37890','0','0','100','25','5000','8000','14000','21000','11','72490','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Necrotic Strike'),
('20021095','37890','0','0','90','7','10000','10000','18000','25000','11','70670','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Shadow Cleave'),
('20021096','37890','0','0','90','25','10000','10000','18000','25000','11','72006','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Shadow Cleave'),
('20021097','37890','0','0','100','31','15000','15000','35000','42000','11','70674','0','1','0','0','0','0','0','0','0','0','Cult Fanatic - Casts Vampiric Might'),
('20021098','38369','0','0','100','31','10000','12000','35000','40000','11','71822','4','0','0','0','0','0','0','0','0','0','Dark Nucleus - Casts Shadow Resonance'),
('20021099','37571','0','0','100','7','8000','12000','19000','27000','11','72057','1','0','0','0','0','0','0','0','0','0','Darkfallen Advisor - Casts Lich Slap'),
('22021001','37571','0','0','100','25','8000','12000','19000','27000','11','72421','1','0','0','0','0','0','0','0','0','0','Darkfallen Advisor - Casts Lich Slap'),
('22021002','37571','14','0','90','30','320','20','0','0','11','72065','6','1','0','0','0','0','0','0','0','0','Darkfallen Advisor - Casts Shroud of Protection on Friendlies at 20% HP'),
('22021003','37571','14','0','90','30','320','50','0','0','11','72066','6','1','0','0','0','0','0','0','0','0','Darkfallen Advisor - Casts Shroud of Spell Warding on Friendlies at 50% HP'),
('22021004','37664','0','0','100','7','8000','12000','35000','35000','11','70408','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Amplify Magic'),
('22021005','37664','0','0','100','25','8000','12000','35000','35000','11','72336','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Amplify Magic'),
('22021006','37664','0','0','100','7','15000','16000','25000','26000','11','70407','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Blast Wave'),
('22021007','37664','0','0','100','25','15000','16000','25000','26000','11','71151','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Blast Wave'),
('22021009','37664','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Stop Movement on Aggro'),
('22021010','37664','4','0','100','6','0','0','0','0','11','70409','1','0','22','6','0','0','0','0','0','0','Darkfallen Archmage - Cast Fireball and Set Phase 1 on Aggro'),
('22021011','37664','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Darkfallen Archmage - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021012','37664','0','6','100','7','0','0','1500','3000','11','70409','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Cast Fireball above 15% Mana (Phase 1)'),
('22021013','37664','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Darkfallen Archmage - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021014','37664','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Start Movement Beyond 30 Yards'),
('22021015','37664','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - On Evade set Phase to 0'),
('22021016','37664','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Stop Movement on Aggro'),
('22021017','37664','4','0','100','24','0','0','0','0','11','71153','1','0','22','6','0','0','0','0','0','0','Darkfallen Archmage - Cast Fireball and Set Phase 1 on Aggro'),
('22021018','37664','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Darkfallen Archmage - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021019','37664','0','6','100','25','0','0','1500','3000','11','71153','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Cast Fireball above 15% Mana (Phase 1)'),
('22021020','37664','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Darkfallen Archmage - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021021','37664','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Start Movement Beyond 30 Yards'),
('22021022','37664','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - On Evade set Phase to 0'),
('22021023','37664','0','0','100','31','10000','11000','20000','29000','11','70410','4','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Casts Polymorph: Spider'),
('22021024','37595','0','0','100','31','15000','15000','28000','29000','11','70450','4','1','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Casts Blood Mirror'),
('22021025','37595','0','0','100','31','8000','11000','14000','16000','11','70437','1','0','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Casts Unholy Strike'),
('22021026','37595','1','0','100','31','1000','1000','1800000','1800000','11','71736','0','1','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Casts Vampiric Aura on Spawn'),
('22021027','37662','0','0','100','31','10000','12000','35000','36000','11','70750','0','0','0','0','0','0','0','0','0','0','Darkfallen Commander - Casts Battle Shout'),
('22021028','37622','4','0','100','6','0','0','0','0','11','70449','1','0','0','0','0','0','0','0','0','0','Darkfallen Commander - Casts Vampire Rush on Aggro'),
('22021029','37622','4','0','100','24','0','0','0','0','11','71155','1','0','0','0','0','0','0','0','0','0','Darkfallen Commander - Casts Vampire Rush on Aggro'),
('22021030','36939','0','0','100','31','10000','11000','14000','18000','11','15284','1','0','0','0','0','0','0','0','0','0','High Overlord Saurfang - Casts Cleave'),
('22021031','36939','4','0','100','30','0','0','0','0','11','70309','4','0','0','0','0','0','0','0','0','0','High Overlord Saurfang - Casts Rending Throw on Aggro'),
('22021032','36939','0','0','100','31','18000','19000','35000','35000','11','69634','0','1','0','0','0','0','0','0','0','0','High Overlord Saurfang - Casts Taste of Blood'),
('22021033','37886','0','0','100','7','10000','11000','22000','28000','11','70633','4','0','0','0','0','0','0','0','0','0','Gluttonous Abomination - Casts Gut Spray'),
('22021034','37886','0','0','100','25','10000','11000','22000','28000','11','71283','4','0','0','0','0','0','0','0','0','0','Gluttonous Abomination - Casts Gut Spray'),
('22021035','37562','0','0','100','7','5000','8000','14000','19000','11','70215','4','0','0','0','0','0','0','0','0','0','Gas Cloud - Casts Gaseous Bloat'),
('22021036','37562','0','0','100','25','5000','8000','14000','19000','11','70672','4','0','0','0','0','0','0','0','0','0','Gas Cloud - Casts Gaseous Bloat'),
('22021037','37532','0','0','100','7','5000','8000','14000','14000','11','71361','4','0','0','0','0','0','0','0','0','0','Frostwing Whelp - Casts Frost Blast'),
('22021038','37532','0','0','100','25','5000','8000','14000','14000','11','71362','4','0','0','0','0','0','0','0','0','0','Frostwing Whelp - Casts Frost Blast'),
('22021039','37532','0','0','100','31','3000','3000','12000','18000','11','71350','1','0','0','0','0','0','0','0','0','0','Frostwing Whelp - Casts Focus Fire'),
('22021040','37228','0','0','100','7','9000','10000','25000','27000','11','71316','4','0','0','0','0','0','0','0','0','0','Frostwarden Warrior - Casts Glacial Strike'),
('22021041','37228','0','0','100','25','9000','10000','25000','27000','11','71317','4','0','0','0','0','0','0','0','0','0','Frostwarden Warrior - Casts Glacial Strike'),
('22021042','37228','0','0','100','31','15000','18000','35000','35000','11','71325','0','1','0','0','0','0','0','0','0','0','Frostwarden Warrior - Casts Frostblade'),
('22021043','37229','0','0','100','31','15000','15000','22000','25000','11','71320','0','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Casts Frost Nova'),
('22021044','37229','0','0','100','31','5000','9000','19000','25000','11','71331','4','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Casts Ice Tomb'),
('22021045','36791','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Stop Movement on Aggro'),
('22021046','36791','4','0','100','30','0','0','0','0','11','71318','1','0','22','6','0','0','0','0','0','0','Frostwarden Sorceress - Cast Frostbolt and Set Phase 1 on Aggro'),
('22021047','36791','3','0','100','30','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Frostwarden Sorceress - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021048','36791','0','6','100','31','0','0','1500','3000','11','71318','1','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Cast Frostbolt above 15% Mana (Phase 1)'),
('22021049','36791','3','5','100','30','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Frostwarden Sorceress - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021050','36791','9','0','100','31','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Start Movement Beyond 30 Yards'),
('22021051','36791','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Frostwarden Sorceress - On Evade set Phase to 0'),
('22021052','37531','0','0','100','7','15000','15000','22000','25000','11','71337','0','0','0','0','0','0','0','0','0','0','Frostwarden Handler - Casts Concussive Shock'),
('22021053','37531','0','0','100','25','15000','15000','22000','25000','11','71338','0','0','0','0','0','0','0','0','0','0','Frostwarden Handler - Casts Concussive Shock'),
('22021054','37546','0','0','100','31','8000','11000','14000','19000','11','70191','1','0','0','0','0','0','0','0','0','0','Frenzied Abomination - Casts Cleave'),
('22021055','37546','2','0','100','30','30','0','0','0','11','70371','0','0','1','-106','0','0','0','0','0','0','Frenzied Abomination - Casts Enrage at 30% HP'),
('22021056','37919','0','0','100','31','12000','15000','22000','27000','11','70710','4','0','0','0','0','0','0','0','0','0','Empowered Vampiric Fiend  - Casts Leeching Rot'),
('22021057','37919','0','0','100','31','10000','10000','40000','40000','11','70711','0','1','0','0','0','0','0','0','0','0','Empowered Vampiric Fiend  - Casts Empowered Blood'),
('22021058','37919','1','0','100','31','1000','1000','1800000','1800000','11','41290','0','0','0','0','0','0','0','0','0','0','Empowered Vampiric Fiend - Casts Disease Cloud on Spawn'),
('22021059','37996','0','0','100','7','12000','12000','21000','21000','11','66019','4','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Death Coil'),
('22021060','37996','0','0','100','25','12000','12000','21000','21000','11','67929','4','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Death Coil'),
('22021061','37996','0','0','80','7','9000','9000','14000','18000','11','66047','1','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Frost Strike'),
('22021062','37996','0','0','80','25','9000','9000','14000','18000','11','67935','1','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Frost Strike'),
('22021063','37996','0','0','100','31','10000','10000','35000','35000','11','66023','0','1','0','0','0','0','0','0','0','0','Ebon Champion - Casts Icebound Fortitude'),
('22021064','37996','0','0','70','7','5000','5000','13000','16000','11','66021','4','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Icy Touch'),
('22021065','37996','0','0','70','25','5000','5000','13000','16000','11','67938','4','0','0','0','0','0','0','0','0','0','Ebon Champion - Casts Icy Touch'),
('22021066','36880','0','0','90','7','15000','15000','35000','39000','11','71114','0','0','0','0','0','0','0','0','0','0','Decaying Colossus - Casts Massive Stomp'),
('22021067','36880','0','0','90','25','15000','15000','35000','39000','11','71115','0','0','0','0','0','0','0','0','0','0','Decaying Colossus - Casts Massive Stomp'),
('22021068','36808','0','0','100','31','11000','11000','22000','25000','11','69492','1','0','0','0','0','0','0','0','0','0','Deathspeaker Zealot  - Casts Shadow Cleave'),
('22021069','36805','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Stop Movement on Aggro'),
('22021070','36805','4','0','100','6','0','0','0','0','11','69576','1','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt and Set Phase 1 on Aggro'),
('22021071','36805','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Servant - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021072','36805','0','6','100','7','0','0','1500','3000','11','69576','1','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt above 15% Mana (Phase 1)'),
('22021073','36805','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021074','36805','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Start Movement Beyond 30 Yards'),
('22021075','36805','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - On Evade set Phase to 0'),
('22021076','36805','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Stop Movement on Aggro'),
('22021077','36805','4','0','100','24','0','0','0','0','11','71108','1','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt and Set Phase 1 on Aggro'),
('22021078','36805','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Servant - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021079','36805','0','6','100','25','0','0','1500','3000','11','71108','1','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt above 15% Mana (Phase 1)'),
('22021080','36805','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021081','36805','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Start Movement Beyond 30 Yards'),
('22021082','36805','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - On Evade set Phase to 0'),
('27021066','36805','0','0','100','7','5000','7000','15000','19000','11','69404','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Curse of Agony'),
('27021067','36805','0','0','100','25','5000','7000','15000','19000','11','71112','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Curse of Agony'),
('27021068','36805','0','0','100','31','12000','14000','30000','32000','11','69405','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Consuming Shadows'),
('27021069','36829','0','0','100','31','12000','14000','22000','22000','11','69483','4','0','0','0','0','0','0','0','0','0','Deathspeaker High Priest  - Casts Dark Reckoning'),
('27021070','36829','1','0','100','31','1000','1000','1800000','1800000','11','69491','0','0','0','0','0','0','0','0','0','0','Deathspeaker High Priest - Casts Aura of Darkness on Spawn'),
('27021071','37666','0','0','100','31','12000','14000','22000','23000','11','70437','1','0','0','0','0','0','0','0','0','0','Darkfallen Tactician - Casts Unholy Strike'),
('27021072','37666','4','0','100','30','0','0','0','0','11','70431','1','0','0','0','0','0','0','0','0','0','Darkfallen Tactician - Cast Shadowstep on Aggro'),
('27021073','37666','0','0','80','31','9000','9000','15000','25000','11','70432','1','0','0','0','0','0','0','0','0','0','Darkfallen Tactician - Casts Blood Sap'),
('27021074','37665','0','0','100','7','9000','9000','32000','35000','11','70435','1','0','0','0','0','0','0','0','0','0','Darkfallen Lieutenant - Casts Rend Flesh'),
('27021075','37665','0','0','100','25','9000','9000','32000','35000','11','71154','1','0','0','0','0','0','0','0','0','0','Darkfallen Lieutenant - Casts Rend Flesh'),
('27021076','37665','0','0','100','31','9000','9000','22000','25000','11','70423','4','0','0','0','0','0','0','0','0','0','Darkfallen Lieutenant - Casts Vampiric Curse'),
('27021077','37007','0','0','100','31','15000','15000','25000','25000','11','71022','0','0','0','0','0','0','0','0','0','0','Deathbound Ward - Casts Disrupting Shout'),
('27021078','37007','0','0','100','31','12000','12000','20000','29000','11','71021','1','0','0','0','0','0','0','0','0','0','Deathbound Ward - Casts Saber Lash'),
('27021079','36807','14','0','90','6','320','40','0','0','11','69389','6','1','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Casts Shadow Mend on Friendlies'),
('27021080','36807','14','0','90','24','320','40','0','0','11','71107','6','1','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Casts Shadow Mend on Friendlies'),
('27021081','36807','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Stop Movement on Aggro'),
('27021082','36807','4','0','100','30','0','0','0','0','11','69387','1','0','22','6','0','0','0','0','0','0','Deathspeaker Disciple - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('27021083','36807','3','0','100','30','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Disciple - Start Movement and Set Phase 2 when Mana is at 15%'),
('27021084','36807','0','6','100','31','0','0','1500','3000','11','69387','1','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('27021085','36807','3','5','100','30','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Disciple - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021086','36807','9','0','100','31','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Start Movement Beyond 30 Yards'),
('22021087','36807','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - On Evade set Phase to 0'),
('22021088','36807','0','0','100','31','9000','9000','25000','28000','11','69391','0','1','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Casts Dark Blessing'),
('22021089','36811','0','0','100','7','12000','15000','25000','25000','11','69355','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Casts Shadow Nova'),
('22021090','36811','0','0','100','25','12000','15000','25000','25000','11','71106','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Casts Shadow Nova'),
('22021091','36811','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Stop Movement on Aggro'),
('22021092','36811','4','0','100','30','0','0','0','0','11','69387','1','0','22','6','0','0','0','0','0','0','Deathspeaker Attendant  - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021093','36811','3','0','100','30','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Attendant  - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021094','36811','0','6','100','31','0','0','1500','3000','11','69387','1','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021095','36811','3','5','100','30','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Attendant  - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021096','36811','9','0','100','31','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - Start Movement Beyond 30 Yards'),
('22021097','36811','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant  - On Evade set Phase to 0'),
('22021098','37663','0','0','100','31','12000','12000','24000','26000','11','70645','4','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Casts Chains of Shadow'),
('22021099','37663','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Stop Movement on Aggro'),
('22021100','37663','4','0','100','6','0','0','0','0','11','72960','1','0','22','6','0','0','0','0','0','0','Darkfallen Noble - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021101','37663','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Darkfallen Noble - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021102','37663','0','6','100','7','0','0','1500','3000','11','72960','1','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021103','37663','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Darkfallen Noble - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021104','37663','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Start Movement Beyond 30 Yards'),
('22021105','37663','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - On Evade set Phase to 0'),
('22021106','37663','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Stop Movement on Aggro'),
('22021107','37663','4','0','100','24','0','0','0','0','11','72961','1','0','22','6','0','0','0','0','0','0','Darkfallen Noble - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021108','37663','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Darkfallen Noble - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021109','37663','0','6','100','25','0','0','1500','3000','11','72961','1','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021110','37663','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Darkfallen Noble - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021111','37663','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Start Movement Beyond 30 Yards'),
('22021112','37663','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - On Evade set Phase to 0'),
('22021113','38472','0','0','100','31','9000','9000','25000','28000','11','69391','0','0','0','0','0','0','0','0','0','0','Darnavan - Casts Bladestorm'),
('22021114','38472','0','0','70','31','12000','13000','28000','29000','11','65946','0','0','0','0','0','0','0','0','0','0','Darnavan - Casts Bladestorm'),
('22021115','38472','4','0','100','30','0','0','0','0','11','65927','1','0','0','0','0','0','0','0','0','0','Darnavan  - Cast Charge on Aggro'),
('22021116','38472','0','0','50','31','7000','7000','15000','15000','11','65930','4','0','0','0','0','0','0','0','0','0','Darnavan - Cast Intimidating Shout'),
('22021117','38472','0','0','80','31','5000','10000','11000','18000','11','65926','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Mortal Strike'),
('22021118','38472','0','0','80','31','10000','10000','14000','22000','11','65924','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Overpower'),
('22021119','38472','0','0','60','31','11000','11000','16000','18000','11','65936','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Sunder Armor'),
('22021120','38485','0','0','100','31','9000','9000','25000','28000','11','69391','0','0','0','0','0','0','0','0','0','0','Darnavan - Casts Bladestorm'),
('22021121','38485','0','0','70','31','12000','13000','28000','29000','11','65946','0','0','0','0','0','0','0','0','0','0','Darnavan - Casts Bladestorm'),
('22021122','38485','4','0','100','30','0','0','0','0','11','65927','1','0','0','0','0','0','0','0','0','0','Darnavan  - Cast Charge on Aggro'),
('22021123','38485','0','0','50','31','7000','7000','15000','15000','11','65930','4','0','0','0','0','0','0','0','0','0','Darnavan - Cast Intimidating Shout'),
('22021124','38485','0','0','80','31','5000','10000','11000','18000','11','65926','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Mortal Strike'),
('22021125','38485','0','0','80','31','10000','10000','14000','22000','11','65924','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Overpower'),
('22021126','38485','0','0','60','31','11000','11000','16000','18000','11','65936','1','0','0','0','0','0','0','0','0','0','Darnavan - Cast Sunder Armor'),
('22021127','38454','0','0','100','7','11000','11000','26000','28000','11','72052','0','0','0','0','0','0','0','0','0','0','Kinetic Bomb - Cast Kinetic Bomb'),
('22021128','38454','0','0','100','25','11000','11000','26000','28000','11','72800','0','0','0','0','0','0','0','0','0','0','Kinetic Bomb - Cast Kinetic Bomb'),
('22021129','38454','0','0','100','7','10000','12000','24000','25000','11','70161','1','0','0','0','0','0','0','0','0','0','Korkron Axethrower - Cast Hurl Axe'),
('22021130','38454','0','0','100','25','10000','12000','24000','25000','11','72539','1','0','0','0','0','0','0','0','0','0','Korkron Axethrower - Cast Hurl Axe'),
('22021131','38454','0','0','100','31','15000','15000','20000','29000','11','71339','1','0','0','0','0','0','0','0','0','0','Korkron Axethrower - Cast Burning Pitch'),
('22021132','37117','4','0','100','30','0','0','0','0','11','69705','1','0','0','0','0','0','0','0','0','0','Korkron Battle-Mage - Cast Below Zero on Aggro'),
('22021133','37032','0','0','100','31','10000','10000','18000','24000','11','69902','1','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Devastate'),
('22021134','37032','0','0','100','7','5000','6000','14000','25000','11','69903','4','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Shield Slam'),
('22021135','37032','0','0','100','25','5000','6000','14000','25000','11','72645','4','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Shield Slam'),
('22021136','37032','0','0','80','7','14000','14000','20000','20000','11','69965','0','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Thunderclap'),
('22021137','37032','0','0','80','25','14000','14000','20000','20000','11','71147','0','0','0','0','0','0','0','0','0','0','Korkron Defender - Cast Thunderclap'),
('22021138','37032','0','0','100','31','8000','11000','18000','29000','11','69901','0','1','0','0','0','0','0','0','0','0','Korkron Defender - Cast Spell Reflect'),
('22021139','37033','0','0','100','31','10000','10000','180000','190000','11','69811','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Cast Summon Korkron Battle Standard'),
('22021140','37044','0','0','100','31','3000','3000','180000','190000','11','69809','0','0','0','0','0','0','0','0','0','0','Korkron Battle Standard - Cast Summon Korkron Battle Standard'),
('22021141','37033','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Stop Movement on Aggro'),
('22021142','37033','4','0','100','6','0','0','0','0','11','69869','1','0','22','6','0','0','0','0','0','0','Korkron Invoker - Cast Frostfire Bolt and Set Phase 1 on Aggro'),
('22021143','37033','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Invoker - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021144','37033','0','6','100','7','0','0','1500','3000','11','69869','1','0','0','0','0','0','0','0','0','0','Korkron Invoker - Cast Frostfire Bolt above 15% Mana (Phase 1)'),
('22021145','37033','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Invoker - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021146','37033','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Start Movement Beyond 30 Yards'),
('22021147','37033','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - On Evade set Phase to 0'),
('22021148','37033','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Stop Movement on Aggro'),
('22021149','37033','4','0','100','24','0','0','0','0','11','71130','1','0','22','6','0','0','0','0','0','0','Korkron Invoker - Cast Frostfire Bolt and Set Phase 1 on Aggro'),
('22021150','37033','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Invoker - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021151','37033','0','6','100','25','0','0','1500','3000','11','71130','1','0','0','0','0','0','0','0','0','0','Korkron Invoker - Cast Frostfire Bolt above 15% Mana (Phase 1)'),
('22021152','37033','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Invoker - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021153','37033','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Start Movement Beyond 30 Yards'),
('22021154','37033','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - On Evade set Phase to 0'),
('22021155','37033','2','0','100','31','20','0','12300','14900','11','69904','0','0','0','0','0','0','0','0','0','0','Korkron Invoker - Casts Blink at 20% HP'),
('22021156','37149','0','0','100','7','8000','11000','18000','24000','11','69969','4','0','0','0','0','0','0','0','0','0','Korkron  Necrolyte - Cast Curse of Doom'),
('22021157','37149','0','0','100','25','8000','11000','18000','24000','11','71124','4','0','0','0','0','0','0','0','0','0','Korkron  Necrolyte - Cast Curse of Doom'),
('22021158','37149','0','0','100','7','10000','12000','14000','19000','11','69973','4','0','0','0','0','0','0','0','0','0','Korkron  Necrolyte - Cast Incinerate'),
('22021159','37149','0','0','100','25','10000','12000','14000','19000','11','71135','4','0','0','0','0','0','0','0','0','0','Korkron  Necrolyte - Cast Incinerate'),
('22021160','37149','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Stop Movement on Aggro'),
('22021161','37149','4','0','100','6','0','0','0','0','11','69972','1','0','22','6','0','0','0','0','0','0','Korkron Necrolyte - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021162','37149','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Necrolyte - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021163','37149','0','6','100','7','0','0','1500','3000','11','69972','1','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021164','37149','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Necrolyte - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021165','37149','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Start Movement Beyond 30 Yards'),
('22021166','37149','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - On Evade set Phase to 0'),
('22021167','37149','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Stop Movement on Aggro'),
('22021168','37149','4','0','100','24','0','0','0','0','11','71143','1','0','22','6','0','0','0','0','0','0','Korkron Necrolyte - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('22021169','37149','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Necrolyte - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021170','37149','0','6','100','25','0','0','1500','3000','11','71143','1','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('22021171','37149','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Necrolyte - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021172','37149','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - Start Movement Beyond 30 Yards'),
('22021173','37149','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Necrolyte - On Evade set Phase to 0'),
('22021174','37031','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - Stop Movement on Aggro'),
('22021175','37031','4','0','100','6','0','0','0','0','11','69970','1','0','22','6','0','0','0','0','0','0','Korkron Oracle - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('22021176','37031','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Oracle - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021177','37031','0','6','100','7','0','0','1500','3000','11','69970','1','0','0','0','0','0','0','0','0','0','Korkron Oracle - Cast Lightning Bolt above 15% Mana (Phase 1)'),
('22021178','37031','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Oracle - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021179','37031','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Oracle- Start Movement Beyond 30 Yards'),
('22021180','37031','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - On Evade set Phase to 0'),
('22021181','37031','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - Stop Movement on Aggro'),
('22021182','37031','4','0','100','24','0','0','0','0','11','71136','1','0','22','6','0','0','0','0','0','0','Korkron Oracle - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('22021183','37031','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Oracle - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021184','37031','0','6','100','25','0','0','1500','3000','11','71136','1','0','0','0','0','0','0','0','0','0','Korkron Oracle - Cast Lightning Bolt above 15% Mana (Phase 1)'),
('22021185','37031','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Oracle - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021186','37031','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - Start Movement Beyond 30 Yards'),
('22021187','37031','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Oracle - On Evade set Phase to 0'),
('22021188','37031','1','0','100','31','1000','1000','1200000','1200000','11','69926','0','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Earth Shield on Spawn'),
('22021189','37031','14','0','90','6','320','40','0','0','11','69923','6','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Chain Heal on Friendlies'),
('22021190','37031','14','0','90','24','320','40','0','0','11','71120','6','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Chain Heal on Friendlies'),
('22021191','37031','2','0','100','7','50','0','12300','14900','11','69958','0','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Healing Wave at 50% HP'),
('22021192','37031','2','0','100','25','50','0','12300','14900','11','71133','0','1','0','0','0','0','0','0','0','0','Korkron Oracle - Casts Healing Wave at 50% HP'),
('22021193','37030','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Primalist - Stop Movement on Aggro'),
('22021194','37030','4','0','100','6','0','0','0','0','11','69968','1','0','22','6','0','0','0','0','0','0','Korkron Primalist - Cast Wrath and Set Phase 1 on Aggro'),
('22021195','37030','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Primalist - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021196','37030','0','6','100','7','0','0','1500','3000','11','69968','1','0','0','0','0','0','0','0','0','0','Korkron Primalist - Cast Wrath above 15% Mana (Phase 1)'),
('22021197','37030','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Primalist - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021198','37030','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Primalist- Start Movement Beyond 30 Yards'),
('22021199','37030','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Primalist- On Evade set Phase to 0'),
('22021200','37030','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Primalist - Stop Movement on Aggro'),
('22021201','37030','4','0','100','24','0','0','0','0','11','71148','1','0','22','6','0','0','0','0','0','0','Korkron Primalist - Cast Wrath and Set Phase 1 on Aggro'),
('22021202','37030','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Primalist - Start Movement and Set Phase 2 when Mana is at 15%'),
('22021203','37030','0','6','100','25','0','0','1500','3000','11','71148','1','0','0','0','0','0','0','0','0','0','Korkron Primalist - Cast Wrath above 15% Mana (Phase 1)'),
('22021204','37030','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Primalist - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('22021205','37030','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Primalist - Start Movement Beyond 30 Yards'),
('22021206','37030','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Primalist - On Evade set Phase to 0'),
('22021208','37030','14','0','90','6','3200','40','0','0','11','69882','6','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Regrowth on Friendlies'),
('22021209','37030','14','0','90','24','3200','40','0','0','11','71141','6','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Regrowth on Friendlies'),
('22021210','37030','2','0','50','7','50','0','12300','14900','11','69898','0','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Rejuvenation at 50% HP'),
('22021211','37030','2','0','50','25','50','0','12300','14900','11','71142','0','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Rejuvenation at 50% HP'),
('22021212','37030','2','0','50','7','50','0','12300','14900','11','69899','0','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Healing Touch at 50% HP'),
('22021213','37030','2','0','50','25','50','0','12300','14900','11','71121','0','1','0','0','0','0','0','0','0','0','Korkron Primalist - Casts Healing Touch at 50% HP'),
('22021214','36957','0','0','100','31','8000','8000','16000','21000','11','71339','4','0','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Burning Pitch'),
('22021215','36957','0','0','100','7','10000','10000','41000','42000','11','69647','0','1','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Desperate Resolve'),
('22021216','36957','0','0','100','25','10000','10000','41000','42000','11','72536','0','1','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Desperate Resolve'),
('22021217','37029','0','0','100','31','10000','10000','15000','16000','11','69912','1','0','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Plague Strike'),
('22021218','37029','0','0','100','31','7000','12000','14000','24000','11','69916','1','0','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Icy Touch'),
('22021219','36982','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Rocketeer - Stop Movement on Aggro'),
('22021220','36982','0','0','80','31','2000','2000','7000','9000','11','69679','4','0','0','0','0','0','0','0','0','0','Korkron Reaver - Cast Rocket Artillery'),
('25021001','36960','0','0','100','31','10000','10000','25000','29000','11','69652','0','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Bladestorm'),
('25021002','36960','0','0','100','31','15000','15000','30000','31000','11','69653','0','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Bladestorm'),
('25021003','36960','0','0','100','31','8000','16000','21000','32000','11','71339','4','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Burning Pitch'),
('25021004','36960','2','0','100','3','50','0','12300','14900','11','69647','0','1','0','0','0','0','0','0','0','0','Korkron Sergeant - Casts Desperate Resolve at 50% HP'),
('25021005','36960','2','0','100','9','50','0','12300','14900','11','72536','0','1','0','0','0','0','0','0','0','0','Korkron Sergeant - Casts Desperate Resolve at 50% HP'),
('25021006','36960','2','0','100','5','50','0','12300','14900','11','72537','0','1','0','0','0','0','0','0','0','0','Korkron Sergeant - Casts Desperate Resolve at 50% HP'),
('25021007','36960','2','0','100','17','50','0','12300','14900','11','72538','0','1','0','0','0','0','0','0','0','0','Korkron Sergeant - Casts Desperate Resolve at 50% HP'),
('25021008','36960','0','0','80','3','5000','5000','18000','25000','11','69651','1','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Wounding Strike'),
('28021008','36960','0','0','80','9','5000','5000','18000','25000','11','72569','1','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Wounding Strike'),
('25021009','36960','0','0','80','5','5000','5000','18000','25000','11','72570','1','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Wounding Strike'),
('29021010','36960','0','0','80','17','5000','5000','18000','25000','11','72571','1','0','0','0','0','0','0','0','0','0','Korkron Sergeant - Cast Wounding Strike'),
('29021011','37146','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Stop Movement on Aggro'),
('29021012','37146','4','0','100','6','0','0','0','0','11','69974','1','0','22','1','0','0','0','0','0','0','Korkron Sniper - Cast Shoot and Set Phase 1 on Aggro'),
('29021013','37146','0','13','100','7','2200','4700','2200','4700','11','69974','1','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Shoot (Phase 1)'),
('29021014','37146','9','13','100','7','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Start Movement at 20 Yards (Phase 1)'),
('29021015','37146','9','13','100','7','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Stop Movement at 10 Yards (Phase 1)'),
('29021016','37146','9','13','100','7','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Start Movement at 5 Yards (Phase 1)'),
('29021017','37146','2','0','100','6','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Set Phase 2 at 15% HP'),
('29021018','37146','2','11','100','6','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Korkron Sniper - Start Movement and Flee at 15% HP (Phase 2)'),
('29021019','37146','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - On Evade set Phase to 0'),
('29021020','37146','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Stop Movement on Aggro'),
('29021021','37146','4','0','100','24','0','0','0','0','11','71144','1','0','22','1','0','0','0','0','0','0','Korkron Sniper - Cast Shoot and Set Phase 1 on Aggro'),
('29021022','37146','0','13','100','25','2200','4700','2200','4700','11','71144','1','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Shoot (Phase 1)'),
('29021023','37146','9','13','100','25','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Start Movement at 20 Yards (Phase 1)'),
('29021024','37146','9','13','100','25','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Stop Movement at 10 Yards (Phase 1)'),
('29021025','37146','9','13','100','25','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Start Movement at 5 Yards (Phase 1)'),
('29021026','37146','2','0','100','24','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - Set Phase 2 at 15% HP'),
('29021027','37146','2','11','100','24','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Korkron Sniper - Start Movement and Flee at 15% HP (Phase 2)'),
('29021028','37146','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Sniper - On Evade set Phase to 0'),
('25021010','37146','0','0','80','7','5000','5000','18000','25000','11','69989','4','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Arcane Shot'),
('25021011','37146','0','0','80','25','5000','5000','18000','25000','11','71116','4','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Arcane Shot'),
('25021012','37146','0','0','70','7','10000','12000','24000','29000','11','69975','4','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Explosive Shot'),
('25021013','37146','0','0','70','25','10000','12000','24000','29000','11','71126','4','0','0','0','0','0','0','0','0','0','Korkron Sniper - Cast Explosive Shot'),
('25021014','37034','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Templar - Stop Movement on Aggro'),
('25021015','37034','4','0','100','6','0','0','0','0','11','69967','1','0','22','6','0','0','0','0','0','0','Korkron Templar - Cast Smite and Set Phase 1 on Aggro'),
('25021016','37034','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Templar - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021017','37034','0','6','100','7','0','0','1500','3000','11','69967','1','0','0','0','0','0','0','0','0','0','Korkron Templar - Cast Smite above 15% Mana (Phase 1)'),
('25021018','37034','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Templar - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021019','37034','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Templar - Start Movement Beyond 30 Yards'),
('25021020','37034','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Templar - On Evade set Phase to 0'),
('25021021','37034','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Korkron Templar - Stop Movement on Aggro'),
('25021022','37034','4','0','100','24','0','0','0','0','11','71146','1','0','22','6','0','0','0','0','0','0','Korkron Templar - Cast Smite and Set Phase 1 on Aggro'),
('25021023','37034','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Korkron Templar - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021024','37034','0','6','100','25','0','0','1500','3000','11','71146','1','0','0','0','0','0','0','0','0','0','Korkron Templar - Cast Smite above 15% Mana (Phase 1)'),
('25021025','37034','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Korkron Templar - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021026','37034','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Korkron Templar - Start Movement Beyond 30 Yards'),
('25021027','37034','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Korkron Templar - On Evade set Phase to 0'),
('25021028','37034','14','0','90','6','48000','40','0','0','11','69963','6','1','0','0','0','0','0','0','0','0','Korkron Templar - Casts Greater Heal on Friendlies'),
('25021029','37034','14','0','90','24','48000','40','0','0','11','71131','6','1','0','0','0','0','0','0','0','0','Korkron Templar - Casts Greater Heal on Friendlies'),
('25021030','37034','0','0','100','31','8000','12000','24000','30000','11','69910','0','1','0','0','0','0','0','0','0','0','Korkron Templar - Cast Pain Suppression'),
('25021031','37035','4','0','100','6','0','0','0','0','11','69927','1','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Avengers Shield on Aggro'),
('25021032','37035','4','0','100','24','0','0','0','0','11','71117','1','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Avengers Shield on Aggro'),
('25021033','37035','0','0','100','7','15000','15000','25000','35000','11','69930','0','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Consecration'),
('25021034','37035','0','0','100','25','15000','15000','25000','35000','11','71122','0','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Consecration'),
('25021035','37035','0','0','100','7','10000','10000','20000','21000','11','69934','0','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Holy Wrath'),
('25021036','37035','0','0','100','25','10000','10000','20000','21000','11','71134','0','0','0','0','0','0','0','0','0','0','Korkron Vanquisher - Cast Holy Wrath'),
('25021037','36897','2','0','100','31','50','0','12300','14900','11','69889','0','0','0','0','0','0','0','0','0','0','Little Ooze - Casts Merge at 50% HP'),
('25021038','36897','0','0','100','31','8000','10000','17000','21000','11','69774','4','32','0','0','0','0','0','0','0','0','Little Ooze - Cast Sticky Ooze'),
('25021039','36897','0','0','100','31','14000','15000','27000','31000','11','69750','0','0','0','0','0','0','0','0','0','0','Little Ooze - Cast Weak Radiating Ooze'),
('25021040','36725','0','0','100','31','5000','5000','35000','35000','11','70965','0','0','0','0','0','0','0','0','0','0','Nerubar Broodkeeper - Cast Crypt Scarabs'),
('25021041','36725','14','0','90','30','45000','40','0','0','11','71020','6','1','0','0','0','0','0','0','0','0','Nerubar Broodkeeper - Casts Dark Mending on Friendlies'),
('25021042','36725','0','0','100','31','10000','10000','21000','22000','11','70980','4','0','0','0','0','0','0','0','0','0','Nerubar Broodkeeper - Cast Web Wrap'),
('25021043','37501','4','0','100','30','0','0','0','0','11','71801','0','1','0','0','0','0','0','0','0','0','Nerubar Champion - Cast Rush on Aggro'),
('25021044','37502','0','0','100','31','5000','5000','35000','35000','11','71326','0','0','0','0','0','0','0','0','0','0','Nerubar Webweaver - Cast Crypt Scarabs'),
('25021045','37502','0','0','100','31','8000','11000','14000','21000','11','71327','4','0','0','0','0','0','0','0','0','0','Nerubar Webweaver - Cast Web'),
('25021046','37023','0','0','100','31','8000','11500','18000','21000','11','71103','4','0','0','0','0','0','0','0','0','0','Plague Scientist - Cast Combobulating Spray'),
('25021047','37023','0','0','100','31','10000','10000','14000','17000','11','71079','1','0','0','0','0','0','0','0','0','0','Plague Scientist - Cast Plague Blast'),
('25021048','37023','0','0','100','31','15000','15000','25000','27000','11','69871','4','32','0','0','0','0','0','0','0','0','Plague Scientist - Cast Plague Stream'),
('25021049','37217','0','0','100','31','15000','15000','35000','35000','11','71123','0','0','0','0','0','0','0','0','0','0','Precious - Cast Decimate'),
('25021050','37217','0','0','90','31','5000','8000','19000','22000','11','71127','1','0','0','0','0','0','0','0','0','0','Precious - Cast Mortal Wound'),
('25021051','10404','2','0','100','30','20','0','0','0','11','71088','0','0','0','0','0','0','0','0','0','0','Pustulating Horror - Casts Blight Bomb at 20% HP'),
('25021052','10404','0','0','90','7','5000','8000','20000','22000','11','71089','4','0','0','0','0','0','0','0','0','0','Pustulating Horror - Cast Bubbling Pus'),
('25021053','10404','0','0','90','25','5000','8000','20000','22000','11','71089','4','0','0','0','0','0','0','0','0','0','Pustulating Horror - Cast Bubbling Pus'),
('25021054','36701','0','0','100','7','10000','10000','25000','35000','11','69242','0','0','0','0','0','0','0','0','0','0','Raging Spirit - Cast Soul Shriek'),
('25021055','36701','0','0','100','25','10000','10000','25000','35000','11','73800','0','0','0','0','0','0','0','0','0','0','Raging Spirit - Cast Soul Shriek'),
('25021056','37533','1','0','100','31','1000','1000','1900000','1900000','11','71387','0','1','0','0','0','0','0','0','0','0','Rimefang - Casts Frost Aura on Spawn'),
('25021057','37533','0','0','100','31','15000','15000','25000','27000','11','71386','0','0','0','0','0','0','0','0','0','0','Rimefang - Cast Frost Breath'),
('25021058','37533','0','0','100','31','8000','17000','21000','32000','11','71376','1','0','0','0','0','0','0','0','0','0','Rimefang - Cast Icy Blast'),
('25021059','37868','0','0','100','7','15000','15000','27000','27000','11','71179','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Mana Void'),
('25021060','37868','0','0','100','25','15000','15000','27000','27000','11','71741','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Mana Void'),
('25021061','37868','0','0','100','3','10000','10000','18000','22000','11','70759','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('25021062','37868','0','0','100','9','10000','10000','18000','22000','11','71889','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('25021063','37868','0','0','100','5','10000','10000','18000','22000','11','72015','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('25021064','37868','0','0','100','17','10000','10000','18000','22000','11','72016','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('25021065','37868','0','0','100','31','18000','18000','28000','28000','11','70602','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Corruption'),
('16021069','36844','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Risen Deathspeaker Servant - Stop Movement on Aggro'),
('16021070','36844','4','0','100','6','0','0','0','0','11','69576','1','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt and Set Phase 1 on Aggro'),
('16021071','36844','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Servant - Start Movement and Set Phase 2 when Mana is at 15%'),
('16021072','36844','0','6','100','7','0','0','1500','3000','11','69576','1','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt above 15% Mana (Phase 1)'),
('16021073','36844','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('16021074','36844','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Start Movement Beyond 30 Yards'),
('16021075','36844','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - On Evade set Phase to 0'),
('16021076','36844','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Stop Movement on Aggro'),
('16021077','36844','4','0','100','24','0','0','0','0','11','71108','1','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt and Set Phase 1 on Aggro'),
('16021078','36844','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Deathspeaker Servant - Start Movement and Set Phase 2 when Mana is at 15%'),
('16021079','36844','0','6','100','25','0','0','1500','3000','11','71108','1','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Chaos Bolt above 15% Mana (Phase 1)'),
('16021080','36844','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Deathspeaker Servant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('16021081','36844','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Start Movement Beyond 30 Yards'),
('15021082','36844','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - On Evade set Phase to 0'),
('25021066','36844','0','0','100','7','5000','7000','15000','19000','11','69404','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Curse of Agony'),
('25021067','36844','0','0','100','25','5000','7000','15000','19000','11','71112','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Curse of Agony'),
('25021068','36844','0','0','100','31','12000','14000','30000','32000','11','69405','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant - Casts Consuming Shadows'),
('25021069','38494','0','0','100','31','15000','15000','27000','27000','11','64652','0','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Casts Stomp'),
('25021070','38494','0','0','100','31','5000','8000','18000','25000','11','72865','4','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Casts Death Plague'),
('25021071','38490','0','0','100','31','15000','15000','27000','27000','11','64652','0','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Casts Stomp'),
('25021072','38490','0','0','100','31','5000','8000','18000','25000','11','72865','4','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Casts Death Plague'),
('25021073','36724','0','0','100','31','8000','12000','22000','26000','11','71029','4','0','0','0','0','0','0','0','0','0','Servant of the Throne - Casts Glacial Blast'),
('25021074','38410','0','0','100','31','5000','9000','12000','17000','11','71937','4','0','0','0','0','0','0','0','0','0','Severed Essence - Casts Corruption'),
('25021075','37698','2','0','100','6','25','0','0','0','11','72143','0','0','1','-106','0','0','0','0','0','0','Shambling Horror - Casts Enrage at 25% HP'),
('25021076','37698','2','0','100','24','25','0','0','0','11','72146','0','0','1','-106','0','0','0','0','0','0','Shambling Horror - Casts Enrage at 25% HP'),
('25021077','37698','0','0','100','7','7000','9000','15000','17000','11','72149','0','0','0','0','0','0','0','0','0','0','Shambling Horror - Casts Shockwave'),
('25021078','37698','0','0','100','25','7000','9000','15000','17000','11','73794','0','0','0','0','0','0','0','0','0','0','Shambling Horror - Casts Shockwave'),
('25021079','37017','0','0','80','7','7000','9000','15000','15000','11','69921','0','0','0','0','0','0','0','0','0','0','Skybreaker Assassin - Casts Fan of Knives'),
('25021080','37017','0','0','80','25','7000','9000','15000','15000','11','71128','0','0','0','0','0','0','0','0','0','0','Skybreaker Assassin - Casts Fan of Knives'),
('25021081','37017','0','0','90','7','12000','14000','24000','25000','11','69920','1','0','0','0','0','0','0','0','0','0','Skybreaker Assassin - Casts Sinister Strike'),
('25021082','37017','0','0','90','25','12000','14000','24000','25000','11','71145','1','0','0','0','0','0','0','0','0','0','Skybreaker Assassin - Casts Sinister Strike'),
('25021083','37126','0','0','100','7','12000','14000','25000','25000','11','71468','4','0','0','0','0','0','0','0','0','0','Sister Svalna - Casts Aether Burst'),
('25021084','37126','0','0','100','25','12000','14000','25000','25000','11','71469','4','0','0','0','0','0','0','0','0','0','Sister Svalna - Casts Aether Burst'),
('25021085','37126','2','0','100','31','40','0','12300','14900','11','71463','0','1','0','0','0','0','0','0','0','0','Sister Svalna - Casts Aether Shield at 40% HP'),
('25021086','37126','0','0','100','31','15000','15000','35000','35000','11','71465','0','0','0','0','0','0','0','0','0','0','Sister Svalna - Casts Divine Surge'),
('25021087','37126','0','0','100','31','12000','12000','19000','28000','11','71443','4','0','0','0','0','0','0','0','0','0','Sister Svalna - Casts Impaling Spear'),
('25021088','37126','4','0','100','30','0','0','0','0','11','70053','0','0','0','0','0','0','0','0','0','0','Sister Svalna - Cast Revive Champion on Aggro'),
('25021089','37004','0','0','100','31','8000','12000','18000','26000','11','69916','1','0','0','0','0','0','0','0','0','0','Skybreaker Dreadblade - Casts Icy Touch'),
('25021090','37004','0','0','90','31','5000','5000','14000','19000','11','69912','1','0','0','0','0','0','0','0','0','0','Skybreaker Dreadblade - Casts Plague Strike'),
('25021193','37027','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Stop Movement on Aggro'),
('25021194','37027','4','0','100','6','0','0','0','0','11','69968','1','0','22','6','0','0','0','0','0','0','Skybreaker Hierophant - Cast Wrath and Set Phase 1 on Aggro'),
('25021195','37027','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Hierophant - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021196','37027','0','6','100','7','0','0','1500','3000','11','69968','1','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Cast Wrath above 15% Mana (Phase 1)'),
('25021197','37027','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Hierophant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021198','37027','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant- Start Movement Beyond 30 Yards'),
('25021199','37027','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant- On Evade set Phase to 0'),
('25021200','37027','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Stop Movement on Aggro'),
('25021201','37027','4','0','100','24','0','0','0','0','11','71148','1','0','22','6','0','0','0','0','0','0','Skybreaker Hierophant - Cast Wrath and Set Phase 1 on Aggro'),
('25021202','37027','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Hierophant - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021203','37027','0','6','100','25','0','0','1500','3000','11','71148','1','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Cast Wrath above 15% Mana (Phase 1)'),
('25021204','37027','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Hierophant - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021205','37027','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Start Movement Beyond 30 Yards'),
('25021206','37027','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Hierophant - On Evade set Phase to 0'),
('25021208','37027','14','0','90','6','3200','40','0','0','11','69882','6','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Regrowth on Friendlies'),
('25021209','37027','14','0','90','24','3200','40','0','0','11','71141','6','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Regrowth on Friendlies'),
('25021210','37027','2','0','50','7','50','0','12300','14900','11','69898','0','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Rejuvenation at 50% HP'),
('25021211','37027','2','0','50','25','50','0','12300','14900','11','71142','0','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Rejuvenation at 50% HP'),
('25021212','37027','2','0','50','7','50','0','12300','14900','11','69899','0','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Healing Touch at 50% HP'),
('25021213','37027','2','0','50','25','50','0','12300','14900','11','71121','0','1','0','0','0','0','0','0','0','0','Skybreaker Hierophant - Casts Healing Touch at 50% HP'),
('25021274','37016','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Stop Movement on Aggro'),
('25021275','37016','4','0','100','6','0','0','0','0','11','69970','1','0','22','6','0','0','0','0','0','0','Skybreaker Luminary - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('25021276','37016','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Luminary - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021277','37016','0','6','100','7','0','0','1500','3000','11','69970','1','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Cast Lightning Bolt above 15% Mana (Phase 1)'),
('25021278','37016','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Luminary - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021279','37016','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary- Start Movement Beyond 30 Yards'),
('25021280','37016','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - On Evade set Phase to 0'),
('25021281','37016','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Stop Movement on Aggro'),
('25021282','37016','4','0','100','24','0','0','0','0','11','71136','1','0','22','6','0','0','0','0','0','0','Skybreaker Luminary - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('25021283','37016','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Luminary - Start Movement and Set Phase 2 when Mana is at 15%'),
('25021284','37016','0','6','100','25','0','0','1500','3000','11','71136','1','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Cast Lightning Bolt above 15% Mana (Phase 1)'),
('25021285','37016','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Luminary - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('25021286','37016','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - Start Movement Beyond 30 Yards'),
('25021287','37016','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Luminary - On Evade set Phase to 0'),
('25021288','37016','1','0','100','31','1000','1000','1200000','1200000','11','69926','0','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Earth Shield on Spawn'),
('25021289','37016','14','0','90','6','320','40','0','0','11','69923','6','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Chain Heal on Friendlies'),
('25021290','37016','14','0','90','24','320','40','0','0','11','71120','6','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Chain Heal on Friendlies'),
('25021291','37016','2','0','100','7','50','0','12300','14900','11','69958','0','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Healing Wave at 50% HP'),
('25021292','37016','2','0','100','25','50','0','12300','14900','11','71133','0','1','0','0','0','0','0','0','0','0','Skybreaker Luminary - Casts Healing Wave at 50% HP'),
('25021293','36950','0','0','100','31','15000','15000','20000','29000','11','71335','4','0','0','0','0','0','0','0','0','0','Skybreaker Marine - Cast Burning Pitch'),
('25021294','36950','0','0','100','3','10000','10000','41000','42000','11','69647','0','1','0','0','0','0','0','0','0','0','Skybreaker Marine - Cast Desperate Resolve'),
('25021295','36950','0','0','100','9','10000','10000','41000','42000','11','72536','0','1','0','0','0','0','0','0','0','0','Skybreaker Marine - Cast Desperate Resolve'),
('25021296','36950','0','0','100','21','10000','10000','41000','42000','11','72537','0','1','0','0','0','0','0','0','0','0','Skybreaker Marine - Cast Desperate Resolve'),
('36021011','37144','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Stop Movement on Aggro'),
('36021012','37144','4','0','100','6','0','0','0','0','11','69974','1','0','22','1','0','0','0','0','0','0','Skybreaker Marksman - Cast Shoot and Set Phase 1 on Aggro'),
('36021013','37144','0','13','100','7','2200','4700','2200','4700','11','69974','1','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Shoot (Phase 1)'),
('36021014','37144','9','13','100','7','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman- Start Movement at 20 Yards (Phase 1)'),
('36021015','37144','9','13','100','7','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Stop Movement at 10 Yards (Phase 1)'),
('36021016','37144','9','13','100','7','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Start Movement at 5 Yards (Phase 1)'),
('36021017','37144','2','0','100','6','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Set Phase 2 at 15% HP'),
('36021018','37144','2','11','100','6','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Marksman - Start Movement and Flee at 15% HP (Phase 2)'),
('36021019','37144','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - On Evade set Phase to 0'),
('36021020','37144','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Stop Movement on Aggro'),
('36021021','37144','4','0','100','24','0','0','0','0','11','71144','1','0','22','1','0','0','0','0','0','0','Skybreaker Marksman - Cast Shoot and Set Phase 1 on Aggro'),
('36021022','37144','0','13','100','25','2200','4700','2200','4700','11','71144','1','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Shoot (Phase 1)'),
('36021023','37144','9','13','100','25','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Start Movement at 20 Yards (Phase 1)'),
('36021024','37144','9','13','100','25','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Stop Movement at 10 Yards (Phase 1)'),
('36021025','37144','9','13','100','25','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Start Movement at 5 Yards (Phase 1)'),
('36021026','37144','2','0','100','24','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Set Phase 2 at 15% HP'),
('36021027','37144','2','11','100','24','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Marksman - Start Movement and Flee at 15% HP (Phase 2)'),
('36021028','37144','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - On Evade set Phase to 0'),
('26011010','37144','0','0','80','7','5000','5000','18000','25000','11','69989','4','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Arcane Shot'),
('26011011','37144','0','0','80','25','5000','5000','18000','25000','11','71116','4','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Arcane Shot'),
('26011012','37144','0','0','70','7','10000','12000','24000','29000','11','69975','4','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Explosive Shot'),
('26011013','37144','0','0','70','25','10000','12000','24000','29000','11','71126','4','0','0','0','0','0','0','0','0','0','Skybreaker Marksman - Cast Explosive Shot'),
('26011014','36978','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Mortar Soldier - Stop Movement on Aggro'),
('26011015','36978','0','0','80','31','2000','2000','7000','9000','11','69679','4','0','0','0','0','0','0','0','0','0','Skybreaker Mortar Soldier - Cast Rocket Artillery'),
('26011016','36998','0','0','100','31','10000','10000','18000','24000','11','69902','1','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Devastate'),
('26011017','36998','0','0','100','7','5000','6000','14000','25000','11','69903','4','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Shield Slam'),
('26011018','36998','0','0','100','25','5000','6000','14000','25000','11','72645','4','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Shield Slam'),
('26011019','36998','0','0','80','7','14000','14000','20000','20000','11','69965','0','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Thunderclap'),
('26011020','36998','0','0','80','25','14000','14000','20000','20000','11','71147','0','0','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Thunderclap'),
('26011021','36998','0','0','100','31','8000','11000','18000','29000','11','69901','0','1','0','0','0','0','0','0','0','0','Skybreaker Protector - Cast Spell Reflect'),
('26011022','36969','0','0','100','31','15000','15000','20000','29000','11','71335','4','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Burning Pitch'),
('26011023','36969','0','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement on Aggro'),
('26011024','36969','4','0','100','2','0','0','0','0','11','70162','1','0','22','1','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot and Set Phase 1 on Aggro'),
('26011025','36969','0','13','100','3','2200','4700','2200','4700','11','70162','1','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot (Phase 1)'),
('26011026','36969','9','13','100','3','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 20 Yards (Phase 1)'),
('26011027','36969','9','13','100','3','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement at 10 Yards (Phase 1)'),
('26011028','36969','9','13','100','3','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 5 Yards (Phase 1)'),
('26011029','36969','2','0','100','2','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Set Phase 2 at 15% HP'),
('26011030','36969','2','11','100','2','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Rifleman - Start Movement and Flee at 15% HP (Phase 2)'),
('26011031','36969','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - On Evade set Phase to 0'),
('26011032','36969','0','0','100','8','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement on Aggro'),
('26011033','36969','4','0','100','8','0','0','0','0','11','72566','1','0','22','1','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot and Set Phase 1 on Aggro'),
('26011034','36969','0','13','100','9','2200','4700','2200','4700','11','72566','1','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot (Phase 1)'),
('26011035','36969','9','13','100','9','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 20 Yards (Phase 1)'),
('26011036','36969','9','13','100','9','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement at 10 Yards (Phase 1)'),
('26011037','36969','9','13','100','9','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 5 Yards (Phase 1)'),
('26011038','36969','2','0','100','8','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Set Phase 2 at 15% HP'),
('26011039','36969','2','11','100','8','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Rifleman - Start Movement and Flee at 15% HP (Phase 2)'),
('26011040','36969','7','0','100','8','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - On Evade set Phase to 0'),
('26011041','36969','0','0','100','4','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement on Aggro'),
('26011042','36969','4','0','100','4','0','0','0','0','11','72567','1','0','22','1','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot and Set Phase 1 on Aggro'),
('26011043','36969','0','13','100','5','2200','4700','2200','4700','11','72567','1','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot (Phase 1)'),
('26011044','36969','9','13','100','5','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 20 Yards (Phase 1)'),
('26011045','36969','9','13','100','5','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement at 10 Yards (Phase 1)'),
('26011046','36969','9','13','100','5','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 5 Yards (Phase 1)'),
('26011047','36969','2','0','100','4','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Set Phase 2 at 15% HP'),
('26011048','36969','2','11','100','4','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Rifleman - Start Movement and Flee at 15% HP (Phase 2)'),
('26011049','36969','7','0','100','4','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - On Evade set Phase to 0'),
('26011050','36969','0','0','100','16','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement on Aggro'),
('26011051','36969','4','0','100','16','0','0','0','0','11','72568','1','0','22','1','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot and Set Phase 1 on Aggro'),
('26011052','36969','0','13','100','17','2200','4700','2200','4700','11','72568','1','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Cast Shoot (Phase 1)'),
('26011053','36969','9','13','100','17','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 20 Yards (Phase 1)'),
('26011054','36969','9','13','100','17','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Stop Movement at 10 Yards (Phase 1)'),
('26011055','36969','9','13','100','17','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Start Movement at 5 Yards (Phase 1)'),
('26011056','36969','2','0','100','16','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - Set Phase 2 at 15% HP'),
('26011057','36969','2','11','100','16','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Skybreaker Rifleman - Start Movement and Flee at 15% HP (Phase 2)'),
('26011058','36969','7','0','100','16','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Rifleman - On Evade set Phase to 0'),
('26021001','36961','0','0','100','31','9000','9000','25000','28000','11','69652','0','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Casts Bladestorm'),
('26021002','36961','0','0','80','7','5000','10000','11000','18000','11','69651','1','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Mortal Strike'),
('26021003','36961','0','0','80','9','5000','10000','11000','18000','11','72569','1','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Mortal Strike'),
('26021004','36961','0','0','80','17','5000','10000','11000','18000','11','72570','1','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Mortal Strike'),
('26021005','36961','0','0','100','7','10000','10000','41000','42000','11','69647','0','1','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Desperate Resolve'),
('26021006','36961','0','0','100','9','10000','10000','41000','42000','11','72536','0','1','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Desperate Resolve'),
('26021007','36961','0','0','100','17','10000','10000','41000','42000','11','72537','0','1','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Desperate Resolve'),
('26021008','36961','0','0','100','31','15000','15000','20000','29000','11','71335','4','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Burning Pitch'),
('26021009','36961','0','0','100','31','15000','15000','30000','31000','11','69653','0','0','0','0','0','0','0','0','0','0','Skybreaker Sergeant - Cast Bladestorm'),
('26021010','37026','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Stop Movement on Aggro'),
('26021011','37026','4','0','100','6','0','0','0','0','11','69869','1','0','22','6','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Frostfire Bolt and Set Phase 1 on Aggro'),
('26021012','37026','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Sorcerer - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021013','37026','0','6','100','7','0','0','1500','3000','11','69869','1','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Frostfire Bolt above 15% Mana (Phase 1)'),
('26021014','37026','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Sorcerer - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021015','37026','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Start Movement Beyond 30 Yards'),
('26021016','37026','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - On Evade set Phase to 0'),
('26021017','37026','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Stop Movement on Aggro'),
('26021018','37026','4','0','100','24','0','0','0','0','11','71130','1','0','22','6','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Frostfire Bolt and Set Phase 1 on Aggro'),
('26021019','37026','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Sorcerer - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021020','37026','0','6','100','25','0','0','1500','3000','11','71130','1','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Frostfire Bolt above 15% Mana (Phase 1)'),
('26021021','37026','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Sorcerer - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021022','37026','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Start Movement Beyond 30 Yards'),
('26021023','37026','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - On Evade set Phase to 0'),
('26021024','37026','2','0','100','31','20','0','12300','14900','11','69904','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Casts Blink at 20% HP'),
('26021025','37026','0','0','100','31','10000','10000','180000','190000','11','69810','0','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Summon Skybreaker Battle Standard'),
('26021026','37041','0','0','100','31','3000','3000','180000','190000','11','69808','0','0','0','0','0','0','0','0','0','0','Skybreaker Battle Standard - Cast Skybreaker Battle Standard'),
('26021027','37116','4','0','100','30','0','0','0','0','11','69705','1','0','0','0','0','0','0','0','0','0','Skybreaker Sorcerer - Cast Below Zero on Aggro'),
('26021028','37148','0','0','100','7','8000','11000','18000','24000','11','69969','4','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Curse of Doom'),
('26021029','37148','0','0','100','25','8000','11000','18000','24000','11','71124','4','0','0','0','0','0','0','0','0','0','Skybreaker Summoner- Cast Curse of Doom'),
('26021030','37148','0','0','100','7','10000','12000','14000','19000','11','69973','4','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Incinerate'),
('26021031','37148','0','0','100','25','10000','12000','14000','19000','11','71135','4','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Incinerate'),
('26021032','37148','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Stop Movement on Aggro'),
('26021033','37148','4','0','100','6','0','0','0','0','11','69972','1','0','22','6','0','0','0','0','0','0','Skybreaker Summoner - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('26021034','37148','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Summoner - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021035','37148','0','6','100','7','0','0','1500','3000','11','69972','1','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('26021036','37148','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Summoner - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021037','37148','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Start Movement Beyond 30 Yards'),
('26021038','37148','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - On Evade set Phase to 0'),
('26021039','37148','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Stop Movement on Aggro'),
('26021040','37148','4','0','100','24','0','0','0','0','11','71143','1','0','22','6','0','0','0','0','0','0','Skybreaker Summoner - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('26021041','37148','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Summoner - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021042','37148','0','6','100','25','0','0','1500','3000','11','71143','1','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('26021043','37148','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Summoner - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021044','37148','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - Start Movement Beyond 30 Yards'),
('26021045','37148','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Summoner - On Evade set Phase to 0'),
('26021046','37021','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Stop Movement on Aggro'),
('26021047','37021','4','0','100','6','0','0','0','0','11','69967','1','0','22','6','0','0','0','0','0','0','Skybreaker Vicar - Cast Smite and Set Phase 1 on Aggro'),
('26021048','37021','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Vicar - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021049','37021','0','6','100','7','0','0','1500','3000','11','69967','1','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Cast Smite above 15% Mana (Phase 1)'),
('26021050','37021','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Vicar - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021051','37021','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Start Movement Beyond 30 Yards'),
('26021052','37021','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - On Evade set Phase to 0'),
('26021053','37021','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Stop Movement on Aggro'),
('26021054','37021','4','0','100','24','0','0','0','0','11','71146','1','0','22','6','0','0','0','0','0','0','Skybreaker Vicar - Cast Smite and Set Phase 1 on Aggro'),
('26021055','37021','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Skybreaker Vicar - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021056','37021','0','6','100','25','0','0','1500','3000','11','71146','1','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Cast Smite above 15% Mana (Phase 1)'),
('26021057','37021','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Skybreaker Vicar - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021058','37021','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - Start Movement Beyond 30 Yards'),
('26021059','37021','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Skybreaker Vicar - On Evade set Phase to 0'),
('26021060','37021','14','0','90','6','48000','40','0','0','11','69963','6','1','0','0','0','0','0','0','0','0','Skybreaker Vicar - Casts Greater Heal on Friendlies'),
('26021061','37021','14','0','90','24','48000','40','0','0','11','71131','6','1','0','0','0','0','0','0','0','0','Skybreaker Vicarr - Casts Greater Heal on Friendlies'),
('26021062','37021','0','0','100','31','8000','12000','24000','30000','11','69910','0','1','0','0','0','0','0','0','0','0','Skybreaker Vicar - Cast Pain Suppression'),
('26021063','37003','4','0','100','6','0','0','0','0','11','69927','1','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Avengers Shield on Aggro'),
('26021064','37003','4','0','100','24','0','0','0','0','11','71117','1','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Avengers Shield on Aggro'),
('26021065','37003','0','0','100','7','15000','15000','25000','35000','11','69930','0','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Consecration'),
('26021066','37003','0','0','100','25','15000','15000','25000','35000','11','71122','0','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Consecration'),
('26021067','37003','0','0','100','7','10000','10000','20000','21000','11','69934','0','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Holy Wrath'),
('26021068','37003','0','0','100','25','10000','10000','20000','21000','11','71134','0','0','0','0','0','0','0','0','0','0','Skybreaker Vindicator - Cast Holy Wrath'),
('26021069','37534','0','0','100','31','15000','15000','35000','35000','11','36922','0','0','0','0','0','0','0','0','0','0','Spinestalker - Cast Bellowing Roar'),
('26021070','37534','0','0','100','7','10000','10000','30000','30000','11','71369','0','0','0','0','0','0','0','0','0','0','Spinestalker - Cast Tail Sweep'),
('26021071','37534','0','0','80','25','10000','10000','30000','30000','11','71370','0','0','0','0','0','0','0','0','0','0','Spinestalker - Cast Tail Sweep'),
('26021072','37534','0','0','100','31','8000','12000','24000','32000','11','40505','1','0','0','0','0','0','0','0','0','0','Spinestalker - Cast Cleave'),
('26021073','37230','0','0','100','7','15500','15500','35500','35500','11','70362','4','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Blizzard'),
('26021074','37230','0','0','100','25','15500','15500','35500','35500','11','71118','4','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Blizzard'),
('26021075','37230','0','0','100','31','8000','10000','25000','30000','11','70361','1','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Cleave'),
('26021076','37230','0','0','80','7','8000','8000','15000','25000','11','70116','1','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Frost Breath'),
('26021077','37230','0','0','80','25','8000','8000','15000','25000','11','72641','1','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Frost Breath'),
('26021078','37544','0','0','100','31','8000','10000','18000','22000','11','70189','4','32','0','0','0','0','0','0','0','0','Spire Gargoyle - Cast Poison Spit'),
('26021079','37545','0','0','100','31','8000','9000','14000','19000','11','70396','1','0','0','0','0','0','0','0','0','0','Spire Minion - Cast Ghoul Slash'),
('26021080','37545','2','0','100','31','50','0','12300','14900','11','70363','0','0','0','0','0','0','0','0','0','0','Spire Minion - Casts Cannibalize at 50% HP'),
('26021081','36824','0','0','100','31','10000','10000','28000','34000','11','69397','4','0','0','0','0','0','0','0','0','0','Spirit Warden - Cast Soul Rip'),
('26021082','36824','2','0','100','31','25','0','10300','12900','11','69383','0','1','0','0','0','0','0','0','0','0','Spirit Warden - Cast Dark Hunger When Below 25% HP'),
('26021083','37025','11','0','100','30','0','0','0','0','11','71805','0','0','0','0','0','0','0','0','0','0','Stinky - Cast Plague Stench on spawn'),
('26021084','37025','0','0','100','31','10000','10000','24000','25000','11','71127','1','0','0','0','0','0','0','0','0','0','Stinky - Cast Mortal Wound'),
('26021085','37025','0','0','100','31','15000','15000','35000','35000','11','71123','0','0','0','0','0','0','0','0','0','0','Stinky - Cast Decimate'),
('26021086','37863','4','0','100','30','0','0','0','0','11','70588','1','0','0','0','0','0','0','0','0','0','Suppresser - Cast Suppression'),
('26021087','38194','0','0','80','31','5000','5000','13000','16000','11','66021','4','0','0','0','0','0','0','0','0','0','Torgo the Elder - Casts Icy Touch'),
('26021088','38194','0','0','100','31','10000','10000','18000','22000','11','66047','1','0','0','0','0','0','0','0','0','0','Torgo the Elder - Casts Frost Strike'),
('26021089','37011','0','0','100','31','15000','15000','34000','36000','11','70960','0','1','0','0','0','0','0','0','0','0','The Damned - Casts Bone Flurry'),
('26021090','37011','6','0','100','30','0','0','0','0','11','70961','0','3','0','0','0','0','0','0','0','0','The Damned - Cast Shattered Bones On Death'),
('26021091','37098','0','0','100','7','14000','17000','27000','37000','11','71906','4','0','0','0','0','0','0','0','0','0','Valkyr Herald - Casts Severed Essence'),
('26021092','37098','0','0','100','25','14000','17000','27000','37000','11','71942','4','0','0','0','0','0','0','0','0','0','Valkyr Herald - Casts Severed Essence'),
('26021093','37133','0','0','100','7','15000','15000','25000','25000','11','41056','0','0','0','0','0','0','0','0','0','0','Ymirjar Warlord - Casts Whirlwind'),
('26021094','37133','0','0','100','25','15000','15000','25000','25000','11','41057','0','0','0','0','0','0','0','0','0','0','Ymirjar Warlord - Casts Whirlwind'),
('26021095','37697','0','0','80','7','14000','15000','25000','30000','11','70492','0','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Ooze Eruption'),
('26021096','37697','0','0','80','9','14000','15000','25000','30000','11','72505','0','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Ooze Eruption'),
('26021097','37697','0','0','80','17','14000','15000','25000','30000','11','72624','0','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Ooze Eruption'),
('26021098','37697','0','0','100','7','12000','12000','22000','28000','11','70447','4','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Volatile Ooze Adhesive'),
('26021099','37697','0','0','100','9','12000','12000','22000','28000','11','72836','4','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Volatile Ooze Adhesive'),
('26021100','37697','0','0','100','17','12000','12000','22000','28000','11','72837','4','0','0','0','0','0','0','0','0','0','Volatile Ooze - Casts Volatile Ooze Adhesive'),
('26021101','37038','4','0','100','30','0','0','0','0','11','71164','0','0','0','0','0','0','0','0','0','0','Vengeful Fleshreaper - Cast Leaping Face Maul on Aggro'),
('26021102','37132','0','0','80','31','15000','15000','27000','32000','11','72624','0','1','0','0','0','0','0','0','0','0','Ymirjar Battle-Maiden - Casts Adrenaline Rush'),
('26021103','37132','0','0','70','31','10000','10000','17000','19000','11','71257','1','0','0','0','0','0','0','0','0','0','Ymirjar Battle-Maiden - Casts Barbaric Strike'),
('26021104','37901','0','0','100','31','12000','15000','22000','27000','11','70671','4','0','0','0','0','0','0','0','0','0','Vampiric Fiend - Casts Leeching Rot'),
('26021105','37901','11','0','100','30','0','0','0','0','11','41290','0','0','0','0','0','0','0','0','0','0','Vampiric Fiend - Cast Disease Cloud on spawn'),
('26021106','37127','2','0','100','30','40','0','0','0','11','71270','0','0','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Casts Arctic Chill at 40% HP'),
('26021107','37127','0','0','100','31','15000','15000','31000','32000','11','71274','0','0','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Casts Frozen Orb'),
('26021108','37127','0','0','100','31','18000','18000','28000','36000','11','69929','4','0','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Casts Spirit Stream'),
('26021109','37127','0','0','100','31','10000','10000','25000','25000','11','71306','4','1','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Casts Twisted Winds'),
('26021110','38125','0','0','100','31','18000','18000','28000','36000','11','69929','4','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Spirit Stream'),
('26021111','38125','0','0','100','31','11000','11000','16000','21500','11','71298','4','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Banish'),
('26021112','38125','0','0','80','7','20000','20000','45000','45500','11','71299','0','1','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Deaths Embrace'),
('26021113','38125','0','0','80','25','20000','20000','45000','45500','11','71300','0','1','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Deaths Embrace'),
('26021114','38125','0','0','100','31','8000','8000','50000','55000','11','71303','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Casts Summon Ymirjar'),
('26021115','38125','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Stop Movement on Aggro'),
('26021116','38125','4','0','100','6','0','0','0','0','11','71296','1','0','22','6','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('26021117','38125','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Ymirjar Deathbringer - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021118','38125','0','6','100','7','0','0','1500','3000','11','71296','1','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('26021119','38125','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Ymirjar Deathbringer- Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021120','38125','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Start Movement Beyond 30 Yards'),
('26021121','38125','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - On Evade set Phase to 0'),
('26021122','38125','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Stop Movement on Aggro'),
('26021123','38125','4','0','100','24','0','0','0','0','11','71297','1','0','22','6','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('26021124','38125','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Ymirjar Deathbringer - Start Movement and Set Phase 2 when Mana is at 15%'),
('26021125','38125','0','6','100','25','0','0','1500','3000','11','71297','1','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Shadow Bolt above 15% Mana (Phase 1)'),
('26021126','38125','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Ymirjar Deathbringer- Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('26021127','38125','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Start Movement Beyond 30 Yards'),
('26021128','38125','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - On Evade set Phase to 0'),
('26021129','37134','0','0','70','31','10000','10000','24000','28000','11','71252','4','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Casts Volley'),
('26021130','37134','0','0','90','31','15000','15000','30000','37000','11','71251','4','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Casts Rapid Shot'),
('26021131','37134','0','0','100','31','5000','5000','14000','17000','11','71249','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Casts Ice Trap'),
('26021132','37134','1','0','100','30','1000','1000','0','0','11','71705','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Casts Summon Warhawk OOC'),
('26021133','37134','0','0','100','30','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Stop Movement on Aggro'),
('26021134','37134','4','0','100','30','0','0','0','0','11','71253','1','0','22','1','0','0','0','0','0','0','Ymirjar Huntress - Cast Shoot and Set Phase 1 on Aggro'),
('26021135','37134','0','13','100','31','2200','4700','2200','4700','11','71253','1','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Cast Shoot (Phase 1)'),
('26021136','37134','9','13','100','31','20','100','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Start Movement at 20 Yards (Phase 1)'),
('26021137','37134','9','13','100','31','6','10','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Stop Movement at 10 Yards (Phase 1)'),
('26021138','37134','9','13','100','31','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Start Movement at 5 Yards (Phase 1)'),
('26021139','37134','2','0','100','30','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Set Phase 2 at 15% HP'),
('26021140','37134','2','11','100','30','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Ymirjar Huntress - Start Movement and Flee at 15% HP (Phase 2)'),
('26021141','37134','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - On Evade set Phase to 0');
