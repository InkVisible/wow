-- RECOMENDATION: USE THIS DATA AT YOUR OWN RISK
-- Hi, Misimouse from http://forum.siomproject.com/
-- This SQL is a hack way to fix a lot of quest, on my opinion is not a good way and lots of this fixes are not working right, I think this SQL need to be redone or remove from repo
-- Do not remove this text, this is a reference for future fixes
-- Any way I fix like 30 of this erros.

ALTER TABLE db_version CHANGE COLUMN required_295_world_forge_of_souls required_370_world_north_quest bit;

UPDATE creature SET phaseMask = 2 WHERE id = 25496;
UPDATE gameobject SET phasemask = 3 WHERE id IN (187684, 187685, 187686, 187687);
UPDATE creature SET phaseMask = 2 WHERE id = 25479;
UPDATE gameobject SET phasemask = 3 WHERE id = 187683;
-- A suitable test Subject
DELETE FROM conditions  WHERE SourceEntry = 45995;
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2)  VALUES (13, 0, 45995, 18, 1, 25381);
-- Soul of the Decursed
UPDATE quest_template SET ReqCreatureOrGOId1 = 25814, ReqSpellCast1 = 46485 WHERE entry = 11899;
-- chain di quest: Prison Break
DELETE FROM conditions  WHERE SourceEntry IN (45441, 45611, 45634);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2)  VALUES
(13, 0, 45441, 18, 2, 187561),
(13, 0, 45611, 18, 2, 25474),
(13, 0, 45634, 18, 2, 25478);
DELETE FROM `conditions` WHERE (`SourceGroup`=25584) AND (`SourceEntry`=34909);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2) VALUES (1, 25584, 34909, 0, 0, 0);
-- The Honored Dead
UPDATE quest_template SET ReqCreatureOrGOId1 = 25342, ReqSpellCast1 = 45474 WHERE entry = 11593;
-- Envoy Ripfang
UPDATE `creature_template` SET `unit_flags` = 131072 WHERE `entry` = 26441;
-- Rifle the Bodies
UPDATE `creature_template` SET `questItem2` = 35783 WHERE `entry` = 26455;
DELETE FROM `conditions` WHERE (`SourceGroup`=26455) AND (`SourceEntry`=35783);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2) VALUES (1, 26455, 35783, 0, 0, 0);
-- Strenghten of the Ancients
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 26421;
-- Lumber Hack
UPDATE `gameobject_template` SET `type` = 22, `data0` = 47939, `data1` = 1, `data4` = 0 WHERE `entry` = 188539;
-- Slim Pickings
DELETE FROM `conditions` WHERE (`SourceGroup`=26291) AND (`SourceEntry`=36765);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2) VALUES (1, 26291, 36765, 0, 0, 0);

UPDATE `creature_template` SET `questItem1` = 36765 WHERE `entry` = 26291;
-- Doing your Duty
UPDATE `gameobject_template` SET `type` = 22, `data0` = 48330, `data1` = 1, `data3` = 0 WHERE `entry` = 188666;
-- Wanted: Rageman's Flipper
DELETE FROM `creature` WHERE `id`=29664;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(NULL, 29664, 571, 1, 1, 0, 0, 4869.93, -2522.63, 206.977, 5.02451, 300, 0, 0, 106350, 0, 0, 0);
-- Put On Yer Kneepads...
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 30250 WHERE `entry` = 12904;
-- The Iron Thane and His Anvil
DELETE FROM `creature` WHERE `id`=26405;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(NULL, 26405, 571, 1, 1, 0, 1419, 3290.45, -5106.34, 304.754, 5.41623, 25, 0, 0, 12762, 0, 0, 0);
-- Trust is Earned ReqsourceCount4 need to be set to 0
UPDATE `quest_template` SET `SpecialFlags` = 0, `ReqSourceId4` = 0, `ReqSourceCount4` = 0, `ReqCreatureOrGOId1` = 24783, `ReqCreatureOrGOCount1` = 1, `Method` = 1 WHERE `entry` = 11460;
DELETE FROM `creature` WHERE `id`=24783;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(NULL, 24783, 571, 1, 1, 0, 0, 471.524, -5922.09, 308.72, 5.71113, 300, 0, 0, 1, 0, 0, 0);
-- Draekkari Shaman
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 26447;
-- Captured Champion
UPDATE `creature_template` SET `unit_flags` = 131072 WHERE `entry` = 28396;
-- Saragosa's End
DELETE FROM `creature` WHERE `id`=26231;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(NULL, 26231, 571, 1, 1, 0, 0, 3994.79, 7299.07, 256.525, 4.20399, 25, 0, 0, 9642, 3319, 0, 0);
-- spawn Storm
DELETE FROM `creature` WHERE `id`=26045;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('26045','571','1','1','0','0','3404.36','4132.39','18.0545','2.53816','300','0','0','9291','0','0','0');
-- spawn Rokhan
DELETE FROM `creature` WHERE `id`=26859;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('26859','571','1','1','0','0','4338.81','979.87','91.7794','5.39392','300','0','0','91600','0','0','0');
DELETE FROM `gameobject` WHERE `id`=190354;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES('190354','571','1','1','4405.59','558.674','116.982','2.71885','0','0','0.977744','0.2098','300','0','1');
-- The heart of the storm
DELETE FROM `gameobject` WHERE `id`=192181;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES('192181','571','1','1','7308.77','-737.125','791.611','1.51904','0','0','0.688574','0.725166','300','0','1');
-- spawn Iron Colossus
DELETE FROM `creature` WHERE `id`=30300;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('30300','571','1','1','0','0','8199.14','-100.122','848.307','3.12753','300','0','0','315000','0','0','0');
UPDATE `creature_template` SET `unit_flags` = 0  WHERE `entry` = 26425;
UPDATE `creature_template` SET `unit_flags` = 0  WHERE `entry` = 26447;
-- Congratulation dipendente da Troll Patrols
UPDATE quest_template SET PrevQuestId = 12587 WHERE entry = 12604;
-- Avool's Sword of Jin

DELETE FROM `conditions` WHERE (`SourceEntry`=44311);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2) VALUES
(1, 30988, 44311, 0, 0, 0),
(1, 31262, 44311, 0, 0, 0),
(1, 29376, 44311, 0, 0, 0),
(1, 34728, 44311, 0, 0, 0);

-- Quest Vargul:
UPDATE creature_template SET KillCredit1 = 29882 WHERE NAME LIKE "Vargul %" AND maxlevel < 76;
-- Quest Gymer:
DELETE FROM conditions  WHERE SourceEntry = 55525;
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2)  VALUES (13, 0, 55525, 18, 1, 29928);
-- ReqCreatureOrGOCount1 = 1 use method instead bad hacks
UPDATE quest_template SET ReqSpellCast1 = 55525, ReqCreatureOrGOCount1 = 1 WHERE entry = 12916;
-- Same here, for avoid errors on start is beter to set Method to 0 if oy want to set in autocomplete
UPDATE quest_template SET Method= 0 WHERE entry = 12916;
-- Troll Patrol:
UPDATE creature_template SET npcflag = npcflag | 1 WHERE entry = 28042;
-- Pickpocket:
UPDATE creature_template SET pickpocketloot = 30003 WHERE entry IN (28078, 25428, 26492, 28108, 26792, 26357, 26728, 26344, 26447, 26727, 31396, 26704, 28242, 25429, 29554, 29404, 26343, 29623, 30597, 24540, 26554, 26202, 27278);
UPDATE pickpocketing_loot_template SET ChanceOrQuestChance = 30 WHERE entry = 30003 AND item = 43575;
UPDATE pickpocketing_loot_template SET ChanceOrQuestChance = 10 WHERE entry = 30003 AND item = 33447;
-- This is de best stupid pacth never i seen, how you update lost of npcs with a unique pickpocket id? that is silly and stupid, but ok, RoCore accepted and I will do the patch for console errors
DELETE FROM `pickpocketing_loot_template` WHERE `entry` IN (24540,25428,25429,26202,26343,26344,26357,26447,26492,26704,27278,28078,28108,28242,29404,29554,29623,31396);
-- Quest Storm Peaks:
UPDATE creature_template SET faction_A = 14, faction_H = 14 WHERE entry = 29466;
UPDATE quest_template SET ReqCreatureOrGOid1 = 30146 WHERE entry = 12906;
-- My god, use please a good hack way at least
UPDATE quest_template SET ReqCreatureOrGOCount1 = 1 WHERE entry = 12970;
UPDATE quest_template SET Method= 0 WHERE entry = 12970;
UPDATE quest_template SET ReqCreatureOrGOCount1 = 7, ReqCreatureOrGOCount2 = 15 WHERE entry = 12851;
-- When you want to do a quest autocompletable only need to set to 0 Method yo don't need to remove requirements
UPDATE quest_template SET Method= 0 WHERE entry = 12851;
-- If you ReqCreatureOrGOCount2 = 0 also you need to remove the creature I saw all this fixes is a hack way, but at least do it rigth
UPDATE quest_template SET ReqCreatureOrGOid1 = 29639, ReqCreatureOrGOCount2 = 0, `ReqCreatureOrGOId2` = 0 WHERE entry = 12856;
UPDATE creature_template SET faction_H = 14, faction_A = 14 WHERE entry = 30174;
-- I really hate when people can read about how a emulator works
UPDATE quest_template SET ReqCreatureOrGOCount1 = 1 WHERE entry = 13064;
UPDATE quest_template SET Method= 0 WHERE entry = 13064;
UPDATE creature_template SET faction_H = 14, faction_A = 14 WHERE entry = 29503;
UPDATE quest_template SET ReqCreatureOrGOid1 = 29984, ReqCreatureOrGOid2 = 29978 WHERE entry = 13005;
-- Very bad hacks, pelase learn at leas a bit about structures
UPDATE quest_template SET SpecialFlags = 0, ReqSourceId2 = 0, `ReqSourceCount2` = 0 WHERE entry = 13047;
DELETE FROM conditions  WHERE SourceEntry = 58151;
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2)  VALUES (13, 0, 58151, 18, 1, 30894);
-- Planning for the future
UPDATE creature_template SET IconName='Pickup' WHERE entry=26200;
DELETE FROM npc_spellclick_spells WHERE npc_entry=26200;
INSERT INTO npc_spellclick_spells VALUES (26200, 46773, 11960, 1, 11960, 3, 0, 0, 0),(26200, 46167, 11960, 1, 11960, 1, 0, 0, 0);
-- Some Make Lemonade, Some Make Liquor
DELETE FROM `conditions` WHERE (`SourceGroup`=190622);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2) VALUES
(4, 190622, 38656, 0, 0, 0),
(4, 190622, 38653, 0, 0, 0),
(4, 190622, 38655, 0, 0, 0);

UPDATE gameobject_template SET type = 3 WHERE entry = 190622;
UPDATE gameobject_template SET data0 = 1690, data10 = 0, data5 = 0 WHERE entry = 190622;
UPDATE quest_template SET Method = 0 WHERE entry = 12644;
UPDATE quest_template SET ReqItemId1 = 0, ReqItemCount1 = 0 WHERE entry = 12644;
DELETE FROM conditions  WHERE SourceEntry = 51962;
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2)  VALUES
 (13, 0, 51962, 18, 1, 27986),
 (13, 0, 51962, 18, 1, 28047),
 (13, 0, 51962, 18, 1, 28568);
DELETE FROM `creature_questrelation` WHERE `quest` = 13571;
DELETE FROM `gameobject_questrelation` WHERE `quest` = 13571;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 13571;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (32516, 13571);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 32516;
DELETE FROM `creature_involvedrelation` WHERE `quest` = 13571;
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 13571;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (32516, 13571);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=32516;
-- Proof of Demise: The Prophet Tharon'ja
DELETE FROM `conditions` WHERE (`SourceGroup`=31360) AND (`SourceEntry`=43670);
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2) VALUES (1, 31360, 43670, 0, 0, 0);
-- Prisoners of Wyrmskull
UPDATE `item_template` SET `spellid_1` = 43094 WHERE `entry` = 33308;
-- Scare the Guano Out of Them!

DELETE FROM `conditions` WHERE (`SourceGroup`=23959) AND `SourceEntry`=33084;
INSERT INTO conditions (SourceTypeOrReferenceId,SourceGroup,SourceEntry,ConditionTypeOrReference,ConditionValue1,ConditionValue2) VALUES
(1, 23959, 33084, 0, 0, 0);

-- The Lost Shield of the Aesirites
DELETE FROM `creature` WHERE `id`=24910;
INSERT INTO `creature` 
(`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`)VALUES
(24910, 571, 1, 1, 0, 0, 119.3, -3698.84, 0.7830, 6.091574, 300, 0, 0, 0, 0, 0, 0);
-- Seeds of the Blacksouled Keepers
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 23876, `ReqCreatureOrGOCount1` = 8 WHERE `entry` = 11319;
-- the Gearmaster
UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 21 WHERE `entry` = 25834;
DELETE FROM `creature` WHERE `id`=25834;
INSERT INTO `creature` 
(`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(25834, 571, 1, 1, 0, 0, 3999.4, 4854.34, 25.970, 5.61456, 120, 0, 0, 0, 0, 0, 0);
UPDATE `quest_template` SET `ReqItemId1` = 35486, `ReqItemId2` = 0, `ReqItemCount1` = 1, `ReqItemCount2` = 0, `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOCount1` = 0 WHERE `entry` = 11798;
UPDATE `quest_template` SET `ReqItemId1` = 35486, `ReqItemId2` = 0, `ReqItemCount1` = 1, `ReqItemCount2` = 0, `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOCount1` = 0 WHERE `entry` = 11909;
-- Re-cursive
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 25814, `ReqCreatureOrGOCount1` = 6 WHERE `entry` = 11712;
-- Master and Servant
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 25752,`ReqCreatureOrGOCount1` = 15 WHERE `entry` = 11730;
-- Trust is Earned
-- Better way, my god, you did 3 fixes just for nothing
DELETE FROM `quest_template` WHERE `entry`='11460';
INSERT INTO `quest_template` (`entry`, `Method`, `ZoneOrSort`, `SkillOrClassMask`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredRaces`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RepObjectiveFaction2`, `RepObjectiveValue2`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `CharTitleId`, `PlayersSlain`, `BonusTalents`, `RewardArenaPoints`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `RewXPId`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `CompletedText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemId5`, `ReqItemId6`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqItemCount5`, `ReqItemCount6`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValueId1`, `RewRepValueId2`, `RewRepValueId3`, `RewRepValueId4`, `RewRepValueId5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewHonorAddition`, `RewHonorMultiplier`, `unk0`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`, `WDBVerified`) VALUES
('11460','2','495','0','68','0','71','0','1101','0','0','0','0','0','0','0','0','0','0','0','138','2','0','0','0','0','0','11465','0','11465','5','0','0','0','Trust is Earned','The first and most important factor in falconry is the bond between the falconer and $g his:her; bird. Trust must be earned by the master!$B$B<Hidalgo points to the falcons in the cage at his feet.>$B$BIf you are to earn their trust you will first need to fill their bellies.$B$BThe fjord rock falcon, as these birds are known, primarily eat grubs. Throughout the fjord you will find loose rocks that serve as breeding grounds for these grubs. Find a grub and return here to feed the falcons in the cage.','Hidalgo at the Explorers\' League Outpost in the Howling Fjord wants you to find a Fjord Grub and feed it to one of the falcons in the cage by his feet.','Yes, $n. I can see the bond of companionship forming. She has accepted you as master.','This is an important exercise, $n. If you are to become a falconer you must learn how to feed your bird.','Fjord Rock Falcon Fed','Return to Hidalgo the Master Falconer at the Explorers\' League Outpost in Howling Fjord.','','','','','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','34102','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1050','0','0','0','0','5','0','0','0','0','0','0','0','0','0','0','0','0','0','24000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','11723');
UPDATE quest_template SET Method= 0 WHERE entry = 11460;
-- The Cleansing Of Jintha'kalar
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 28270, `ReqCreatureOrGOCount1` = 15 WHERE `entry` = 12545;
-- Darkness Calling
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 12633;
-- Spiritual Insight
UPDATE `quest_template` SET `SpecialFlags` = 0 WHERE `entry` = 12028;
-- No Place to Run
UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 21 WHERE `entry` = 28820;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 27430 WHERE `entry` = 12261;
UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 21 WHERE `entry` = 27430;
-- Breaking Off A Piece
UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 0, `pickpocketloot` = 27805, `spell1` = 51340, `spell2` = 20298 WHERE `entry` = 27805;
UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 0, `pickpocketloot` = 27826, `spell1` = 20298, `spell2` = 51337 WHERE `entry` = 27826;
-- The Cleansing Of Jintha'kalar
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 26946 WHERE `entry` = 12545;
-- Freya's Pact
UPDATE `quest_template` SET `SpecialFlags` = 0 WHERE `entry` = 12621;
-- Captains Adams
DELETE FROM `creature` WHERE `id`=23749;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(NULL, 23749, 571, 1, 1, 0, 256, 1347.15, -3140.23, 172.159, 3.69501, 300, 0, 0, 9610, 0, 0, 0);
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 14 WHERE `entry` = 23749;
-- Father Levariol
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 14 WHERE `entry` = 24038;
DELETE FROM `creature` WHERE `id`=24038;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(NULL, 24038, 571, 1, 1, 0, 14, 1338.22, -3161.22, 170.93, 1.21237, 300, 0, 0, 7432, 0, 0, 0);
-- Mage-Lieutenant Malistr
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 14 WHERE `entry` = 23888;
DELETE FROM `creature` WHERE `id`=23888;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(NULL, 23888, 571, 1, 1, 0, 273, 1358.74, -3148.41, 170.933, 2.78002, 300, 0, 0, 7432, 0, 0, 0);
-- Truce?
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOCount1` = 0 WHERE `entry` = 11989;
-- Seared Scourge
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 26570 WHERE `entry` = 12038;
-- Kick 'Em While They're Down
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 27456 WHERE `entry` = 12289;
-- Shredder Repair
UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 21, `spell1` = 48558, `spell2` = 48604, `spell3` = 48548, `questItem1` = 37500 WHERE `entry` = 27354;
UPDATE `quest_template` SET `ReqItemId1` = 37500, `ReqItemCount1` = 3, `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOCount1` = 0 WHERE `entry` = 12244;
-- Life or Death
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 27482 WHERE `entry` = 12296;
-- Mystery of the Infinite, Redux
UPDATE `quest_template` SET `SpecialFlags` = 0 WHERE `entry` = 13343;
-- No place to run
UPDATE `creature_template` SET `npcflag` = 5 WHERE `entry` = 27430;
-- The Echo of Ymiron
UPDATE `quest_template` SET `Method` = 0 WHERE `entry` = 11343;
-- Flight of the Wintergarde Defender
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 27370 WHERE `entry` = 12237;
-- Mutiny on the Mercy
DELETE FROM `creature` WHERE `id`=25026;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(NULL, 25026, 571, 1, 1, 0, 740, 46.8108, -3558.65, 2.42189, 3.99313, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 39.5281, -3551.25, 5.11112, 1.128, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 47.0112, -3586.82, 1.68766, 3.15119, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 53.8785, -3575.56, 0.697963, 5.53723, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 44.8365, -3574.5, 1.12571, 5.205, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 31.6932, -3571.84, 4.09672, 0.785569, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 26.035, -3578.56, 4.17629, 1.02119, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 22.547, -3585.87, 2.45468, 1.9456, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 27.3697, -3591.84, 1.57441, 3.78579, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 38.6976, -3589.4, 2.13266, 5.11233, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 54.2873, -3597.72, 1.51092, 2.06106, 120, 0, 0, 7984, 0, 0, 0),
(NULL, 25026, 571, 1, 1, 0, 740, 96.838, -3688.85, 0.864487, 1.05496, 120, 0, 0, 7984, 0, 0, 0);
-- A return to Resting
UPDATE `quest_template` SET `ReqSpellCast1` = 0, `ReqSpellCast2` = 0, `ReqSpellCast3` = 0, `ReqSpellCast4` = 0 WHERE `entry` = 11568;
-- Raining Down Destruction
-- Miss to update one requirement
UPDATE `quest_template` SET `ReqSourceId4` = 0, `ReqSourceCount4` = 0, `ReqCreatureOrGOId1` = 26268 WHERE `entry` = 11982;
-- Mounting Up
-- redone this line
UPDATE `quest_template` SET `SrcItemId` = 0, `SrcItemCount` = 0, `ReqSourceId3` = 0, `ReqSourceCount3` = 0, `ReqSourceId4` = 0, `ReqSourceCount4` = 0, `ReqCreatureOrGOId1` = 26472 WHERE `entry` = 12414;
-- Cultivating an Image
UPDATE `quest_template` SET `SrcItemId` = 0, `SrcItemCount` = 0, `ReqItemId2` = 0, `ReqItemCount2` = 0, `ReqCreatureOrGOId1` = 26408 WHERE `entry` = 12184;
-- I put this in the end, cos this sql is a crap
-- Is better to use Method than hacks, specially if this hack can show errors on start
DELETE FROM `quest_template` WHERE `entry`='13047';
insert into `quest_template` (`entry`, `Method`, `ZoneOrSort`, `SkillOrClassMask`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredRaces`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RepObjectiveFaction2`, `RepObjectiveValue2`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `CharTitleId`, `PlayersSlain`, `BonusTalents`, `RewardArenaPoints`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `RewXPId`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `CompletedText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemId5`, `ReqItemId6`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqItemCount5`, `ReqItemCount6`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValueId1`, `RewRepValueId2`, `RewRepValueId3`, `RewRepValueId4`, `RewRepValueId5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewHonorAddition`, `RewHonorMultiplier`, `unk0`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`, `WDBVerified`) values
('13047','2','67','0','77','0','80','0','0','0','0','0','0','0','0','0','0','0','0','0','138','2','0','0','0','0','13035','13108','0','13108','7','0','0','0','The Reckoning','Loken killed my wife, turned my followers and me against each other.  He took away everything I had, but today... that changes.$B$BToday we reclaim our sacred grounds.  Today... Loken dies.$B$BMeet me on the bridge near the Temple of Wisdom, just southwest of Ulduar.  I will finish this one way or the other.$B$BI need you there as a witness.  You will not aid me -- this is personal.$B$BAfter it\'s done, send word to Jokkum, King of the Frost Giants.  He\'s a good friend and will know what to do.','Meet Thorim near the Temple of Wisdom.  Report the outcome of the fight to King Jokkum in Dun Niffelem.','No... it cannot be...$b$bNo one can defeat Thorim in single combat. Not a giant, nor a beast... no one! Especially not that coward of a brother of his.$b$bOn my forefather\'s names, this I swear...$b$bLoken will pay for this!','Ach, $N! It\'s good to see you, little one.','Witness the Reckoning','Return to King Jokkum at Dun Niffelem in The Storm Peaks.','','','','','0','0','0','0','0','0','0','0','0','0','0','0','0','42840','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','43210','43211','43212','43213','0','0','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','222000','198600','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','11723');
UPDATE quest_template SET Method= 0 WHERE entry = 13047;

-- I really dont know why this SQL delete this NPCs, at least if you delete some guid be sure that need to be erased
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('88395','30300','571','1','8','0','0','7927.19','-154.457','868.181','0.298384','360','0','0','315000','0','0','2'),
('96620','23749','571','1','1','0','0','1341.01','-3139.52','172.174','3.53166','600','0','0','9610','0','0','2'),
('98440','32491','571','1','1','0','0','7093.84','-226.29','796.63','4.74999','600','0','0','18900','0','0','2');