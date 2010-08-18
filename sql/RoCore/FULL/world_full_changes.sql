--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
CREATE TABLE `db_version` (
  `required_31_world_db_version` bit(1) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Used DB version notes';

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES
(NULL);
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

-- Patch acherus
DELETE FROM `creature_template` WHERE `entry` = 438700;
INSERT INTO `creature_template` VALUES (438700, 0, 0, 0, 0, 0, 18, 0, 18, 0, 'Acherus_porter', NULL, NULL, 0, 80, 80, 0, 35, 35, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `faction_A`=2082 WHERE `entry`=438700;
UPDATE `creature_template` SET `faction_H`=2082 WHERE `entry`=438700;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=438700;
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=438700;
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=438700;
DELETE FROM `creature` WHERE `id`=438700;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(438700, 0, 1, 256, 0, 0, 2390.19, -5641.09, 378.069, 0.760892, 300, 0, 0, 5342, 0, 0, 0),
(438700, 609, 1, 1, 0, 0, 2386.42, -5643.42, 420.97, 0.629104, 300, 0, 0, 5342, 0, 0, 0),
(438700, 609, 1, 1, 0, 0, 2392.36, -5639.5, 377.518, 0.616926, 300, 0, 0, 5342, 0, 0, 0),
(438700, 0, 1, 65535, 0, 0, 2386.39, -5643.9, 421.156, 3.57475, 25, 0, 0, 12, 12, 0, 0);

-- Argent Tournament
UPDATE gameobject SET state = 0 WHERE id = 194618;
DELETE FROM `gameobject_loot_template` WHERE entry = 194618;
INSERT INTO `gameobject_loot_template` VALUES(
194618, 46070, 100, 1, 0, 1, 1);
UPDATE quest_template SET QuestFlags = 0 WHERE entry = 13678;
UPDATE quest_template SET NextQuestId = 0 WHERE NextQuestId = 13678;
UPDATE quest_template SET ReqCreatureOrGOId1 = 24108 WHERE entry = 13679;
UPDATE quest_template SET NextQuestId = 0 WHERE NextQuestId = 13672;
UPDATE creature_template SET mindmg = 500, maxdmg = 800 WHERE entry = 33448;
UPDATE creature_template SET ScriptName = 'npc_squire_danny' WHERE entry = 33518;
UPDATE creature_template SET mindmg = 650, maxdmg = 1000, ScriptName = 'npc_argent_champion' WHERE entry = 33707;
UPDATE quest_template SET PrevQuestId = 13680 WHERE PrevQuestId = 13687;
UPDATE quest_template SET PrevQuestId = 13679 WHERE PrevQuestId = 13686;
UPDATE quest_template SET ReqSourceId2 = 0, ReqSourceCount2 = 0 WHERE ReqSourceId2 = 45000;
UPDATE item_template SET maxcount = 1 WHERE entry = 45005;
UPDATE creature_template SET  ScriptName = 'npc_argent_valiant' WHERE entry = 33448;

-- script boreal tundra
-- Fizzcrank Fullthrottle
UPDATE creature_template SET  ScriptName = 'npc_fizzcrank_fullthrottle' WHERE entry = 25590;
-- Surristrasz
UPDATE creature_template SET  ScriptName = 'npc_surristrasz' WHERE entry =24795;
-- Librarian Tiare
UPDATE creature_template SET  ScriptName = 'npc_tiare' WHERE entry =30051;

UPDATE instance_template SET script = 'instance_eye_of_eternity' WHERE map = 616;
UPDATE creature_template SET VehicleId=264 WHERE entry = 30248;
UPDATE `gameobject_template` SET `ScriptName` = 'go_malygos_iris' WHERE `entry` IN (193960,193958); 

UPDATE creature_template SET ScriptName = 'boss_malygos', unit_flags = unit_flags & ~256 WHERE entry = 28859;
UPDATE creature_template SET ScriptName = 'mob_nexus_lord' WHERE entry = 30245; -- Nexus Lord
UPDATE creature_template SET ScriptName = 'mob_scion_of_eternity' WHERE entry = 30249; -- Scion of Eternity
UPDATE creature_template SET ScriptName = 'mob_power_spark' WHERE entry = 30084;  -- Power Spark
UPDATE creature_template SET ScriptName = 'npc_arcane_overload' WHERE entry = 30282; -- Arcane Overload

UPDATE creature_template SET unit_flags = 1 WHERE entry = 28859;

UPDATE creature_template SET mindmg = 3684, maxdmg = 4329, dmg_multiplier = 7.5, mechanic_immune_mask = 1072918979 WHERE entry = 30245; -- Nexus Lord
UPDATE creature_template SET mindmg = 3684, maxdmg = 4329, dmg_multiplier = 13,  mechanic_immune_mask = 1072918979 WHERE entry = 31750; -- Nexus Lord (1)
UPDATE creature_template SET mechanic_immune_mask = 1072918979 WHERE entry IN (30249, 31751);

DELETE FROM creature WHERE id = 33224;
INSERT INTO creature (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33224, 571, 1, 1, 0, 0, 3730.57, -4302.91, 182.097, 2.35789, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 1, 1, 0, 0, 3726.49, -4312.76, 179.671, 1.68559, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 1, 1, 0, 0, 3714.32, -4311.07, 181.014, 0.81772, 300, 0, 0, 40, 120, 0, 0),  
(33224, 571, 1, 1, 0, 0, 3715.14, -4305.41, 182.313, 1.36436, 300, 0, 0, 40, 120, 0, 0),
(33224, 571, 1, 1, 0, 0, 3723.58, -4306.54, 182.245, 1.89215, 300, 0, 0, 40, 120, 0, 0);  

UPDATE `gameobject_template` SET `data10` = 26572 WHERE `entry`=180912;
UPDATE `gameobject_template` SET `data10` = 26566 WHERE `entry`=180911;

/*
-- achievement realm first magic seeker non-existing criteria Entry: 1400
DELETE FROM achievement_criteria_data WHERE criteria_id = 1400;
INSERT INTO achievement_criteria_data VALUES
(1400, 1, 28859, 0);
*/

UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 30090;
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35, VehicleId = 165 WHERE entry IN (30234, 30248);
UPDATE creature_template SET flags_extra = flags_extra | 2, faction_A = 35, faction_H = 35 WHERE entry = 30118;
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 30282;
UPDATE creature_template SET mindmg = 1, maxdmg = 1, dmg_multiplier = 1 WHERE entry = 30592;
UPDATE creature_template SET modelid1 = 11686, modelid2 = 11686 WHERE entry = 22517;
-- Wyrmest Drake Spell & mount
UPDATE creature_template SET spell1 = 56091, spell2 = 56092, spell3 = 57090, spell4 = 57143, spell5 = 57108, spell6 = 57403, VehicleId = 165 WHERE entry IN (30161, 31752);
-- add de malygos & gameobject
UPDATE gameobject_template SET flags = 4, data0 = 43 WHERE entry in (193967, 193905);

-- Aggro Malygos
UPDATE creature_model_info SET combat_reach = '30' WHERE modelid = 26752;

-- drakes_disks
UPDATE creature_template SET InhabitType = 4, VehicleId = 223 WHERE entry IN (30234, 30248);
UPDATE creature_template SET spell6 = 57092, spell7 = 57403 WHERE entry IN (30161, 31752);

-- script_texts
DELETE FROM script_texts WHERE entry BETWEEN -1616034 AND -1616000;
INSERT INTO script_texts (npc_entry, entry, content_default, sound, type, language, emote, comment) VALUES
(28859, -1616000, 'Lesser beings, intruding here! A shame that your excess courage does not compensate for your stupidity!', 14512, 1, 0, 0, 'Malygos INTRO 1'),
(28859, -1616001, 'None but the blue dragonflight are welcome here! Perhaps this is the work of Alexstrasza? Well then, she has sent you to your deaths.', 14513, 1, 0, 0, 'Malygos INTRO 2'),
(28859, -1616002, 'What could you hope to accomplish, to storm brazenly into my domain? To employ MAGIC? Against ME?', 14514, 1, 0, 0, 'Malygos INTRO 3'),
(28859, -1616003, 'I am without limits here... the rules of your cherished reality do not apply... In this realm, I am in control...', 14515, 1, 0, 0, 'Malygos INTRO 4'),
(28859, -1616004, 'I give you one chance. Pledge fealty to me, and perhaps I won\'t slaughter you for your insolence!', 14516, 1, 0, 0, 'Malygos INTRO 5'),
(28859, -1616005, 'My patience has reached its limit, I WILL BE RID OF YOU!', 14517, 1, 0, 0, 'Malygos AGGRO 1'),
(28859, -1616006, 'Watch helplessly as your hopes are swept away...', 14525, 1, 0, 0, 'Malygos VORTEX'),
(28859, -1616007, 'I AM UNSTOPPABLE!', 14533, 1, 0, 0, 'Malygos SPARK BUFF'),
(28859, -1616008, 'Your stupidity has finally caught up to you!', 14519, 1, 0, 0, 'Malygos SLAY 1-1'),
(28859, -1616009, 'More artifacts to confiscate...', 14520, 1, 0, 0, 'Malygos SLAY 1-2'),
(28859, -1616010, 'How very... naive...', 14521, 1, 0, 0, 'Malygos SLAY 1-3'),
(28859, -1616012, 'I had hoped to end your lives quickly, but you have proven more...resilient then I had anticipated. Nonetheless, your efforts are in vain, it is you reckless, careless mortals who are to blame for this war! I do what I must...And if it means your...extinction...THEN SO BE IT!', 14522, 1, 0, 0, 'Malygos PHASEEND 1'),
(28859, -1616013, 'Few have experienced the pain I will now inflict upon you!', 14523, 1, 0, 0, 'Malygos AGGRO 2'),
(28859, -1616014, 'YOU WILL NOT SUCCEED WHILE I DRAW BREATH!', 14518, 1, 0, 0, 'Malygos DEEP BREATH'),
(28859, -1616016, 'I will teach you IGNORANT children just how little you know of magic...', 14524, 1, 0, 0, 'Malygos ARCANE OVERLOAD'),
(28859, -1616020, 'Your energy will be put to good use!', 14526, 1, 0, 0, 'Malygos SLAY 2-1'),
(28859, -1616021, 'I AM THE SPELL-WEAVER! My power is INFINITE!', 14527, 1, 0, 0, 'Malygos SLAY 2-2'),
(28859, -1616022, 'Your spirit will linger here forever!', 14528, 1, 0, 0, 'Malygos SLAY 2-3'),
(28859, -1616017, 'ENOUGH! If you intend to reclaim Azeroth\'s magic, then you shall have it...', 14529, 1, 0, 0, 'Malygos PHASEEND 2'),
(28859, -1616018, 'Now your benefactors make their appearance...But they are too late. The powers contained here are sufficient to destroy the world ten times over! What do you think they will do to you?', 14530, 1, 0, 0, 'Malygos PHASE 3 INTRO'),
(28859, -1616019, 'SUBMIT!', 14531, 1, 0, 0, 'Malygos AGGRO 3'),
(28859, -1616026, 'The powers at work here exceed anything you could possibly imagine!', 14532, 1, 0, 0, 'Malygos STATIC FIELD'),
(28859, -1616023, 'Alexstrasza! Another of your brood falls!', 14534, 1, 0, 0, 'Malygos SLAY 3-1'),
(28859, -1616024, 'Little more then gnats!', 14535, 1, 0, 0, 'Malygos SLAY 3-2'),
(28859, -1616025, 'Your red allies will share your fate...', 14536, 1, 0, 0, 'Malygos SLAY 3-3'),
(28859, -1616027, 'Still standing? Not for long...', 14537, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616028, 'Your cause is lost!', 14538, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616029, 'Your fragile mind will be shattered!', 14539, 1, 0, 0, 'Malygos SPELL 1'),
(28859, -1616030, 'UNTHINKABLE! The mortals will destroy... e-everything... my sister... what have you-', 14540, 1, 0, 0, 'Malygos DEATH'),
(32295, -1616031, 'I did what I had to, brother. You gave me no alternative.', 14406, 1, 0, 0, 'Alexstrasza OUTRO 1'),
(32295, -1616032, 'And so ends the Nexus War.', 14407, 1, 0, 0, 'Alexstrasza OUTRO 2'),
(32295, -1616033, 'This resolution pains me deeply, but the destruction, the monumental loss of life had to end. Regardless of Malygos\' recent transgressions, I will mourn his loss. He was once a guardian, a protector. This day, one of the world\'s mightiest has fallen.', 14408, 1, 0, 0, 'Alexstrasza OUTRO 3'),
(32295, -1616034, 'The red dragonflight will take on the burden of mending the devastation wrought on Azeroth. Return home to your people and rest. Tomorrow will bring you new challenges, and you must be ready to face them. Life...goes on.', 14409, 1, 0, 0, 'Alexstrasza OUTRO 4');


-- some naxx loot and script_ai

DELETE FROM `creature_loot_template` WHERE (`entry`=16017);
INSERT INTO `creature_loot_template` VALUES 
(16017, 33470, 33, 1, 0, 2, 7),
(16017, 43852, 17, 1, 0, 1, 1),
(16017, 35947, 7, 1, 0, 1, 1),
(16017, 33445, 4, 1, 0, 1, 1),
(16017, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29347);
INSERT INTO `creature_loot_template` VALUES 
(29347, 33470, 33, 1, 0, 2, 7),
(29347, 43852, 17, 1, 0, 1, 1),
(29347, 35947, 7, 1, 0, 1, 1),
(29347, 33445, 4, 1, 0, 1, 1),
(29347, 40412, 1.5, 1, 1, 1, 1),
(29347, 40409, 1.5, 1, 1, 1, 1),
(29347, 40408, 1.5, 1, 1, 1, 1),
(29347, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16018);
INSERT INTO `creature_loot_template` VALUES 
(16018, 33470, 33, 1, 0, 2, 7),
(16018, 43852, 17, 1, 0, 1, 1),
(16018, 35947, 7, 1, 0, 1, 1),
(16018, 33445, 4, 1, 0, 1, 1),
(16018, 33447, 2, 1, 0, 1, 1),
(16018, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29353);
INSERT INTO `creature_loot_template` VALUES 
(29353, 33470, 33, 1, 0, 2, 7),
(29353, 43852, 17, 1, 0, 1, 1),
(29353, 35947, 7, 1, 0, 1, 1),
(29353, 33445, 4, 1, 0, 1, 1),
(29353, 40412, 1.5, 1, 1, 1, 1),
(29353, 40409, 1.5, 1, 1, 1, 1),
(29353, 40414, 1.5, 1, 1, 1, 1),
(29353, 40410, 1.5, 1, 1, 1, 1),
(29353, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16029);
INSERT INTO `creature_loot_template` VALUES 
(16029, 33470, 33, 1, 0, 2, 7),
(16029, 43852, 17, 1, 0, 1, 1),
(16029, 35947, 7, 1, 0, 1, 1),
(16029, 33445, 4, 1, 0, 1, 1),
(16029, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29356);
INSERT INTO `creature_loot_template` VALUES 
(29356, 33470, 33, 1, 0, 2, 7),
(29356, 43852, 17, 1, 0, 1, 1),
(29356, 35947, 7, 1, 0, 1, 1),
(29356, 33445, 4, 1, 0, 1, 1),
(29356, 40412, 1.5, 1, 1, 1, 1),
(29356, 40406, 1.5, 1, 1, 1, 1),
(29356, 40408, 1.5, 1, 1, 1, 1),
(29356, 40407, 1.5, 1, 1, 1, 1),
(29356, 40410, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16020);
INSERT INTO `creature_loot_template` VALUES 
(16020, 33470, 33, 1, 0, 2, 7),
(16020, 43852, 17, 1, 0, 1, 1),
(16020, 35947, 7, 1, 0, 1, 1),
(16020, 33445, 4, 1, 0, 1, 1),
(16020, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29362);
INSERT INTO `creature_loot_template` VALUES 
(29362, 33470, 33, 1, 0, 2, 7),
(29362, 43852, 17, 1, 0, 1, 1),
(29362, 35947, 7, 1, 0, 1, 1),
(29362, 33445, 4, 1, 0, 1, 1),
(29362, 40409, 1.5, 1, 1, 1, 1),
(29362, 40412, 1.5, 1, 1, 1, 1),
(29362, 40414, 1.5, 1, 1, 1, 1),
(29362, 40407, 1.5, 1, 1, 1, 1),
(29362, 40408, 1.5, 1, 1, 1, 1),
(29362, 40410, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16022);
INSERT INTO `creature_loot_template` VALUES 
(16022, 33470, 33, 1, 0, 2, 7),
(16022, 43852, 17, 1, 0, 1, 1),
(16022, 35947, 7, 1, 0, 1, 1),
(16022, 33445, 4, 1, 0, 1, 1),
(16022, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29363);
INSERT INTO `creature_loot_template` VALUES 
(29363, 33470, 33, 1, 0, 2, 7),
(29363, 43852, 17, 1, 0, 1, 1),
(29363, 35947, 7, 1, 0, 1, 1),
(29363, 33445, 4, 1, 0, 1, 1),
(29363, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16021);
INSERT INTO `creature_loot_template` VALUES 
(16021, 33470, 33, 1, 0, 2, 7),
(16021, 43852, 17, 1, 0, 1, 1),
(16021, 35947, 7, 1, 0, 1, 1),
(16021, 33445, 4, 1, 0, 1, 1),
(16021, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29359);
INSERT INTO `creature_loot_template` VALUES 
(29359, 33470, 33, 1, 0, 2, 7),
(29359, 43852, 17, 1, 0, 1, 1),
(29359, 35947, 7, 1, 0, 1, 1),
(29359, 33445, 4, 1, 0, 1, 1),
(29359, 40409, 1.5, 1, 1, 1, 1),
(29359, 40412, 1.5, 1, 1, 1, 1),
(29359, 40407, 1.5, 1, 1, 1, 1),
(29359, 40406, 1.5, 1, 1, 1, 1),
(29359, 40414, 1.5, 1, 1, 1, 1);


DELETE FROM `creature_loot_template` WHERE (`entry`=16025);
INSERT INTO `creature_loot_template` VALUES 
(16025, 33470, 33, 1, 0, 2, 7),
(16025, 43852, 17, 1, 0, 1, 1),
(16025, 35947, 7, 1, 0, 1, 1),
(16025, 33445, 4, 1, 0, 1, 1),
(16025, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29371);
INSERT INTO `creature_loot_template` VALUES 
(29371, 33470, 33, 1, 0, 2, 7),
(29371, 43852, 17, 1, 0, 1, 1),
(29371, 35947, 7, 1, 0, 1, 1),
(29371, 33445, 4, 1, 0, 1, 1),
(29371, 33447, 2, 1, 0, 1, 1),
(29371, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=30071);
INSERT INTO `creature_loot_template` VALUES 
(30071, 33470, 33, 1, 0, 2, 7),
(30071, 43852, 17, 1, 0, 1, 1),
(30071, 35947, 7, 1, 0, 1, 1),
(30071, 33445, 4, 1, 0, 1, 1),
(30071, 33447, 2, 1, 0, 1, 1),
(30071, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=30075);
INSERT INTO `creature_loot_template` VALUES 
(30075, 33470, 33, 1, 0, 2, 7),
(30075, 43852, 17, 1, 0, 1, 1),
(30075, 35947, 7, 1, 0, 1, 1),
(30075, 33445, 4, 1, 0, 1, 1),
(30075, 40412, 1.5, 1, 1, 1, 1),
(30075, 40406, 1.5, 1, 1, 1, 1),
(30075, 40408, 1.5, 1, 1, 1, 1),
(30075, 40407, 1.5, 1, 1, 1, 1),
(30075, 40410, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16146);
INSERT INTO `creature_loot_template` VALUES 
(16146, 33470, 33, 1, 0, 2, 7),
(16146, 43852, 17, 1, 0, 1, 1),
(16146, 35947, 7, 1, 0, 1, 1),
(16146, 33445, 4, 1, 0, 1, 1),
(16146, 33447, 2, 1, 0, 1, 1),
(16146, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29823);
INSERT INTO `creature_loot_template` VALUES 
(29823, 33470, 33, 1, 0, 2, 7),
(29823, 43852, 17, 1, 0, 1, 1),
(29823, 35947, 7, 1, 0, 1, 1),
(29823, 33445, 4, 1, 0, 1, 1),
(29823, 33447, 2, 1, 0, 1, 1),
(29823, 40406, 1.5, 1, 2, 1, 1),
(29823, 40412, 1.5, 1, 2, 1, 1),
(29823, 40414, 1.5, 1, 2, 1, 1),
(29823, 40409, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16165);
INSERT INTO `creature_loot_template` VALUES 
(16165, 33470, 33, 1, 0, 2, 7),
(16165, 43852, 17, 1, 0, 1, 1),
(16165, 35947, 7, 1, 0, 1, 1),
(16165, 33445, 4, 1, 0, 1, 1),
(16165, 33447, 2, 1, 0, 1, 1),
(16165, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29828);
INSERT INTO `creature_loot_template` VALUES 
(29828, 33470, 33, 1, 0, 2, 7),
(29828, 43852, 17, 1, 0, 1, 1),
(29828, 35947, 7, 1, 0, 1, 1),
(29828, 33445, 4, 1, 0, 1, 1),
(29828, 33447, 2, 1, 0, 1, 1),
(29828, 40408, 1.5, 1, 2, 1, 1),
(29828, 40412, 1.5, 1, 2, 1, 1),
(29828, 40414, 1.5, 1, 2, 1, 1),
(29828, 40407, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16164);
INSERT INTO `creature_loot_template` VALUES 
(16164, 33470, 33, 1, 0, 2, 7),
(16164, 43852, 17, 1, 0, 1, 1),
(16164, 35947, 7, 1, 0, 1, 1),
(16164, 33445, 4, 1, 0, 1, 1),
(16164, 33447, 2, 1, 0, 1, 1),
(16164, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29825);
INSERT INTO `creature_loot_template` VALUES 
(29825, 33470, 33, 1, 0, 2, 7),
(29825, 43852, 17, 1, 0, 1, 1),
(29825, 35947, 7, 1, 0, 1, 1),
(29825, 33445, 4, 1, 0, 1, 1),
(29825, 33447, 2, 1, 0, 1, 1),
(29825, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16145);
INSERT INTO `creature_loot_template` VALUES 
(16145, 33470, 33, 1, 0, 2, 7),
(16145, 43852, 17, 1, 0, 1, 1),
(16145, 35947, 7, 1, 0, 1, 1),
(16145, 33445, 4, 1, 0, 1, 1),
(16145, 33447, 2, 1, 0, 1, 1),
(16145, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29824);
INSERT INTO `creature_loot_template` VALUES 
(29824, 33470, 33, 1, 0, 2, 7),
(29824, 43852, 17, 1, 0, 1, 1),
(29824, 35947, 7, 1, 0, 1, 1),
(29824, 33445, 4, 1, 0, 1, 1),
(29824, 33447, 2, 1, 0, 1, 1),
(29824, 40408, 1.5, 1, 2, 1, 1),
(29824, 40412, 1.5, 1, 2, 1, 1),
(29824, 40414, 1.5, 1, 2, 1, 1),
(29824, 40410, 1.5, 1, 2, 1, 1),
(29824, 40407, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16167);
INSERT INTO `creature_loot_template` VALUES 
(16167, 33470, 33, 1, 0, 2, 7),
(16167, 43852, 17, 1, 0, 1, 1),
(16167, 35947, 7, 1, 0, 1, 1),
(16167, 33445, 4, 1, 0, 1, 1),
(16167, 33447, 2, 1, 0, 1, 1),
(16167, 33448, 1.5, 1, 0, 1, 1),
(16167, 39427, 1.1, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29835);
INSERT INTO `creature_loot_template` VALUES 
(29835, 33470, 33, 1, 0, 2, 7),
(29835, 43852, 17, 1, 0, 1, 1),
(29835, 35947, 7, 1, 0, 1, 1),
(29835, 33445, 4, 1, 0, 1, 1),
(29835, 33447, 2, 1, 0, 1, 1),
(29835, 33448, 1.5, 1, 0, 1, 1),
(29835, 40407, 1.1, 1, 0, 1, 1),
(29835, 40410, 1.1, 1, 0, 1, 1),
(29835, 40406, 1.1, 1, 0, 1, 1),
(29835, 43510, 1.1, 1, 0, 1, 1),
(29835, 39152, 1.1, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16193);
INSERT INTO `creature_loot_template` VALUES 
(16193, 33470, 33, 1, 0, 2, 7),
(16193, 43852, 17, 1, 0, 1, 1),
(16193, 35947, 7, 1, 0, 1, 1),
(16193, 33445, 4, 1, 0, 1, 1),
(16193, 33447, 2, 1, 0, 1, 1),
(16193, 40409, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29837);
INSERT INTO `creature_loot_template` VALUES 
(29837, 33470, 33, 1, 0, 2, 7),
(29837, 43852, 17, 1, 0, 1, 1),
(29837, 35947, 7, 1, 0, 1, 1),
(29837, 33445, 4, 1, 0, 1, 1),
(29837, 33447, 2, 1, 0, 1, 1),
(29837, 40408, 1.5, 1, 2, 1, 1),
(29837, 40412, 1.5, 1, 2, 1, 1),
(29837, 40414, 1.5, 1, 2, 1, 1),
(29837, 40410, 1.5, 1, 2, 1, 1),
(29837, 40407, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16163);
INSERT INTO `creature_loot_template` VALUES 
(16163, 33470, 33, 1, 0, 2, 7),
(16163, 43852, 17, 1, 0, 1, 1),
(16163, 35947, 7, 1, 0, 1, 1),
(16163, 33445, 4, 1, 0, 1, 1),
(16163, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29842);
INSERT INTO `creature_loot_template` VALUES 
(29842, 33470, 33, 1, 0, 2, 7),
(29842, 43852, 17, 1, 0, 1, 1),
(29842, 35947, 7, 1, 0, 1, 1),
(29842, 33445, 4, 1, 0, 1, 1),
(29842, 33447, 2, 1, 0, 1, 1),
(29842, 40408, 1.5, 1, 2, 1, 1),
(29842, 40412, 1.5, 1, 2, 1, 1),
(29842, 40414, 1.5, 1, 2, 1, 1),
(29842, 40410, 1.5, 1, 2, 1, 1),
(29842, 40407, 1.5, 1, 2, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16067);
INSERT INTO `creature_loot_template` VALUES 
(16067, 33470, 33, 1, 0, 2, 7),
(16067, 43852, 17, 1, 0, 1, 1),
(16067, 35947, 7, 1, 0, 1, 1),
(16067, 33445, 4, 1, 0, 1, 1),
(16067, 39468, 1.5, 1, 0, 1, 1),
(16067, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29852);
INSERT INTO `creature_loot_template` VALUES 
(29852, 33470, 33, 1, 0, 2, 7),
(29852, 43852, 17, 1, 0, 1, 1),
(29852, 35947, 7, 1, 0, 1, 1),
(29852, 33445, 4, 1, 0, 1, 1),
(29852, 39468, 1.5, 1, 0, 1, 1),
(29852, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16154);
INSERT INTO `creature_loot_template` VALUES 
(16154, 33470, 33, 1, 0, 2, 7),
(16154, 43852, 17, 1, 0, 1, 1),
(16154, 35947, 7, 1, 0, 1, 1),
(16154, 33445, 4, 1, 0, 1, 1),
(16154, 39467, 1.5, 1, 1, 1, 1),
(16154, 39472, 1.5, 1, 1, 1, 1),
(16154, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29831);
INSERT INTO `creature_loot_template` VALUES 
(29831, 33470, 33, 1, 0, 2, 7),
(29831, 43852, 17, 1, 0, 1, 1),
(29831, 35947, 7, 1, 0, 1, 1),
(29831, 33445, 4, 1, 0, 1, 1),
(29831, 40408, 1.5, 1, 1, 1, 1),
(29831, 40407, 1.5, 1, 1, 1, 1),
(29831, 40410, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16194);
INSERT INTO `creature_loot_template` VALUES 
(16194, 33470, 33, 1, 0, 2, 7),
(16194, 43852, 17, 1, 0, 1, 1),
(16194, 35947, 7, 1, 0, 1, 1),
(16194, 33445, 4, 1, 0, 1, 1),
(16194, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29898);
INSERT INTO `creature_loot_template` VALUES 
(29898, 33470, 33, 1, 0, 2, 7),
(29898, 43852, 17, 1, 0, 1, 1),
(29898, 35947, 7, 1, 0, 1, 1),
(29898, 33445, 4, 1, 0, 1, 1),
(29898, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16215);
INSERT INTO `creature_loot_template` VALUES 
(16215, 33470, 33, 1, 0, 2, 7),
(16215, 43852, 17, 1, 0, 1, 1),
(16215, 35947, 7, 1, 0, 1, 1),
(16215, 33445, 4, 1, 0, 1, 1),
(16215, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29899);
INSERT INTO `creature_loot_template` VALUES 
(29899, 33470, 33, 1, 0, 2, 7),
(29899, 43852, 17, 1, 0, 1, 1),
(29899, 35947, 7, 1, 0, 1, 1),
(29899, 33445, 4, 1, 0, 1, 1),
(29899, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16216);
INSERT INTO `creature_loot_template` VALUES 
(16216, 33470, 33, 1, 0, 2, 7),
(16216, 43852, 17, 1, 0, 1, 1),
(16216, 35947, 7, 1, 0, 1, 1),
(16216, 33445, 4, 1, 0, 1, 1),
(16216, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29900);
INSERT INTO `creature_loot_template` VALUES 
(29900, 33470, 33, 1, 0, 2, 7),
(29900, 43852, 17, 1, 0, 1, 1),
(29900, 35947, 7, 1, 0, 1, 1),
(29900, 33445, 4, 1, 0, 1, 1),
(29900, 33447, 2, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=15974);
INSERT INTO `creature_loot_template` VALUES 
(15974, 44758, 70, 1, 0, 2, 4),
(15974, 42253, 30, 1, 1, 1, 3),
(15974, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=29242);
INSERT INTO `creature_loot_template` VALUES 
(29242, 44758, 70, 1, 0, 2, 4),
(29242, 42253, 30, 1, 1, 1, 3),
(29242, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=15975);
INSERT INTO `creature_loot_template` VALUES 
(15975, 44758, 70, 1, 0, 2, 4),
(15975, 42253, 30, 1, 1, 1, 3),
(15975, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=29241);
INSERT INTO `creature_loot_template` VALUES 
(29241, 44758, 70, 1, 0, 2, 4),
(29241, 42253, 30, 1, 1, 1, 3),
(29241, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=15976);
INSERT INTO `creature_loot_template` VALUES 
(15976, 44758, 70, 1, 0, 2, 4),
(15976, 42253, 30, 1, 1, 1, 3),
(15976, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=29243);
INSERT INTO `creature_loot_template` VALUES 
(29243, 44758, 70, 1, 0, 2, 4),
(29243, 42253, 30, 1, 1, 1, 3),
(29243, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=15978);
INSERT INTO `creature_loot_template` VALUES 
(15978, 44758, 70, 1, 0, 2, 4),
(15978, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=30389);
INSERT INTO `creature_loot_template` VALUES 
(30389, 44758, 70, 1, 0, 2, 4),
(30389, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=15980);
INSERT INTO `creature_loot_template` VALUES 
(15980, 33470, 40, 1, 0, 2, 7),
(15980, 43852, 17, 1, 0, 1, 1),
(15980, 35947, 7, 1, 0, 1, 1),
(15980, 33445, 4, 1, 0, 1, 1),
(15980, 33447, 2, 1, 0, 1, 1),
(15980, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29247);
INSERT INTO `creature_loot_template` VALUES 
(29247, 33470, 40, 1, 0, 2, 7),
(29247, 43852, 17, 1, 0, 1, 1),
(29247, 35947, 7, 1, 0, 1, 1),
(29247, 33445, 4, 1, 0, 1, 1),
(29247, 33447, 2, 1, 0, 1, 1),
(29247, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=15981);
INSERT INTO `creature_loot_template` VALUES 
(15981, 33470, 40, 1, 0, 2, 7),
(15981, 43852, 17, 1, 0, 1, 1),
(15981, 35947, 7, 1, 0, 1, 1),
(15981, 33445, 4, 1, 0, 1, 1),
(15981, 33447, 2, 1, 0, 1, 1),
(15981, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29248);
INSERT INTO `creature_loot_template` VALUES 
(29248, 33470, 40, 1, 0, 2, 7),
(29248, 43852, 17, 1, 0, 1, 1),
(29248, 35947, 7, 1, 0, 1, 1),
(29248, 33445, 4, 1, 0, 1, 1),
(29248, 33447, 2, 1, 0, 1, 1),
(29248, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=15979);
INSERT INTO `creature_loot_template` VALUES 
(15979, 44758, 70, 1, 0, 2, 4),
(15979, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=29286);
INSERT INTO `creature_loot_template` VALUES 
(29286, 44758, 70, 1, 0, 2, 4),
(29286, 44759, 15, 1, 0, 2, 3);

DELETE FROM `creature_loot_template` WHERE (`entry`=16244);
INSERT INTO `creature_loot_template` VALUES 
(16244, 33470, 40, 1, 0, 2, 7),
(16244, 43852, 17, 1, 0, 1, 1),
(16244, 35947, 7, 1, 0, 1, 1),
(16244, 33445, 4, 1, 0, 1, 1),
(16244, 33447, 2, 1, 0, 1, 1),
(16244, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29574);
INSERT INTO `creature_loot_template` VALUES 
(29574, 33470, 33, 1, 0, 2, 7),
(29574, 43852, 17, 1, 0, 1, 1),
(29574, 35947, 7, 1, 0, 1, 1),
(29574, 33445, 4, 1, 0, 1, 1),
(29574, 40412, 1.5, 1, 1, 1, 1),
(29574, 40409, 1.5, 1, 1, 1, 1),
(29574, 40414, 1.5, 1, 1, 1, 1),
(29574, 40410, 1.5, 1, 1, 1, 1),
(29574, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16243);
INSERT INTO `creature_loot_template` VALUES 
(16243, 33470, 40, 1, 0, 2, 7),
(16243, 43852, 17, 1, 0, 1, 1),
(16243, 35947, 7, 1, 0, 1, 1),
(16243, 33445, 4, 1, 0, 1, 1),
(16243, 33447, 2, 1, 0, 1, 1),
(16243, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29575);
INSERT INTO `creature_loot_template` VALUES 
(29575, 33470, 33, 1, 0, 2, 7),
(29575, 43852, 17, 1, 0, 1, 1),
(29575, 35947, 7, 1, 0, 1, 1),
(29575, 33445, 4, 1, 0, 1, 1),
(29575, 40412, 1.5, 1, 1, 1, 1),
(29575, 40409, 1.5, 1, 1, 1, 1),
(29575, 40414, 1.5, 1, 1, 1, 1),
(29575, 40410, 1.5, 1, 1, 1, 1),
(29575, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16168);
INSERT INTO `creature_loot_template` VALUES 
(16168, 33470, 40, 1, 0, 2, 7),
(16168, 43852, 17, 1, 0, 1, 1),
(16168, 35947, 7, 1, 0, 1, 1),
(16168, 33445, 4, 1, 0, 1, 1),
(16168, 33447, 2, 1, 0, 1, 1),
(16168, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29576);
INSERT INTO `creature_loot_template` VALUES 
(29576, 33470, 33, 1, 0, 2, 7),
(29576, 43852, 17, 1, 0, 1, 1),
(29576, 35947, 7, 1, 0, 1, 1),
(29576, 33445, 4, 1, 0, 1, 1),
(29576, 40412, 1.5, 1, 1, 1, 1),
(29576, 40409, 1.5, 1, 1, 1, 1),
(29576, 40414, 1.5, 1, 1, 1, 1),
(29576, 40410, 1.5, 1, 1, 1, 1),
(29576, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16297);
INSERT INTO `creature_loot_template` VALUES 
(16297, 33470, 40, 1, 0, 2, 7),
(16297, 43852, 17, 1, 0, 1, 1),
(16297, 35947, 7, 1, 0, 1, 1),
(16297, 33445, 4, 1, 0, 1, 1),
(16297, 33447, 2, 1, 0, 1, 1),
(16297, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29601);
INSERT INTO `creature_loot_template` VALUES 
(29601, 33470, 33, 1, 0, 2, 7),
(29601, 43852, 17, 1, 0, 1, 1),
(29601, 35947, 7, 1, 0, 1, 1),
(29601, 33445, 4, 1, 0, 1, 1),
(29601, 40412, 1.5, 1, 1, 1, 1),
(29601, 40409, 1.5, 1, 1, 1, 1),
(29601, 40414, 1.5, 1, 1, 1, 1),
(29601, 40410, 1.5, 1, 1, 1, 1),
(29601, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16036);
INSERT INTO `creature_loot_template` VALUES 
(16036, 33470, 40, 1, 0, 2, 7),
(16036, 43852, 17, 1, 0, 1, 1),
(16036, 35947, 7, 1, 0, 1, 1),
(16036, 33445, 4, 1, 0, 1, 1),
(16036, 33447, 2, 1, 0, 1, 1),
(16036, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29608);
INSERT INTO `creature_loot_template` VALUES 
(29608, 33470, 33, 1, 0, 2, 7),
(29608, 43852, 17, 1, 0, 1, 1),
(29608, 35947, 7, 1, 0, 1, 1),
(29608, 33445, 4, 1, 0, 1, 1),
(29608, 40412, 1.5, 1, 1, 1, 1),
(29608, 40409, 1.5, 1, 1, 1, 1),
(29608, 40414, 1.5, 1, 1, 1, 1),
(29608, 40410, 1.5, 1, 1, 1, 1),
(29608, 40406, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=16034);
INSERT INTO `creature_loot_template` VALUES 
(16034, 33470, 40, 1, 0, 2, 7),
(16034, 43852, 17, 1, 0, 1, 1),
(16034, 35947, 7, 1, 0, 1, 1),
(16034, 33445, 4, 1, 0, 1, 1),
(16034, 33447, 2, 1, 0, 1, 1),
(16034, 39470, 1.5, 1, 1, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=29609);
INSERT INTO `creature_loot_template` VALUES 
(29609, 33470, 33, 1, 0, 2, 7),
(29609, 43852, 17, 1, 0, 1, 1),
(29609, 35947, 7, 1, 0, 1, 1),
(29609, 33445, 4, 1, 0, 1, 1);

DELETE FROM `creature_ai_scripts` WHERE (`id`=16427020);
INSERT INTO `creature_ai_scripts` VALUES 
(16427020, 16236, 0, 0, 100, 3, 1000, 3000, 3000, 6000, 11, 29407, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spell N');
DELETE FROM `creature_ai_scripts` WHERE (`id`=16427021);
INSERT INTO `creature_ai_scripts` VALUES 
(16427021, 16236, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 54805, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spell H');

DELETE FROM `creature_loot_template` WHERE `item` IN (39467, 39472, 39470, 39427, 39468, 39473);
INSERT INTO `creature_loot_template` VALUES 
(16017, 39467, 1.5, 1, 1, 1, 1),
(16017, 39472, 1.5, 1, 1, 1, 1),
(16017, 39470, 1.5, 1, 1, 1, 1),
(16017, 39427, 1.5, 1, 1, 1, 1),
(16017, 39468, 1.5, 1, 1, 1, 1),
(16017, 39473, 1.5, 1, 1, 1, 1),
(16018, 39467, 1.5, 1, 1, 1, 1),
(16018, 39472, 1.5, 1, 1, 1, 1),
(16018, 39470, 1.5, 1, 1, 1, 1),
(16018, 39427, 1.5, 1, 1, 1, 1),
(16018, 39468, 1.5, 1, 1, 1, 1),
(16018, 39473, 1.5, 1, 1, 1, 1),
(16029, 39467, 1.5, 1, 1, 1, 1),
(16029, 39472, 1.5, 1, 1, 1, 1),
(16029, 39470, 1.5, 1, 1, 1, 1),
(16029, 39427, 1.5, 1, 1, 1, 1),
(16029, 39468, 1.5, 1, 1, 1, 1),
(16029, 39473, 1.5, 1, 1, 1, 1),
(16020, 39467, 1.5, 1, 1, 1, 1),
(16020, 39472, 1.5, 1, 1, 1, 1),
(16020, 39470, 1.5, 1, 1, 1, 1),
(16020, 39427, 1.5, 1, 1, 1, 1),
(16020, 39468, 1.5, 1, 1, 1, 1),
(16020, 39473, 1.5, 1, 1, 1, 1),
(16021, 39467, 1.5, 1, 1, 1, 1),
(16021, 39472, 1.5, 1, 1, 1, 1),
(16021, 39470, 1.5, 1, 1, 1, 1),
(16021, 39427, 1.5, 1, 1, 1, 1),
(16021, 39468, 1.5, 1, 1, 1, 1),
(16021, 39473, 1.5, 1, 1, 1, 1),
(16025, 39467, 1.5, 1, 1, 1, 1),
(16025, 39472, 1.5, 1, 1, 1, 1),
(16025, 39470, 1.5, 1, 1, 1, 1),
(16025, 39427, 1.5, 1, 1, 1, 1),
(16025, 39468, 1.5, 1, 1, 1, 1),
(16025, 39473, 1.5, 1, 1, 1, 1),
(30071, 39467, 1.5, 1, 1, 1, 1),
(30071, 39472, 1.5, 1, 1, 1, 1),
(30071, 39470, 1.5, 1, 1, 1, 1),
(30071, 39427, 1.5, 1, 1, 1, 1),
(30071, 39468, 1.5, 1, 1, 1, 1),
(30071, 39473, 1.5, 1, 1, 1, 1),
(16146, 39467, 1.5, 1, 1, 1, 1),
(16146, 39472, 1.5, 1, 1, 1, 1),
(16146, 39470, 1.5, 1, 1, 1, 1),
(16146, 39427, 1.5, 1, 1, 1, 1),
(16146, 39468, 1.5, 1, 1, 1, 1),
(16146, 39473, 1.5, 1, 1, 1, 1),
(16165, 39467, 1.5, 1, 1, 1, 1),
(16165, 39472, 1.5, 1, 1, 1, 1),
(16165, 39470, 1.5, 1, 1, 1, 1),
(16165, 39427, 1.5, 1, 1, 1, 1),
(16165, 39468, 1.5, 1, 1, 1, 1),
(16165, 39473, 1.5, 1, 1, 1, 1),
(16164, 39467, 1.5, 1, 1, 1, 1),
(16164, 39472, 1.5, 1, 1, 1, 1),
(16164, 39470, 1.5, 1, 1, 1, 1),
(16164, 39427, 1.5, 1, 1, 1, 1),
(16164, 39468, 1.5, 1, 1, 1, 1),
(16164, 39473, 1.5, 1, 1, 1, 1),
(16145, 39467, 1.5, 1, 1, 1, 1),
(16145, 39472, 1.5, 1, 1, 1, 1),
(16145, 39470, 1.5, 1, 1, 1, 1),
(16145, 39427, 1.5, 1, 1, 1, 1),
(16145, 39468, 1.5, 1, 1, 1, 1),
(16145, 39473, 1.5, 1, 1, 1, 1),
(16167, 39467, 1.5, 1, 1, 1, 1),
(16167, 39472, 1.5, 1, 1, 1, 1),
(16167, 39470, 1.5, 1, 1, 1, 1),
(16167, 39427, 1.5, 1, 1, 1, 1),
(16167, 39468, 1.5, 1, 1, 1, 1),
(16167, 39473, 1.5, 1, 1, 1, 1),
(16193, 39467, 1.5, 1, 1, 1, 1),
(16193, 39472, 1.5, 1, 1, 1, 1),
(16193, 39470, 1.5, 1, 1, 1, 1),
(16193, 39427, 1.5, 1, 1, 1, 1),
(16193, 39468, 1.5, 1, 1, 1, 1),
(16193, 39473, 1.5, 1, 1, 1, 1),
(16163, 39467, 1.5, 1, 1, 1, 1),
(16163, 39472, 1.5, 1, 1, 1, 1),
(16163, 39470, 1.5, 1, 1, 1, 1),
(16163, 39427, 1.5, 1, 1, 1, 1),
(16163, 39468, 1.5, 1, 1, 1, 1),
(16163, 39473, 1.5, 1, 1, 1, 1),
(16067, 39467, 1.5, 1, 1, 1, 1),
(16067, 39472, 1.5, 1, 1, 1, 1),
(16067, 39470, 1.5, 1, 1, 1, 1),
(16067, 39427, 1.5, 1, 1, 1, 1),
(16067, 39468, 1.5, 1, 1, 1, 1),
(16067, 39473, 1.5, 1, 1, 1, 1),
(16154, 39467, 1.5, 1, 1, 1, 1),
(16154, 39472, 1.5, 1, 1, 1, 1),
(16154, 39470, 1.5, 1, 1, 1, 1),
(16154, 39427, 1.5, 1, 1, 1, 1),
(16154, 39468, 1.5, 1, 1, 1, 1),
(16154, 39473, 1.5, 1, 1, 1, 1),
(16194, 39467, 1.5, 1, 1, 1, 1),
(16194, 39472, 1.5, 1, 1, 1, 1),
(16194, 39470, 1.5, 1, 1, 1, 1),
(16194, 39427, 1.5, 1, 1, 1, 1),
(16194, 39468, 1.5, 1, 1, 1, 1),
(16194, 39473, 1.5, 1, 1, 1, 1),
(16215, 39467, 1.5, 1, 1, 1, 1),
(16215, 39472, 1.5, 1, 1, 1, 1),
(16215, 39470, 1.5, 1, 1, 1, 1),
(16215, 39427, 1.5, 1, 1, 1, 1),
(16215, 39468, 1.5, 1, 1, 1, 1),
(16215, 39473, 1.5, 1, 1, 1, 1),
(16216, 39467, 1.5, 1, 1, 1, 1),
(16216, 39472, 1.5, 1, 1, 1, 1),
(16216, 39470, 1.5, 1, 1, 1, 1),
(16216, 39427, 1.5, 1, 1, 1, 1),
(16216, 39468, 1.5, 1, 1, 1, 1),
(16216, 39473, 1.5, 1, 1, 1, 1),
(15974, 39467, 1.5, 1, 1, 1, 1),
(15974, 39472, 1.5, 1, 1, 1, 1),
(15974, 39470, 1.5, 1, 1, 1, 1),
(15974, 39427, 1.5, 1, 1, 1, 1),
(15974, 39468, 1.5, 1, 1, 1, 1),
(15974, 39473, 1.5, 1, 1, 1, 1),
(15975, 39467, 1.5, 1, 1, 1, 1),
(15975, 39472, 1.5, 1, 1, 1, 1),
(15975, 39470, 1.5, 1, 1, 1, 1),
(15975, 39427, 1.5, 1, 1, 1, 1),
(15975, 39468, 1.5, 1, 1, 1, 1),
(15975, 39473, 1.5, 1, 1, 1, 1),
(15976, 39467, 1.5, 1, 1, 1, 1),
(15976, 39472, 1.5, 1, 1, 1, 1),
(15976, 39470, 1.5, 1, 1, 1, 1),
(15976, 39427, 1.5, 1, 1, 1, 1),
(15976, 39468, 1.5, 1, 1, 1, 1),
(15976, 39473, 1.5, 1, 1, 1, 1),
(15978, 39467, 1.5, 1, 1, 1, 1),
(15978, 39472, 1.5, 1, 1, 1, 1),
(15978, 39470, 1.5, 1, 1, 1, 1),
(15978, 39427, 1.5, 1, 1, 1, 1),
(15978, 39468, 1.5, 1, 1, 1, 1),
(15978, 39473, 1.5, 1, 1, 1, 1),
(15980, 39467, 1.5, 1, 1, 1, 1),
(15980, 39472, 1.5, 1, 1, 1, 1),
(15980, 39470, 1.5, 1, 1, 1, 1),
(15980, 39427, 1.5, 1, 1, 1, 1),
(15980, 39468, 1.5, 1, 1, 1, 1),
(15980, 39473, 1.5, 1, 1, 1, 1),
(15981, 39467, 1.5, 1, 1, 1, 1),
(15981, 39472, 1.5, 1, 1, 1, 1),
(15981, 39470, 1.5, 1, 1, 1, 1),
(15981, 39427, 1.5, 1, 1, 1, 1),
(15981, 39468, 1.5, 1, 1, 1, 1),
(15981, 39473, 1.5, 1, 1, 1, 1),
(15979, 39467, 1.5, 1, 1, 1, 1),
(15979, 39472, 1.5, 1, 1, 1, 1),
(15979, 39470, 1.5, 1, 1, 1, 1),
(15979, 39427, 1.5, 1, 1, 1, 1),
(15979, 39468, 1.5, 1, 1, 1, 1),
(15979, 39473, 1.5, 1, 1, 1, 1),
(16244, 39467, 1.5, 1, 1, 1, 1),
(16244, 39472, 1.5, 1, 1, 1, 1),
(16244, 39470, 1.5, 1, 1, 1, 1),
(16244, 39427, 1.5, 1, 1, 1, 1),
(16244, 39468, 1.5, 1, 1, 1, 1),
(16244, 39473, 1.5, 1, 1, 1, 1),
(16243, 39467, 1.5, 1, 1, 1, 1),
(16243, 39472, 1.5, 1, 1, 1, 1),
(16243, 39470, 1.5, 1, 1, 1, 1),
(16243, 39427, 1.5, 1, 1, 1, 1),
(16243, 39468, 1.5, 1, 1, 1, 1),
(16243, 39473, 1.5, 1, 1, 1, 1),
(16168, 39467, 1.5, 1, 1, 1, 1),
(16168, 39472, 1.5, 1, 1, 1, 1),
(16168, 39470, 1.5, 1, 1, 1, 1),
(16168, 39427, 1.5, 1, 1, 1, 1),
(16168, 39468, 1.5, 1, 1, 1, 1),
(16168, 39473, 1.5, 1, 1, 1, 1),
(16297, 39467, 1.5, 1, 1, 1, 1),
(16297, 39472, 1.5, 1, 1, 1, 1),
(16297, 39470, 1.5, 1, 1, 1, 1),
(16297, 39427, 1.5, 1, 1, 1, 1),
(16297, 39468, 1.5, 1, 1, 1, 1),
(16297, 39473, 1.5, 1, 1, 1, 1),
(16036, 39467, 1.5, 1, 1, 1, 1),
(16036, 39472, 1.5, 1, 1, 1, 1),
(16036, 39470, 1.5, 1, 1, 1, 1),
(16036, 39427, 1.5, 1, 1, 1, 1),
(16036, 39468, 1.5, 1, 1, 1, 1),
(16036, 39473, 1.5, 1, 1, 1, 1),
(16034, 39467, 1.5, 1, 1, 1, 1),
(16034, 39472, 1.5, 1, 1, 1, 1),
(16034, 39470, 1.5, 1, 1, 1, 1),
(16034, 39427, 1.5, 1, 1, 1, 1),
(16034, 39468, 1.5, 1, 1, 1, 1),
(16034, 39473, 1.5, 1, 1, 1, 1);



-- http://www.wowhead.com/npc=16211
UPDATE `creature_template` SET `unit_flags` = 131074 WHERE `entry` = 16211;


-- some scripts_ai
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=29256);
INSERT INTO `creature_ai_scripts` VALUES 
( 100000100, 29256, 0, 0, 100, 2, 0, 0, 0, 0, 11, 28969, 4, 32, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard (Normal) - Cast Acid Spit on Aggro'),
( 100000101, 29256, 0, 0, 100, 4, 0, 0, 0, 0, 11, 56098, 4, 32, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard (Heroic) - Cast Acid Spit on Aggro'),
( 100000102, 29256, 0, 0, 100, 3, 4000, 6000, 4000, 7000, 11, 28969, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard (Normal) - Cast Acid Spit'),
( 100000104, 29256, 0, 0, 100, 5, 4000, 6000, 4000, 7000, 11, 56098, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard (Heroic) - Cast Acid Spit'),
( 100000105, 29256, 0, 0, 100, 7, 7000, 9000, 7000, 9000, 11, 40504, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Cast Cleave'),
( 100000106, 29256, 2, 0, 100, 7, 30, 0, 120000, 120000, 11, 8269, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Cast Frenzy at 30% HP'),
(100000107, 29256, 6, 0, 100, 0, 0, 0, 0, 0, 11, 28864, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Summon Corpse Scarabs');

UPDATE `creature_template` SET `spell1` = 55765, `AIName` = 'EventAI' WHERE `entry` = 16429;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=16429);
INSERT INTO `creature_ai_scripts` VALUES 
(100000108, 16429, 9, 0, 100, 3, 0, 3, 500, 1000, 11, 55765, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wail of Souls - Normal'),
(100000109, 16429, 9, 0, 100, 5, 0, 3, 500, 1000, 11, 55765, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wail of Souls - Hero');


UPDATE `creature_template` SET `spell1` = 28457, `AIName` = 'EventAI', `spell2` = 55714 WHERE `entry` = 16427;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=16427);
INSERT INTO `creature_ai_scripts` VALUES 
(100000110, 16427, 9, 0, 100, 3, 0, 3, 0, 0, 11, 28457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Explode - Normal'),
(100000111, 16427, 9, 0, 100, 5, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Explode - Hero');

--
-- Obsidian Sanctum
--
UPDATE `instance_template` SET `script`='instance_obsidian_sanctum' WHERE `map`=615;
UPDATE `creature_template` SET `ScriptName`='boss_sartharion' WHERE `entry`=28860;
UPDATE `creature_template` SET `ScriptName`='mob_vesperon' WHERE `entry`=30449;
UPDATE `creature_template` SET `ScriptName`='mob_shadron' WHERE `entry`=30451;
UPDATE `creature_template` SET `ScriptName`='mob_tenebron' WHERE `entry`=30452;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_shadron' WHERE `entry`=31218;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_vesperon' WHERE `entry`=31219;
-- flametsunami
UPDATE creature_template SET minlevel=83, maxlevel=83, faction_A=14, faction_H=14, unit_flags=0x02000000, flags_extra=0x00000002, ScriptName="npc_flame_tsunami" WHERE entry=30616;

UPDATE creature_template SET ScriptName="npc_twilight_fissure" WHERE entry=30641; 
UPDATE creature_template SET ScriptName="npc_flame_tsunami" WHERE entry=30616;

-- safezone flag
UPDATE creature_template SET flags_extra = 0x00000002 WHERE entry=30494;

-- sartharion door
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 181247;


-- Add Twilight Portals
DELETE FROM gameobject WHERE id=193988;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(193988, 615, 3, 1, 3137.26, 501.08, 87.9118, 0.846795, 0, 0, 0.41086, 0.911698, -30, 0, 1),
(193988, 615, 3, 1, 3238.37, 518.595, 58.9057, 0.739184, 0, 0, 0.361235, 0.932475, -30, 0, 1),
(193988, 615, 3, 1, 3362.01, 553.726, 95.7068, 4.56818, 0, 0, 0.756211, -0.654328, -30, 0, 1),
(193988, 615, 3, 1, 3219.67, 656.795, 87.2898, 5.92596, 0, 0, 0.177664, -0.984091, 25, 0, 1);

-- Set creature data to creatures used in Sartharion encounter
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 31103; -- Twilight Egg (Cosmetic)
UPDATE creature_template SET unit_flags = unit_flags | 4, faction_A = 103, faction_H = 103, flags_extra = 2 WHERE entry = 30648; -- Fire Cyclone 
UPDATE creature SET spawndist = 0 WHERE id = 30648; -- Fire Cyclone
UPDATE creature_template SET ScriptName = 'npc_twilight_fissure' WHERE entry = 30641;
UPDATE creature_template SET ScriptName = 'npc_flame_tsunami' WHERE entry = 30616;
UPDATE creature_template SET ScriptName = 'mob_twilight_eggs' WHERE entry IN (30882, 31204);
UPDATE creature_template SET ScriptName = 'mob_twilight_whelp' WHERE entry IN (30890, 31540, 31214, 31548);
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, mindmg = 1857, maxdmg = 2703 WHERE entry IN (30890, 31214);
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, mindmg = 3032, maxdmg = 5194 WHERE entry IN (31540, 31548);
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81 WHERE entry IN (30882, 31539); -- Twilight Egg
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81 WHERE entry IN (31204, 31547); -- Sartharion Twilight Egg
UPDATE creature_template SET faction_A = 103, faction_H = 103, minlevel = 81, maxlevel = 81, flags_extra = 2, scale = 0.75 WHERE entry IN (30641, 31521); -- Twilight Fissure
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, mindmg = 693, maxdmg = 963, attackpower = 1567, dmg_multiplier = 1 WHERE entry = 30643; -- Lava Blaze
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, mindmg = 894, maxdmg = 1203, attackpower = 3134, dmg_multiplier = 1 WHERE entry = 31317; -- Lava Blaze (1)
UPDATE creature_template SET faction_A = 14, faction_H = 14, minlevel = 81, maxlevel = 81, flags_extra = 2 WHERE entry = 30616; -- Flame Tsunami
UPDATE creature_template SET faction_A = 103, faction_H = 103, mindmg = 409, maxdmg = 502, attackpower = 780, dmg_multiplier = 35, mechanic_immune_mask = 617299803, minlevel = 81, maxlevel = 81 WHERE entry IN (31218, 31219); -- Acolytes of Vesperon/Shandron
--  twilight fissure
UPDATE creature_template SET flags_extra = 0 WHERE entry IN (30641, 31521);
UPDATE creature_template SET modelid1 = 29038 WHERE entry IN (30641, 31521);

-- mob obsidian
UPDATE creature_template SET unit_flags = 33554434 WHERE entry IN (30641, 31521, 31103);

-- disciple of vesperon
UPDATE creature_template SET faction_H = 16, faction_A = 16, ScriptName = 'npc_disciple_of_vesperon' WHERE entry = 30858;
UPDATE gameobject SET spawntimesecs = -60 WHERE id = 193988;

UPDATE `instance_template` SET `script`='instance_oculus' WHERE `map`=578;
UPDATE `creature_template` SET `ScriptName`='npc_unstable_sphere' WHERE `entry`=28166;
UPDATE `creature_template` SET `ScriptName`='npc_oculus_drake' WHERE `entry` IN (27657,27658,27659);

-- Ruby drake
UPDATE creature_template SET spell1 = 50232, spell2 = 50248, spell3 = 50240, spell4 =  50253, spell5 = 53112, VehicleId = 70 WHERE entry = 27756;
-- Amber Drake
UPDATE creature_template SET spell1 = 49840, spell2 = 49838, spell3 = 49592, spell4 =  0, spell5 = 53112, VehicleId = 70 WHERE entry = 27755;
-- Emerald Drake
UPDATE creature_template SET spell1 = 50328, spell2 = 50341, spell3 = 50344, spell4 =  0, spell5 = 53112, VehicleId = 70 WHERE entry = 27692;
/*
UPDATE creature_template SET npcflag=1 WHERE entry IN (27657,27658,27659);
*/
UPDATE creature_template SET ScriptName='boss_drakos' WHERE entry = 27654;
UPDATE creature_template SET ScriptName='boss_urom' WHERE entry = 27655;
UPDATE creature_template SET ScriptName='mob_centrifige_construct' WHERE entry = 27641;
UPDATE creature_template SET ScriptName='boss_varos' WHERE entry = 27447;
UPDATE creature_template SET ScriptName='boss_eregos' WHERE entry = 27656;

-- Unstable Sphere
UPDATE creature_template SET minlevel = 80, maxlevel = 80, mindmg = 422, maxdmg = 586, faction_A = 16, faction_H = 16, attackpower = 642, dmg_multiplier = 1, minrangedmg = 345, maxrangedmg = 509, rangedattackpower = 103 WHERE entry = 28166;

-- Drakos the Interrogator
DELETE FROM `script_texts` WHERE npc_entry='27654';
INSERT INTO `script_texts` VALUES ('27654', -1578000, 'The prisoners shall not go free. The word of Malygos is law!','', '', '', '', '', '', '', '', 13594,1,0,0, 'drakos SAY_AGGRO');
INSERT INTO `script_texts` VALUES ('27654', -1578001, 'A fitting punishment!','', '', '', '', '', '', '', '', 13602, 1,0,0, 'drakos SAY_KILL_1');
INSERT INTO `script_texts` VALUES ('27654', -1578002, 'Sentence: executed!','', '', '', '', '', '', '', '', 13603,1,0,0, 'drakos SAY_KILL_2');
INSERT INTO `script_texts` VALUES ('27654', -1578003, 'Another casualty of war!','', '', '', '', '', '', '', '', 13604, 1,0,0, 'drakos SAY_KILL_3');
INSERT INTO `script_texts` VALUES ('27654', -1578004, 'The war... goes on.','', '', '', '', '', '', '', '', 13605,1,0,0,  'drakos SPELL_DEATH');
INSERT INTO `script_texts` VALUES ('27654', -1578005, 'It is too late to run!','', '', '', '', '', '', '', '', 13598, 1,0,0, 'drakos SAY_PULL_1');
INSERT INTO `script_texts` VALUES ('27654', -1578006, 'Gather \'round! ','', '', '', '', '', '', '', '', 13599, 1,0,0, 'drakos SAY_PULL_2');
INSERT INTO `script_texts` VALUES ('27654', -1578007, 'None shall escape!','', '', '', '', '', '', '', '', 13600, 1,0,0, 'drakos SAY_PULL_3');
INSERT INTO `script_texts` VALUES ('27654', -1578008, 'I condemn you to death!','', '', '', '', '', '', '', '', 13601,1,0,0,  'drakos SAY_PULL_4');
INSERT INTO `script_texts` VALUES ('27654', -1578009, 'Tremble, worms!','', '', '', '', '', '', '', '', 13595,1,0,0,  'drakos SAY_STOMP_1');
INSERT INTO `script_texts` VALUES ('27654', -1578010, 'I will crush you!', '', '', '', '', '', '', '', '', 13596, 1,0,0, 'drakos SAY_STOMP_2');
INSERT INTO `script_texts` VALUES ('27654', -1578011, 'Can you fly?', '', '', '', '', '', '', '', '', 13597, 1,0,0, 'drakos SAY_STOMP_3');

-- Mage-Lord Urom
DELETE FROM `script_texts` WHERE npc_entry= '27655';
INSERT INTO `script_texts` VALUES ('27655', -1578012, 'Poor blind fools!','', '', '', '', '', '', '', '', 13638,1,0,0, 'urom SAY_AGGRO');
INSERT INTO `script_texts` VALUES ('27655', -1578013, 'If only you understood!','', '', '', '', '', '', '', '', 13641,1,0,0, 'urom SAY_KILL_1');
INSERT INTO `script_texts` VALUES ('27655', -1578014, 'Now, do you see? DO YOU?!','', '', '', '', '', '', '', '', 13642,1,0,0, 'urom SAY_KILL_2');
INSERT INTO `script_texts` VALUES ('27655', -1578015, 'Unfortunate, but necessary.','', '', '', '', '', '', '', '', 13643,1,0,0, 'urom SAY_KILL_3');
INSERT INTO `script_texts` VALUES ('27655', -1578016, 'Everything I\'ve done... has been for Azeroth...','', '', '', '', '', '', '', '', 13644,1,0,0, 'urom SAY_DEATH');
INSERT INTO `script_texts` VALUES ('27655', -1578017, 'A taste... just a small taste... of the Spell-Weaver\'s power!','', '', '', '', '', '', '', '', 13639,1,0,0, 'urom SAY_EXPLOSION_1');
INSERT INTO `script_texts` VALUES ('27655', -1578018, 'So much unstable energy... but worth the risk to destroy you!','', '', '', '', '', '', '', '', 13640,1,0,0, 'urom SAY_EXPLOSION_2');
INSERT INTO `script_texts` VALUES ('27655', -1578019, 'What do we have here... those would defy the Spell-Weaver? Those without foresight or understanding. How could I make you see? Malygos is saving the world from itself! Bah! You are hardly worth my time!','', '', '', '', '', '', '', '', 13635,1,0,0, 'urom SAY_SUMMON_1');
INSERT INTO `script_texts` VALUES ('27655', -1578020, 'Clearly my pets failed. Perhaps another demonstration is in order.','', '', '', '', '', '', '', '', 13636,1,0,0, 'urom SAY_SUMMON_2');
INSERT INTO `script_texts` VALUES ('27655', -1578021, 'Still you fight. Still you cling to misguided principles. If you survive, you\'ll find me in the center ring.','', '', '', '', '', '', '', '', 13637,1,0,0, 'urom SAY_SUMMON_3');

-- Varos Cloudstrider
DELETE FROM `script_texts` WHERE npc_entry = '27447';
INSERT INTO `script_texts` VALUES ('27447', -1578022, 'There will be no mercy!','', '', '', '', '', '', '', '', 13649,1,0,0, 'varos SAY_AGGRO');
INSERT INTO `script_texts` VALUES ('27447', -1578023, 'You were warned.','', '', '', '', '', '', '', '', 13653,1,0,0, 'varos SAY_KILL_1');
INSERT INTO `script_texts` VALUES ('27447', -1578024, 'The Oculus is ours.','', '', '', '', '', '', '', '', 13654,1,0,0, 'varos SAY_KILL_2');
INSERT INTO `script_texts` VALUES ('27447', -1578025, 'They are... too strong! Underestimated their... fortitude.','', '', '', '', '', '', '', '', 13655,1,0,0, 'varos SAY_DEATH');
INSERT INTO `script_texts` VALUES ('27447', -1578026, 'Blast them! Destroy them!','', '', '', '', '', '', '', '', 13650,1,0,0, 'varos SAY_STRIKE_1');
INSERT INTO `script_texts` VALUES ('27447', -1578027, 'Take no prisoners! Attack!','', '', '', '', '', '', '', '', 13651,1,0,0, 'varos SAY_STRIKE_2');
INSERT INTO `script_texts` VALUES ('27447', -1578028, 'Strike now! Obliterate them!','', '', '', '', '', '', '', '', 13652,1,0,0, 'varos SAY_STRIKE_3');

-- Varos says when Drakos dies
INSERT INTO `script_texts` VALUES ('27447', -1578029, 'Intruders, your victory will be short-lived. I am Commander Varos Cloudstrider. My drakes control the skies and protest this conduit. I will see to it personally that the Oculus does not fall into your hands!','', '', '', '', '', '', '', '', 13648,1,0,0, 'varos SAY_SPAWN');


UPDATE gameobject_template SET flags=4 where entry IN (189986,193995);

-- 8276
-- Fix Arcane Beam npc
UPDATE creature SET phaseMask = 0 WHERE id = 28239;
-- Fix Centrifuge Core npc
UPDATE creature SET phaseMask = 1 WHERE id = 28183;
-- Fix fazione Arcane beam
UPDATE creature_template SET faction_A = 35, faction_H = 35 WHERE entry = 28239;
-- Planar Anomaly
UPDATE creature_template SET InhabitType = 5, modelid1 = 28107, modelid3 = 28107 WHERE entry = 30879;

-- Exit portal
UPDATE gameobject_template set data17 = 0 where entry = 193908;

-- 8380
-- Reputazione a Oculus
DELETE FROM `creature_onkill_reputation` WHERE creature_id IN (27654, 27656, 27655, 27447, 27633, 27636, 28236, 27638, 27635, 27641, 28276, 27650, 27645, 27651, 27642, 27649, 27648, 27647, 27653, 27644, 30879, 27640, 27639, 28153);
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES 
(27654, 1037, 1052, 7, 0, 250, 7, 0, 250, 1), -- Drakos the interrogator
(27656, 1037, 1052, 7, 0, 250, 7, 0, 250, 1), -- Ley Guardian Eregos
(27655, 1037, 1052, 7, 0, 250, 7, 0, 250, 1), -- Mage lord urom
(27447, 1037, 1052, 7, 0, 250, 7, 0, 250, 1), -- Varos cloudstrider
-- Trash
(27633, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27636, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(28236, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27638, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27635, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27641, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(28276, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27650, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27645, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27651, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27642, 1037, 1052, 7, 0, 5, 7, 0, 5, 1), 
(27649, 1037, 1052, 7, 0, 25, 7, 0, 25, 1), 
(27648, 1037, 1052, 7, 0, 5, 7, 0, 5, 1), 
(27647, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27653, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27644, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(30879, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27640, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27639, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(28153, 1037, 1052, 7, 0, 5, 7, 0, 5, 1);
-- Planar Anomlay di Eregos
UPDATE creature_template SET ScriptName = 'npc_planar_anomaly' WHERE entry = 30879;
-- Arcane beam
DELETE FROM creature WHERE id = 28239;
UPDATE creature_template SET modelid3 = 0 WHERE entry = 30879;

-- Script Texts
DELETE FROM script_texts where `entry` <= -1752008 AND `entry` >= -1752016;
DELETE FROM script_texts where `entry` <= -1752001 AND `entry` >= -1752006;
DELETE FROM script_texts where `entry` <= -1752017 AND `entry` >= -1752036;

INSERT INTO script_texts (`entry`, `content_default`, `npc_entry`, `content_loc3`, `sound`, `type`, `language`) VALUES
('-1752008', 'Help! I am trapped within this tree! I require aid!', '0', '', '17490', '1', '0'),	 	
('-1752009', 'Thank you! I could not have held out for much longer.... A terrible thing has happened here.', '0', '', '17491', '1', '0'),	 	
('-1752010', 'We believed the Sanctum was well-fortified, but we were not prepared for the nature of this assault.', '0', '', '17492', '0', '0'),	 	
('-1752011', 'The Black dragonkin materialized from thin air, and set upon us before we could react.', '0', '', '17493', '0', '0'), 	
('-1752012', 'We did not stand a chance. As my brethren perished around me, I managed to retreat here and bar the entrance.', '0', '', '17494', '0', '0'), 	
('-1752013', 'They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the Sanctum.', '0', '', '17495', '0', '0'),	
('-1752014', 'The commander of the forces on the ground here is a cruel brute named Zarithrian, but I fear there are greater powers at work.', '0', '', '17496', '0', '0'),	
('-1752015', 'In their initial assault, I caught a glimpse of their true leader, a fearsome full-grown twilight dragon.', '0', '', '17497', '0', '0'),	
('-1752016', 'I know not the extent of their plans, heroes, but I know this: They cannot be allowed to succeed!', '0', '', '17498', '0', '0'),

( -1752001, "Ah, the entertainment has arrived.", 0, "", 17520, 1, 0),
( -1752002, "Baltharus leaves no survivors!", 0, "", 17521, 1, 0),
( -1752003, "This world has enough heroes.", 0, "", 17522, 1, 0),
( -1752004, "I..Didn''t saw...that coming...", 0, "", 17523, 1, 0),
( -1752005, "Twice the pain and half the fun.", 0, "", 17524, 1, 0),
( -1752006, "Your power wanes, ancient one.... Soon you will join your friends.", 0, "", 17525, 1, 0),

( -1752017, "Alexstrasza has chosen capable allies... A pity that I must END YOU!", 0, "", 17512, 1, 0),
( -1752018, "You thought you stood a chance?", 0, "", 17513, 1, 0),
( -1752019, "It''s for the best.", 0, "", 17514, 1, 0),
( -1752020, "HALION! I...", 0, "", 17515, 1, 0),
( -1752021, "Turn them to ashes, minions!", 0, "", 17516, 1, 0),

( -1752022, "You will sssuffer for this intrusion!", 0, "", 17528, 1, 0),
( -1752023, "As it should be...", 0, "", 17529, 1, 0),
( -1752024, "Halion will be pleased", 0, "", 17530, 1, 0),
( -1752025, "Hhrr...Grr..", 0, "", 17531, 1, 0),
( -1752026, "Burn in the master's flame!", 0, "", 17532, 1, 0),

(-1752027, 'Insects! You''re too late. The Ruby Sanctum is lost.',NULL,NULL,17499,0,0),
(-1752028, 'Your world teeters on the brink of annihilation. You will ALL bear witness to the coming of a new age of DESTRUCTION!',NULL,NULL,17500,0,0),
(-1752029, 'Another hero falls.',NULL,NULL,17501,0,0),
(-1752030, 'Hahahahaha.',NULL,NULL,17502,0,0),
(-1752031, 'Relish this victory, mortals, for it will be your last! This world will burn with the master''s return!',NULL,NULL,17503,0,0),
(-1752032, 'Not good enough.',NULL,NULL,17504,0,0),
(-1752033, 'The heavens burn!',NULL,NULL,17505,0,0),
(-1752034, 'Beware the shadow!',NULL,NULL,17506,0,0),
(-1752035, 'You will find only suffering within the realm of twilight! Enter if you dare!',NULL,NULL,17507,0,0),
(-1752036, 'I am the light and the darkness! Cower, mortals, before the herald of Deathwing!',NULL,NULL,17508,0,0);

-- Scriptnames
UPDATE `instance_template` SET `script`='instance_ruby_sanctum' WHERE (`map`='724');
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus' WHERE `entry` = '39751';
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus_clone' WHERE `entry` = '39899';
UPDATE `creature_template` SET `ScriptName` = 'npc_xerestrasza' WHERE `entry` = '40429';
UPDATE `creature_template` SET `ScriptName` = 'boss_zarithrian' WHERE `entry` = '39746';
UPDATE `creature_template` SET `ScriptName` = 'boss_ragefire' WHERE `entry` = '39747';
UPDATE `creature_template` SET `ScriptName` = 'boss_halion' WHERE `entry`= '39863';
UPDATE `creature_template` SET `ScriptName` = 'boss_twilight_halion' WHERE `entry` = '40142';
UPDATE `creature_template` SET `ScriptName` = 'npc_onyx_flamecaller' WHERE `entry` = '39814';
UPDATE `gameobject_template` SET `ScriptName` = 'go_firefield' WHERE `entry` = '203005';
UPDATE `creature_template` SET `ScriptName` = 'npc_meteor_strike' WHERE `entry` = '40055';
UPDATE `creature_template` SET `ScriptName` = 'npc_combustion' WHERE `entry` = '40001';
UPDATE `creature_template` SET `ScriptName` = 'npc_consumption' WHERE `entry` = '40135';
UPDATE `creature_template` SET `ScriptName` = 'npc_meteor_flame' WHERE `entry` = '40044';


DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='-74562') AND (`spell_effect`='74610');
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='-74792') AND (`spell_effect`='74800');
INSERT INTO spell_linked_spell VALUES (-74562, 74610, 0, 'Fiery Combustion removed -> Combustion');
INSERT INTO spell_linked_spell VALUES (-74792, 74800, 0, 'Soul Consumption removed -> Consumption');

UPDATE `instance_template` SET `script`='instance_trial_of_the_champion' WHERE `map`=650;
UPDATE `creature_template` SET `ScriptName`='npc_announcer_toc5' WHERE `entry`IN (35004,35005);

-- Moturas
DELETE FROM `vehicle_accessory` WHERE `entry` in (35491,33299,33418,33409,33300,33408,33301,33414,33297,33416,33298);
INSERT INTO `vehicle_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`) VALUES
(35491,35451,0,0, 'Black Knight'),
(33299,35323,0,1, 'Darkspear Raptor'),
(33418,35326,0,1, 'Silvermoon Hawkstrider'),
(33409,35314,0,1, 'Orgrimmar Wolf'),
(33300,35325,0,1, 'Thunder Bluff Kodo'),
(33408,35329,0,1, 'Ironforge Ram'),
(33301,35331,0,1, 'Gnomeregan Mechanostrider'),
(33414,35327,0,1, 'Forsaken Warhorse'),
(33297,35328,0,1, 'Stormwind Steed'),
(33416,35330,0,1, 'Exodar Elekk'),
(33298,35332,0,1, 'Darnassian Nightsaber');


-- Textos originales.
DELETE FROM `script_texts` WHERE `entry` <= -1999926 and `entry` >= -1999956;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1999926, 'Coming out of the gate Grand Champions other faction.  ' ,0,0,0,1, 'SAY_START' ),
(0,-1999927, 'Good work! You can get your award from Crusader\'s Coliseum chest!.  ' ,0,1,0,1, 'Win' ),
(0,-1999928, 'You spoiled my grand entrance. Rat.' ,16256,1,0,5, 'SAY_AGGRO' ),
(0,-1999929, 'Did you honestly think an agent if the Kich King would be bested on the field of your pathetic little tournament?' ,16257,1,0,5, 'SAY_AGGRO_1' ),
(0,-1999930, 'I have come to finish my task ' ,16258,1,0,5, 'SAY_AGGRO_2' ),
(0,-1999931, 'This farce ends here!' ,16259,1,0,5, 'SAY_AGGRO_3' ),
(0,-1999932, '[Zombie]Brains.... .... ....' ,0,1,0,5, 'SAY_SLAY' ),
(0,-1999933, 'My roting flash was just getting in the way!' ,16262,1,0,5, 'SAY_DEATH_1' ),
(0,-1999934, 'I have no need for bones to best you!' ,16263,1,0,5, 'SAY_DEATH_2' ),
(0,-1999935, 'No! I must not fail...again...' ,16264,1,0,5, 'SAY_DEATH_3' ),
(0,-1999936, 'What\'s that. up near the rafters ?' ,0,1,0,5, 'detected' ),
(0,-1999937, 'Please change your weapon! Next battle will be start now!' ,0,3,0,5, 'nx' ),
(0,-1999939, 'Excellent work!' ,0,1,0,1, 'work' ),
(0,-1999940, 'Coming out of the gate Crusader\'s Coliseum Champion.' ,0,0,0,1, 'SAY_START3' ),
(0,-1999941, 'Excellent work! You are win Argent champion!' ,0,3,0,0, 'win' ),
(0,-1999942, 'The Sunreavers are proud to present their representatives in this trial by combat.' ,0,0,0,1, 'an1' ),
(0,-1999943, 'Welcome, champions. Today, before the eyes of your leeders and peers, you will prove youselves worthy combatants.' ,0,0,0,1, 'an2' ),
(0,-1999944, 'Fight well, Horde! Lok\'tar Ogar!' ,0,1,0,5, 'Thrall' ),
(0,-1999945, 'Finally, a fight worth watching.' ,0,1,0,5, 'Garrosh' ),
(0,-1999946, 'I did not come here to watch animals tear at each other senselessly, Tirion' ,0,1,0,5, 'King' ),
(0,-1999947, 'You will first be facing three of the Grand Champions of the Tournament! These fierce contenders have beaten out all others to reach the pinnacle of skill in the joust.' ,0,1,0,5, 'Hightlord' ),
(0,-1999948, 'Will tought! You next challenge comes from the Crusade\'s own ranks. You will be tested against their consederable prowess.' ,0,1,0,5, 'Hightlord2' ),
(0,-1999949, 'You may begin!' ,0,0,0,5, 'text' ),
(0,-1999950, 'Well, then. Let us begin.' ,0,1,0,5, 'pal agro' ),
(0,-1999951, 'Take this time to consider your past deeds.' ,16248,1,0,5, 'palsum' ),
(0,-1999952, 'What is the meaning of this?' ,0,1,0,5, 'dk_hightlord' ),
(0,-1999953, 'No...I\'m still too young' ,0,1,0,5, 'die' ),
(0,-1999954, 'Excellent work! You are win Argent champion!' ,0,3,0,0, 'win' );


-- actualizaci?n nueva de todos los npc relacionado a prueba del campe?n
-- Update mob's stats
-- Memory's Stats
-- Health, mana, vehicle id, etc...
-- Equipment
-- Faction for Vehicle

DELETE FROM `creature_template` WHERE `entry` IN 
(33297, 33298, 33299, 33300, 33301, 33408, 33409, 33414, 33416, 33418, 34657, 34658, 34701, 34702, 34703, 34705, 34928, 34942, 35028, 35029, 
35030, 35031, 35032, 35033, 35034, 35035, 35036, 35037, 35038, 35039, 35040, 35041, 35042, 35043, 35044, 35045, 35046, 35047, 35048, 35049, 
35050, 35051, 35052, 35119, 35305, 35306, 35307, 35308, 35309, 35310, 35314, 35323, 35325, 35326, 35327, 35328, 35329, 35330, 35331, 35332, 
35451, 35490, 35517, 35518, 35519, 35520, 35521, 35522, 35523, 35524, 35525, 35527, 35528, 35529, 35530, 35531, 35532, 35533, 35534, 35535, 
35536, 35537, 35538, 35539, 35541, 35542, 35543, 35544, 35545, 35564, 35568, 35569, 35570, 35571, 35572, 35590, 35617, 35633, 35634, 35635, 
35636, 35637, 35638, 35640, 35641, 35644, 35717, 35768, 36082, 36083, 36084, 36085, 36086, 36087, 36088, 36089, 36090, 36091, 36558);


INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES 
('33297','0','0','0','0','0','28912','0','0','0','Stormwind Steed','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','1'),
('33298','0','0','0','0','0','29256','0','0','0','Darnassian Nightsaber','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11723'),
('33299','0','0','0','0','0','29261','0','0','0','Darkspear Raptor','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11159'),
('33300','0','0','0','0','0','29259','0','0','0','Thunder Bluff Kodo','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11159'),
('33301','0','0','0','0','0','28571','0','0','0','Gnomeregan Mechanostrider','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','1'),
('33408','0','0','0','0','0','29258','0','0','0','Ironforge Ram','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','1'),
('33409','0','0','0','0','0','29260','0','0','0','Orgrimmar Wolf','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11159'),
('33414','0','0','0','0','0','29257','0','0','0','Forsaken Warhorse','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11159'),
('33416','0','0','0','0','0','29255','0','0','0','Exodar Elekk','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','11403'),
('33418','0','0','0','0','0','29262','0','0','0','Silvermoon Hawkstrider','','','0','80','80','0','14','14','0','1','1.14286','1','0','20000','30000','0','24','1','2000','0','1','0','8','0','0','0','0','0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','140','1','0','0','0','generic_vehicleAI_toc5','1'),
('34657','36086','0','0','0','0','28735','0','28735','0','Jaelyne Evensong','Grand Champion of Darnassus','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68340','66083','66081','66079','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2095','617297499','0','boss_hunter_toc5','1'),
('34658','0','0','0','0','0','9991','0','0','0','Jaelyne Evensong\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('34701','36083','0','0','0','0','28736','0','28736','0','Colosos','Grand Champion of the Exodar','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67529','67530','67528','67534','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2096','617297499','0','boss_shaman_toc5','1'),
('34702','36082','0','0','0','0','28586','0','28586','0','Ambrose Boltspark','Grand Champion of Gnomeregan','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','64','0','0','0','0','0','0','0','0','0','66044','66042','66045','66043','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','0','617297499','0','boss_mage_toc5','1'),
('34703','36087','0','0','0','0','28564','0','28564','0','Lana Stouthammer','Grand Champion of Ironforge','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67709','67706','67701','0','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','441','1','2093','617297499','0','boss_rouge_toc5','1'),
('34705','36088','0','0','0','0','28560','0','28560','0','Marshal Jacob Alerius','Grand Champion of Stormwind','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2092','617297499','0','boss_warrior_toc5','1'),
('34928','35517','0','0','0','0','29490','0','29490','0','Argent Confessor Paletress','','','0','82','82','2','14','14','0','1','1','1','1','452','678','0','170','14.5','2000','2000','2','0','0','0','0','0','0','0','362','542','136','7','104','0','0','0','0','0','0','0','0','0','66546','66536','66515','66537','0','0','0','0','0','0','0','0','','0','3','8','20','1','0','0','0','0','0','0','0','151','1','235','805257215','0','boss_paletress','1'),
('34942','35531','0','0','0','0','29525','0','29525','0','Memory of Hogger','','','0','82','82','2','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35028','35541','0','0','0','0','29536','0','29536','0','Memory of VanCleef','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35029','35538','0','0','0','0','29556','0','29556','0','Memory of Mutanus','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35030','35530','0','0','0','0','29537','0','29537','0','Memory of Herod','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35031','35536','0','0','0','0','29562','0','29562','0','Memory of Lucifron','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','66619','66552','0','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35032','0','0','0','0','0','14992','0','14992','0','Memory of Thunderaan','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35033','35521','0','0','0','0','14367','0','14367','0','Memory of Chromaggus','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35034','35528','0','0','0','0','29540','0','29540','0','Memory of Hakkar','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35035','0','0','0','0','0','29888','0','0','0','Barrett Ramsey','Argent Coliseum Master','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','768','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','11723'),
('35036','35543','0','0','0','0','29541','0','29541','0','Memory of Vek\'nilash','','','0','82','82','2','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35037','35535','0','0','0','0','29542','0','29542','0','Memory of Kalithresh','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66552','66620','66619','0','0','0','0','0','0','0','0','0','','0','3','29.2313','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35038','35537','0','0','0','0','29543','0','29543','0','Memory of Malchezaar','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35039','35527','0','0','0','0','18698','0','18698','0','Memory of Gruul','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35040','35542','0','0','0','0','29545','0','0','0','Memory of Vashj','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35041','35520','0','0','0','0','29546','0','29546','0','Memory of Archimonde','','','0','82','82','2','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35042','35533','0','0','0','0','29547','0','29547','0','Memory of Illidan','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35043','35523','0','0','0','0','18699','0','18699','0','Memory of Delrissa','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35044','35525','0','0','0','0','23428','0','23428','0','Memory of Entropius','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35045','35534','0','0','0','0','29558','0','29558','0','Memory of Ingvar','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','6','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35046','35522','0','0','0','0','29549','0','29549','0','Memory of Cyanigosa','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35047','35524','0','0','0','0','26644','0','26644','0','Memory of Eck','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35048','35539','0','0','0','0','21401','0','21401','0','Memory of Onyxia','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35049','35529','0','0','0','0','29557','0','29557','0','Memory of Heigan','','','0','82','82','2','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','6','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35050','35532','0','0','0','0','29185','0','29185','0','Memory of Ignis','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','5','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35051','35544','0','0','0','0','28548','0','28548','0','Memory of Vezax','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35052','35519','0','0','0','0','29553','0','29553','0','Memory of Algalon','','','0','82','82','2','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','4','72','0','0','0','0','0','0','0','0','0','67679','67678','67677','0','0','0','0','0','0','0','0','0','','0','3','29','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','npc_memory','1'),
('35119','35518','0','0','0','0','29616','0','29616','0','Eadric the Pure','Grand Champion of the Argent Crusade','','0','82','82','2','14','14','0','1','1','1','1','452','678','0','170','14.5','2000','2000','2','0','0','0','0','0','0','0','362','542','136','7','104','0','0','0','0','0','0','0','0','0','66865','66863','66867','66935','0','0','0','0','0','0','0','0','','0','3','42.5','20','1','0','0','0','0','0','0','0','151','1','834','805257215','0','boss_eadric','1'),
('35305','35306','0','0','0','0','29758','29759','29758','0','Argent Monk','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','8','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67251','67255','67233','67235','0','0','0','0','0','0','7661','7661','','0','3','8','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_argent_soldier','1'),
('35306','0','0','0','0','0','29758','29759','29758','0','Argent Monk','','','0','80','80','0','14','14','0','1','1','1','1','420','630','0','158','12','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67251','67255','67233','67235','0','0','0','0','0','0','7661','7661','','0','3','23.5867','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35307','35308','0','0','0','0','29760','29761','29760','0','Argent Priestess','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','5.5','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67194','36176','67289','67229','0','0','0','0','0','0','7653','7653','','0','3','8','8','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_argent_soldier','1'),
('35308','0','0','0','0','0','29760','29761','29760','0','Argent Priestess','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','8.5','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67194','36176','67289','67229','0','0','0','0','0','0','7653','7653','','0','3','10','8','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35309','35310','0','0','0','0','29762','29763','29762','0','Argent Lightwielder','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','8.4','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67247','67290','15284','67237','0','0','0','0','0','0','7651','7651','','0','3','8','5','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_argent_soldier','1'),
('35310','0','0','0','0','0','29762','29763','29762','0','Argent Lightwielder','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','12.6','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','8','0','0','0','0','0','0','0','0','0','67247','67290','15284','67237','0','0','0','0','0','0','7651','7651','','0','3','8','5','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35314','0','0','0','0','0','29090','0','0','0','Orgrimmar Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35323','0','0','0','0','0','28702','0','0','0','Sen\'jin Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35325','33471','0','0','0','0','28864','0','0','0','Thunder Bluff Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','35325','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35326','0','0','0','0','0','28862','0','0','0','Silvermoon Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35327','0','0','0','0','0','28865','0','0','0','Undercity Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35328','0','0','0','0','0','28863','0','0','0','Stormwind Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35329','0','0','0','0','0','28860','0','0','0','Ironforge Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35330','0','0','0','0','0','28858','0','0','0','Exodar Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35331','0','0','0','0','0','28859','0','0','0','Gnomeregan Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35332','0','0','0','0','0','28857','0','0','0','Darnassus Champion','','','0','80','80','2','35','35','0','1','1.14286','1','1','422','586','0','642','7.5','0','0','1','33554432','8','0','0','0','0','0','345','509','103','7','2048','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','PassiveAI','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','2049','0','0','','11723'),
('35451','35490','0','0','0','0','29837','0','29837','0','The Black Knight','','','0','80','80','2','14','14','0','1','1','1','1','420','630','0','158','11.8','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','35451','0','0','0','0','0','0','0','0','67724','67745','67718','67725','0','0','0','0','0','0','9530','9530','','0','3','5.95238','1','1','0','0','0','0','0','0','0','0','1','0','805257215','0','boss_black_knight','1'),
('35490','0','0','0','0','0','29837','0','29837','0','The Black Knight','','','0','80','80','0','14','14','0','1','1','1','1','420','630','0','158','17.6','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','35490','0','0','0','0','0','0','0','0','67884','68306','67881','67883','0','0','0','0','0','0','10700','10700','','0','3','37.7387','1','1','0','0','0','0','0','0','0','0','1','0','805257215','1','','1'),
('35517','0','0','0','0','0','29490','0','29490','0','Argent Confessor Paletress','','','0','82','82','2','14','14','0','1','1','1','1','452','678','0','170','22.4','2000','2000','2','0','0','0','0','0','0','0','362','542','136','7','104','0','0','0','0','0','0','0','0','0','66546','67674','66515','67675','0','0','0','0','0','0','0','0','','0','3','8','20','1','0','0','0','0','0','0','0','151','1','235','805257215','1','','1'),
('35518','0','0','0','0','0','29616','0','29616','0','Eadric the Pure','Grand Champion of the Argent Crusade','','0','82','82','2','14','14','0','1','1','1','1','452','678','0','170','22.4','2000','2000','2','0','0','0','0','0','0','0','362','542','136','7','104','0','0','0','0','0','0','0','0','0','66865','66863','66867','66935','0','0','0','0','0','0','0','0','','0','3','42.5','20','1','0','0','0','0','0','0','0','151','1','834','805257215','1','','1'),
('35519','0','0','0','0','0','29553','0','29553','0','Memory of Algalon','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','4','72','0','0','0','0','0','0','0','0','0','67679','67678','67677','0','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35520','0','0','0','0','0','29546','0','29546','0','Memory of Archimonde','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35521','0','0','0','0','0','14367','0','14367','0','Memory of Chromaggus','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35522','0','0','0','0','0','29549','0','29549','0','Memory of Cyanigosa','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35523','0','0','0','0','0','18699','0','18699','0','Memory of Delrissa','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35524','0','0','0','0','0','26644','0','26644','0','Memory of Eck','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35525','0','0','0','0','0','23428','0','23428','0','Memory of Entropius','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35527','0','0','0','0','0','18698','0','18698','0','Memory of Gruul','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35528','0','0','0','0','0','29540','0','29540','0','Memory of Hakkar','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35529','0','0','0','0','0','29557','0','29557','0','Memory of Heigan','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','6','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35530','0','0','0','0','0','29537','0','29537','0','Memory of Herod','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35531','0','0','0','0','0','29525','0','29525','0','Memory of Hogger','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35532','0','0','0','0','0','29185','0','29185','0','Memory of Ignis','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','5','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35533','0','0','0','0','0','29547','0','29547','0','Memory of Illidan','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35534','0','0','0','0','0','29558','0','29558','0','Memory of Ingvar','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','6','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35535','0','0','0','0','0','29542','0','29542','0','Memory of Kalithresh','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66552','66620','66619','0','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35536','0','0','0','0','0','29562','0','29562','0','Memory of Lucifron','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','66619','66552','0','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35537','0','0','0','0','0','29543','0','29543','0','Memory of Malchezaar','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','3','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35538','0','0','0','0','0','29556','0','29556','0','Memory of Mutanus','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35539','0','0','0','0','0','21401','0','21401','0','Memory of Onyxia','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','2','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35541','0','0','0','0','0','29536','0','29536','0','Memory of VanCleef','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35542','0','0','0','0','0','29545','0','29545','0','Memory of Vashj','','','0','82','82','0','14','14','0','1','1','0.5','1','452','678','0','170','15','2000','2000','1','0','0','0','0','0','0','0','362','542','136','7','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35543','0','0','0','0','0','29541','0','29541','0','Memory of Vek\'nilash','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35544','0','0','0','0','0','28548','0','28548','0','Memory of Vezax','','','0','82','82','0','14','14','0','1','1','0.5','1','330','495','0','124','20.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','10','72','0','0','0','0','0','0','0','0','0','66620','67679','66619','67678','0','0','0','0','0','0','0','0','','0','3','122.031','25','1','0','0','0','0','0','0','0','150','1','0','617297499','0','','1'),
('35545','0','0','0','0','0','25528','0','25528','0','Risen Jaeren Sunsworn','Black Knight\'s Minion','','0','80','80','2','14','14','0','1','1','1','0','420','630','0','158','1.4','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67774','67879','67729','67886','0','0','0','0','0','0','0','0','','0','3','2.5','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_risen_ghoul','1'),
('35564','35568','0','0','0','0','25528','0','25528','0','Risen Arelas Brightstar','Black Knight\'s Minion','','0','80','80','2','14','14','0','1','1','1','0','420','630','0','158','1.4','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67774','67879','67729','67886','0','0','0','0','0','0','0','0','','0','3','2.5','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_risen_ghoul','1'),
('35568','0','0','0','0','0','25528','0','25528','0','Risen Arelas Brightstar','Black Knight\'s Minion','','0','80','80','0','14','14','0','1','1','1','0','420','630','0','158','1.4','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67879','67886','67880','0','0','0','0','0','0','0','0','0','','0','3','9.43467','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35569','36085','0','0','0','0','28637','0','28637','0','Eressea Dawnsinger','Grand Champion of Silvermoon','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','66044','66042','66045','66043','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2021','617297499','0','boss_mage_toc5','1'),
('35570','36091','0','0','0','0','28588','0','28588','0','Zul\'tore','Grand Champion of Sen\'jin','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68340','66083','66081','66079','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2019','617297499','0','boss_hunter_toc5','1'),
('35571','36090','0','0','0','0','28597','0','28597','0','Runok Wildmane','Grand Champion of the Thunder Bluff','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67529','67530','67528','67534','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2025','617297499','0','boss_shaman_toc5','1'),
('35572','36089','0','0','0','0','28587','0','28587','0','Mokra the Skullcrusher','Grand Champion of Orgrimmar','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','441','1','2018','617297499','0','boss_warrior_toc5','1'),
('35590','35717','0','0','0','0','24996','24999','24997','0','Risen Champion','Black Knight\'s Minion','','0','80','80','2','14','14','0','1','1','1','0','420','630','0','158','1','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67774','67879','67729','67886','0','0','0','0','0','0','0','0','','0','3','1.5','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35617','36084','0','0','0','0','28589','0','28589','0','Deathstalker Visceri','Grand Champion of Undercity','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','10.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67709','67706','67701','0','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2020','617297499','0','boss_rouge_toc5','1'),
('35633','0','0','0','0','0','28571','0','0','0','Ambrose Boltspark\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35634','0','0','0','0','0','10718','0','0','0','Deathstalker Visceri\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35635','0','0','0','0','0','28607','0','0','0','Eressea Dawnsinger\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35636','0','0','0','0','0','2787','0','0','0','Lana Stouthammer\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35637','0','0','0','0','0','29284','0','0','0','Marshal Jacob Alerius\' Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35638','0','0','0','0','0','29879','0','0','0','Mokra the Skullcrusher\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35640','0','0','0','0','0','29880','0','0','0','Runok Wildmane\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35641','0','0','0','0','0','29261','0','0','0','Zul\'tore\'s Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('35644','0','0','0','0','0','28918','0','0','0','Argent Warhorse','','vehichleCursor','0','80','80','2','35','35','0','1','2','1','0','10000','20000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','10','0','0','0','0','0','0','0','0','0','0','62544','62575','63010','66482','0','0','0','0','0','486','0','0','','0','3','40','1','1','0','0','0','0','0','0','0','157','1','0','0','0','','11723'),
('35717','0','0','0','0','0','24996','24999','24997','0','Risen Champion','Black Knight\'s Minion','','0','80','80','0','14','14','0','1','1','1','0','420','630','0','158','1.4','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','72','0','0','0','0','0','0','0','0','0','67774','67879','67729','67886','0','0','0','0','0','0','0','0','','0','3','7.076','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1'),
('35768','0','0','0','0','0','29255','0','0','0','Colosos\' Mount','','','0','80','80','2','14','14','0','1','1.14286','1','0','20000','30000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','486','0','0','','0','3','10','1','1','0','0','0','0','0','0','0','0','1','0','0','0','generic_vehicleAI_toc5','11723'),
('36082','0','0','0','0','0','28586','0','28586','0','Ambrose Boltspark','Grand Champion of Gnomeregan','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','15.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','64','0','0','0','0','0','0','0','0','0','68312','68310','66045','68311','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','0','617297499','1','','1'),
('36083','0','0','0','0','0','28736','0','28736','0','Colosos','Grand Champion of the Exodar','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','17','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68319','67530','68318','67534','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2096','617297499','1','','1'),
('36084','0','0','0','0','0','28589','0','28589','0','Deathstalker Visceri','Grand Champion of Undercity','','0','80','80','0','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','67709','67706','67701','0','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','0','1','2020','617297499','1','','1'),
('36085','0','0','0','0','0','28637','0','28637','0','Eressea Dawnsinger','Grand Champion of Silvermoon','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68312','68310','66045','68311','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2021','617297499','1','','1'),
('36086','0','0','0','0','0','28735','0','28735','0','Jaelyne Evensong','Grand Champion of Darnassus','','0','80','80','2','1802','1802','0','1','1','1','1','420','630','0','158','15.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68340','66083','66081','66079','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2095','617297499','1','','1'),
('36087','0','0','0','0','0','28564','0','28564','0','Lana Stouthammer','Grand Champion of Ironforge','','0','80','80','0','1802','1802','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','441','1','2093','617297499','1','','1'),
('36088','0','0','0','0','0','28560','0','28560','0','Marshal Jacob Alerius','Grand Champion of Stormwind','','0','80','80','0','1802','1802','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','0','1','2092','617297499','1','','1'),
('36089','0','0','0','0','0','28587','0','28587','0','Mokra the Skullcrusher','Grand Champion of Orgrimmar','','0','80','80','0','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','441','1','2018','617297499','1','','1'),
('36090','0','0','0','0','0','28597','0','28597','0','Runok Wildmane','Grand Champion of the Thunder Bluff','','0','80','80','2','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','2','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68319','67530','67528','67534','0','0','0','0','0','0','0','0','','0','3','15','20','1','0','0','0','0','0','0','0','0','1','2025','617297499','1','','1'),
('36091','0','0','0','0','0','28588','0','28588','0','Zul\'tore','Grand Champion of Sen\'jin','','0','80','80','0','1801','1801','0','1','1','1','1','420','630','0','158','15.2','2000','2000','1','0','0','0','0','0','0','0','336','504','126','7','0','0','0','0','0','0','0','0','0','0','68340','66083','66081','66079','0','0','0','0','0','0','0','0','','0','3','35.38','20','1','0','0','0','0','0','0','0','0','1','2019','617297499','1','','1'),
('36558','0','0','0','0','0','29283','0','0','0','Argent Battleworg','','vehichleCursor','0','80','80','2','35','35','0','1','2','1','0','10000','20000','0','642','1','0','0','1','0','8','0','0','0','0','0','345','509','103','10','0','0','0','0','0','0','0','0','0','0','62544','62575','63010','66482','0','0','0','0','0','486','0','0','','0','3','40','1','1','0','0','0','0','0','0','0','157','1','0','0','0','','11723');

-- Anuncios al comienzo del evento.
DELETE FROM `creature_template` WHERE `entry` in (35591,35592);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35591, 0, 0, 0, 0, 0, 29894, 0, 0, 0, 'Jaeren Sunsworn', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart'),
(35592, 0, 0, 0, 0, 0, 29893, 0, 0, 0, 'Arelas Brightstar', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart');


-- Fountain of Light
DELETE FROM `creature_template` WHERE `entry`=35311;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35311, 0, 0, 0, 0, 0, 27769, 0, 0, 0, 'Fountain of Light', '', '', 0, 79, 80, 0, 14, 14, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');


-- Grifo esquel?tico del Caballero Negro http://es.wowhead.com/npc=35491
DELETE FROM `creature_template` WHERE `entry`=35491;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35491, 0, 0, 0, 0, 0, 29842, 0, 0, 0, 'Black Knight\'s Skeletal Gryphon', '', '', 0, 80, 80, 2, 35, 35, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1048576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 0, 0, '', 0, 4, 15, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, 0, 'npc_black_knight_skeletal_gryphon');
DELETE FROM `script_waypoint` WHERE `entry`=35491;
INSERT INTO `script_waypoint` VALUES
(35491,1,781.513062, 657.989624, 466.821472,0,''),
(35491,2,759.004639, 665.142029, 462.540771,0,''),
(35491,3,732.936646, 657.163879, 452.678284,0,''),
(35491,4,717.490967, 646.008545, 440.136902,0,''),
(35491,5,707.570129, 628.978455, 431.128632,0,''),
(35491,6,705.164063, 603.628418, 422.956635,0,''),
(35491,7,716.350891, 588.489746, 420.801666,0,''),
(35491,8,741.702881, 580.167725, 420.523010,0,''),
(35491,9,761.634033, 586.382690, 422.206207,0,''),
(35491,10,775.982666, 601.991943, 423.606079,0,''),
(35491,11,769.051025, 624.686157, 420.035126,0,''),
(35491,12,756.582214, 631.692322, 412.529785,0,''),
(35491,13,744.841,634.505,411.575,0,'');
-- Grifo esquel?tico del Caballero Negro antes de comenzar la batalla
DELETE FROM `creature_template` WHERE `entry` in (35492);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35492, 0, 0, 0, 0, 0, 29842, 0, 0, 0, 'Black Knight\'s Skeletal Gryphon', '', '', 0, 80, 80, 2, 35, 35, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1048576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 0, 0, '', 0, 3, 15, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, 0, 'npc_gr');
DELETE FROM `script_waypoint` WHERE `entry`=35492;
INSERT INTO `script_waypoint` VALUES
(35492,1,741.067078, 634.471558, 411.569366,0,''),
(35492,2,735.726196, 639.247498, 414.725555,0,''),
(35492,3,730.187256, 653.250977, 418.913269,0,''),
(35492,4,734.517700, 666.071350, 426.259247,0,''),
(35492,5,739.638489, 675.339417, 438.226776,0,''),
(35492,6,741.833740, 698.797302, 456.986328,0,''),
(35492,7,734.647339, 711.084778, 467.165314,0,''),
(35492,8,715.388489, 723.820862, 470.333588,0,''),
(35492,9,687.178711, 730.140503, 470.569336,0,'');



-- Spawn Announcer in normal/heroic mode
DELETE FROM `creature` WHERE `id`=35004;
DELETE FROM `creature` WHERE `guid`=130961;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(130961, 35004, 650, 3, 1, 0, 0, 746.626, 618.54, 411.09, 4.63158, 86400, 0, 0, 10635, 0, 0, 0);

-- Da?o
UPDATE `creature_template` SET `dmg_multiplier`= (dmg_multiplier*1.40) WHERE `entry` IN (SELECT `id` FROM creature WHERE `map`=650);
-- El Caballero Negro 35451 11.8 - 35490 17.6p
UPDATE `creature_template` SET `dmg_multiplier`= (dmg_multiplier*2) WHERE `entry`= 35451;
UPDATE `creature_template` SET `dmg_multiplier`= (dmg_multiplier*2) WHERE `entry`= 35490;

-- CREATURES SPAWN TRIAL OF CHAMPION MAP 650
DELETE FROM `creature` WHERE `map`=650;
SET @GUID := 500000;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(@GUID,36558,650,3,1,0,0,726.826,661.201,412.472,4.66003,86400,0,0,1,0,0,0),
(@GUID+1,36558,650,3,1,0,0,716.665,573.495,412.475,0.977384,86400,0,0,1,0,0,0),
(@GUID+2,36558,650,3,1,0,0,705.497,583.944,412.476,0.698132,86400,0,0,1,0,0,0),
(@GUID+3,36558,650,3,1,0,0,770.486,571.552,412.475,2.05949,86400,0,0,1,0,0,0),
(@GUID+4,36558,650,3,1,0,0,717.443,660.646,412.467,4.92183,86400,0,0,1,0,0,0),
(@GUID+5,36558,650,3,1,0,0,700.531,591.927,412.475,0.523599,86400,0,0,1,0,0,0),
(@GUID+6,36558,650,3,1,0,0,790.177,589.059,412.475,2.56563,86400,0,0,1,0,0,0),
(@GUID+7,36558,650,3,1,0,0,702.165,647.267,412.475,5.68977,86400,0,0,1,0,0,0),
(@GUID+8,36558,650,3,1,0,0,773.097,660.733,412.467,4.45059,86400,0,0,1,0,0,0),
(@GUID+9,36558,650,3,1,0,0,793.052,642.851,412.474,3.63029,86400,0,0,1,0,0,0),
(@GUID+10,36558,650,3,1,0,0,778.741,576.049,412.476,2.23402,86400,0,0,1,0,0,0),
(@GUID+11,36558,650,3,1,0,0,788.016,650.788,412.475,3.80482,86400,0,0,1,0,0,0),
(@GUID+12,35644,650,3,1,0,0,704.943,651.33,412.475,5.60251,86400,0,0,1,0,0,0),
(@GUID+13,35644,650,3,1,0,0,774.898,573.736,412.475,2.14675,86400,0,0,1,0,0,0),
(@GUID+14,35644,650,3,1,0,0,699.943,643.37,412.474,5.77704,86400,0,0,1,0,0,0),
(@GUID+15,35644,650,3,1,0,0,712.594,576.26,412.476,0.890118,86400,0,0,1,0,0,0),
(@GUID+16,35644,650,3,1,0,0,793.009,592.667,412.475,2.6529,86400,0,0,1,0,0,0),
(@GUID+17,35644,650,3,1,0,0,702.967,587.649,412.475,0.610865,86400,0,0,1,0,0,0),
(@GUID+18,35644,650,3,1,0,0,768.255,661.606,412.47,4.55531,86400,0,0,1,0,0,0),
(@GUID+19,35644,650,3,1,0,0,720.569,571.285,412.475,1.06465,86400,0,0,1,0,0,0),
(@GUID+20,35644,650,3,1,0,0,787.439,584.969,412.476,2.47837,86400,0,0,1,0,0,0),
(@GUID+21,35644,650,3,1,0,0,722.363,660.745,412.468,4.83456,86400,0,0,1,0,0,0),
(@GUID+22,35644,650,3,1,0,0,790.49,646.533,412.474,3.71755,86400,0,0,1,0,0,0),
(@GUID+23,35644,650,3,1,0,0,777.564,660.3,412.467,4.34587,86400,0,0,1,0,0,0),
(@GUID+24,35591,650,3,1,0,0,746.626,618.54,411.09,4.63158,86400,0,0,10635,0,0,0),
(@GUID+25,35016,650,3,1,0,0,702.274,638.76,412.47,0,120,0,0,1,0,0,0),
(@GUID+26,35016,650,3,1,0,0,697.285,618.253,412.476,0,120,0,0,1,0,0,0),
(@GUID+27,35016,650,3,1,0,0,714.486,581.722,412.476,0,120,0,0,1,0,0,0),
(@GUID+28,35016,650,3,1,0,0,703.884,596.601,412.474,0,120,0,0,1,0,0,0),
(@GUID+29,35016,650,3,1,0,0,712.413,653.931,412.474,0,120,0,0,1,0,0,0),
(@GUID+30,34977,650,3,1,0,0,733.809,545.215,442.075,1.41372,120,0,0,1,0,0,0),
(@GUID+31,34977,650,3,1,0,0,730.998,552.719,438.812,1.3439,120,0,0,1,0,0,0),
(@GUID+32,34977,650,3,1,0,0,734.411,560.158,435.501,1.37881,120,0,0,1,0,0,0),
(@GUID+33,34977,650,3,1,0,0,726.38,557.151,436.978,1.25664,120,0,0,1,0,0,0),
(@GUID+34,34979,650,3,1,0,0,709.576,570.106,435.504,0.942478,120,0,0,1,0,0,0),
(@GUID+35,34979,650,3,1,0,0,712.873,563.172,436.967,1.02974,120,0,0,1,0,0,0),
(@GUID+36,34979,650,3,1,0,0,714.34,553.708,440.223,1.11701,120,0,0,1,0,0,0),
(@GUID+37,34979,650,3,1,0,0,700.273,559.224,442.08,0.925025,120,0,0,1,0,0,0),
(@GUID+38,34966,650,3,1,0,0,718.917,564.078,435.504,1.11701,120,0,0,1,0,0,0),
(@GUID+39,34966,650,3,1,0,0,721.971,548.191,442.072,1.23918,120,0,0,1,0,0,0),
(@GUID+40,34966,650,3,1,0,0,718.405,555.92,438.803,1.15192,120,0,0,1,0,0,0),
(@GUID+41,34966,650,3,1,0,0,725.661,560.835,435.503,1.23918,120,0,0,1,0,0,0),
(@GUID+42,34858,650,3,1,0,0,697.241,583.858,435.504,0.628319,120,0,0,1,0,0,0),
(@GUID+43,34858,650,3,1,0,0,689.635,582.823,438.819,0.558505,120,0,0,1,0,0,0),
(@GUID+44,34858,650,3,1,0,0,696.26,577.507,436.966,0.698132,120,0,0,1,0,0,0),
(@GUID+45,34858,650,3,1,0,0,682.856,586.2,440.243,0.471239,120,0,0,1,0,0,0),
(@GUID+46,34858,650,3,1,0,0,688.012,573.852,442.074,0.663225,120,0,0,1,0,0,0),
(@GUID+47,34860,650,3,1,0,0,699.005,654.894,435.504,5.53269,120,0,0,1,0,0,0),
(@GUID+48,34860,650,3,1,0,0,693.635,654.892,436.963,5.60251,120,0,0,1,0,0,0),
(@GUID+49,34860,650,3,1,0,0,690.486,661.661,440.209,5.55015,120,0,0,1,0,0,0),
(@GUID+50,34860,650,3,1,0,0,684.069,656.681,442.074,5.68977,120,0,0,1,0,0,0),
(@GUID+52,34860,650,3,1,0,0,686.866,650.837,438.779,5.75959,120,0,0,1,0,0,0),
(@GUID+53,34861,650,3,1,0,0,677.17,640.74,442.069,6.00393,120,0,0,1,0,0,0),
(@GUID+54,34861,650,3,1,0,0,689.436,639.259,435.503,5.95157,120,0,0,1,0,0,0),
(@GUID+55,34861,650,3,1,0,0,679.981,648.878,440.198,5.86431,120,0,0,1,0,0,0),
(@GUID+56,34861,650,3,1,0,0,686.392,643.351,436.973,5.88176,120,0,0,1,0,0,0),
(@GUID+57,34861,650,3,1,0,0,692.406,644.87,435.504,5.8294,120,0,0,1,0,0,0),
(@GUID+58,34970,650,3,1,0,0,769.951,547.875,442.072,1.79769,120,0,0,1,0,0,0),
(@GUID+59,34970,650,3,1,0,0,761.217,549.142,440.246,1.58825,120,0,0,1,0,0,0),
(@GUID+60,34970,650,3,1,0,0,764.08,553.434,438.828,1.8675,120,0,0,1,0,0,0),
(@GUID+61,34857,650,3,1,0,0,675.281,589.988,442.081,0.383972,120,0,0,1,0,0,0),
(@GUID+62,34857,650,3,1,0,0,675.115,597.719,442.073,0.279253,120,0,0,1,0,0,0),
(@GUID+63,34857,650,3,1,0,0,692.854,590.632,435.504,0.471239,120,0,0,1,0,0,0),
(@GUID+64,34857,650,3,1,0,0,689.623,598.045,435.503,0.331613,120,0,0,1,0,0,0),
(@GUID+65,34857,650,3,1,0,0,684.964,591.017,438.848,0.418879,120,0,0,1,0,0,0),
(@GUID+66,34975,650,3,1,0,0,779.997,550.694,442.077,2.05949,120,0,0,1,0,0,0),
(@GUID+67,34975,650,3,1,0,0,773.502,555.516,438.825,1.95477,120,0,0,1,0,0,0),
(@GUID+68,34859,650,3,1,0,0,687.965,629.611,435.498,6.19592,120,0,0,1,0,0,0),
(@GUID+69,34859,650,3,1,0,0,688.731,604.689,435.501,0.20944,120,0,0,1,0,0,0),
(@GUID+70,34859,650,3,1,0,0,677.986,634.102,440.245,5.78437,120,0,0,1,0,0,0),
(@GUID+71,34859,650,3,1,0,0,680.599,603.986,438.794,0.191986,120,0,0,1,0,0,0),
(@GUID+72,34859,650,3,1,0,0,685.113,600.431,436.97,0.279253,120,0,0,1,0,0,0),
(@GUID+73,34859,650,3,1,0,0,685.118,634.405,436.976,6.0912,120,0,0,1,0,0,0),
(@GUID+74,34868,650,3,1,0,0,806.488,574.615,442.076,2.49582,120,0,0,1,0,0,0),
(@GUID+75,34868,650,3,1,0,0,799.194,575.25,438.801,2.37365,120,0,0,1,0,0,0),
(@GUID+76,34974,650,3,1,0,0,790.608,559.269,442.073,2.40855,120,0,0,1,0,0,0),
(@GUID+77,34869,650,3,1,0,0,813.502,644.877,440.254,3.49066,120,0,0,1,0,0,0),
(@GUID+78,34869,650,3,1,0,0,818.512,640.599,442.078,3.38594,120,0,0,1,0,0,0),
(@GUID+79,34869,650,3,1,0,0,813.3,650.717,442.073,3.49066,120,0,0,1,0,0,0),
(@GUID+80,34856,650,3,1,0,0,813.635,587.592,442.069,2.70526,120,0,0,1,0,0,0),
(@GUID+81,34856,650,3,1,0,0,814.332,597.781,440.261,2.89725,120,0,0,1,0,0,0),
(@GUID+82,34856,650,3,1,0,0,808.924,586.035,440.295,2.63545,120,0,0,1,0,0,0),
(@GUID+83,34870,650,3,1,0,0,818.163,607.13,440.209,2.94961,120,0,0,1,0,0,0),
(@GUID+84,34870,650,3,1,0,0,818.134,626.964,440.218,3.28122,120,0,0,1,0,0,0),
(@GUID+85,34871,650,3,1,0,0,810.608,659.83,442.086,3.68265,120,0,0,1,0,0,0),
(@GUID+86,34871,650,3,1,0,0,800.194,660.729,438.769,3.82227,120,0,0,1,0,0,0),
(@GUID+87,34871,650,3,1,0,0,805.472,648.721,436.927,3.50811,120,0,0,1,0,0,0),
(@GUID+88,34905,650,3,1,0,0,696.359,653.587,435.504,5.53252,120,0,0,1,0,0,0),
(@GUID+89,34903,650,3,1,0,0,697.116,583.052,435.504,0.628319,120,0,0,1,0,0,0),
(@GUID+90,34902,650,3,1,0,0,689.196,597,435.503,0.349066,120,0,0,1,0,0,0),
(@GUID+91,34883,650,3,1,0,0,687.83,617.649,435.493,1.58825,120,0,0,1,0,0,0),
(@GUID+92,34901,650,3,1,0,0,687.16,618.132,435.489,0,120,0,0,1,0,0,0),
(@GUID+93,34904,650,3,1,0,0,690.596,642,435.504,5.88176,120,0,0,1,0,0,0);


-- cajas que las spawnea el core
DELETE FROM `gameobject_template` WHERE `entry` IN (195709, 195374, 195323); -- modo normal
DELETE FROM `gameobject_template` WHERE `entry` IN (195710, 195375, 195324); -- modo heroico
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES 
('195323','3','9069','Confessor\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','27327','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195324','3','9069','Confessor\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','27417','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195374','3','9069','Eadric\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','27325','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195375','3','9069','Eadric\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','27416','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195709','3','9069','Champion\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','27321','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723'),
('195710','3','9069','Champion\'s Cache','','','','0','0','2','0','0','0','0','0','0','1634','27414','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11723');

-- GAMEOBJECTS SPAWN TRIAL OF CHAMPION MAP 650
DELETE FROM `gameobject` WHERE `map`=650;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
('150063','196398','650','3','1','801.663','624.806','412.344','-1.3439','0','0','0','0','0','0','0'),
('150064','196398','650','3','1','784.533','660.238','412.389','-0.715585','0','0','0','0','0','0','0'),
('150065','196398','650','3','1','710.325','660.708','412.387','0.698132','0','0','0','0','0','0','0'),
('150066','196398','650','3','1','692.127','610.575','412.347','1.85005','0','0','0','0','0','0','0'),
('150067','195477','650','3','1','813.13','617.632','413.039','0','0','0','0','0','0','0','0'),
('150068','195486','650','3','1','813.12','617.59','413.031','0','0','0','0','0','0','0','0'),
('150069','195481','650','3','1','746.156','549.464','412.881','1.5708','0','0','0','0','0','0','0'),
('150070','195480','650','3','1','746.156','549.464','412.881','1.5708','0','0','0','0','0','0','0'),
('150071','195479','650','3','1','746.156','549.464','412.881','1.5708','0','0','0','0','0','0','0'),
('150072','195478','650','3','1','746.156','549.464','412.881','1.5708','0','0','0','0','0','0','0'),
('150075','195485','650','3','1','844.685','623.408','159.109','0','0','0','0','0','0','0','0'),
('150081','195647','650','3','1','746.698','677.469','412.339','1.5708','0','0','1','0','0','0','1'),
('150074','195649','650','3','65535','685.625','617.977','412.285','6.28137','0','0','0.000909718','-1','25','0','1'),
('150078','180723','650','3','1','779.951','655.656','421.818','-2.35619','0','0','0','0','0','0','0'),
('150079','180723','650','3','1','782.309','582.892','421.546','2.25147','0','0','0','0','0','0','0'),
('150073','195648','650','3','65535','746.561','557.002','412.393','1.57292','0','0','0.707856','0.706357','25','0','1'),
('150076','195650','650','3','65535','807.66','618.091','412.394','3.12015','0','0','0.999943','0.0107224','25','0','0'),
('150082','180708','650','3','1','712.521','655.648','424.593','-0.767944','0','0','0','0','0','0','0'),
('150083','180708','650','3','1','704.793','600.736','429.519','0.436332','0','0','0','0','0','0','0'),
('150084','180708','650','3','1','704.302','636.326','425.136','-0.418879','0','0','0','0','0','0','0'),
('150085','180703','650','3','1','712.521','655.648','424.593','-0.767944','0','0','0','0','0','0','0'),
('150086','180703','650','3','1','714.158','585.533','425.579','0.715585','0','0','0','0','0','0','0'),
('150087','180703','650','3','1','704.793','600.736','429.519','0.436332','0','0','0','0','0','0','0'),
('150088','180730','650','3','1','714.158','585.533','425.579','0.715585','0','0','0','0','0','0','0'),
('150089','180730','650','3','1','704.793','600.736','429.519','0.436332','0','0','0','0','0','0','0'),
('150090','180736','650','3','1','792.309','598.457','424.636','2.70526','0','0','0','0','0','0','0'),
('150091','180736','650','3','1','794.441','638.306','425.7','-2.77507','0','0','0','0','0','0','0'),
('150092','180736','650','3','1','779.951','655.656','421.818','-2.35619','0','0','0','0','0','0','0'),
('150093','180736','650','3','1','782.309','582.892','421.546','2.25147','0','0','0','0','0','0','0'),
('150094','180720','650','3','1','779.951','655.656','421.818','-2.35619','0','0','0','0','0','0','0'),
('150095','180720','650','3','1','782.309','582.892','421.546','2.25147','0','0','0','0','0','0','0'),
('150096','180738','650','3','1','794.441','638.306','425.7','-2.77507','0','0','0','0','0','0','0'),
('150097','180738','650','3','1','782.309','582.892','421.546','2.25147','0','0','0','0','0','0','0'),
('150098','180728','650','3','1','704.302','636.326','425.136','-0.418879','0','0','0','0','0','0','0'),
('150099','180728','650','3','1','714.158','585.533','425.579','0.715585','0','0','0','0','0','0','0'),
('150100','180728','650','3','1','712.521','655.648','424.593','-0.767944','0','0','0','0','0','0','0');
DELETE FROM `gameobject` WHERE `id` IN (195709, 195374, 195323, 195710, 195375, 195324); -- objetos spawneados en ctdb, no deberian estar

-- drop and conditions
DELETE FROM `conditions` WHERE `SourceGroup` IN (35451, 35490, 27327, 21417, 27325, 27416, 27321, 27414); 
INSERT INTO `conditions` VALUES
(1, 35451, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(1, 35490, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 27327, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 21417, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 27325, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 27416, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 27321, 43228, 0, 1, 57940, 0, 0, 0, '', NULL),
(4, 27414, 43228, 0, 1, 57940, 0, 0, 0, '', NULL);

-- The Black Knight
-- http://www.wowhead.com/npc=35451/el-caballero-negro#drops:mode=normal:0+1-15
-- Normal
-- Fix drops rates
DELETE FROM `creature_loot_template` WHERE (`entry`=35451);
INSERT INTO `creature_loot_template` VALUES 
(35451, 47216, 16.666, 1, 2, 1, 1),
(35451, 47215, 16.666, 1, 2, 1, 1),
(35451, 47226, 16.666, 1, 2, 1, 1),
(35451, 47227, 16.666, 1, 2, 1, 1),
(35451, 47229, 16.666, 1, 2, 1, 1),
(35451, 47232, 16.666, 1, 2, 1, 1),
(35451, 47222, 16.666, 1, 1, 1, 1),
(35451, 47221, 16.666, 1, 1, 1, 1),
(35451, 47228, 16.666, 1, 1, 1, 1),
(35451, 47220, 16.666, 1, 1, 1, 1),
(35451, 47230, 16.666, 1, 1, 1, 1),
(35451, 47231, 16.666, 1, 1, 1, 1),
(35451, 43228, 28, 1, 0, 3, 3);

-- http://www.wowhead.com/npc=35451/el-caballero-negro#drops:mode=heroic:0+1-15
-- Hero
-- Fix rates and drops and some missing
DELETE FROM `creature_loot_template` WHERE (`entry`=35490);
INSERT INTO `creature_loot_template` VALUES 
(35490, 47565, 14.285, 1, 2, 1, 1),
(35490, 47568, 14.285, 1, 2, 1, 1),
(35490, 47569, 14.285, 1, 2, 1, 1),
(35490, 47564, 14.285, 1, 2, 1, 1),
(35490, 47567, 14.285, 1, 2, 1, 1),
(35490, 47560, 14.285, 1, 2, 1, 1),
(35490, 49682, 14.285, 1, 2, 1, 1),
(35490, 47566, 16.666, 1, 1, 1, 1),
(35490, 47562, 16.666, 1, 1, 1, 1),
(35490, 47529, 16.666, 1, 1, 1, 1),
(35490, 47561, 16.666, 1, 1, 1, 1),
(35490, 47563, 16.666, 1, 1, 1, 1),
(35490, 47527, 16.666, 1, 1, 1, 1),
(35490, 43228, 2, 1, 0, 4, 4),
(35490, 43102, 100, 1, 0, 1, 1),
(35490, 48418, -100, 1, 0, 1, 1),
(35490, 47241, 100, 1, 0, 1, 1),
(35490, 44990, 47, 1, 0, 1, 1),
(35490, 34057, 1.3, 1, 0, 1, 2);

-- Confessor's Cache
-- http://www.wowhead.com/object=195323#contains:mode=normal:0+1-15
-- Normal (Entry: 195323)
-- fix drops rates and groups
DELETE FROM `gameobject_loot_template` WHERE (`entry`=27327);
INSERT INTO `gameobject_loot_template` VALUES 
(27327, 43228, 100, 1, 0, 3, 3),
(27327, 47176, 8.333, 1, 1, 1, 1),
(27327, 47177, 8.333, 1, 1, 1, 1),
(27327, 47178, 8.333, 1, 1, 1, 1),
(27327, 47181, 8.333, 1, 1, 1, 1),
(27327, 47185, 8.333, 1, 1, 1, 1),
(27327, 47211, 8.333, 1, 1, 1, 1),
(27327, 47212, 8.333, 1, 1, 1, 1),
(27327, 47213, 8.333, 1, 1, 1, 1),
(27327, 47214, 8.333, 1, 1, 1, 1),
(27327, 47217, 8.333, 1, 1, 1, 1),
(27327, 47218, 8.333, 1, 1, 1, 1),
(27327, 47219, 8.333, 1, 1, 1, 1);

-- http://www.wowhead.com/object=195323#contains:mode=heroic:0+1-15
-- Heroic (Entry: 195324)
-- Fix rates and groups
UPDATE `gameobject_template` SET `data1`='21417' WHERE entry='195324';
DELETE FROM `gameobject_loot_template` WHERE (`entry`=21417);
INSERT INTO `gameobject_loot_template` VALUES 
(21417, 47514, 8.333, 1, 1, 1, 1),
(21417, 47512, 8.333, 1, 1, 1, 1),
(21417, 47511, 8.333, 1, 1, 1, 1),
(21417, 47510, 8.333, 1, 1, 1, 1),
(21417, 47500, 8.333, 1, 1, 1, 1),
(21417, 47245, 8.333, 1, 1, 1, 1),
(21417, 47522, 8.333, 1, 1, 1, 1),
(21417, 47498, 8.333, 1, 1, 1, 1),
(21417, 47497, 8.333, 1, 1, 1, 1),
(21417, 47496, 8.333, 1, 1, 1, 1),
(21417, 47495, 8.333, 1, 1, 1, 1),
(21417, 47494, 8.333, 1, 1, 1, 1),
(21417, 47241, 100, 1, 0, 1, 1),
(21417, 44990, 40, 1, 0, 1, 1),
(21417, 43228, 23, 1, 0, 4, 4),
(21417, 34057, 1.3, 1, 0, 1, 2);

-- Eadric's Cache
-- http://www.wowhead.com/object=195374#contains:mode=normal:0+1-15
-- Normal (entry: 195374)
-- Fix groups and drops
DELETE FROM `gameobject_loot_template` WHERE (`entry`=27325);
INSERT INTO `gameobject_loot_template` VALUES 
(27325, 47176, 8.333, 1, 1, 1, 1),
(27325, 47200, 8.333, 1, 1, 1, 1),
(27325, 47178, 8.333, 1, 1, 1, 1),
(27325, 47201, 8.333, 1, 1, 1, 1),
(27325, 47213, 8.333, 1, 1, 1, 1),
(27325, 47181, 8.333, 1, 1, 1, 1),
(27325, 47197, 8.333, 1, 1, 1, 1),
(27325, 47177, 8.333, 1, 1, 1, 1),
(27325, 47202, 8.333, 1, 1, 1, 1),
(27325, 47199, 8.333, 1, 1, 1, 1),
(27325, 47185, 8.333, 1, 1, 1, 1),
(27325, 43228, 21, 1, 0, 3, 3),
(27325, 47210, 8.333, 1, 1, 1, 1);

-- http://www.wowhead.com/object=195374#contains:mode=heroic:0+1-15
-- Hero (Entry: 195375)
-- Fix groups and rates
DELETE FROM `gameobject_loot_template` WHERE (`entry`=27416);
INSERT INTO `gameobject_loot_template` VALUES 
(27416, 47509, 8.333, 1, 1, 1, 1),
(27416, 47508, 8.333, 1, 1, 1, 1),
(27416, 47504, 8.333, 1, 1, 1, 1),
(27416, 47503, 8.333, 1, 1, 1, 1),
(27416, 47502, 8.333, 1, 1, 1, 1),
(27416, 47501, 8.333, 1, 1, 1, 1),
(27416, 47500, 8.333, 1, 1, 1, 1),
(27416, 47498, 8.333, 1, 1, 1, 1),
(27416, 47497, 8.333, 1, 1, 1, 1),
(27416, 47496, 8.333, 1, 1, 1, 1),
(27416, 47495, 8.333, 1, 1, 1, 1),
(27416, 47494, 8.333, 1, 1, 1, 1),
(27416, 47241, 100, 1, 0, 1, 1),
(27416, 44990, 40, 1, 0, 1, 1),
(27416, 43228, 23, 1, 0, 4, 4),
(27416, 34057, 1.3, 1, 0, 1, 2);

-- Champion's Cache
-- http://www.wowhead.com/object=195709#contains:mode=normal:0+1-15
-- Normal (Entry: 195709)
-- Fix rates
DELETE FROM `gameobject_loot_template` WHERE (`entry`=27321);
INSERT INTO `gameobject_loot_template` VALUES 
(27321, 43228, 24, 1, 0, 3, 3),
(27321, 47172, 16.666, 1, 1, 1, 1),
(27321, 47171, 16.666, 1, 1, 1, 1),
(27321, 47170, 16.666, 1, 1, 1, 1),
(27321, 47174, 16.666, 1, 1, 1, 1),
(27321, 47173, 16.666, 1, 1, 1, 1),
(27321, 47175, 16.666, 1, 1, 1, 1);

-- http://www.wowhead.com/object=195709#contains:mode=heroic:0+1-15
-- (Entry: 195710)
-- Fix rates
DELETE FROM `gameobject_loot_template` WHERE (`entry`=27414);
INSERT INTO `gameobject_loot_template` VALUES 
(27414, 44990, 43, 1, 0, 1, 1),
(27414, 47241, 100, 1, 0, 1, 1),
(27414, 34057, 1.3, 1, 0, 1, 1),
(27414, 43228, 24, 1, 0, 4, 4),
(27414, 47243, 16.666, 1, 1, 1, 1),
(27414, 47244, 16.666, 1, 1, 1, 1),
(27414, 47493, 16.666, 1, 1, 1, 1),
(27414, 47248, 16.666, 1, 1, 1, 1),
(27414, 47249, 16.666, 1, 1, 1, 1),
(27414, 47250, 16.666, 1, 1, 1, 1);

UPDATE `instance_template` SET `script`='instance_trial_of_the_crussader' WHERE (`map`='649');

UPDATE `creature_template` SET `ScriptName`='npc_tcrus_announcer' WHERE (`entry`='34816');
UPDATE `creature_template` SET `ScriptName`='npc_tcrus_fizzlebang' WHERE (`entry`='35458');
UPDATE `creature_template` SET `ScriptName`='npc_tcrus_tirion' WHERE (`entry`='34996');
UPDATE `creature_template` SET `ScriptName`='npc_LichKing' WHERE (`entry`='35877');
UPDATE `creature_template` SET `ScriptName`='npc_Garrosh' WHERE (`entry`='34995');
UPDATE `creature_template` SET `ScriptName`='npc_KingVyrn' WHERE (`entry`='34990');

-- Faction Champions Horde
UPDATE `creature_template` SET `ScriptName`='boss_gorgrim_shadowcleave' WHERE (`entry`='34458');
UPDATE `creature_template` SET `ScriptName`='boss_birana_stormhoof' WHERE (`entry`='34451');
UPDATE `creature_template` SET `ScriptName`='boss_erin_misthoof' WHERE (`entry`='34459');
UPDATE `creature_template` SET `ScriptName`='boss_rujkah' WHERE (`entry`='34448');
UPDATE `creature_template` SET `ScriptName`='boss_ginselle_blightslinger' WHERE (`entry`='34449');
UPDATE `creature_template` SET `ScriptName`='boss_liandra_suncaller' WHERE (`entry`='34445');
UPDATE `creature_template` SET `ScriptName`='boss_malithas_brightblader' WHERE (`entry`='34456');
UPDATE `creature_template` SET `ScriptName`='boss_caiphus_the_stern' WHERE (`entry`='34447');
UPDATE `creature_template` SET `ScriptName`='boss_vivienne_blackwhisper' WHERE (`entry`='34441');
UPDATE `creature_template` SET `ScriptName`='boss_mazdinah' WHERE (`entry`='34454');
UPDATE `creature_template` SET `ScriptName`='boss_broln_stouthorn' WHERE (`entry`='34455');
UPDATE `creature_template` SET `ScriptName`='boss_thrakgar' WHERE (`entry`='34444');
UPDATE `creature_template` SET `ScriptName`='boss_harkzog' WHERE (`entry`='34450');
UPDATE `creature_template` SET `ScriptName`='boss_narrhok_steelbreaker' WHERE (`entry`='34453');

-- Faction Champions Alliance
UPDATE `creature_template` SET `ScriptName`='boss_tyrius_duskblade' WHERE (`entry`='34461');
UPDATE `creature_template` SET `ScriptName`='boss_kavina_grovesong' WHERE (`entry`='34460');
UPDATE `creature_template` SET `ScriptName`='boss_melador_valestrider' WHERE (`entry`='34469');
UPDATE `creature_template` SET `ScriptName`='boss_alyssia_moonstalker' WHERE (`entry`='34467');
UPDATE `creature_template` SET `ScriptName`='boss_noozle_whizzlestick' WHERE (`entry`='34468');
UPDATE `creature_template` SET `ScriptName`='boss_velanaa' WHERE (`entry`='34465');
UPDATE `creature_template` SET `ScriptName`='boss_baelnor_lightbearer' WHERE (`entry`='34471');
UPDATE `creature_template` SET `ScriptName`='boss_anthar_forgemender' WHERE (`entry`='34466');
UPDATE `creature_template` SET `ScriptName`='boss_brienna_nightfell' WHERE (`entry`='34473');
UPDATE `creature_template` SET `ScriptName`='boss_irieth_shadowstepe' WHERE (`entry`='34472');
UPDATE `creature_template` SET `ScriptName`='boss_shaabad' WHERE (`entry`='34463');
UPDATE `creature_template` SET `ScriptName`='boss_saamul' WHERE (`entry`='34470');
UPDATE `creature_template` SET `ScriptName`='boss_serissa_grimdabbler' WHERE (`entry`='34474');
UPDATE `creature_template` SET `ScriptName`='boss_shocuul' WHERE (`entry`='34475');

-- Spell DBC
INSERT INTO `spelldifficulty_dbc` VALUES ('6000', '66331', '67478', '67477', '67479'); -- Gormok Impale
INSERT INTO `spelldifficulty_dbc` VALUES ('6001', '66330', '67647', '67648', '67649'); -- Gormok Staggering Stomp
INSERT INTO `spelldifficulty_dbc` VALUES ('6002', '66689', '67650', '67651', '67652'); -- Icehowl Artic Breath
INSERT INTO `spelldifficulty_dbc` VALUES ('6003', '66683', '67660', '67660', '67662'); -- Icehowl Massic Crash
INSERT INTO `spelldifficulty_dbc` VALUES ('6004', '67345', '67663', '67663', '67665'); -- Icehowl Whirl
INSERT INTO `spelldifficulty_dbc` VALUES ('6005', '66770', '67655', '67654', '67656'); -- Icehowl Ferocious Butt
INSERT INTO `spelldifficulty_dbc` VALUES ('6006', '66879', '67624', '67625', '67626'); -- Dreadscale Burning Bite
INSERT INTO `spelldifficulty_dbc` VALUES ('6007', '66820', '67636', '67635', '67637'); -- Dreadscale Molten Spew
INSERT INTO `spelldifficulty_dbc` VALUES ('6020', '66237', '67049', '67050', '67051'); -- Jaraxxus Incinerate Flesh
INSERT INTO `spelldifficulty_dbc` VALUES ('6021', '66528', '67029', '67030', '67031'); -- Jaraxxus Fel Lighting
INSERT INTO `spelldifficulty_dbc` VALUES ('6022', '68124', '68126', '68127', '68128'); -- Jaraxxus Legion Flame
INSERT INTO `spelldifficulty_dbc` VALUES ('6023', '66532', '66963', '66964', '66965'); -- Jaraxxus Fel Fireball
INSERT INTO `spelldifficulty_dbc` VALUES ('6024', '66258', '66258', '67903', '67903'); -- Jaraxxus Summon Volcan
INSERT INTO `spelldifficulty_dbc` VALUES ('6025', '67103', '67103', '67104', '67105'); -- Portal Summon Guardian

UPDATE `creature_template` SET `ScriptName`='Boss_Jaraxxus' WHERE (`entry`='34780');
UPDATE `creature_template` SET `ScriptName`='Mob_Vulcan' WHERE `entry`=34813;
UPDATE `creature_template` SET `ScriptName`='Mob_FireTrigger' WHERE `entry`=34784;
UPDATE `creature_template` SET `ScriptName`='Mob_Netherportal' WHERE `entry`=34825;
UPDATE `creature_template` SET `scale`='2' WHERE `entry`=34825;
UPDATE `creature_template` SET `ScriptName`='Mob_MistressOfPain' WHERE `entry`=34826;

-- correct little error to start core not really importants
DELETE FROM `creature_template` WHERE `entry`=41000;
INSERT INTO `creature_template` VALUES ('41000','0','0','0','0','0','169','11686','169','0','Wilfred Portal Trigger','','','0','81','81','0','14','14','0','1','1','0','1','2','0','0','1','2000','2000','1','1','0','0','0','0','0','0','1','2','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','1','1','0','0','0','0','0','0','0','0','1','0','0','2','0','','11159');

-- Gormok
UPDATE `creature_template` SET `ScriptName`='boss_gormok_impaler' WHERE (`entry`='34796');
UPDATE `creature_template` SET `scale`='1.5', `faction_A`='16', `faction_H`='16', `ScriptName`='mob_firebomb_trigger' WHERE (`entry`='34854');

-- Acidmaw & Dreadscale
UPDATE `creature_template` SET `ScriptName`='boss_acidmaw' WHERE (`entry`='35144');
UPDATE `creature_template` SET `ScriptName`='boss_dreadscale' WHERE (`entry`='34799');

-- IceHowl
UPDATE `creature_template` SET `ScriptName`='boss_icehowl' WHERE (`entry`='34797');


UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_eydis' WHERE `entry`=34496;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_fjola' WHERE `entry`=34497;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_valkyr_orb' WHERE `entry` IN (34628, 34630);
UPDATE `creature_template` SET unit_flags= 33554434, faction_A =14, faction_H=14 WHERE `entry` IN (34628, 34630);
INSERT INTO `npc_spellclick_spells` VALUES (34567, 65684, 0, 0, 0, 1, 0, 0, 0), (34568, 65686, 0, 0, 0, 1, 0, 0, 0); -- dark/light "portals"
-- INSERT INTO `spell_script_target` VALUES (65875, 1, 34497), (65876, 1, 34496);

UPDATE `creature_template` SET `ScriptName`='Boss_Raid_Anubarak' WHERE (`entry`='34564');
UPDATE `creature_template` SET `ScriptName`='Mob_NerubianTrigger' WHERE (`entry`='34862');
UPDATE `creature_template` SET `ScriptName`='mob_swarm_scarab' WHERE (`entry`='34605');
UPDATE `creature_template` SET `ScriptName`='nerubian_burrower' WHERE (`entry`='34607');
UPDATE `creature_template` SET `ScriptName`='frost_sphere' WHERE (`entry`='34606');
UPDATE `creature_template` SET `ScriptName`='creature_impale' WHERE (`entry`='29184');
UPDATE `creature_template` SET `ScriptName`='cr_dark_essence' WHERE (`entry`='34567');
UPDATE `creature_template` SET `ScriptName`='cr_light_essence' WHERE (`entry`='34568');

DELETE FROM script_texts where `entry` <= -1600205 AND `entry` >= -1600224;
DELETE FROM script_texts where `entry`='-1600229';
DELETE FROM script_texts where `entry` <= -1600234 AND `entry` >= -1600237;
DELETE FROM script_texts where `entry` <= -1600239 AND `entry` >= -1600244;
DELETE FROM script_texts where `entry` <= -1600246 AND `entry` >= -1600250;
DELETE FROM script_texts where `entry` <= -1600252 AND `entry` >= -1600258;
DELETE FROM script_texts where `entry` <= -1713554 AND `entry` >= -1713561;


INSERT INTO `script_texts` VALUES ('0', '-1600205', 'Welcome champions, you have heard the call of the Argent Crusade, and you have boldly answered. It is here, in the Crusader\'s Coliseum, that you will face your greatest challenges. Those of you, who survive the rigors of the coliseum will join the Argent Crusade on it\'s march to Icecrown Citadel.', null, null, 'Willkommen, Champions! Ihr habt den Ruf des Argentumkreuzzugs vernommen und seid ihm mutig gefolgt! Hier, im Kolosseum der Kreuzfahrer, werdet Ihr auf Eure gr??ten Herausforderungen treffen.Die jenigen unter Euch, welche die Gefahren des Kolosseums ?berleben, werden den Kreuzzug bei seinem Marsch auf die Eiskronenzitadelle begleiten.', null, null, null, null, null, '16036', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600206', 'Hailing from the deepest, darkest carverns of the storm peaks, Gormok the Impaler! Battle on, heroes!', null, null, 'Er kommt aus den tiefsten, dunkelsten H?hlen der Sturmgifpel - Gormok der Pf?hler! Voran, Helden!', null, null, null, null, null, '16038', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600207', 'Let the games begin!', '', null, 'Lasst die Spiele beginnen.', null, null, null, null, null, '16037', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600208', ' I have seen more worthy challenges in the ring of blood, you waste our time paladin!', null, null, 'Im Ring des Blutes habe ich w?rdigere K?mpfer gesehen. Ihr verschwendet unsere Zeit, Paladin!', null, null, null, null, null, '16026', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600209', 'Steel yourselves, heroes, for the twin terrors Acidmaw and Dreadscale. Enter the arena!', null, null, 'Stellt euch Helden, den die Zwillingsschrecken ?tschlund und Schreckensmaul erscheinen in der Arena.', null, null, null, null, null, '16039', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600210', 'The air freezes with the introduction of our next combatant, Icehowl! Kill or be killed, champions!', null, null, 'Mit der Ank?ndigung unseres n?chsten K?mpers gefriert die Luft selbst: Eisheuler! T?tet oder werdet get?tet, Champions!', null, null, null, null, null, '16040', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600211', 'Grand Warlock Wilfred Fizzlebang will summon forth your next challenge. Stand by for his entry!', null, null, 'Gro?hexenmeister Wilfred Zischknall wird Eure n?chste Herausforderung beschw?ren. Harrt seiner Ankunft.', null, null, null, null, null, '16043', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600212', 'Thank you, Highlord! Now challengers, I will begin the ritual of summoning! When I am done, a fearsome Doomguard will appear!', null, null, 'Danke. Hochlord. Nun, Champions, werde ich mit dem Beschw?rungsritual beginnen. Sobald es beendet ist, wird eine f?rchterliche Verdammniswache erscheinen!', null, null, null, null, null, '16268', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600213', 'Prepare for oblivion!', null, null, 'Bereitet euch auf den Untergang vor!', null, null, null, null, null, '16269', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600214', 'Ah ha! Behold the absolute power of Wilfred Fizzlebang, master summoner! You are bound to ME, demon!', null, null, 'A-HA! Ich hab es vollbracht! Bestaunt die gerenzenlose Macht von Wilfred Zischknall, Meisterbeschw?rer! Du bist an mich gebunden, D?mon!', null, null, null, null, null, '16270', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600215', 'Trifling gnome, your arrogance will be your undoing!', null, null, 'Unbedeutener Gnom! Deine Arroganz wird dir zum Verh?ngnis!', null, null, null, null, null, '16143', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600216', 'But I\'m in charge her-', null, null, 'aber ich hab hier die Kontrolle ahh......', null, null, null, null, null, '16271', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600217', 'Quickly, heroes! Destroy the demon lord before it can open a portal to its twisted demonic realm!', null, null, 'Schnell, Helden, Zerst?rt den D?monenlord, bevor er ein Portal zu seiner verzerrten Welt ?ffnen kann!', null, null, null, null, null, '16044', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600218', 'You face Jaraxxus, eredar lord of the Burning Legion!', null, null, null, null, null, null, null, null, '16144', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600219', 'FLESH FROM BONE!', null, null, null, null, null, null, null, null, '16149', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600220', 'Come forth, sister! Your master calls!', null, null, null, null, null, null, null, null, '16150', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600221', 'INFERNO!', null, null, null, null, null, null, null, null, '16151', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600222', 'Insignificant gnat!', null, null, null, null, null, null, null, null, '16145', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600223', 'Banished to the Nether!', null, null, null, null, null, null, null, null, '16146', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600224', 'Another will take my place. Your world is doomed.', null, null, null, null, null, null, null, null, '16147', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600229', 'The next battle will be against the Argent Crusade\'s most powerful knights! Only by defeating them will you be deemed worthy...', null, null, null, null, null, null, null, null, '0', '1', '0', '0', null);
-- 1600229 - 1600233 Todo Texte
INSERT INTO `script_texts` VALUES ('0', '-1600234', 'The next battle will be against the Argent Crusade\'s most powerful knights! Only by defeating them will you be deemed worthy...', null, null, null, null, null, null, null, null, '16047', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600235', 'Our honor has been besmirched! They make wild claims and false accusations against us. I demand justice! Allow my champions to fight in place of your knights, Tirion. We challenge the Horde!', null, null, null, null, null, null, null, null, '16066', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600236', 'Very well, I will allow it. Fight with honor!', null, null, null, null, null, null, null, null, '16048', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600237', 'Fight for the glory of the Alliance, heroes! Honor your king and your people!', null, null, null, null, null, null, null, null, '16065', '1', '0', '0', null);
-- 1600238 Horde Spawn
INSERT INTO `script_texts` VALUES ('0', '-1600239', 'Only by working together will you overcome the final challenge. From the depths of Icecrown come to of the Scourge\'s most powerful lieutenants: fearsome val\'kyr, winged harbingers of the Lich King!', null, null, null, null, null, null, null, null, '16050', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600240', 'A mighty blow has been dealt to the Lich King! You have proven yourselves able bodied champions of the Argent Crusade. Together we will strike at Icecrown Citadel and destroy what remains of the Scourge! There is no challenge that we cannot face united!', null, null, 'Dem Lichtk?nig wurde ein schwerer Schlag versetzt! Ihr habt Euch als w?rdige Champions erwiesen. Gemeinsam werden wir den Angriff auf die Eiskronenzitadelle durchf?hren und den Rest der Gei?el zerst?ren! Gemeinsam meistern wir alles!', null, null, null, null, null, '16051', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600241', 'You will have your challenge, Fordring.', null, null, 'Ihr werdet Eure Herausforderung bekommen, Fordring.', null, null, null, null, null, '16321', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600242', 'Arthas! You are hopelessly outnumbered! Lay down Frostmourne and I will grant you a just death.', null, null, 'Arthas! Wir sind Euch zahlenm??ig ?berlegen! Legt Frostgram nieder und ich werde Euch einen gerechten Tod gew?hren.', null, null, null, null, null, '16052', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600243', 'The Nerubians built an empire beneath the frozen wastes of Northrend. An empire that you so foolishly built your structures upon. MY EMPIRE.', null, null, 'Die Neruber erbauten ein K?nigreich unter den gefrorenen Ein?den Nordens. Ein K?nigreich, auf dem Ihr so t?richt Euren Spielplatz aufgebaut habt, AUF MEINEM K?NIGREICH.', null, null, null, null, null, '16322', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600244', 'The souls of your fallen champions will be mine, Fordring.', null, null, 'Die Seelen Eurer gefallenen Champions werden mir geh?ren, Fordering.', null, null, null, null, null, '16323', '1', '0', '0', null);
-- 1600245 Anubarak Intro
INSERT INTO `script_texts` VALUES ('0', '-1600246', 'The loss of Wilfred Fizzlebang, while unfortunate, should be a lesson to those that dare dabble in dark magic. Alas, you are victorious and must now face the next challenge. ', null, null, 'Der Verlust von Wilfred Fizzlebang sollte jeden unter euch eine Lehre sein, die es wagen mit den dunklen k?nsten herumzuspielen. Jedoch ihr seid Siegreich und ihr m?sst nun die n?chste Herausforderung antreten.', null, null, null, null, null, '16045', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600247', 'Treacherous Alliance dogs! You summon a demon lord against warriors of the Horde!? Your deaths will be swift! ', null, null, 'Hinterh?ltige Allianz Hunde! Ihr beschw?rt einen D?monenlord gegen die Krieger der Horde! Ihr werdet einen schnellen Tot finden.', null, null, null, null, null, '16021', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600248', 'The Alliance doesn\'t need the help of a demon lord to deal with Horde filth. Come, pig! ', null, null, 'Die Allianz braucht keinen D?mon zur unterst?tzung gegen Hordendreck! Komm her Schwein!', null, null, null, null, null, '16064', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600249', 'Everyone, calm down! Compose yourselves! There is no conspiracy at play here. The warlock acted on his own volition - outside of influences from the Alliance. The tournament must go on! ', null, null, 'Ihr alle beruhigt euch. Hier ist keine Verschw?rung ingange der Hexenmeister handelte aus eigenen willen heraus unabh?ngig von der Allianz! Das Tunier muss weitergehen.', null, null, null, null, null, '16046', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600250', 'A shallow and tragic victory. We are weaker as a whole from the losses suffered today. Who but the Lich King could benefit from such foolishness? Great warriors have lost their lives. And for what? The true threat looms ahead - the Lich King awaits us all in death.', null, null, null, null, null, null, null, null, '16049', '1', '0', '0', null);
-- -1600251 Northrend Beast Wipe
INSERT INTO `script_texts` VALUES ('0', '-1600252', 'In the name of our dark master. For the Lich King. You. Will. Die.', null, null, null, null, null, null, null, null, '16272', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600253', 'CHAOS!', null, null, null, null, null, null, null, null, '16274', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600254', 'The Scourge cannot be stopped...', null, null, null, null, null, null, null, null, '16275', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600255', 'UNWORTHY!', null, null, null, null, null, null, null, null, '16276', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600256', 'You have been measured, and found wanting!', null, null, null, null, null, null, null, null, '16277', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600257', 'Let the dark consume you!', null, null, null, null, null, null, null, null, '16278', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('0', '-1600258', 'Let the light consume you!', null, null, null, null, null, null, null, null, '16279', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713554', 'Ahhh... Our guests arrived, just as the master promised.', null, null, null, null, null, null, null, null, '16235', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713555', 'This place will serve as your tomb!', null, null, null, null, null, null, null, null, '16234', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713556', 'Auum na-l ak-k-k-k, isshhh. Rise, minions. Devour...', null, null, null, null, null, null, null, null, '16240', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713557', 'The swarm shall overtake you!', null, null, null, null, null, null, null, null, '16241', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713558', 'F-lakkh shir!', null, null, null, null, null, null, null, null, '16236', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713559', 'Another soul to sate the host.', null, null, null, null, null, null, null, null, '16237', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713560', 'I have failed you, master...', null, null, null, null, null, null, null, null, '16238', '1', '0', '0', null);
INSERT INTO `script_texts` VALUES ('34564', '-1713561', 'Highlord Tirion Fordring yells: Champions, you''re alive! Not only have you defeated every challenge of the Trial of the Crusader, but thwarted Arthas directly! Your skill and cunning will prove to be a powerful weapon against the Scourge. Well done! Allow one of my mages to transport you back to the surface!', null, null, null, null, null, null, null, null, '0', '1', '0', '0', null);

-- Some cleanup
UPDATE `creature_template` SET `ScriptName`= '' WHERE `entry` IN (33365,33370,33312,33367,33686,33579,34275,33214);
UPDATE `gameobject_template` SET `ScriptName`= '' WHERE `entry` IN (194375,194371,194370,194377);
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5369,5423);
DELETE FROM `script_waypoint` WHERE `entry`=33370;

DELETE FROM areatrigger_scripts WHERE `entry`=4156;
INSERT INTO areatrigger_scripts VALUES (4156,'at_naxxramas_frostwyrm_wing');

UPDATE `instance_template` SET `script`='instance_ulduar' WHERE `map`=603;
UPDATE `creature_template` SET `ScriptName`='boss_auriaya' WHERE `entry`=33515;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan' WHERE `entry`=33113;
UPDATE `creature_template` SET `AIName`='TurretAI',`ScriptName`='' WHERE `entry`=33139;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_seat' WHERE `entry`=33114;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_defense_turret' WHERE `entry`=33142;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan_overload_device' WHERE `entry`=33143;
UPDATE `creature_template` SET `ScriptName`='spell_pool_of_tar' WHERE `entry`=33090;
UPDATE `creature_template` SET `ScriptName`='boss_ignis' WHERE `entry`=33118;
UPDATE `creature_template` SET `ScriptName`='boss_razorscale' WHERE `entry`=33186;
UPDATE `creature_template` SET `ScriptName`='boss_xt002' WHERE `entry`=33293;
UPDATE `creature_template` SET `ScriptName`='mob_xt002_heart' WHERE `entry`=33329;
UPDATE `creature_template` SET `ScriptName`='mob_scrapbot' WHERE `entry`=33343;
UPDATE `creature_template` SET `ScriptName`='mob_pummeller' WHERE `entry`=33344;
UPDATE `creature_template` SET `ScriptName`='mob_boombot' WHERE `entry`=33346;
UPDATE `creature_template` SET `ScriptName`='mob_void_zone' WHERE `entry`=34001;
UPDATE `creature_template` SET `ScriptName`='mob_life_spark' WHERE `entry`=34004;
UPDATE `creature_template` SET `ScriptName`='mob_rune_of_summoning' WHERE `entry`=33051;
UPDATE `creature_template` SET `ScriptName`='boss_algalon' WHERE `entry`=32871;
UPDATE `creature_template` SET `ScriptName`='mob_collapsing_star' WHERE `entry`=32955;
UPDATE `gameobject_template` SET `ScriptName`='ulduar_teleporter' WHERE `entry`=194569;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=33142;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=33139;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=34111;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=34224;

-- Leviathan Torret 33139
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry` IN (33139, 34111);
-- Leviathan Torret 33142
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry` IN (33142);

-- 7770_ignis_vehicleid
UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` = 33118;

-- 7792
DELETE FROM `creature_template` WHERE `entry` IN (33119);
INSERT INTO `creature_template` VALUES
('33119','0','0','0','0','0','13069','0','0','0','Scorch trigger','',NULL,'0','83','83','2','16','16','0','2','2','85','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','EventAI','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','trigger_periodic','0');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33119);
INSERT INTO `creature_ai_scripts` VALUES 
( 10033119, 33119, 0, 0, 100, 3, 1000, 1000, 1000, 1000, 11, 62548, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Scorch Ground');

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `unit_flags` = 33554434, `ScriptName` = 'mob_iron_construct', `flags_extra` = 0 WHERE `entry` = 33121;

-- 7796_xt002_vehicleid
UPDATE `creature_template` SET `vehicleId` = 332 WHERE `entry` = 33293;

-- 7930_leviathan_trigger
DELETE FROM `creature_template` WHERE `entry` IN (33115);
INSERT INTO `creature_template` VALUES
('33115','0','0','0','0','0','13069','0','0','0','Leviathan trigger','',NULL,'0','83','83','2','16','16','0','2','2','1','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','flame_leviathan_trigger','0');

DELETE FROM creature WHERE `id` IN (33115, 33060, 33062, 33109);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES (33115,603,1,1,0,0,-784.969,-135.608,429.774,0.351076,480000,0,0,3458360,279750,0,0);

-- 8042_boss_leviathan
DELETE FROM `creature_template` WHERE `entry` IN (33240);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES('33240','33240','0','0','0','0','28517','0','0','0','Ulduar Colossus','','','0','80','80','2','1692','1692','0','1.2','1.14286','1','1','422','586','0','642','7.5','2000','0','1','32832','0','0','0','0','0','0','345','509','103','5','524352','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','125','1','1','0','0','0','0','0','0','0','124','1','0','0','0','mob_colossus','11403');
-- ubicaci?n Leviathan
DELETE FROM `creature` WHERE `id`=33113;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(94374, 33113, 603, 1, 1, 0, 0, 435.89, -8.417, 409.886, 3.12723, 480000, 0, 0, 23009250, 0, 0, 0);
-- Refuerzo orbital
UPDATE `creature_template` SET `unit_flags` = 33685510, `type_flags` = 0 WHERE `entry` = 34286;

-- 8047_ignis_scorchground
DELETE FROM `creature_template` WHERE `entry` IN (33119);
INSERT INTO `creature_template` VALUES
('33119','0','0','0','0','0','13069','0','0','0','Scorch trigger','','','0','80','80','2','16','16','0','1','1.14286','85','1','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','4','1','1','0','0','0','0','0','0','0','94','1','0','0','0','mob_scorch_ground','11159');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33119);

-- 8086_razorscale_event
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_watcher' WHERE `entry` = 33453;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_sentinel' WHERE `entry` = 33846;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_guardian' WHERE `entry` = 33388;
UPDATE `creature_template` SET `ScriptName` = 'mob_devouring_flame' WHERE `entry` = 34188;
UPDATE `creature_template` SET `ScriptName` = 'npc_expedition_commander_ulduar' WHERE `entry` = 33210;
UPDATE `creature_template` SET `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;
UPDATE `creature_template` SET `unit_flags` = 33685506 WHERE `entry` IN (33245,33233);
DELETE FROM `creature` WHERE `id`=33186;

-- 8093_razorscale_triggers
DELETE FROM `creature` WHERE `id`=33282;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33233,33259);

-- 8098_kologarn_event
DELETE FROM `creature` WHERE `id` IN (33632, 33802);
UPDATE `creature_template` SET `unit_flags` = 33685510 WHERE `entry` = 33809;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33661;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `ScriptName` = 'mob_focused_eyebeam' WHERE `entry` IN (33632, 33802);
UPDATE `creature_template` SET `ScriptName` = 'mob_left_arm' WHERE `entry` = 32933;
UPDATE `creature_template` SET `ScriptName` = 'mob_right_arm' WHERE `entry` = 32934;

UPDATE `creature_template` SET `unit_flags` = 33947654 WHERE `entry` = 33121;

-- 8119_assembly_iron
UPDATE `creature_template` SET `ScriptName` = 'boss_steelbreaker' WHERE `entry` = 32867;
UPDATE `creature_template` SET `ScriptName` = 'boss_runemaster_molgeim' WHERE `entry` = 32927;
UPDATE `creature_template` SET `ScriptName` = 'boss_stormcaller_brundir' WHERE `entry` = 32857;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33051, 33691, 33689);
UPDATE creature_template SET faction_A=16, faction_H=16, scriptname='mob_rune_of_power' WHERE entry = 33705;
UPDATE creature_template SET faction_A=16, faction_H=16, scriptname='mob_lightning_elemental', difficulty_entry_1 = 33689 WHERE entry = 32958;

-- 8124_auriaya_event
DELETE FROM `creature` WHERE id = 34014;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0 WHERE `entry` = 33515;
UPDATE `creature_template` SET `equipment_id` = 2500 WHERE `entry` = 33515;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `ScriptName` = 'feral_defender_trigger' WHERE `entry` = 34096;
UPDATE `creature_template` SET `ScriptName` = 'mob_feral_defender' WHERE `entry` = 34035;
UPDATE `creature_template` SET `ScriptName` = 'mob_sanctum_sentry' WHERE `entry` = 34014;
UPDATE `creature_template` SET `ScriptName` = 'seeping_trigger' WHERE `entry` = 34098;

DELETE FROM `creature_equip_template` WHERE entry = 2500;
INSERT INTO `creature_equip_template` VALUES ('2500','45315','0','0');

DELETE FROM `creature_addon` WHERE guid = 137496;
INSERT INTO `creature_addon` VALUES ('137496','1033515','0','0','0','0','0');

DELETE FROM `waypoint_data` WHERE id = 1033515;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
('1033515','1','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','2','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','3','1938.90','42.09','411.35','3000','0','0','100','0'),
('1033515','4','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','5','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','6','2011.43','44.91','417.72','0','0','0','100','0'),
('1033515','7','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','8','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','9','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','10','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','11','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','12','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','13','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','14','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','15','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','16','1939.18','-90.90','411.35','3000','0','0','100','0'),
('1033515','17','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','18','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','19','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','20','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','21','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','22','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','23','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','24','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','25','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','26','2011.43','44.91','417.72','0','0','0','100','0');

-- 9130_auriaya_fix
UPDATE `creature` SET `MovementType` = 2 WHERE `id` = 33515;

-- 8137_leviathan_vehiclesystem
UPDATE `creature_template` SET `unit_flags` = 0, `npcflag` = 1, `ScriptName` = 'npc_keeper_norgannon' WHERE `entry` = 33686;
DELETE FROM `creature_template` WHERE `entry`=33115;
DELETE FROM creature WHERE `id`=33115;

-- 8148_boss_hodir
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0, `ScriptName` = 'boss_hodir' WHERE `entry` = 32845;

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0 WHERE `entry` IN (34188, 33632, 33802, 34096, 34098);
UPDATE `creature_template` SET `modelid1` = 25865, `modelid2` = 0, `flags_extra` = 0, `ScriptName` = 'mob_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `modelid1` = 28470, `modelid2` = 0, `ScriptName` = 'mob_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `modelid1` = 28470, `modelid2` = 0, `ScriptName` = 'mob_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0 WHERE `entry` = 33174;
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 61990;
INSERT INTO `spell_linked_spell` VALUES 
(61990, -62457, 2, "Ice Shards Immunity (Hodir)"),
(61990, -65370, 2, "Ice Shards Immunity (Hodir)");

UPDATE `creature_template` SET `unit_flags` = 33817094 WHERE `entry` = 33174;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612581215 WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 32941;
UPDATE `creature_template` SET `unit_flags` = 33686016, `flags_extra` = 2 WHERE `entry` = 30298;

DELETE FROM `creature` WHERE `id` = 32938;

-- 8153_razorscale_event
DELETE FROM `creature` WHERE `id`=33186;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(94373, 33186, 603, 1, 1, 0, 0, 587.073, -203.205, 441.237, 1.60532, 604800, 0, 0, 3555975, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33554438 WHERE `entry` = 33184;

-- 8155_hodir_npcs
UPDATE `creature_template` SET `unit_flags` = 393220, `ScriptName` = '' WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 33948166 WHERE `entry` = 33174;

DELETE FROM `creature` WHERE `id` IN (32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

UPDATE `creature_template` SET `faction_A` = 1665, `faction_H` = 1665, `unit_flags` = 32768 WHERE `entry` IN (33325, 32901, 33328, 32901, 32893, 33327, 32897, 33326, 32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0, `ScriptName` = 'toasty_fire' WHERE `entry` = 33342;

-- 8164_ulduar_immunities
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33113, 33118, 33186, 33293, 32867, 32927, 32930, 33515, 32906, 32845, 33350, 32865, 33271, 33288, 32871);
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299547 WHERE `entry` = 32857;

UPDATE `script_texts` SET `content_default` = "Welcome, champions! All of our attempts at grounding her have failed. We could use a hand in bring her down with these harpoon guns.", `type` = 0  WHERE `entry` = -1603260;
UPDATE `script_texts` SET `content_default` = "Move! Quickly! She won?t remain grounded for long.", `type` = 1  WHERE `entry` = -1603261;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603053;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603214;

-- 8166_hodir_flashfreeze
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61990, -61990);
INSERT INTO `spell_linked_spell` VALUES 
(61990, 7940, 2, "Hodir Flash Freeze immunity");

-- 8172_freya_elders
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_brightleaf' WHERE `entry` =32915;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_ironbranch' WHERE `entry` =32913;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_stonebark' WHERE `entry` =32914;
UPDATE `creature_template` SET `ScriptName` = 'creature_sun_beam', `unit_flags` = 33685510, `modelid1` = 11686, `modelid2` = 0 WHERE `entry` =33170;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 393220, `ScriptName` = 'creature_iron_roots' WHERE `entry` = 33168;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62243;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(62217, -62243, 1, 'cancels the effects of Unstable Sun Beam'),
(62922, -62243, 1, 'cancels the effects of Unstable Sun Beam');

-- 8178_boss_freya
UPDATE `creature_template` SET `ScriptName` = 'boss_freya' WHERE `entry` =32906;
UPDATE `creature_template` SET `unit_flags` = 393220, `ScriptName` = 'creature_eonars_gift' WHERE `entry` =33228;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33685508, `ScriptName` = 'creature_nature_bomb' WHERE `entry` =34129;
UPDATE `creature_template` SET `unit_class` = 2, `ScriptName` = 'creature_detonating_lasher' WHERE `entry` =32918;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_conservator' WHERE `entry` =33203;
UPDATE `creature_template` SET `unit_flags` = 33686022, `ScriptName` = 'creature_healthy_spore' WHERE `entry` =33215;
UPDATE `creature_template` SET `ScriptName` = 'creature_storm_lasher' WHERE `entry` =32919;
UPDATE `creature_template` SET `ScriptName` = 'creature_snaplasher' WHERE `entry` =32916;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_water_spirit' WHERE `entry` =33202;

DELETE FROM `creature` WHERE `guid` = 136607;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62532;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(64321, -62532, 1, 'Potent Pheromones ward off the Conservator''s Grip'),
(62619, -62532, 1, 'Pheromones ward off the Conservator''s Grip');

-- 8195_freya_event
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33686022, `ScriptName` = 'creature_unstable_sun_beam' WHERE `entry` = 33050;

-- 8199_ulduar_cleanup
DELETE FROM `gameobject` WHERE `id` = '194905';
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('270000','194905','603','1','1','401.308','-13.8236','409.524','3.14159','0','0','0','1','180','255','0');

UPDATE `creature_template` SET `speed_walk` = 0.5 WHERE `entry` = 33113;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 8, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;

-- 8228_ignis_scorch
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `ScriptName` = 'mob_scorch_ground' WHERE `entry` = 33221;
DELETE FROM `creature_template` WHERE `entry` = 33119;

-- 8241_thorim_gate
DELETE FROM `gameobject_scripts` WHERE `id`=55194;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(55194, 0, 11, 34155, 15, '0', 0, 0, 0, 0);

UPDATE `gameobject` SET `id` = 101855, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;

-- 8252_boss_thorim
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32882, 32908, 32885, 33110);
UPDATE `creature_template` SET `unit_flags` = 0, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875);

UPDATE `creature` SET `spawndist` = 0 WHERE `id` = 32865;
UPDATE `creature` SET `position_x` = 2135.078, `position_y` = -298.758, `orientation` = 1.61 WHERE `id` = 32865;

DELETE FROM `creature` WHERE `id` IN (32882, 32908, 32885, 32879, 33140, 33141);

UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (32892, 32879, 32780, 33140, 33141);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

UPDATE `creature_template` SET `unit_flags` = 33686020 WHERE `entry` = 33378;

DELETE FROM `creature` WHERE `id` IN (33378, 32892);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(131835, 33378, 603, 1, 1, 16925, 0, 2104.99, -233.484, 433.573, 5.49779, 604800, 0, 0, 12600, 0, 0, 1),
(131836, 33378, 603, 1, 1, 16925, 0, 2092.64, -262.594, 433.576, 6.26573, 604800, 0, 0, 12600, 0, 0, 1),
(131837, 33378, 603, 1, 1, 16925, 0, 2104.76, -292.719, 433.181, 0.785398, 604800, 0, 0, 12600, 0, 0, 1),
(131839, 33378, 603, 1, 1, 16925, 0, 2164.97, -293.375, 433.526, 2.35619, 604800, 0, 0, 12600, 0, 0, 1),
(131840, 33378, 603, 1, 1, 16925, 0, 2164.58, -233.333, 433.892, 3.90954, 604800, 0, 0, 12600, 0, 0, 1),
(131841, 33378, 603, 1, 1, 16925, 0, 2145.8, -222.196, 433.293, 4.45059, 604800, 0, 0, 12600, 0, 0, 1),
(131842, 33378, 603, 1, 1, 16925, 0, 2123.91, -222.443, 433.375, 4.97419, 604800, 0, 0, 12600, 0, 0, 1);

/*
DELETE FROM `spell_script_target` WHERE `entry`=62016;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('62016','1','33378');
*/
UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'mob_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'mob_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `ScriptName` = 'thorim_trap_bunny' WHERE `entry` IN (33725, 33282);
UPDATE `creature_template` SET `flags_extra` = 0, `ScriptName` = 'thorim_energy_source' WHERE `entry` = 32892;
UPDATE `creature_template` SET `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;

-- 8262_thorim_event
DELETE FROM `creature` WHERE `id` IN (33378, 32892);
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);

DELETE FROM `creature` WHERE `id` IN (32922, 32923, 32925);
SET @GUID := 200400;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) values 
(@GUID,32922,603,1,1,25984,0,2110.24,-213.923,436.857,5.16617,604800,0,0,80886,0,0,0),
(@GUID+1,32922,603,1,1,25984,0,2095.97,-213.634,445.036,5.37561,604800,0,0,80886,0,0,0),
(@GUID+2,32922,603,1,1,25984,0,2076.95,-244.528,442.998,5.96903,604800,0,0,80886,0,0,0),
(@GUID+3,32922,603,1,1,25984,0,2077.98,-272.724,438.925,0.191986,604800,0,0,80886,0,0,0),
(@GUID+4,32922,603,1,1,25984,0,2087.4,-301.326,443.005,0.698132,604800,0,0,80886,0,0,0),
(@GUID+5,32922,603,1,1,25984,0,2091.17,-286.804,430.781,0.523599,604800,0,0,80886,0,0,0),
(@GUID+6,32922,603,1,1,25984,0,2177.83,-295.005,434.846,2.35619,604800,0,0,80886,0,0,0),
(@GUID+7,32922,603,1,1,25984,0,2189.87,-278.583,438.928,2.87979,604800,0,0,80886,0,0,0),
(@GUID+8,32922,603,1,1,25984,0,2197.19,-256.436,445.037,3.24631,604800,0,0,80886,0,0,0),
(@GUID+9,32922,603,1,1,25984,0,2185.87,-254.436,432.798,3.29867,604800,0,0,80886,0,0,0),
(@GUID+10,32922,603,1,1,25984,0,2179.62,-227.25,442.009,3.89208,604800,0,0,80886,0,0,0),
(@GUID+11,32922,603,1,1,25984,0,2161.18,-218.451,432.811,4.17134,604800,0,0,80886,0,0,0),
(@GUID+12,32923,603,1,1,28580,0,2193.75,-292.545,449.069,3.21141,180,0,0,18900,0,0,0),
(@GUID+13,32923,603,1,1,28580,0,2178.55,-286.8,430.795,2.51327,180,0,0,18900,0,0,0),
(@GUID+14,32923,603,1,1,28580,0,2178.61,-299.455,438.917,2.30383,180,0,0,18900,0,0,0),
(@GUID+15,32923,603,1,1,28580,0,2186.39,-292.184,440.98,2.51327,180,0,0,18900,0,0,0),
(@GUID+16,32923,603,1,1,28580,0,2184.1,-304.141,447.037,2.32129,180,0,0,18900,0,0,0),
(@GUID+17,32923,603,1,1,28580,0,2185.45,-274.37,432.804,2.93215,180,0,0,18900,0,0,0),
(@GUID+18,32923,603,1,1,28580,0,2189.09,-274.368,436.838,2.94961,180,0,0,18900,0,0,0),
(@GUID+19,32923,603,1,1,28580,0,2193.43,-266.823,440.96,3.08923,180,0,0,18900,0,0,0),
(@GUID+20,32923,603,1,1,28580,0,2192.18,-282.637,442.998,2.82743,180,0,0,18900,0,0,0),
(@GUID+21,32923,603,1,1,28580,0,2199.59,-279.142,449.1,2.9147,180,0,0,18900,0,0,0),
(@GUID+22,32923,603,1,1,28580,0,2199.07,-267.828,447.077,3.07178,180,0,0,18900,0,0,0),
(@GUID+23,32923,603,1,1,28580,0,2184.24,-269.38,430.788,3.01942,180,0,0,18900,0,0,0),
(@GUID+24,32923,603,1,1,28580,0,2185.79,-278.182,434.833,2.86234,180,0,0,18900,0,0,0),
(@GUID+25,32923,603,1,1,28580,0,2191.54,-269.729,438.919,3.03687,180,0,0,18900,0,0,0),
(@GUID+26,32923,603,1,1,28580,0,2194.43,-276.351,442.961,2.93215,180,0,0,18900,0,0,0),
(@GUID+27,32923,603,1,1,28580,0,2196.2,-281.951,447.042,2.86234,180,0,0,18900,0,0,0),
(@GUID+28,32923,603,1,1,28580,0,2200.95,-267.306,449.114,3.08923,180,0,0,18900,0,0,0),
(@GUID+29,32923,603,1,1,28580,0,2181.97,-248.535,430.753,3.4383,180,0,0,18900,0,0,0),
(@GUID+30,32923,603,1,1,28580,0,2185.63,-247.405,434.837,3.4383,180,0,0,18900,0,0,0),
(@GUID+31,32923,603,1,1,28580,0,2189.51,-258.295,436.863,3.22886,180,0,0,18900,0,0,0),
(@GUID+32,32923,603,1,1,28580,0,2200.71,-251.84,449.088,3.29867,180,0,0,18900,0,0,0),
(@GUID+33,32923,603,1,1,28580,0,2194.08,-243.276,445.031,3.45575,180,0,0,18900,0,0,0),
(@GUID+34,32923,603,1,1,28580,0,2195.15,-251.153,442.98,3.33358,180,0,0,18900,0,0,0),
(@GUID+35,32923,603,1,1,28580,0,2178.26,-234.068,439.581,3.49066,180,0,0,18900,0,0,0),
(@GUID+36,32923,603,1,1,28580,0,2181.94,-238.58,434.834,3.61283,180,0,0,18900,0,0,0),
(@GUID+37,32923,603,1,1,28580,0,2182.5,-234.925,445.771,3.66519,180,0,0,18900,0,0,0),
(@GUID+38,32923,603,1,1,28580,0,2187.5,-232.918,456.92,3.38594,180,0,0,18900,0,0,0),
(@GUID+39,32923,603,1,1,28580,0,2184.62,-222.366,457.92,4.2237,180,0,0,18900,0,0,0),
(@GUID+40,32923,603,1,1,28580,0,2191.95,-229.319,468.174,3.54302,180,0,0,18900,0,0,0),
(@GUID+41,32923,603,1,1,28580,0,2161.32,-222.722,428.718,4.24115,180,0,0,18900,0,0,0),
(@GUID+42,32923,603,1,1,28580,0,2165.7,-216.552,437.482,4.11898,180,0,0,18900,0,0,0),
(@GUID+43,32923,603,1,1,28580,0,2172.48,-215.681,446.296,4.03171,180,0,0,18900,0,0,0),
(@GUID+44,32923,603,1,1,28580,0,2170.81,-208.646,447.254,4.11898,180,0,0,18900,0,0,0),
(@GUID+45,32923,603,1,1,28580,0,2164.44,-204.417,449.036,4.2237,180,0,0,18900,0,0,0),
(@GUID+46,32923,603,1,1,28580,0,2109.83,-216.211,434.81,5.20108,180,0,0,18900,0,0,0),
(@GUID+47,32923,603,1,1,28580,0,2100.14,-217.783,438.879,5.35816,180,0,0,18900,0,0,0),
(@GUID+48,32923,603,1,1,28580,0,2101.65,-211.524,442.959,5.2709,180,0,0,18900,0,0,0),
(@GUID+49,32923,603,1,1,28580,0,2105.1,-204.009,449.074,5.16617,180,0,0,18900,0,0,0),
(@GUID+50,32923,603,1,1,28580,0,2105.72,-213.887,438.883,5.23599,180,0,0,18900,0,0,0),
(@GUID+51,32923,603,1,1,28580,0,2093.1,-235.128,430.762,5.70723,180,0,0,18900,0,0,0),
(@GUID+52,32923,603,1,1,28580,0,2086.43,-236.845,436.861,5.79449,180,0,0,18900,0,0,0),
(@GUID+53,32923,603,1,1,28580,0,2090.16,-227.646,438.9,5.61996,180,0,0,18900,0,0,0),
(@GUID+54,32923,603,1,1,28580,0,2083.78,-233.255,440.947,5.75959,180,0,0,18900,0,0,0),
(@GUID+55,32923,603,1,1,28580,0,2082.41,-227.753,444.991,5.68977,180,0,0,18900,0,0,0),
(@GUID+56,32923,603,1,1,28580,0,2083.46,-220.87,449.11,5.32325,180,0,0,18900,0,0,0),
(@GUID+57,32923,603,1,1,28580,0,2085.77,-278.108,432.796,0.314159,180,0,0,18900,0,0,0),
(@GUID+58,32923,603,1,1,28580,0,2082.43,-279.181,436.843,0.314159,180,0,0,18900,0,0,0),
(@GUID+59,32923,603,1,1,28580,0,2080.09,-268.561,436.861,0.122173,180,0,0,18900,0,0,0),
(@GUID+60,32923,603,1,1,28580,0,2076.67,-281.238,443.013,0.314159,180,0,0,18900,0,0,0),
(@GUID+61,32923,603,1,1,28580,0,2070.95,-275.786,447.029,0.314159,180,0,0,18900,0,0,0),
(@GUID+62,32923,603,1,1,28580,0,2073.01,-269.083,444.984,0.10472,180,0,0,18900,0,0,0),
(@GUID+63,32923,603,1,1,28580,0,2085.04,-249.688,432.797,6.02139,180,0,0,18900,0,0,0),
(@GUID+64,32923,603,1,1,28580,0,2081.76,-248.184,436.858,6.00393,180,0,0,18900,0,0,0),
(@GUID+65,32923,603,1,1,28580,0,2076.05,-253.313,440.97,6.10865,180,0,0,18900,0,0,0),
(@GUID+66,32923,603,1,1,28580,0,2072.73,-250.245,445.018,6.07375,180,0,0,18900,0,0,0),
(@GUID+67,32923,603,1,1,28580,0,2071.74,-242.53,449.109,5.98648,180,0,0,18900,0,0,0),
(@GUID+68,32923,603,1,1,28580,0,2086.54,-289.927,436.879,0.523599,180,0,0,18900,0,0,0),
(@GUID+69,32923,603,1,1,28580,0,2096.15,-293.986,430.76,0.698132,180,0,0,18900,0,0,0),
(@GUID+70,32923,603,1,1,28580,0,2090.54,-299.068,438.92,0.698132,180,0,0,18900,0,0,0),
(@GUID+71,32923,603,1,1,28580,0,2082.36,-289.917,440.969,0.488692,180,0,0,18900,0,0,0),
(@GUID+72,32923,603,1,1,28580,0,2091.47,-291.981,432.8,0.610865,180,0,0,18900,0,0,0),
(@GUID+73,32923,603,1,1,28580,0,2081.7,-300.628,447.058,0.628319,180,0,0,18900,0,0,0),
(@GUID+74,32925,603,1,1,28581,0,2187.69,-270.488,434.832,3.01942,604800,0,0,40443,4169,0,0),
(@GUID+75,32925,603,1,1,28581,0,2193.33,-257.943,440.949,3.22886,604800,0,0,40443,4169,0,0),
(@GUID+76,32925,603,1,1,28581,0,2191.72,-247.573,440.946,3.40339,604800,0,0,40443,4169,0,0),
(@GUID+77,32925,603,1,1,28581,0,2181.61,-224.316,447.512,3.82227,604800,0,0,40443,4169,0,0),
(@GUID+78,32925,603,1,1,28581,0,2178.52,-240.156,430.756,3.61283,604800,0,0,40443,4169,0,0),
(@GUID+79,32925,603,1,1,28581,0,2162.94,-207.222,445.019,4.24115,604800,0,0,40443,4169,0,0),
(@GUID+80,32925,603,1,1,28581,0,2169.97,-218.059,441.236,4.03171,604800,0,0,40443,4169,0,0),
(@GUID+81,32925,603,1,1,28581,0,2108.07,-208.596,442.986,5.16617,604800,0,0,40443,4169,0,0),
(@GUID+82,32925,603,1,1,28581,0,2102.01,-220.66,434.848,5.35816,604800,0,0,40443,4169,0,0),
(@GUID+83,32925,603,1,1,28581,0,2077.76,-232.818,447.073,5.79449,604800,0,0,40443,4169,0,0),
(@GUID+84,32925,603,1,1,28581,0,2089.41,-225.486,440.96,5.67232,604800,0,0,40443,4169,0,0),
(@GUID+85,32925,603,1,1,28581,0,2089.53,-238.313,432.82,5.79449,604800,0,0,40443,4169,0,0),
(@GUID+86,32925,603,1,1,28581,0,2079.95,-256.325,436.876,6.16101,604800,0,0,40443,4169,0,0),
(@GUID+87,32925,603,1,1,28581,0,2070.53,-254.7,447.074,0.436332,604800,0,0,40443,4169,0,0),
(@GUID+88,32925,603,1,1,28581,0,2068.65,-270.917,449.112,0.226893,604800,0,0,40443,4169,0,0),
(@GUID+89,32925,603,1,1,28581,0,2079.16,-291.637,445.029,0.488692,604800,0,0,40443,4169,0,0),
(@GUID+90,32925,603,1,1,28581,0,2093.31,-296.653,434.853,0.698132,604800,0,0,40443,4169,0,0),
(@GUID+91,32925,603,1,1,28581,0,2188.81,-295.889,445.046,2.49582,604800,0,0,40443,4169,0,0),
(@GUID+92,32925,603,1,1,28581,0,2197.29,-272.726,445.048,3.00197,604800,0,0,40443,4169,0,0);

DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','0','16','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','11403');
DELETE FROM `gameobject` WHERE `id`=194265;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2002365, 194265, 603, 1, 64, 2173.24, -252.985, 420.146, 5.27078, 0, 0, 1, 0, 7200, 100, 1);

UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 2002365;

DELETE FROM `creature` WHERE `guid`=131934;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('131934','33725','603','1','1','16925','0','2134.93','-339.696','437.311','0','604800','0','0','12600','0','0','0');

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33725;
UPDATE `creature_template` SET `flags_extra` = 2, `ScriptName` = 'thorim_phase_trigger' WHERE `entry` = 32892;

DELETE FROM `creature_addon` WHERE `guid`IN (131817, 131934);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('131817','0','0','0','1','0','40775 0'),
('131934','0','0','0','1','0','40775 0');

-- 8264_thorim_preadds
UPDATE `creature_template` SET `mindmg` = 488, `maxdmg` = 642, `attackpower` = 682, `dmg_multiplier` = 7.5, `equipment_id` = 1852 WHERE `entry` = 32908;
UPDATE `creature_template` SET `mindmg` = 488, `maxdmg` = 642, `attackpower` = 482, `dmg_multiplier` = 7.5, `equipment_id` = 1847 WHERE `entry` = 32885;
UPDATE `creature_template` SET `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32907, 32883);

-- 8265_thorim_chest
DELETE FROM `gameobject` WHERE `id`=194314;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(7143, 194314, 603, 1, 1, 2134.58, -286.908, 419.495, 1.55988, 0, 0, 0.703237, 0.710955, -604800, 0, 1);

-- 8266_thorim_hardmode
DELETE FROM creature_template WHERE `entry` IN (33196, 33234);
INSERT INTO `creature_template`  values
('33196','33234','0','0','0','0','28488','0','0','0','Sif','','','0','83','83','2','16','16','0','1','1.14286','1','3','370','531','4','343','35','2000','0','8','33587202','8','0','0','0','0','0','365','542','84','7','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','350','1','1','0','0','0','0','0','0','0','0','1','850','0','0','npc_sif','11159'),
('33234','0','0','0','0','0','28488','0','0','0','Sif (1)','','','0','83','83','2','35','35','0','1','1.14286','1','3','370','531','0','343','70','2000','0','8','0','8','0','0','0','0','0','365','542','84','7','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','350','1','1','0','0','0','0','0','0','0','0','1','0','0','0','','1');

-- 8270_razorscale_triggers
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `flags_extra` = 2, `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;

-- 8274_thorim_tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(' 270010','194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');

-- 8275_tram_packets
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
INSERT INTO `gameobject` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(270011, 194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

-- 8277_ignis_vehicle
UPDATE `creature_template` SET `vehicleid` = 342 WHERE `entry` = 33118;

-- 8281_xt002_adds
UPDATE `creature_template` SET `vehicleid` = 353 WHERE `entry` = 33293;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5, `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33343, 33346);
UPDATE `creature_template` SET `modelid1` = 19139, `modelid2` = 0, `modelid3` = 0, `dmg_multiplier` = 35 WHERE `entry` = 33346;

-- 8282_razorscale_event
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `flags_extra` = 2, `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33245;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33282;

-- 8289_kologarn_arms
DELETE FROM `creature_model_info` WHERE `modelid` IN (28638, 28821, 28822);
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28638, 0.15, 20, 2, 0),
(28821, 0.35, 20, 2, 0),
(28822, 0.35, 20, 2, 0);

-- 8291_hodir_adds_resistance
UPDATE `creature_template` SET `resistance4` = 1000 WHERE `entry` IN (33325, 32901, 33328, 32900, 32893, 33327, 32897, 33326, 32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

-- 8297_mimiron_phase1
UPDATE `creature_template` SET `vehicleId` = 336 WHERE `entry` = 33432; -- Leviathan Mk II
DELETE FROM creature WHERE id = 34071;
DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 7, 1, 'Leviathan Mk II turret');
UPDATE creature_template SET ScriptName = 'boss_mimiron' WHERE entry = 33350;
UPDATE creature_template SET ScriptName = 'boss_leviathan_mk' WHERE entry = 33432;
UPDATE creature_template SET ScriptName = 'boss_leviathan_mk_turret' WHERE entry = 34071;
UPDATE creature_template SET ScriptName = 'mob_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);

-- 8320 mimiron_encounter
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0, 0, 2, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33856, 34143, 34050);
UPDATE `creature_template` SET `unit_flags` = 33686018 WHERE `entry` = 34050;
UPDATE `creature` SET `position_x` = 2736.92, `position_y` = 2572.30, `orientation` = 5.723 WHERE `guid` = 137630;
UPDATE `creature_template` SET `ScriptName` = 'boss_vx_001', `unit_flags` = 0, `vehicleid` = 371, `Health_mod` = 375 WHERE `entry` = 33651;
UPDATE `creature_template` SET `ScriptName` = 'boss_aerial_unit', `unit_flags` = 0, `vehicleid` = 388, `Health_mod` = 250 WHERE `entry` = 33670;
UPDATE `creature_template` SET `vehicleid` = 370, `Health_mod` = 156.185 WHERE `entry` = 33432;
UPDATE `creature_template` SET `Health_mod` = 156.185 WHERE `entry` = 34071;

DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret');
UPDATE `creature_template` SET `modelid1` = 17188, `modelid2` = 0 WHERE `entry` = 25171;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5, `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;

DELETE FROM `creature` WHERE `id`=33651;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33651, 603, 1, 1, 28841, 0, 2744.65, 2569.46, 364.397, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2, `ScriptName` = 'rocket_strike' WHERE `entry` = 34047;

DELETE FROM `creature` WHERE `id`=33670;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33670, 603, 1, 1, 28979, 0, 2744.65, 2569.46, 380.040, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33686020, `type_flags` = 0, `flags_extra` = 2, `ScriptName` = 'magnetic_core' WHERE `entry` = 34068;
-- 8334_mimiron_chest
UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 194956;
DELETE FROM `gameobject` WHERE `id`=194956;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(5868, 194956, 603, 1, 1, 2744.65, 2569.46, 364.397, 3.14159, 0, 0, 0.703237, 0.710955, -604800, 0, 1);

UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33432, 33651, 33670);

-- 8338_ulduar_teleports
DELETE FROM `gameobject` WHERE `id`=194569;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(21679, 194569, 603, 1, 1, 2086.26, -23.9948, 421.316, 0, 0, 0, 0, 1, 180, 255, 0),
(21684, 194569, 603, 1, 1, 1498.05, -24.3509, 420.966, 0, 0, 0, 0, 1, 180, 255, 0),
(49422, 194569, 603, 1, 1, 1859.65, -24.9121, 448.811, 0, 0, 0, 0, 1, 180, 255, 0),
(49423, 194569, 603, 1, 1, 2518.16, 2569.03, 412.299, 0, 0, 0, 0, 1, 180, 255, 0),
(49424, 194569, 603, 1, 1, 1854.82, -11.5608, 334.175, 0, 0, 0, 0, 1, 180, 255, 0),
(73286, 194569, 603, 1, 1, -706.122, -92.6024, 429.876, 0, 0, 0, 0, 1, 180, 255, 0),
(73327, 194569, 603, 1, 1, 553.233, -12.3247, 409.679, 0, 0, 0, 0, 1, 180, 255, 0),
(73322, 194569, 603, 1, 1, 131.248, -35.3802, 409.804, 0, 0, 0, 0, 1, 180, 255, 0),
(73340, 194569, 603, 1, 1, 926.292, -11.4635, 418.595, 0, 0, 0, 0, 1, 180, 255, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33184;

-- 8353_ulduar_evenai
-- Runeforged Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `AIName` = 'EventAI' WHERE `entry` = 34234;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34234);
INSERT INTO `creature_ai_scripts` VALUES 
(3423401, 34234, 0, 0, 100, 3, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Flaming Rune 10'),
(3423402, 34234, 0, 0, 100, 5, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Flaming Rune 25'),
(3423403, 34234, 0, 0, 100, 3, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Lava Burst 10'),
(3423404, 34234, 0, 0, 100, 5, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Lava Burst 25'),
(3423405, 34234, 0, 0, 100, 3, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Runed Flame Jets 10'),
(3423406, 34234, 0, 0, 100, 5, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Runed Flame Jets 25');

-- Steelforged Defender
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370, `AIName` = 'EventAI' WHERE `entry` = 33236;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (33236, 33838);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33236);
INSERT INTO `creature_ai_scripts` VALUES 
(3323601, 33236, 0, 0, 100, 3, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring 10'),
(3323602, 33236, 0, 0, 100, 5, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring 25'),
(3323603, 33236, 0, 0, 100, 3, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt 10'),
(3323604, 33236, 0, 0, 100, 5, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt 25'),
(3323605, 33236, 0, 0, 100, 3, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor 10'),
(3323606, 33236, 0, 0, 100, 5, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor 25');

-- Mechagnome Battletank
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 968, `minrangedmg` = 341, `maxrangedmg` = 506, `AIName` = 'EventAI' WHERE `entry` = 34164;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34164);
INSERT INTO `creature_ai_scripts` VALUES 
(3416401, 34164, 0, 0, 100, 3, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon 10'),
(3416402, 34164, 0, 0, 100, 5, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon 25'),
(3416403, 34164, 0, 0, 100, 3, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack 10'),
(3416404, 34164, 0, 0, 100, 5, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack 25');

-- Ulduar Colossus
UPDATE `creature_template` SET `spell1` = 62625, `attackpower` = 987, `AIName` = 'EventAI' WHERE `entry` = 33237;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33237);
INSERT INTO `creature_ai_scripts` VALUES 
(3323701, 33237, 0, 0, 100, 3, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam 10'),
(3323702, 33237, 0, 0, 100, 5, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam 25');

-- invisible triggers
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33377, 33742, 34286, 33500);

-- Molten Colossus
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `attackpower` = 982, `dmg_multiplier` = 30, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34069;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34069);
INSERT INTO `creature_ai_scripts` VALUES 
(3406901, 34069, 0, 0, 100, 3, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake 10'),
(3406902, 34069, 0, 0, 100, 5, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake 25'),
(3406903, 34069, 0, 0, 100, 3, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast 10'),
(3406904, 34069, 0, 0, 100, 5, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast 25');

-- Magma Rager
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34086;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34086);
INSERT INTO `creature_ai_scripts` VALUES 
(3408601, 34086, 0, 0, 100, 3, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast 10'),
(3408602, 34086, 0, 0, 100, 5, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast 25'),
(3408603, 34086, 0, 0, 100, 3, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds 10'),
(3408604, 34086, 0, 0, 100, 5, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds 25');
UPDATE `creature_template` SET `unit_flags` = 33718790, modelid1 = 11686, modelid2 = 0, `spell1` = 64724, `AIName` = 'EventAI' WHERE `entry` = 34194;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34194);
INSERT INTO `creature_ai_scripts` VALUES 
(3419401, 34194, 0, 0, 100, 3, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds'),
(3419402, 34194, 0, 0, 100, 5, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds');

-- Forge Construct
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64720, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34085;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34085);
INSERT INTO `creature_ai_scripts` VALUES 
(3408501, 34085, 0, 0, 100, 3, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge 10'),
(3408502, 34085, 0, 0, 100, 5, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge 25'),
(3408503, 34085, 0, 0, 100, 3, 2000, 6000, 6000, 9000, 11, 64720, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 10'),
(3408504, 34085, 0, 0, 100, 5, 2000, 6000, 6000, 9000, 11, 64721, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 25');

-- XB-488 Disposalbot
UPDATE `creature_template` SET `spell1` = 65080, `spell2` = 65084, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34273;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34273);
INSERT INTO `creature_ai_scripts` VALUES 
(3427301, 34273, 2, 0, 100, 3, 30, 20, 0, 0, 11, 65084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Self Destruct 10'),
(3427302, 34273, 2, 0, 100, 5, 30, 20, 0, 0, 11, 65084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Self Destruct 25'),
(3427303, 34273, 0, 0, 100, 3, 2000, 6000, 10000, 15000, 11, 65080, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 10'),
(3427304, 34273, 0, 0, 100, 5, 2000, 6000, 10000, 15000, 11, 65104, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 25');

-- Parts Recovery Technician
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554432, `AIName` = 'EventAI' WHERE `entry` = 34267;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34267);
INSERT INTO `creature_ai_scripts` VALUES 
(3426701, 34267, 0, 0, 100, 3, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick 10'),
(3426702, 34267, 0, 0, 100, 5, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick 25'),
(3426703, 34267, 0, 0, 100, 3, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix 10'),
(3426704, 34267, 0, 0, 100, 5, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix 25');

-- XD-175 Compactobot
UPDATE `creature_template` SET `spell1` = 65073, `spell2` = 65106, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34271;
UPDATE `creature_template` SET `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 34269;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34271);
INSERT INTO `creature_ai_scripts` VALUES 
(3427101, 34271, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 65073, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 10'),
(3427102, 34271, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 65106, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 25');

-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `spell1` = 64889, `spell2` = 64975, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34199;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34199);
INSERT INTO `creature_ai_scripts` VALUES 
(3419901, 34199, 0, 0, 100, 3, 0, 0, 10000, 15000, 11, 64889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(3419902, 34199, 0, 0, 100, 5, 0, 0, 10000, 15000, 11, 64975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');

-- Hardened Iron Golem
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64874, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34190;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34190);
INSERT INTO `creature_ai_scripts` VALUES 
(3419001, 34190, 0, 0, 100, 3, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists 10'),
(3419002, 34190, 0, 0, 100, 5, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists 25'),
(3419003, 34190, 0, 0, 100, 3, 5000, 7000, 20000, 30000, 11, 64874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 10'),
(3419004, 34190, 0, 0, 100, 5, 5000, 7000, 20000, 30000, 11, 64967, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 25');

-- Iron Mender
UPDATE `creature_template` SET `spell1` = 64918, `spell2` = 64903, `spell3` = 64897, `dmg_multiplier` = 25, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34198;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34198);
INSERT INTO `creature_ai_scripts` VALUES 
(3419801, 34198, 0, 0, 100, 3, 2000, 4000, 4000, 6000, 11, 64918, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 10'),
(3419802, 34198, 0, 0, 100, 5, 2000, 4000, 4000, 6000, 11, 64971, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 25'),
(3419803, 34198, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 64903, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 10'),
(3419804, 34198, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 64970, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 25'),
(3419805, 34198, 0, 0, 100, 3, 10000, 25000, 30000, 45000, 11, 64897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 10'),
(3419806, 34198, 0, 0, 100, 5, 10000, 25000, 30000, 45000, 11, 64968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 25');

-- Rune Etched Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34196;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34196);
INSERT INTO `creature_ai_scripts` VALUES 
(3419601, 34196, 0, 0, 100, 3, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune 10'),
(3419602, 34196, 0, 0, 100, 5, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune 25'),
(3419603, 34196, 0, 0, 100, 3, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst 10'),
(3419604, 34196, 0, 0, 100, 5, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst 25'),
(3419605, 34196, 0, 0, 100, 3, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets 10'),
(3419606, 34196, 0, 0, 100, 5, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets 25');

-- Chamber Overseer
UPDATE `creature_template` SET `spell1` = 64820, `spell2` = 64825, `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34197;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34197);
INSERT INTO `creature_ai_scripts` VALUES 
(3419701, 34197, 0, 0, 100, 3, 4000, 8000, 6000, 9000, 11, 64820, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 10'),
(3419702, 34197, 0, 0, 100, 5, 4000, 8000, 6000, 9000, 11, 64943, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 25'),
(3419703, 34197, 0, 0, 100, 3, 10000, 12000, 8000, 12000, 11, 64825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 10'),
(3419704, 34197, 0, 0, 100, 5, 10000, 12000, 8000, 12000, 11, 64944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `dmg_multiplier` = 45, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33722;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33722);
INSERT INTO `creature_ai_scripts` VALUES 
(3372201, 33722, 0, 0, 100, 3, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 10'),
(3372202, 33722, 0, 0, 100, 5, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 25'),
(3372203, 33722, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 10'),
(3372204, 33722, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `dmg_multiplier` = 45, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33699;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33699);
INSERT INTO `creature_ai_scripts` VALUES 
(3369901, 33699, 0, 0, 100, 3, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 10'),
(3369902, 33699, 0, 0, 100, 5, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 25'),
(3369903, 33699, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 10'),
(3369904, 33699, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 25');

-- Champion of Hodir
UPDATE `creature_template` SET `spell1` = 64639, `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34133;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34133);
INSERT INTO `creature_ai_scripts` VALUES 
(3413301, 34133, 0, 0, 100, 3, 3000, 6000, 12000, 16000, 11, 64639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 10'),
(3413302, 34133, 0, 0, 100, 5, 3000, 6000, 12000, 16000, 11, 64652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 25');
DELETE FROM `creature` WHERE `guid` IN (136293, 136294, 136295, 136292, 136313, 136314, 136312, 136321, 136319, 136320, 136322, 136346, 136343, 136536, 136533, 137563);

-- Winter Jormungar
UPDATE `creature_template` SET `spell1` = 64638, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34137;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34137);
INSERT INTO `creature_ai_scripts` VALUES 
(3413701, 34137, 0, 0, 100, 3, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite 10'),
(3413702, 34137, 0, 0, 100, 5, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite 25');
UPDATE `creature` SET `spawndist` = 2 WHERE `id` = 34137;

-- Winter Revenant
UPDATE `creature_template` SET `spell1` = 64642, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34134;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34134);
INSERT INTO `creature_ai_scripts` VALUES 
(3413401, 34134, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 64642, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 10'),
(3413402, 34134, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 64653, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 25'),
(3413403, 34134, 0, 0, 100, 3, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike 10'),
(3413404, 34134, 0, 0, 100, 5, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike 25'),
(3413405, 34134, 0, 0, 100, 3, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant 10'),
(3413406, 34134, 0, 0, 100, 5, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant 25');

-- Winter Rumbler
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64647, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34135;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34135);
INSERT INTO `creature_ai_scripts` VALUES 
(3413501, 34135, 0, 0, 100, 3, 6000, 12000, 10000, 16000, 11, 64645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold 10'),
(3413502, 34135, 0, 0, 100, 5, 6000, 12000, 10000, 16000, 11, 64655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold 25'),
(3413503, 34135, 0, 0, 100, 3, 3000, 6000, 8000, 12000, 11, 64647, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 10'),
(3413504, 34135, 0, 0, 100, 5, 3000, 6000, 8000, 12000, 11, 64654, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 25');

-- Guardian Lasher
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63047, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33430;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33430);
INSERT INTO `creature_ai_scripts` VALUES 
(3343001, 33430, 4, 0, 100, 3, 0, 0, 0, 0, 11, 63007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian Pheromones 10'),
(3343002, 33430, 4, 0, 100, 5, 0, 0, 0, 0, 11, 63007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian Pheromones 25'),
(3343003, 33430, 0, 0, 100, 3, 3000, 6000, 10000, 14000, 11, 63047, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian''s Lash 10'),
(3343004, 33430, 0, 0, 100, 5, 3000, 6000, 10000, 14000, 11, 63550, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian''s Lash 25');

-- Forest Swarmer
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33431;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33431);
INSERT INTO `creature_ai_scripts` VALUES 
(3343101, 33431, 0, 0, 100, 3, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate 10'),
(3343102, 33431, 0, 0, 100, 5, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate 25');
/*
DELETE FROM `spell_script_target` WHERE `entry`=63059;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('63059','1','33430');
*/

-- Guardian of Life
UPDATE `creature_template` SET `spell1` = 63226, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 33528;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33528);
INSERT INTO `creature_ai_scripts` VALUES 
(3352801, 33528, 0, 0, 100, 3, 3000, 9000, 15000, 20000, 11, 63226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 10'),
(3352802, 33528, 0, 0, 100, 5, 3000, 9000, 15000, 20000, 11, 63551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 25');

-- Nature's Blade
UPDATE `creature_template` SET `spell1` = 63247, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 25, `AIName` = 'EventAI' WHERE `entry` = 33527;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33527);

-- Ironroot Lasher
UPDATE `creature_template` SET `spell1` = 63240, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 33526;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33526);
INSERT INTO `creature_ai_scripts` VALUES 
(3352601, 33526, 0, 0, 100, 3, 3000, 8000, 12000, 16000, 11, 63240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 10'),
(3352602, 33526, 0, 0, 100, 5, 3000, 8000, 12000, 16000, 11, 63553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 25');

-- Mangrove Ent
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63242, `spell3` = 63241, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33525;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33525);
INSERT INTO `creature_ai_scripts` VALUES 
(3352501, 33525, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane 10'),
(3352502, 33525, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane 25'),
(3352503, 33525, 0, 0, 100, 3, 12000, 16000, 12000, 16000, 11, 63242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 10'),
(3352504, 33525, 0, 0, 100, 5, 12000, 16000, 12000, 16000, 11, 63556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 25'),
(3352505, 33525, 0, 0, 100, 3, 25000, 30000, 25000, 30000, 11, 63241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 10'),
(3352506, 33525, 0, 0, 100, 5, 25000, 30000, 25000, 30000, 11, 63554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 25');

-- Misguided Nymph
UPDATE `creature_template` SET `spell1` = 63082, `spell2` = 63111, `spell3` = 63136, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33355;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33355);
INSERT INTO `creature_ai_scripts` VALUES 
(3335501, 33355, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 10'),
(3335502, 33355, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 25'),
(3335503, 33355, 0, 0, 100, 3, 4000, 6000, 12000, 16000, 11, 63111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 10'),
(3335504, 33355, 0, 0, 100, 5, 4000, 6000, 12000, 16000, 11, 63562, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 25'),
(3335505, 33355, 0, 0, 100, 3, 15000, 20000, 15000, 20000, 11, 63136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 10'),
(3335506, 33355, 0, 0, 100, 5, 15000, 20000, 15000, 20000, 11, 63564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 25');

-- Corrupted Servitor
UPDATE `creature_template` SET `spell1` = 63169, `spell2` = 63149, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33354;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33354);
INSERT INTO `creature_ai_scripts` VALUES 
(3335401, 33354, 0, 0, 100, 3, 2000, 4000, 20000, 25000, 11, 63169, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Petrify Joints 10'),
(3335402, 33354, 0, 0, 100, 5, 2000, 4000, 20000, 25000, 11, 63549, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Petrify Joints 25'),
(3335403, 33354, 0, 0, 100, 3, 6000, 8000, 12000, 16000, 11, 63149, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Violent Earth 10'),
(3335404, 33354, 0, 0, 100, 5, 6000, 8000, 12000, 16000, 11, 63149, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Violent Earth 25');

-- Dark Rune
UPDATE `creature_template` SET `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` IN (33754, 33755);

-- Freya's Elders
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33406, 33575);
UPDATE `creature_template` SET `dmg_multiplier` = 45, `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32913, 32915, 32914);

-- Arachnopod Destroyer
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `dmg_multiplier` = 30, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34183;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34183);
INSERT INTO `creature_ai_scripts` VALUES 
(3418301, 34183, 0, 0, 100, 3, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Flame Spray 10'),
(3418302, 34183, 0, 0, 100, 5, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Flame Spray 25'),
(3418303, 34183, 0, 0, 100, 3, 8000, 10000, 12000, 16000, 11, 64776, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Machine Gun 10'),
(3418304, 34183, 0, 0, 100, 5, 8000, 10000, 12000, 16000, 11, 64776, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Machine Gun 25');

-- Clockwork Mechanic
UPDATE `creature_template` SET `dmg_multiplier` = 20, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 34184;

-- Trash
UPDATE `creature_template` SET `dmg_multiplier` = 10 WHERE `entry` = 34191;

-- Boomer XP-500
UPDATE `creature_template` SET `spell1` = 55714, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 34192;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34192);
INSERT INTO `creature_ai_scripts` VALUES 
(3419201, 34192, 9, 0, 100, 3, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode 10'),
(3419202, 34192, 9, 0, 100, 5, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode 25');

-- Clockwork Sapper
UPDATE `creature_template` SET `spell1` = 64740, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34193;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34193);
INSERT INTO `creature_ai_scripts` VALUES 
(3419301, 34193, 0, 0, 100, 3, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap 10'),
(3419302, 34193, 0, 0, 100, 5, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap 25');

-- Twilight Adherent
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33818;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33818);
INSERT INTO `creature_ai_scripts` VALUES 
(3381801, 33818, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst 10'),
(3381802, 33818, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst 25'),
(3381803, 33818, 0, 0, 100, 3, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal 10'),
(3381804, 33818, 0, 0, 100, 5, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal 25'),
(3381805, 33818, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream 10'),
(3381806, 33818, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream 25');

-- Twilight Guardian
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `dmg_multiplier` = 40, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33822;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33822);
INSERT INTO `creature_ai_scripts` VALUES 
(3382201, 33822, 0, 0, 100, 3, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow 10'),
(3382202, 33822, 0, 0, 100, 5, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow 25'),
(3382203, 33822, 0, 0, 100, 3, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate 10'),
(3382204, 33822, 0, 0, 100, 5, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate 25'),
(3382205, 33822, 0, 0, 100, 3, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap 10'),
(3382206, 33822, 0, 0, 100, 5, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap 25');

-- Twilight Shadowblade
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513,  `equipment_id` = 1862, `dmg_multiplier` = 25, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33824;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33824);
INSERT INTO `creature_ai_scripts` VALUES 
(3382401, 33824, 0, 0, 100, 3, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives 10'),
(3382402, 33824, 0, 0, 100, 5, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives 25');

-- Twilight Slayer
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `dmg_multiplier` = 50, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33823;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33823);
INSERT INTO `creature_ai_scripts` VALUES 
(3382301, 33823, 0, 0, 100, 3, 3000, 5000, 16000, 20000, 11, 35054, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Mortal Strike 10'),
(3382302, 33823, 0, 0, 100, 5, 3000, 5000, 8000, 10000, 11, 35054, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Mortal Strike 25'),
(3382303, 33823, 0, 0, 100, 3, 9000, 12000, 28000, 34000, 11, 63784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Bladestorm 10'),
(3382304, 33823, 0, 0, 100, 5, 9000, 12000, 28000, 34000, 11, 63784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Bladestorm 25');

UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` IN (33818, 33822, 33823, 33824, 33772, 33819, 33820, 33838);
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 32908;

-- Faceless Horror
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `dmg_multiplier` = 65, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33772;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33772);
INSERT INTO `creature_ai_scripts` VALUES 
(3377201, 33772, 0, 0, 100, 3, 18000, 22000, 15000, 20000, 11, 64429, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Death Grip 10'),
(3377202, 33772, 0, 0, 100, 5, 18000, 22000, 15000, 20000, 11, 64429, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Death Grip 25'),
(3377203, 33772, 0, 0, 100, 3, 2000, 4000, 10000, 12000, 11, 63722, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Shadow Crash 10'),
(3377204, 33772, 0, 0, 100, 5, 2000, 4000, 10000, 12000, 11, 63722, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Shadow Crash 25'),
(3377205, 33772, 4, 0, 100, 3, 0, 0, 0, 0, 11, 63703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Void Wave 10'),
(3377206, 33772, 4, 0, 100, 5, 0, 0, 0, 0, 11, 63703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Void Wave 25');

-- Twilight Frost Mage
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33819;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33819);
INSERT INTO `creature_ai_scripts` VALUES 
(3381901, 33819, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Arcane Burst 10'),
(3381902, 33819, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Arcane Burst 25'),
(3381903, 33819, 0, 0, 100, 3, 1000, 2000, 6000, 8000, 11, 63913, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frostbolt 10'),
(3381904, 33819, 0, 0, 100, 5, 1000, 2000, 6000, 8000, 11, 63913, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frostbolt 25'),
(3381905, 33819, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Bolt Volley 10'),
(3381906, 33819, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Bolt Volley 25'),
(3381907, 33819, 0, 0, 100, 3, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Nova 10'),
(3381908, 33819, 0, 0, 100, 5, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Nova 25');

-- Twilight Pyromancer
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33820;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33820);
INSERT INTO `creature_ai_scripts` VALUES 
(3382001, 33820, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst 10'),
(3382002, 33820, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst 25'),
(3382003, 33820, 0, 0, 100, 3, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball 10'),
(3382004, 33820, 0, 0, 100, 5, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball 25'),
(3382005, 33820, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike 10'),
(3382006, 33820, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike 25');

-- Enslaved Fire Elemental
UPDATE `creature_template` SET `spell1` = 38064, `spell2` = 63778, `mechanic_immune_mask` = 33554513, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33838;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33838);
INSERT INTO `creature_ai_scripts` VALUES 
(3383801, 33838, 0, 0, 100, 3, 4000, 8000, 12000, 14000, 11, 38064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Blast Wave 10'),
(3383802, 33838, 0, 0, 100, 5, 4000, 8000, 12000, 14000, 11, 38064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Blast Wave 25'),
(3383803, 33838, 4, 0, 100, 3, 0, 0, 0, 0, 11, 63778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Fire Shield 10'),
(3383804, 33838, 4, 0, 100, 5, 0, 0, 0, 0, 11, 63778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Fire Shield 25');



-- Flame Leviathan
UPDATE `creature_template` SET `dmg_multiplier` = 40, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33118;

-- Ignis
UPDATE `creature_template` SET `dmg_multiplier` = 45, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33118;
UPDATE `creature_template` SET `dmg_multiplier` = 21 WHERE `entry` = 33121;

-- Razorscale
UPDATE `creature_template` SET `dmg_multiplier` = 45, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33186;
UPDATE `creature_template` SET `dmg_multiplier` = 15 WHERE `entry` IN (33453, 33388);
UPDATE `creature_template` SET `dmg_multiplier` = 23 WHERE `entry` = 33846;

-- XT-002
UPDATE `creature_template` SET `dmg_multiplier` = 80, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33293;

-- Assembly of Iron
UPDATE `creature_template` SET `dmg_multiplier` = 95, `AIName` = '' WHERE `entry` = 32867;
UPDATE `creature_template` SET `dmg_multiplier` = 60, `AIName` = '' WHERE `entry` = 32927;
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 32857;

-- Kologarn
UPDATE `creature_template` SET `dmg_multiplier` = 65 WHERE `entry` = 32930;

-- Hodir
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 32845;

-- Auriaya
UPDATE `creature_template` SET `dmg_multiplier` = 65, `unit_class` = 1, `mingold` = 1720000, `maxgold` = 1760000, `mechanic_immune_mask` = 617299803 WHERE `entry` = 33515;
UPDATE `creature_template` SET `speed_walk` = 2, `speed_run` = 2, `dmg_multiplier` = 3 WHERE `entry` = 34035;

-- Freya
UPDATE `creature_template` SET `dmg_multiplier` = 50 WHERE `entry` = 32906;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 7.5, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 32918;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 40, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33203;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33202;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 32919;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 45, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 32916;

-- Thorim
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 32865;
UPDATE `creature_template` SET `dmg_multiplier` = 35 WHERE `entry` IN (32882, 32872, 32873);
UPDATE `creature_template` SET `dmg_multiplier` = 20 WHERE `entry` IN (32908, 32876, 32877, 32874, 33125);
UPDATE `creature_template` SET `dmg_multiplier` = 15 WHERE `entry` IN (32885, 33110, 32878);
UPDATE `creature_template` SET `dmg_multiplier` = 10 WHERE `entry` = 32904;

-- Mimiron
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 75, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33432;

-- Vezax
UPDATE `creature_template` SET `dmg_multiplier` = 65, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 33271;

-- 8362_boss_vezax
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `flags_extra` = 257, `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'mob_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'mob_saronite_animus' WHERE `entry` = 33524;

-- 8378_ulduar_modelid
-- XT-002
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 10 WHERE `modelid` = 28611;
UPDATE `creature_template` SET `dmg_multiplier` = 70 WHERE `entry` = 33293;
-- Assembly of Iron
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 25 WHERE `modelid` = 28313;
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 6 WHERE `modelid` = 28344;
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299547 WHERE `entry` = 32857;
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 32867;
UPDATE `creature_template` SET `dmg_multiplier` = 45 WHERE `entry` = 32927;
-- Kologarn
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28638;
UPDATE `creature_model_info` SET `bounding_radius` = 0.35, `combat_reach` = 15 WHERE `modelid` = 28821;
UPDATE `creature_model_info` SET `bounding_radius` = 0.35, `combat_reach` = 15 WHERE `modelid` = 28822;
UPDATE `creature_template` SET `baseattacktime` = 1800 WHERE `entry` = 32930;
-- Auriaya
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28651;
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 33515;
-- Freya
UPDATE `creature_template` SET `baseattacktime` = 1500 WHERE `entry` = 32906;
-- Mimiron
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 7 WHERE `modelid` = 28831;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28841;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 4 WHERE `modelid` = 28979;
-- Genaral Vezax
UPDATE `creature_template` SET `baseattacktime` = 1800, `dmg_multiplier` = 45 WHERE `entry` = 33271;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 12 WHERE `modelid` = 28548;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` = 33838;

-- 8406_emalon
UPDATE creature_template SET lootid = 33993, mindmg = 509, maxdmg = 683, attackpower = 805, dmg_multiplier = 35 WHERE entry = 33993;
UPDATE creature_template SET lootid = 33994, mindmg = 509, maxdmg = 683, attackpower = 805, dmg_multiplier = 70 WHERE entry = 33994;

-- 8407_voa&emalon
UPDATE creature SET spawnMask = 1 WHERE id = 33993;
UPDATE creature_template SET faction_A = 16, faction_H = 16 WHERE entry = 33994;
UPDATE creature_template SET mindmg = 422, maxdmg = 586, attackpower = 642, dmg_multiplier = 7.5, minrangedmg = 345, maxrangedmg = 509, rangedattackpower = 103 WHERE entry = 33998;

-- 8422 ulduar_loots_hardmode
UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` = 33686;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33779;
DELETE FROM `creature_template` WHERE entry = 33115;
DELETE FROM creature WHERE id = 33115;

-- Emblem of Valor
UPDATE creature_loot_template SET item = 40753 WHERE entry IN (33113, 33186, 33118, 33293, 32927, 32857, 33515, 33271) AND item = 45624;
UPDATE gameobject_loot_template SET item = 40753 WHERE entry IN (27061, 26963, 27078, 27081, 26955, 26946, 27068) AND item = 40752;

-- Flame Leviathan
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` = 33113;

-- XT-002 Hardmode loot

DELETE FROM `creature_loot_template` WHERE `entry`=33293;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33293','40753','100','1','0','1','1'),
('33293','1','100','1','0','-34121','2'),
('33293','45867','0','2','2','1','1'),
('33293','45868','0','2','2','1','1'),
('33293','45869','0','2','2','1','1'),
('33293','45870','0','2','2','1','1'),
('33293','45871','0','2','2','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34121;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34121','45675','0','1','1','1','1'),
('34121','45676','0','1','1','1','1'),
('34121','45677','0','1','1','1','1'),
('34121','45679','0','1','1','1','1'),
('34121','45680','0','1','1','1','1'),
('34121','45682','0','1','1','1','1'),
('34121','45685','0','1','1','1','1'),
('34121','45686','0','1','1','1','1'),
('34121','45687','0','1','1','1','1'),
('34121','45694','0','1','1','1','1');

-- Assembly of Iron Hardmode loot

DELETE FROM `creature_loot_template` WHERE `entry` IN (32857, 32927, 32867);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('32857','40753','100','1','0','1','1'),
('32857','1','100','1','0','-34122','2'),
('32927','40753','100','1','0','2','2'),
('32927','1','100','1','0','-34122','3'),
('32867','45624','100','1','0','1','1'),
('32867','1','100','1','0','-34122','2'),
('32867','45447','0','2','2','1','1'),
('32867','45448','0','2','2','1','1'),
('32867','45449','0','2','2','1','1'),
('32867','45455','0','2','2','1','1'),
('32867','45456','0','2','2','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34122;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34122','45322','0','1','1','1','1'),
('34122','45324','0','1','1','1','1'),
('34122','45329','0','1','1','1','1'),
('34122','45330','0','1','1','1','1'),
('34122','45331','0','1','1','1','1'),
('34122','45332','0','1','1','1','1'),
('34122','45333','0','1','1','1','1'),
('34122','45378','0','1','1','1','1'),
('34122','45418','0','1','1','1','1'),
('34122','45423','0','1','1','1','1');

-- Freya Hardmode loot

UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979  WHERE `entry` = 33203;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33215;
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (27078, 27079, 27080, 27081);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27078','1','100','1','0','-34125','1'),
('27078','2','100','1','0','-34105','1'),
('27078','40753','100','1','0','1','1'),
('27078','45087','100','1','0','1','1'),
('27078','45644','0','1','1','1','1'),
('27078','45645','0','1','1','1','1'),
('27078','45646','0','1','1','1','1'),
('27078','46110','100','1','0','1','1'),
('27079','1','100','1','0','-34125','2'),
('27079','2','100','1','0','-34105','1'),
('27079','40753','100','1','0','1','1'),
('27079','45087','100','1','0','1','1'),
('27079','45644','0','1','1','1','1'),
('27079','45645','0','1','1','1','1'),
('27079','45646','0','1','1','1','1'),
('27079','46110','100','1','0','1','1'),
('27080','1','100','1','0','-34125','2'),
('27080','2','100','1','0','-34105','1'),
('27080','40753','100','1','0','2','2'),
('27080','45087','100','1','0','1','1'),
('27080','45644','0','1','1','1','1'),
('27080','45645','0','1','1','1','1'),
('27080','45646','0','1','1','1','1'),
('27080','46110','100','1','0','1','1'),
('27081','1','100','1','0','-34125','1'),
('27081','2','100','1','0','-34105','1'),
('27081','45943','0','1','2','1','1'),
('27081','45945','0','1','2','1','1'),
('27081','45946','0','1','2','1','1'),
('27081','45294','0','1','2','1','1'),
('27081','45947','0','1','2','1','1'),
('27081','45624','100','1','0','1','1'),
('27081','45087','100','1','0','1','1'),
('27081','45644','0','1','1','1','1'),
('27081','45645','0','1','1','1','1'),
('27081','45646','0','1','1','1','1'),
('27081','45788','-100','1','0','1','1'),
('27081','46110','100','1','0','1','1');

DELETE FROM `gameobject_template` WHERE entry = 194326;
INSERT INTO `gameobject_template` VALUES('194326','3','8628','Freya\'s Gift','','','','0','0','2','0','0','0','0','0','0','1634','27080','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11159');

DELETE FROM `reference_loot_template` WHERE `entry`=34125;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34125','45934','0','1','1','1','1'),
('34125','45935','0','1','1','1','1'),
('34125','45936','0','1','1','1','1'),
('34125','45940','0','1','1','1','1'),
('34125','45941','0','1','1','1','1');

-- Hodir Harmode loot

UPDATE script_texts SET `type` = 2 WHERE entry = -1603218;
DELETE FROM `gameobject` WHERE `id`=194200;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(194200, 603, 1, 1, 2038.29, -200.702, 432.687, 3.12232, 0, 0, 1, 0, 300, 0, 1);

DELETE FROM `gameobject_loot_template` WHERE entry=27069;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27069','45624','100','1','0','1','1'),
('27069','45888','0','1','1','1','1'),
('27069','45886','0','1','1','1','1'),
('27069','45887','0','1','1','1','1'),
('27069','45877','0','1','1','1','1'),
('27069','45876','0','1','1','1','1'),
('27069','45786','-100','1','0','1','1');

-- Thorim Hardmode loot

DELETE FROM `gameobject` WHERE `id`=194314;
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 0 WHERE `entry` IN (194312, 194313);

DELETE FROM `gameobject_loot_template` WHERE entry IN (27073, 27074);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27073','40753','100','1','0','1','1'),
('27073','1','100','1','0','-34130','1'),
('27073','45659','0','1','1','1','1'),
('27073','45660','0','1','1','1','1'),
('27073','45661','0','1','1','1','1'),
('27074','45624','100','1','0','1','1'),
('27074','1','100','1','0','-34130','1'),
('27074','45928','0','1','2','1','1'),
('27074','45929','0','1','2','1','1'),
('27074','45930','0','1','2','1','1'),
('27074','45931','0','1','2','1','1'),
('27074','45933','0','1','2','1','1'),
('27074','45659','0','1','1','1','1'),
('27074','45660','0','1','1','1','1'),
('27074','45661','0','1','1','1','1'),
('27074','45784','-100','3','0','1','1');

DELETE FROM `reference_loot_template` WHERE entry = 34130;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34130','45892','0','1','1','1','1'),
('34130','45893','0','1','1','1','1'),
('34130','45894','0','1','1','1','1'),
('34130','45895','0','1','1','1','1'),
('34130','45927','0','1','1','1','1');

-- Mimiron Hardmode loot

DELETE FROM `gameobject` WHERE `id`=194956;
DELETE FROM `gameobject_template` WHERE entry = 194790;
INSERT INTO `gameobject_template` VALUES ('194790','3','8686','Cache of Innovation','','','','0','0','1.5','0','0','0','0','0','0','1634','27086','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11159');

DELETE FROM `gameobject_loot_template` WHERE entry IN (27085, 27086);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27085','40753','100','1','0','1','1'),
('27085','1','100','1','0','-34129','1'),
('27085','45647','0','1','1','1','1'),
('27085','45648','0','1','1','1','1'),
('27085','45649','0','1','1','1','1'),
('27086','45624','100','1','0','1','1'),
('27086','1','100','1','0','-34129','1'),
('27086','45982','0','1','2','1','1'),
('27086','45988','0','1','2','1','1'),
('27086','45989','0','1','2','1','1'),
('27086','45990','0','1','2','1','1'),
('27086','45993','0','1','2','1','1'),
('27086','45647','0','1','1','1','1'),
('27086','45648','0','1','1','1','1'),
('27086','45649','0','1','1','1','1'),
('27086','45787','-100','1','0','1','1');

DELETE FROM `reference_loot_template` WHERE entry = 34129;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34129','45972','0','1','1','1','1'),
('34129','45973','0','1','1','1','1'),
('34129','45974','0','1','1','1','1'),
('34129','45975','0','1','1','1','1'),
('34129','45976','0','1','1','1','1');

-- General Vezax Hardmode loot

DELETE FROM `creature_loot_template` WHERE entry = 33271;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33271','40753','100','1','0','1','1'),
('33271','1','100','1','0','-34131','2'),
('33271','46032','0','2','2','1','1'),
('33271','46033','0','2','2','1','1'),
('33271','46034','0','2','2','1','1'),
('33271','46035','0','2','2','1','1'),
('33271','46036','0','2','2','1','1');

DELETE FROM `reference_loot_template` WHERE entry = 34131;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34131','45996','0','1','1','1','1'),
('34131','45997','0','1','1','1','1'),
('34131','46008','0','1','1','1','1'),
('34131','46009','0','1','1','1','1'),
('34131','46010','0','1','1','1','1'),
('34131','46011','0','1','1','1','1'),
('34131','46012','0','1','1','1','1'),
('34131','46013','0','1','1','1','1'),
('34131','46014','0','1','1','1','1'),
('34131','46015','0','1','1','1','1');

-- 8410_vezax_animus
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` = 33524;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 10 WHERE `modelid` = 28992;

-- mimiron_hardmode
UPDATE `gameobject_template` SET `type` = 1, `flags` = 32, `ScriptName` = 'not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `unit_flags` = 33554946, `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'mob_mimiron_flame' WHERE `entry` = 34363;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 7.5, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `ScriptName` = 'mob_junk_bot' WHERE `entry` = 33855;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `ScriptName` = 'mob_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_emergency_bot' WHERE `entry` = 34147;

-- 8407_emalon
UPDATE creature SET spawnMask = 1 WHERE id = 33993;
UPDATE creature_template SET faction_A = 16, faction_H = 16 WHERE entry = 33994;
UPDATE creature_template SET mindmg = 422, maxdmg = 586, attackpower = 642, dmg_multiplier = 7.5, minrangedmg = 345, maxrangedmg = 509, rangedattackpower = 103 WHERE entry = 33998;

-- 8429_leviathan_encounter
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62475;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62475','9032','2','System Shutdown');

DELETE FROM areatrigger_scripts WHERE entry IN (5369, 5423);
INSERT INTO areatrigger_scripts VALUES
(5369,'at_RX_214_repair_o_matic_station'),
(5423,'at_RX_214_repair_o_matic_station');

-- 8436_dalaran_teleporter
UPDATE `gameobject_template` SET `type` = 22, `data0` = 53141, `data2` = 1, `data3` = 1 WHERE `entry` = 194481;

-- 8440_achievement_antechamber
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10578, 10579, 10580, 10581);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(10578, 12, 0, 0),
(10580, 12, 0, 0),
(10579, 12, 1, 0),
(10581, 12, 1, 0);

-- 8441_bind
UPDATE `creature_template` SET Health_mod = 50 WHERE `entry` = 33109;
UPDATE `creature_template` SET Health_mod = 90 WHERE `entry` = 33060;
UPDATE `creature_template` SET Health_mod = 40 WHERE `entry` = 33062;

UPDATE `creature_template` SET `dmg_multiplier` = 55, `flags_extra` = 9 WHERE `entry` = 33118;
UPDATE `creature_template` SET `dmg_multiplier` = 50, flags_extra = 1 WHERE `entry` = 33186;
UPDATE `creature_template` SET `dmg_multiplier` = 75, flags_extra = 1 WHERE `entry` = 33293;
UPDATE `creature_template` SET flags_extra = 257 WHERE entry IN (33113, 33271); 
UPDATE `creature_template` SET flags_extra = 1 WHERE entry IN (32867, 32927, 32857, 32930, 33515, 32906, 32845, 33350, 33432, 33651, 33670, 32865, 33288);

-- 8441_achievement_keepers
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10598, 10599, 10559, 10444, 10563, 10455, 10558, 10438, 10561, 10454, 10408, 10560, 10453, 10562);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Freya
(10559, 12, 0, 0),
(10444, 12, 0, 0),
(10563, 12, 1, 0),
(10455, 12, 1, 0),
-- Thorim
(10558, 12, 0, 0),
(10438, 12, 0, 0),
(10561, 12, 1, 0),
(10454, 12, 1, 0),
-- Hodir
(10408, 12, 0, 0),
(10560, 12, 0, 0),
(10453, 12, 1, 0),
(10562, 12, 1, 0);

-- 8447
-- dalaran portal
UPDATE `gameobject_template` SET `faction` = 2007, `data0` = 53141, `data2` = 0 WHERE `entry` = 194481;

-- 8444_ulduar_bind
UPDATE `creature_template` SET Health_mod = 50 WHERE `entry` = 33109;
UPDATE `creature_template` SET Health_mod = 90 WHERE `entry` = 33060;
UPDATE `creature_template` SET Health_mod = 40 WHERE `entry` = 33062;

UPDATE `creature_template` SET `dmg_multiplier` = 55, `flags_extra` = 9 WHERE `entry` = 33118;
UPDATE `creature_template` SET `dmg_multiplier` = 50, flags_extra = 1 WHERE `entry` = 33186;
UPDATE `creature_template` SET `dmg_multiplier` = 75, flags_extra = 1 WHERE `entry` = 33293;
UPDATE `creature_template` SET flags_extra = 257 WHERE entry IN (33113, 33271); 
UPDATE `creature_template` SET flags_extra = 1 WHERE entry IN (32867, 32927, 32857, 32930, 33515, 32906, 32845, 33350, 33432, 33651, 33670, 32865, 33288);

-- 8451_vehicle_regen
-- Ulduar vehicle regen and Freya's Healthy Spores
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 33215;
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` IN (33060, 33062, 33109);

-- 8452_keepers_images
-- Ulduar Keepers Images
DELETE FROM `creature` WHERE `id` IN (33213, 33241, 33242, 33244);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33241, 603, 1, 1, 0, 0, 2057.81, -24.0768, 421.532, 3.12904, 604800, 0, 0, 14433075, 0, 0, 0),
(33242, 603, 1, 1, 0, 0, 2036.81, -73.7053, 411.353, 2.43575, 604800, 0, 0, 14433075, 0, 0, 0),
(33244, 603, 1, 1, 0, 0, 2036.74, 25.4642, 411.357, 3.81412, 604800, 0, 0, 14433075, 0, 0, 0),
(33213, 603, 1, 1, 0, 0, 1939.29, -90.6994, 411.357, 1.02595, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 1, `flags_extra` = 2, `ScriptName` = 'npc_keeper_image' WHERE `entry` IN (33213, 33241, 33242, 33244);

-- 8453_razorscale_yell
-- razorscale yell fix
UPDATE `script_texts` SET `content_default` = "Move! Quickly! She won't remain grounded for long.", `type` = 1  WHERE `entry` = -1603261;

-- script names faltantes
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_ironbranch' WHERE `entry` =32913;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_stonebark' WHERE `entry` =32914;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_brightleaf' WHERE `entry` =32195;
UPDATE `creature_template` SET `ScriptName` = 'creature_iron_roots' WHERE `entry` =33088;
UPDATE `creature_template` SET `ScriptName` = 'creature_sun_beam' WHERE `entry` =33170;
-- XT-002 vehicle id
UPDATE `creature_template` SET `unit_flags` = 33554432, `type_flags` = 0, `VehicleId` = 335 WHERE `entry` = 33293;

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `player_factionchange_reputations`
-- ----------------------------
DROP TABLE IF EXISTS `player_factionchange_reputations`;
CREATE TABLE `player_factionchange_reputations` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_factionchange_reputations
-- ----------------------------

-- ----------------------------
-- Table structure for `player_factionchange_spells`
-- ----------------------------
DROP TABLE IF EXISTS `player_factionchange_spells`;
CREATE TABLE `player_factionchange_spells` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_factionchange_spells
-- ----------------------------

-- ----------------------------
-- Table structure for `player_factionchange_items`
-- ----------------------------
DROP TABLE IF EXISTS `player_factionchange_items`;
CREATE TABLE `player_factionchange_items` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_factionchange_items
-- ----------------------------

-- ----------------------------
-- Table structure for `player_factionchange_achievements`
-- ----------------------------
DROP TABLE IF EXISTS `player_factionchange_achievements`;
CREATE TABLE `player_factionchange_achievements` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_factionchange_achievements
-- ----------------------------

ALTER TABLE db_version CHANGE COLUMN required_31_world_db_version required_2_world_fixes bit;

-- IcecrownCitadel
DELETE FROM `gameobject_scripts` WHERE id= 201584;

-- EyeOfEternity
DELETE FROM achievement_criteria_data WHERE criteria_id = 1400;
UPDATE `creature_template` SET `difficulty_entry_1` = '0' WHERE `creature_template`.`entry` =28859 LIMIT 1 ;

-- TheOculus
UPDATE `creature` SET `phaseMask` = '1' WHERE `creature`.`guid` =86828 LIMIT 1;
UPDATE `creature` SET `phaseMask` = '1' WHERE `creature`.`guid` =86829 LIMIT 1;
UPDATE `creature` SET `phaseMask` = '1' WHERE `creature`.`guid` =86830 LIMIT 1;
UPDATE `creature` SET `phaseMask` = '1' WHERE `creature`.`guid` =86831 LIMIT 1;
UPDATE `creature` SET `phaseMask` = '1' WHERE `creature`.`guid` =86832 LIMIT 1;
UPDATE `creature` SET `phaseMask` = '1' WHERE `creature`.`guid` =86833 LIMIT 1;
UPDATE `creature` SET `phaseMask` = '1' WHERE `creature`.`guid` =86834 LIMIT 1;
UPDATE `creature` SET `phaseMask` = '1' WHERE `creature`.`guid` =86835 LIMIT 1;
DELETE FROM `creature_questrelation` WHERE `id` = 27658; 
DELETE FROM `creature_involvedrelation` WHERE `id` = 27658; 

-- ObsidianSanctum
UPDATE `creature` SET `MovementType` = '0' WHERE `creature`.`guid` =123400 LIMIT 1;
UPDATE `creature` SET `MovementType` = '0' WHERE `creature`.`guid` =123401 LIMIT 1;
UPDATE `creature` SET `MovementType` = '0' WHERE `creature`.`guid` =123402 LIMIT 1;
UPDATE `creature` SET `MovementType` = '0' WHERE `creature`.`guid` =123403 LIMIT 1;
UPDATE `creature` SET `MovementType` = '0' WHERE `creature`.`guid` =123404 LIMIT 1;
UPDATE `creature_template` SET `difficulty_entry_1` = '0' WHERE `creature_template`.`entry` =31214 LIMIT 1 ;
UPDATE `creature_template` SET `difficulty_entry_1` = '0' WHERE `creature_template`.`entry` =30890 LIMIT 1 ;

-- RubySanctum
UPDATE `creature_template` SET `difficulty_entry_2` = '0' WHERE `creature_template`.`entry` =39751 LIMIT 1 ;
UPDATE `gameobject` SET `spawnMask` = '1' WHERE `gameobject`.`guid` =750008 LIMIT 1;
UPDATE `gameobject` SET `spawnMask` = '1' WHERE `gameobject`.`guid` =750007 LIMIT 1;
UPDATE `gameobject` SET `spawnMask` = '1' WHERE `gameobject`.`guid` =750006 LIMIT 1;
UPDATE `gameobject` SET `spawnMask` = '1' WHERE `gameobject`.`guid` =750005 LIMIT 1;


-- Ulduar
UPDATE `creature_addon` SET `auras` = NULL WHERE `creature_addon`.`guid` =137496 LIMIT 1;
UPDATE `creature_template` SET `difficulty_entry_1` = '0' WHERE `creature_template`.`entry` =33240 LIMIT 1 ;
UPDATE `creature_template` SET `unit_class` = '2' WHERE `creature_template`.`entry` =33515 LIMIT 1;
UPDATE `creature_template` SET `unit_class` = '1' WHERE `creature_template`.`entry` =32918 LIMIT 1;
UPDATE `creature_template` SET `unit_class` = '1' WHERE `creature_template`.`entry` =33399 LIMIT 1;
UPDATE `creature_template` SET `unit_class` = '2' WHERE `creature_template`.`entry` =34175 LIMIT 1;
update gameobject_scripts set `command`=11 where `id`=55194;

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

ALTER TABLE db_version CHANGE COLUMN required_3_world_icecrown_citadel required_27_world_command bit;

ALTER TABLE db_version CHANGE COLUMN required_27_world_command required_54_thorim_disarm bit;

-- IA for Thorim
UPDATE `creature_template` SET `ScriptName`='boss_thorim' WHERE (`entry`='32865');

-- Thorim immunity on disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239 WHERE `entry` = 32865;

ALTER TABLE db_version CHANGE COLUMN required_54_thorim_disarm required_91_ys_keepers bit;

-- Keepers (Yogg Saron Encounter)
DELETE FROM `creature` WHERE `id` IN (33410, 33411, 33412, 33413);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33410, 603, 1, 1, 0, 0, 2036.739, 25.464, 338.296, 3.814, 604800, 0, 0, 14433075, 0, 0, 0),
(33411, 603, 1, 1, 0, 0, 1939.094, -90.699, 338.296, 1.026, 604800, 0, 0, 14433075, 0, 0, 0),
(33412, 603, 1, 1, 0, 0, 1939.094, 42.534, 338.296, 5.321, 604800, 0, 0, 14433075, 0, 0, 0),
(33413, 603, 1, 1, 0, 0, 2036.739, -73.705, 338.296, 2.435, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName` = 'npc_ys_freya' WHERE `entry` = 33410;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_hodir' WHERE `entry` = 33411;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_mimiron' WHERE `entry` = 33412;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_thorim' WHERE `entry` = 33413;

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `minlevel` = 80, `maxlevel` = 80, `unit_flags` = 33686018, `type_flags` = 0, `ScriptName` = 'npc_sanity_well' WHERE `entry` = 33991;

ALTER TABLE db_version CHANGE COLUMN required_91_ys_keepers required_117_proto_drake_path bit;

-- Path time-lost protodrake
DELETE FROM `creature` WHERE `id`=32491;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(15636, 32491, 571, 1, 1, 0, 0, 7537.36, -854.089, 982.299, 3.19715, 86400, 0, 0, 18900, 0, 0, 2); -- respawn 24h

UPDATE `creature_template` SET `speed_walk`=2, `speed_run`=2 where `entry`=32491;

DELETE FROM `creature_addon` WHERE `guid`=15636;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (15636,139111);

DELETE FROM `waypoint_data` WHERE `id`=139111; 
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES 
(139111, 4, 7327.08, -942.896, 974.397, 0, 0, 0, 100, 0),
(139111, 3, 7385.49, -878.718, 980.648, 0, 0, 0, 100, 0),
(139111, 2, 7474.28, -857.317, 977.674, 0, 0, 0, 100, 0),
(139111, 1, 7503.86, -856.766, 974.458, 0, 0, 0, 100, 0),
(139111, 5, 7304.96, -1048.66, 986.581, 0, 0, 0, 100, 0),
(139111, 6, 7320.79, -1137.46, 977.352, 0, 0, 0, 100, 0),
(139111, 7, 7325.62, -1190.25, 966.615, 0, 0, 0, 100, 0),
(139111, 8, 7308.36, -1240.42, 966.731, 0, 0, 0, 100, 0),
(139111, 9, 7264.87, -1299.48, 956.037, 0, 0, 0, 100, 0),
(139111, 10, 7228.44, -1360.63, 953.079, 0, 0, 0, 100, 0),
(139111, 11, 7200.34, -1419.23, 956.566, 0, 0, 0, 100, 0),
(139111, 12, 7176.4, -1470.62, 953.531, 0, 0, 0, 100, 0),
(139111, 13, 7205.6, -1503.5, 959.704, 0, 0, 0, 100, 0),
(139111, 14, 7268.69, -1537.84, 981.537, 0, 0, 0, 100, 0),
(139111, 15, 7328.43, -1506.58, 978.2, 0, 0, 0, 100, 0),
(139111, 16, 7418.04, -1460.2, 975.591, 0, 0, 0, 100, 0),
(139111, 17, 7485.83, -1440.65, 993.714, 0, 0, 0, 100, 0),
(139111, 18, 7558.21, -1390.25, 1005.14, 0, 0, 0, 100, 0),
(139111, 19, 7594.67, -1330.07, 1001.81, 0, 0, 0, 100, 0),
(139111, 20, 7636.35, -1254.23, 1004.71, 0, 0, 0, 100, 0),
(139111, 21, 7666.21, -1210.42, 1002.2, 0, 0, 0, 100, 0),
(139111, 22, 7717.33, -1139.02, 998.005, 0, 0, 0, 100, 0),
(139111, 23, 7758.72, -1099.12, 1003.15, 0, 0, 0, 100, 0),
(139111, 24, 7853.67, -1055.75, 1065.35, 0, 0, 0, 100, 0),
(139111, 25, 7905.68, -1031.95, 1083.13, 0, 0, 0, 100, 0),
(139111, 26, 7964.63, -1001.05, 1089.97, 0, 0, 0, 100, 0),
(139111, 27, 8016.11, -981.888, 1052.66, 0, 0, 0, 100, 0),
(139111, 28, 8063.91, -983.353, 1015.5, 0, 0, 0, 100, 0),
(139111, 29, 8171.07, -934.563, 995.578, 0, 0, 0, 100, 0),
(139111, 30, 8199.97, -850.786, 999.696, 0, 0, 0, 100, 0),
(139111, 31, 8220.44, -782.61, 996.339, 0, 0, 0, 100, 0),
(139111, 32, 8198.35, -729.709, 993.536, 0, 0, 0, 100, 0),
(139111, 33, 8164.23, -678.373, 990.623, 0, 0, 0, 100, 0),
(139111, 34, 8116.52, -620.548, 987.072, 0, 0, 0, 100, 0),
(139111, 35, 8080.91, -590.318, 961.444, 0, 0, 0, 100, 0),
(139111, 36, 8025.32, -559.044, 958.409, 0, 0, 0, 100, 0),
(139111, 37, 7934.42, -513.857, 953.61, 0, 0, 0, 100, 0),
(139111, 38, 7874.06, -433.282, 948.766, 0, 0, 0, 100, 0),
(139111, 39, 7821.26, -285.08, 941.347, 0, 0, 0, 100, 0),
(139111, 40, 7773.6, -208.615, 925.122, 0, 0, 0, 100, 0),
(139111, 41, 7718.75, -158.632, 910.074, 0, 0, 0, 100, 0),
(139111, 42, 7665.72, -134.088, 893.788, 0, 0, 0, 100, 0),
(139111, 43, 7589.5, -98.6794, 884.648, 0, 0, 0, 100, 0),
(139111, 44, 7492.43, -87.6879, 865.72, 0, 0, 0, 100, 0),
(139111, 45, 7388.29, -95.9055, 844.498, 0, 0, 0, 100, 0),
(139111, 46, 7240.53, -132.912, 852.502, 0, 0, 0, 100, 0),
(139111, 47, 7179.48, -170.757, 849.114, 0, 0, 0, 100, 0),
(139111, 48, 7128.93, -221.296, 845.666, 0, 0, 0, 100, 0),
(139111, 49, 7110.42, -260.984, 843.577, 0, 0, 0, 100, 0),
(139111, 50, 7101.34, -312.384, 841.101, 0, 0, 0, 100, 0),
(139111, 51, 7089.43, -377.234, 826.201, 0, 0, 0, 100, 0),
(139111, 52, 7084.02, -443.643, 792.785, 0, 0, 0, 100, 0),
(139111, 53, 7083.03, -489.624, 783.07, 0, 0, 0, 100, 0),
(139111, 54, 7080.87, -590.638, 764.014, 0, 0, 0, 100, 0),
(139111, 55, 7065.05, -676.21, 760.991, 0, 0, 0, 100, 0),
(139111, 56, 6978.95, -757.706, 759.465, 0, 0, 0, 100, 0),
(139111, 57, 6926.67, -765.875, 756.956, 0, 0, 0, 100, 0),
(139111, 58, 6861.22, -771.22, 757.357, 0, 0, 0, 100, 0),
(139111, 59, 6807.58, -775.6, 760.469, 0, 0, 0, 100, 0),
(139111, 60, 6743.8, -785.868, 757.409, 0, 0, 0, 100, 0),
(139111, 61, 6687.89, -795.147, 751.151, 0, 0, 0, 100, 0),
(139111, 62, 6639.95, -813.165, 725.154, 0, 0, 0, 100, 0),
(139111, 63, 6605.2, -826.225, 688.031, 0, 0, 0, 100, 0),
(139111, 64, 6512.56, -861.041, 628.843, 0, 0, 0, 100, 0),
(139111, 65, 6451.99, -883.808, 605.176, 0, 0, 0, 100, 0),
(139111, 66, 6415.95, -915.482, 547.719, 0, 0, 0, 100, 0),
(139111, 67, 6420.17, -963.738, 511.286, 0, 0, 0, 100, 0),
(139111, 68, 6414.8, -1034.58, 493.634, 0, 0, 0, 100, 0),
(139111, 69, 6408.01, -1143.4, 484.109, 0, 0, 0, 100, 0),
(139111, 70, 6393.39, -1257.52, 478.683, 0, 0, 0, 100, 0),
(139111, 71, 6387.67, -1387.35, 517.509, 0, 0, 0, 100, 0),
(139111, 72, 6411, -1395.61, 542.258, 0, 0, 0, 100, 0),
(139111, 73, 6564.67, -1450.02, 676.977, 0, 0, 0, 100, 0),
(139111, 74, 6594.86, -1460.71, 701.616, 0, 0, 0, 100, 0),
(139111, 75, 6640.73, -1476.95, 738.558, 0, 0, 0, 100, 0),
(139111, 76, 6682.87, -1491.87, 775.246, 0, 0, 0, 100, 0),
(139111, 77, 6741.23, -1509.22, 814.133, 0, 0, 0, 100, 0),
(139111, 78, 6788.69, -1526.15, 854.279, 0, 0, 0, 100, 0),
(139111, 79, 6813.13, -1534.87, 875.291, 0, 0, 0, 100, 0),
(139111, 80, 6908.43, -1568.86, 870.519, 0, 0, 0, 100, 0),
(139111, 81, 6940.94, -1580.46, 897.684, 0, 0, 0, 100, 0),
(139111, 82, 6990.34, -1598.08, 895.211, 0, 0, 0, 100, 0),
(139111, 83, 7053.23, -1590.21, 923.16, 0, 0, 0, 100, 0),
(139111, 84, 7083.66, -1561.51, 944.018, 0, 0, 0, 100, 0),
(139111, 85, 7103.84, -1542.48, 961.914, 0, 0, 0, 100, 0),
(139111, 86, 7151.78, -1497.26, 958.806, 0, 0, 0, 100, 0),
(139111, 87, 7199, -1452.73, 949.402, 0, 0, 0, 100, 0),
(139111, 88, 7248.36, -1406.18, 950.141, 0, 0, 0, 100, 0),
(139111, 89, 7293.73, -1363.39, 947.2, 0, 0, 0, 100, 0),
(139111, 90, 7368.66, -1355.03, 949.293, 0, 0, 0, 100, 0),
(139111, 91, 7475.82, -1325.68, 951.012, 0, 0, 0, 100, 0),
(139111, 92, 7584.79, -1275.39, 968.346, 0, 0, 0, 100, 0),
(139111, 93, 7618.68, -1210.81, 964.907, 0, 0, 0, 100, 0),
(139111, 94, 7651.48, -1148.31, 961.578, 0, 0, 0, 100, 0),
(139111, 95, 7675.21, -1088.75, 947.033, 0, 0, 0, 100, 0),
(139111, 96, 7684.79, -1006.75, 943.092, 0, 0, 0, 100, 0);

ALTER TABLE db_version CHANGE COLUMN required_117_proto_drake_path required_183_world_wintergrasp bit;

ALTER TABLE db_version CHANGE COLUMN required_183_world_wintergrasp required_187_world_halls_of_reflection bit;

-- Cleanup first
UPDATE `creature_template` SET `Scriptname`=' ' WHERE `entry` IN (38112,38113,37221,37223,38175,38172,38567,38177,38173,38176);
UPDATE `instance_template` SET `script`='instance_hall_of_reflection' WHERE (`map`='668');

UPDATE `instance_template` SET `script` = 'instance_halls_of_reflection' WHERE map=668;
UPDATE `gameobject_template` SET `ScriptName` = '' WHERE `entry` IN (202236,202302);
DELETE FROM `creature` WHERE `map` = 668 AND `id` IN (38177,38176,38173,38172,38567,38175,36940,36941,37069);

UPDATE `creature_template` SET `ScriptName`='generic_creature' WHERE `entry` IN (38177,38176,38173,38172,38567,38175);

UPDATE `gameobject_template` SET `faction` = '114' WHERE `entry` IN (197341, 201976);
UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` IN (197341, 202302, 201385, 201596);

UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='2.0' WHERE `entry` IN (36954, 37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` IN (37221, 37223);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry` IN (38112);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry` IN (38113);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_lich_king_hr' WHERE `entry` IN (36954);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry` IN (37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='generic_creature' WHERE `entry` IN (36940,36941,37069);
UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' WHERE `entry` IN (37221, 36955);
UPDATE `creature_template` SET `equipment_id`='1290' WHERE `entry` IN (37223, 37554);
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=36954;
UPDATE `creature_template` SET `scale`='1' WHERE `entry` IN (37223);
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `unit_flags`='768', `type_flags`='268435564' WHERE `entry` IN (38177, 38176, 38173, 38172, 38567, 38175);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
update `creature_template` set `AIName`='', `Scriptname`='npc_raging_gnoul' where `entry` in (36940);
update `creature_template` set `AIName`='', `Scriptname`='npc_risen_witch_doctor' where `entry` in (36941);
update `creature_template` set `AIName`='', `Scriptname`='npc_abon' where `entry` in (37069);

-- conditions
REPLACE INTO `conditions`  VALUES 
(13, 0, 69431, 0, 18, 1, 37496, 0, 0, '', NULL),
(13, 0, 69431, 0, 18, 1, 37497, 0, 0, '', NULL),
(13, 0, 69431, 0, 18, 1, 37584, 0, 0, '', NULL),
(13, 0, 69431, 0, 18, 1, 37587, 0, 0, '', NULL),
(13, 0, 69431, 0, 18, 1, 37588, 0, 0, '', NULL),
(13, 0, 69708, 0, 18, 1, 37226, 0, 0, '', NULL),
(13, 0, 69784, 0, 18, 1, 37014, 0, 0, '', NULL),
(13, 0, 70194, 0, 18, 1, 37226, 0, 0, '', NULL),
(13, 0, 70224, 0, 18, 1, 37014, 0, 0, '', NULL),
(13, 0, 70225, 0, 18, 1, 37014, 0, 0, '', NULL),
(13, 0, 70464, 0, 18, 1, 36881, 0, 0, '', NULL);

REPLACE INTO `creature_equip_template` VALUES ('38112', '50249', '49777', '0'); #Falric
UPDATE `creature_template` SET `equipment_id`='38112' WHERE `entry` IN (38112);

REPLACE INTO `creature_equip_template` VALUES ('38113', '50248', '50248', '0'); #Marwyn
UPDATE `creature_template` SET `equipment_id`='38113' WHERE `entry` IN (38113);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135341, 38112, 668, 3, 1, 0, 0, 5276.81, 2037.45, 709.32, 5.58779, 604800, 0, 0, 377468, 0, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135342, 38113, 668, 3, 1, 0, 0, 5341.72, 1975.74, 709.32, 2.40694, 604800, 0, 0, 539240, 0, 0, 0);

REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (14531739, 201596, 668, 1, 128, 5275.28, 1694.23, 786.147, 0.981225, 0, 0, 0.471166, 0.882044, 25, 0, 1);

DELETE from `creature` WHERE `id`=36955;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135349, 36955, 668, 3, 128, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

DELETE from `creature` WHERE `id`=37554;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135345, 37554, 668, 3, 64, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

DELETE from `creature` WHERE `id`=37226;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135344, 37226, 668, 3, 1, 0, 0, 5551.29, 2261.33, 733.012, 4.0452, 604800, 0, 0, 27890000, 0, 0, 0);

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 11686, `modelid3` = 11686, `modelid4` = 11686 WHERE `entry` IN (37014,37704);

DELETE FROM `gameobject` WHERE `id` IN (201385,201596,202079);

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (197341,197342,197343);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (197341,197342,197343);

-- Captains chest (override)
DELETE FROM `gameobject` WHERE `id` IN (202212,201710,202337,202336);
UPDATE `gameobject_template` SET `flags` = 0 WHERE `gameobject_template`.`entry` IN (202212,201710,202337,202336);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(972561, 202212, 668, 1, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972562, 201710, 668, 1, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972563, 202337, 668, 2, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972564, 202336, 668, 2, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1);
-- Dalaran portal (override)
DELETE FROM `gameobject` WHERE `guid` IN (972565);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(972565, 202079, 668, 3, 65535, 5250.959961, 1639.359985, 784.302, 0, 0, 0, 0, 0, -604800, 100, 1);

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1594540 AND -1594430;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
# SCENE - Hall Of Reflection (Intro) - PreUther
(-1594433, 'The chill of this place freezes the marrow of my bones!', '??? ?? ??? ???????... ????? ?????? ? ?????.', 16631,0,0,1, '67234'),
(-1594434, 'I... I don\'t believe it! Frostmourne stands before us, unguarded! Just as the Gnome claimed. Come, heroes!', '?... ? ?? ???? ????? ??????. ??????? ?????? ????? ???? ??? ?????? ??????! ??? ? ??????? ????. ?????? ?????!', 17049,0,0,1, '67234'),
(-1594435, 'What is that? Up ahead! Could it be ... ? Heroes at my side!', '??? ??? ??? ???????? ???????? ?????? ?????!', 16632,1,0,1, '67234'),
(-1594436, 'Frostmourne ... The blade that destroyed our kingdom ...', '??????? ??????, ??????, ??????????? ???? ???????????...', 16633,1,0,1, '67234'),
(-1594437, 'Standing this close to the blade that ended my life... The pain... It is renewed.', '???? ????? ???????????? ????, ????? ? ??? ?????? ???? ???, ???????? ? ???? ?????.', 17050,0,0,1, '67234'),
(-1594438, 'Stand back! Touch that blade and your soul will be scarred for all eternity! I must attempt to commune with the spirits locked away within Frostmourne. Give me space, back up please!', '????????. ??? ??? ???????? ????? ?????? ??????? ???? ?? ?????? ????. ? ????????? ?????????? ? ?????? ???????????? ? ??????? ??????. ????????????... ???? ?????! ?????.', 16634,1,0,1, '67234'),
(-1594439, 'I dare not touch it. Stand back! Stand back! As I attempt to commune with the blade. Perhaps our salvation lies within.', '? ?? ???? ??? ?????????. ?????! ?????????! ? ???????? ?????????? ????? ? ?????. ????????, ???????? ????????? ??????!', 17051,1,0,1, '67234'),
# SCENE - Hall Of Reflection (Intro) - UtherDialog
(-1594440, 'Jaina! Could it truly be you?', '??????? ??????? ??? ???', 16666,0,0,1, '67234'),
(-1594441, 'Careful, girl. I\'ve heard talk of that cursed blade saving us before. Look around you and see what has been born of Frostmourne.', '?????????? ???????! ??????? ??? ??? ????????, ??? ???? ????????? ??? ????? ??? ??????. ???????? ??????, ? ?? ???????, ??? ?? ????? ?????.', 16659,0,0,1, '67234'),
(-1594442, 'Uther! Dear Uther! I... I\'m so sorry.', '????? ????? ????! ???... ??? ??? ????.', 16635,0,0,1, '67234'),
(-1594443, 'Uther...Uther the Lightbringer. How...', '????? ???? ???????????? ???...', 17052,0,0,1, '67234'),
(-1594444, 'Jaina, you haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', '??????, ? ??? ???? ???????. ?????? - ??? ????? ??? ??? ????? ??????? ??????. ?????? ?? ????? ?????.', 16667,0,0,1, '67234'),
(-1594445, 'You haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', '? ??? ???? ???????. ?????? - ??? ????? ??? ??? ????? ??????? ??????. ?????? ?? ????? ?????.', 16660,0,0,1, '67234'),
(-1594446, 'Arthas is here? Maybe I...', '????? ?????? ????? ?...', 16636,0,0,1, '67234'),
(-1594447, 'The Lich King is here? Then my destiny shall be fulfilled today!', '?????? - ??? ?????? ?????? ??? ?????? ??????? ???????!', 17053,1,0,1, '67234'),
(-1594448, 'No, girl. Arthas is not here. Arthas is merely a presence within the Lich King\'s mind. A dwindling presence...', '??? ???????. ?????? ????? ???. ????? ???? ????, ?????????? ? ???????? ?????? - ????. ??????? ????.', 16668,0,0,1, '67234'),
(-1594449, 'You cannot defeat the Lich King. Not here. You would be a fool to try. He will kill those who follow you and raise them as powerful servants of the Scourge. But for you, Sylvanas, his reward for you would be worse than the last.', '??? ?? ???????? ?????? - ????. ????????? ???? ?? ?????. ????? ? ????????. ?? ????? ????? ?????????? ? ????????? ?? ??? ?????? ?????. ?? ??? ?? ???? ????????, ?? ??????? ???? ?????? ??? ????????, ??? ? ??????? ???.', 16661,0,0,1, '67234'),
(-1594450, 'But Uther, if there\'s any hope of reaching Arthas. I... I must try.', '?? ???? ???? ???????? ??????? ??????? ??????... ? ?????? ??????????!', 16637,0,0,1, '67234'),
(-1594451, 'There must be a way...', '?????? ???? ??????!', 17054,0,0,1, '67234'),
(-1594452, 'Jaina, listen to me. You must destroy the Lich King. You cannot reason with him. He will kill you and your allies and raise you all as powerful soldiers of the Scourge.', '?????? ???????? ????. ??? ????? ?????????? ?????? - ????. ? ??? ?????? ????????????. ?? ????? ??? ???? ? ????????? ? ?????????????? ?????? ?????.', 16669,0,0,1, '67234'),
(-1594453, 'Perhaps, but know this: there must always be a Lich King. Even if you were to strike down Arthas, another would have to take his place, for without the control of the Lich King, the Scourge would wash over this world like locusts, destroying all that they touched.', '????????... ?? ????! ?????? - ??? ?????? ???? ??????. ???? ???? ?? ?????? ?????? ??? ?? ?????? ????? ?????? ??? ?????. ????????? ????????? ????? ??????? ?? ??? ??? ???? ??????? ? ????????? ??? ?? ????? ????.', 16662,0,0,1, '67234'),
(-1594454, 'Tell me how, Uther? How do I destroy my prince? My...', '?? ??? ????? ??? ??? ????? ????? ??????, ?????...', 16638,0,0,1, '67234'),
(-1594455, 'Who could bear such a burden?', '???? ?? ????? ????? ??????', 17055,0,0,1, '67234'),
(-1594456, 'Snap out of it, girl. You must destroy the Lich King at the place where he merged with Ner\'zhul - atop the spire, at the Frozen Throne. It is the only way.', '?????? ?? ???? ???????. ?????? - ???? ????? ?????????? ?? ??? ?????, ??? ?? ?????? ? ????????. ?? ????? ???????, ? ???????? ?????!', 16670,0,0,1, '67234'),
(-1594457, 'I do not know, Banshee Queen. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', '?? ????, ???????? ??????... ???? ?? ?? ?????, ??????? ??? ??? ???????? ?????? ?????? - ????, ????? ????? ?? ??? ?????????? ??????.', 16663,0,0,1, '67234'),
(-1594458, 'You\'re right, Uther. Forgive me. I... I don\'t know what got a hold of me. We will deliver this information to the King and the knights that battle the Scourge within Icecrown Citadel.', '?? ???? ????, ?????? ????... ? ?? ???? ??? ?? ???? ?????. ?? ????????? ???? ????? ?????? ? ???????, ??????? ????????? ? ?????? ? ???????? ??????? ??????.', 16639,0,0,1, '67234'),
(-1594459, 'There is... something else that you should know about the Lich King. Control over the Scourge must never be lost. Even if you were to strike down the Lich King, another would have to take his place. For without the control of its master, the Scourge would run rampant across the world - destroying all living things.', '???? ????? ????? ??? ??? ??? ? ?????? - ????. ????? ?? ?????? ????? ?? ??? ????????. ???? ???? ?? ?????? ?????? - ????, ???-?? ?????? ????? ?????? ??? ?????. ??? ?????? ????? ??????? ?? ??? ??? ???? ??????? ? ????????? ??? ?????.', 16671,0,0,1, '67234'),
(-1594460, 'Alas, the only way to defeat the Lich King is to destroy him at the place he was created.', '??? ??????????? ?????? ??????? ?????? - ???? - ??? ????? ??? ??? ??? ?? ??? ????????.', 16664,0,0,1, '67234'),
(-1594461, 'Who could bear such a burden?', '???? ?? ????? ????? ??????', 16640,0,0,1, '67234'),
(-1594462, 'The Frozen Throne...', '??????? ????!', 17056,0,0,1, '67234'),
(-1594463, 'A grand sacrifice by a noble soul...', '??????? ??????, ??????????? ????.', 16672,0,0,1, '67234'),
(-1594464, 'I do not know, Jaina. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', '?? ???? ??????... ??? ??????? ???? ?? ?? ?????, ??????? ??? ??? ???????? ?????? ?????? - ????, ????? ????? ?? ??? ?????????? ??????.', 16673,0,0,1, '67234'),
(-1594465, 'Then maybe there is still hope...', '?? ????? ??? ???? ????????', 16641,0,0,1, '67234'),
(-1594466, 'No, Jaina! ARRRRRRGHHHH... He... He is coming. You... You must...', '??? ??????... ?????... ??... ?? ????????????... ??... ?? ??????...', 16674,1,0,1, '67234'),
(-1594467, 'Aye. ARRRRRRGHHHH... He... He is coming. You... You must...', '??... ?????... ??... ?? ????????????... ??... ?? ??????...', 16665,1,0,1, '67234'),
(-1594468, 'SILENCE, PALADIN!', '???????, ???????.', 17225,1,0,0, '67234'),
(-1594469, 'So you wish to commune with the dead? You shall have your wish.', '??? ?? ?????? ?????????? ? ????????? ??? ?????? ?????!', 17226,1,0,0, '67234'),
(-1594470, 'Falric. Marwyn. Bring their corpses to my chamber when you are through.', '??????, ??????, ????? ?????????, ????????? ?? ???? ? ??? ?????.', 17227,0,0,0, '67234'),
(-1594471, 'You won\'t deny me this, Arthas! I must know... I must find out...', '?? ?? ???? ?? ??????????? ?????. ? ?????? ??????, ? ?????? ?????.', 16642,1,0,1, '67234'),
(-1594472, 'You will not escape me that easily, Arthas! I will have my vengeance!', '?? ??? ?????? ?? ???? ?? ?????? ?????. ? ?????? ????!', 17057,1,0,1, '67234'),
(-1594473, '<need translate>', '?????? ????????! ??? ???? ?? ????? ????? ????! ?????? ?? ???? ???????, ?????? ?????? ? ???? ????????!', 17229,1,0,0, '67234'),
(-1594474, '<need translate>', '? ?? ??????? ??????? ??????, ????????. ?? ???? ??? ???? ?? ????????. ?? ?? ????????? ????? ??????? ? ?????? ???? ???? ?????? ????????!', 17228,1,0,0, '67234'),
(-1594475, 'As you wish, my lord.', '??? ?????????, ??? ????????!', 16717,1,0,0, '67234'),
(-1594476, 'As you wish, my lord.', '??? ?????????, ??? ????????!', 16741,1,0,0, '67234'),
# SCENE - Hall Of Reflection (Extro) - PreEscape
(-1594477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', '???? ???????? ???????, ??????! ??? ?? ? ???????... ??-??-??-??... ??? ?? ??????? ???????? ????????? ?????...', 17212,1,0,0, '67234'),
(-1594478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', '? ?? ??????? ??????? ??????, ????????! ?? ???? ??? ???? ?? ????????. ?? ??? ?????? ??????? ??? ????? ??????...', 17213,1,0,0, '67234'),
(-1594479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', '?? ??????? ?????. ?? ?????? ????????? ?? ???? ??? ????? ??????. ??? ????? ???????? ??? ?????????, ??????? ?????...', 16644,0,0,1, '67234'),
(-1594480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', '?? ??????? ?????. ????? ??????, ?? ????. ?? ?????? ????????? ?????? ??????????. ? ?????????? ??? ?????????, ???? ?? ????? ???????.', 17058,0,0,1, '67234'),
# SCENE - Hall Of Reflection (Extro) - Escape
(-1594481, 'Death\'s cold embrace awaits.', '?????? ???????????? ??????? ???????!', 17221,1,0,0, '67234'),
(-1594482, 'Rise minions, do not left them us!', '?????????? ???????????, ?? ????? ?? ???????!', 17216,1,0,0, '67234'),
(-1594483, 'Minions sees them. Bring their corpses back to me!', '???????? ??! ????????? ??? ?? ????!', 17222,1,0,0, '67234'),
(-1594484, 'No...', '??????? ???!', 17214,1,0,0, '67234'),
(-1594485, 'All is lost!', '??????? ? ???????.', 17215,1,0,0, '67234'),
(-1594486, 'There is no escape!', '?????? ??????!', 17217,1,0,0, '67234'),
(-1594487, 'I will destroy this barrier. You must hold the undead back!', '? ??????? ??? ????????, ? ?? ??????????? ?????? ?? ??????????!', 16607,1,0,0, '67234'),
(-1594488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', '??????? ????? ?? ??????? ???????? ??????. ??????? ?????? ?? ??????????, ? ??????? ??? ????????.', 17029,1,0,0, '67234'),
(-1594489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', '????? ??????? ?????... ? ??????? ??, ?????? ?? ????? ?????? ???????? ??? ??????????...', 16608,1,0,0, '67234'),
(-1594490, 'Another barrier? Stand strong, champions! I will bring the wall down!', '??? ???? ????????. ????????? ?????! ? ??????? ??? ?????!', 17030,1,0,0, '67234'),
(-1594491, 'Succumb to the chill of the grave.', '?????????? ????????? ??????!', 17218,1,0,0, '67234'),
(-1594492, 'Another dead end.', '?? ? ???????!', 17219,1,0,0, '67234'),
(-1594493, 'How long can you fight it?', '??? ????? ?? ??????? ???????????????', 17220,1,0,0, '67234'),
(-1594494, '<need translate>', '?? ? ???? ??????. ?  ?????? ??? ??? ?????? ????? ??? ??????????? ?? ?????!', 16609,0,0,0, '67234'),
(-1594495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', '???? ???????? ?????? ?? ???????? ???, ????????. ? ????? ?? ? ????!', 16610,1,0,0, '67234'),
(-1594496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', '? ?????? ?? ???? ??? ?????. ???? ????? ?? ????????? ????!', 17031,1,0,0, '67234'),
(-1594497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', '?? ?? ????????? ??? ????, ??????. ??????????? ??????, ? ? ???????? ??? ????????.', 17032,1,0,0, '67234'),
(-1594498, 'There\'s an opening up ahead. GO NOW!', '? ???? ?????, ??????!', 16645,1,0,0, '67234'),
(-1594499, 'We\'re almost there... Don\'t give up!', '?? ????? ?????????, ?? ??????????!', 16646,1,0,0, '67234'),
(-1594500, 'There\'s an opening up ahead. GO NOW!', '? ???? ?????, ??????!', 17059,1,0,0, '67234'),
(-1594501, 'We\'re almost there! Don\'t give up!', '?? ????? ?????????, ?? ??????????!', 17060,1,0,0, '67234'),
(-1594502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', '?????? ?????? ??????. ?????? ??? ???????? ?????????. ??? ???? ????????? ?????!', 16647,1,0,0, '67234'),
(-1594503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', '????????? ?????, ?????? ??? ?????????? ?????. ?????????? ?????, ??? ???? ????????? ?????.', 17061,1,0,0, '67234'),
(-1594504, 'Nowhere to run! You\'re mine now...', '??-??-??... ?????? ??????. ?????? ?? ???!', 17223,1,0,0, '67234'),
(-1594505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', '??????? ?????????, ?????????? ?? ???? ?????????!', 16714,1,0,0, '67234'),
(-1594506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', '???????? ???????? ???? ??????????? ? ??????? ??? ????????! ??? ??? ??? ??????? ? ??????? - ??????? ???? ??????!', 16738,1,0,0, '67234'),

#Falric
(-1594507, 'Men, women and children... None were spared the master\'s wrath. Your death will be no different.', '???????, ??????? ? ????... ????? ?? ??????? ????? ?????????. ?? ????????? ?? ??????!', 16710,1,0,0, '67234'),
(-1594508, 'Marwyn, finish them...', '??????... ????? ??...', 16713,1,0,0, '67234'),
(-1594509, 'Sniveling maggot!', '???????? ??????!', 16711,1,0,0, '67234'),
(-1594510, 'The children of Stratholme fought with more ferocity!', '?????????????? ??????? - ? ?? ????????? ?????????!', 16712,1,0,0, '67234'),
(-1594511, 'Despair... so delicious...', '??? ????????? ????????!', 16715,1,0,0, '67234'),
(-1594512, 'Fear... so exhilarating...', '??? ??????? ?????!', 16716,1,0,0, '67234'),

#Marwyn
(-1594513, 'Death is all that you will find here!', '?? ??????? ????? ???? ??????!', 16734,1,0,0, '67234'),
(-1594514, 'Yes... Run... Run to meet your destiny... Its bitter, cold embrace, awaits you.', '?????... ??... ?????? ????????? ??????. ?? ???????? ? ???????? ??????? ???? ???...', 16737,1,0,0, '67234'),
(-1594515, 'I saw the same look in his eyes when he died. Terenas could hardly believe it. Hahahaha!', '? ???????? ??? ????? ?? ?????? ? ??? ??????, ?? ????? ?? ??? ????????... ??-??-??-??-??...', 16735,1,0,0, '67234'),
(-1594516, 'Choke on your suffering!', '?????????? ??????????!', 16736,1,0,0, '67234'),
(-1594517, 'Your flesh shall decay before your very eyes!', '?? ??????? ??? ??????????? ???? ?????!', 16739,1,0,0, '67234'),
(-1594518, 'Waste away into nothingness!', '??????? ??? ?????!', 16740,1,0,0, '67234'),

#FrostWorn General
(-1594519, 'You are not worthy to face the Lich King!', '?? ?????????? ????????? ????? ??????? - ?????!', 16921,1,0,0, '67234'),
(-1594520, 'Master, I have failed...', '????????... ? ?????? ???...', 16922,1,0,0, '67234'),

#add
(-1594531, '<need translate>', '?? ??????-?? ????? ???? ?????????.', 0,0,0,0, '67234'),
(-1594532, '<need translate>', '??? ??? ?????? ?? ??????.', 0,0,0,0, '67234'),
(-1594533, '<need translate>', '?, ????????? ??????? ? ???? ?? ?????, ??? ??? ?????? ? ???????.', 0,0,0,0, '67234'),
(-1594536, 'Lady Jaina, we are ready for next mission!', '??????, ?? ??????!', 0,0,0,0, ''),
(-1594537, 'Lady Jaina, Let\'s go!', '????? ???????!', 0,0,0,0, ''),
(-1594538, 'Lady Sylvanas, we are ready for next mission!', '????????, ?? ??????!', 0,0,0,0, ''),
(-1594539, 'Lady Sylvanas, Let\'s go!', '???????!', 0,0,0,0, ''),
(-1594540, 'Let\'s go!', '????????!', 0,0,0,0, '');

-- Waipoints to escort event on Halls of reflection

DELETE FROM script_waypoint WHERE entry=36955;
DELETE FROM script_waypoint WHERE entry=37226;
DELETE FROM script_waypoint WHERE entry=37554;

INSERT INTO script_waypoint VALUES
-- Jaina

   (36955, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (36955, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (36955, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (36955, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (36955, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (36955, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (36955, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (36955, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (36955, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (36955, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (36955, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (36955, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (36955, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (36955, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (36955, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (36955, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (36955, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (36955, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (36955, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (36955, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (36955, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (36955, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana

   (37554, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (37554, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (37554, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (37554, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (37554, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (37554, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (37554, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (37554, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (37554, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (37554, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37554, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37554, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37554, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (37554, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37554, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37554, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37554, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (37554, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37554, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37554, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (37554, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (37554, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King

   (37226, 0, 5577.187,2236.003,733.012, 0, 'WP1'),
   (37226, 1, 5587.682,2228.586,733.011, 0, 'WP2'),
   (37226, 2, 5600.715,2209.058,731.618, 0, 'WP3'),
   (37226, 3, 5606.417,2193.029,731.129, 0, 'WP4'),
   (37226, 4, 5598.562,2167.806,730.918, 0, 'WP5'), 
   (37226, 5, 5559.218,2106.802,731.229, 0, 'WP6'),
   (37226, 6, 5543.498,2071.234,731.702, 0, 'WP7'),
   (37226, 7, 5528.969,2036.121,731.407, 0, 'WP8'),
   (37226, 8, 5512.045,1996.702,735.122, 0, 'WP9'),
   (37226, 9, 5504.490,1988.789,735.886, 0, 'WP10'),

   (37226, 10, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37226, 11, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37226, 12, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37226, 13, 5445.157,1894.955,748.757, 0, 'WP13'),
   (37226, 14, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37226, 15, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37226, 16, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37226, 17, 5335.422,1766.951,767.635, 0, 'WP17'),
   (37226, 18, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37226, 19, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37226, 20, 5278.694,1697.912,785.692, 0, 'WP20'),
   (37226, 21, 5283.589,1703.755,784.176, 0, 'WP19');


ALTER TABLE db_version CHANGE COLUMN required_187_world_halls_of_reflection required_205_world_access_requirement bit;

ALTER TABLE db_version CHANGE COLUMN required_205_world_access_requirement required_242_world_battleground_template bit;
-- note: uncheck if necessary, depending on the db you use /* */

/*
-- Set battleground-names
UPDATE `battleground_template` SET `Comment`= 'Alterac Valley' WHERE `battleground_template`.`id`=1;
UPDATE `battleground_template` SET `Comment`= 'Warsong Gulch' WHERE `battleground_template`.`id`=2;
UPDATE `battleground_template` SET `Comment`= 'Arathi Basin' WHERE `battleground_template`.`id`=3;
UPDATE `battleground_template` SET `Comment`= 'Nagrand Arena' WHERE `battleground_template`.`id`=4;
UPDATE `battleground_template` SET `Comment`= 'Blades''s Edge Arena' WHERE `battleground_template`.`id`=5;
UPDATE `battleground_template` SET `Comment`= 'All Arena' WHERE `battleground_template`.`id`=6;
UPDATE `battleground_template` SET `Comment`= 'Eye of The Storm' WHERE `battleground_template`.`id`=7;
UPDATE `battleground_template` SET `Comment`= 'Ruins of Lordaeron' WHERE `battleground_template`.`id`=8;
UPDATE `battleground_template` SET `Comment`= 'Strand of the Ancients' WHERE `battleground_template`.`id`=9;
UPDATE `battleground_template` SET `Comment`= 'Dalaran Sewers' WHERE `battleground_template`.`id`=10;
UPDATE `battleground_template` SET `Comment`= 'The Ring of Valor' WHERE `battleground_template`.`id`=11;
UPDATE `battleground_template` SET `Comment`= 'Isle of Conquest' WHERE `battleground_template`.`id`=30;
UPDATE `battleground_template` SET `Comment`= 'Random battleground' WHERE `battleground_template`.`id`=32;
*/

ALTER TABLE db_version CHANGE COLUMN required_242_world_battleground_template required_243_world_creature_transport bit;

DELETE FROM `creature_transport`;
INSERT INTO `creature_transport` (`guid`,`transport_entry`,`npc_entry`,`TransOffsetX`,`TransOffsetY`,`TransOffsetZ`,`TransOffsetO`,`emote`) VALUES
(11,164871,25075,4.22547,-13.2054,-23.6771,1.54314,0),
(17,176310,25012,18.1475,-7.41572,6.09809,1.88535,0),
(3,192241,30753,-26.8391,-10.402,35.5991,1.29366,432),
(66,192241,29795,45.6197,7.29317,30.0955,4.67642,0),
(5,192241,30754,-54.639,-15.3254,34.3972,3.83128,0),
(1,176310,25013,0.194107,9.84585,6.09941,3.08731,0),
(7,190536,31790,34.0851,0.015993,19.7141,3.03935,0),
(8,192241,30752,7.30473,24.2619,34.9491,4.43536,0),
(27,176310,25010,13.2057,-2.817,6.09989,3.88733,0),
(10,192241,30755,7.49121,6.05275,34.4239,3.16615,0),
(15,176310,25009,25.2165,6.9111,16.1459,3.94958,0),
(16,176310,25015,34.0669,0.119702,18.287,3.17832,0),
(1,190536,31792,-4.5113,-0.220224,9.36188,1.57535,432),
(2,190536,31791,-11.4596,-8.43786,9.52534,4.77978,432),
(2,176310,25014,-0.532552,-8.68575,6.09815,3.19019,0),
(3,176310,25017,6.22581,9.13103,11.4836,1.53614,0),
(17,192241,30755,37.6428,-9.00797,30.0954,0.004917,0),
(70,192241,30754,-18.9215,-26.8371,89.9664,0.087792,0),
(19,192241,30866,-36.528,23.9373,33.9184,1.89617,0),
(20,192241,30755,-3.46042,28.0231,34.2784,4.66548,0),
(5,190536,31793,16.8969,-3.34782,9.82203,5.62173,432),
(22,192241,30754,-54.7182,15.5861,34.3897,2.50086,0),
(6,190536,31789,28.0019,6.04888,19.2448,3.26161,0),
(24,192241,30866,-36.1494,-23.2606,33.9568,4.2232,0),
(25,192241,30753,-26.9812,10.5208,35.5936,4.74156,432),
(26,176310,25016,-11.1276,6.60326,6.09852,3.05167,432),
(27,192241,30866,15.9225,26.2539,35.4586,1.60085,0),
(9,176310,25018,10.2474,2.78122,11.803,3.46823,432),
(29,192241,30755,7.21494,-6.31021,34.4191,3.11118,0),
(30,192241,32301,-3.37706,0.007499,34.0151,4.65055,0),
(31,192241,30752,8.25547,-21.6199,34.8875,1.73515,0),
(32,192241,30755,-5.59682,-28.2501,34.1226,1.55058,0),
(33,192241,30866,17.7216,-26.2695,35.5686,5.06367,0),
(34,192241,30755,37.6401,8.9586,30.0954,0.012771,0),
(35,192241,30755,37.6428,-9.00797,30.0954,0.004917,0),
(71,192241,30753,-7.63407,0.007234,86.0904,6.2728,0),
(37,192241,30827,45.884,-8.99976,30.0955,1.52942,0),
(7,176310,25011,19.2178,-8.20848,12.1102,4.81518,0),
(39,192241,30753,-34.939,-11.6484,11.4697,5.50858,432),
(40,192241,30753,-34.785,11.9312,11.4869,0.836243,432),
(41,192241,30755,-26.188,-6.1712,9.33333,3.14217,0),
(42,192241,30755,-26.1511,6.90449,9.405,3.12647,0),
(43,192241,30825,38.4745,0.038424,10.1868,3.15788,0),
(44,192241,30753,46.382,7.89944,10.4129,3.96271,0),
(45,192241,30753,45.981,-6.55312,10.3636,2.23091,0),
(46,192241,30755,24.5852,6.86575,7.06382,3.11055,0),
(47,192241,30755,24.3302,-6.97827,7.08356,3.34184,0),
(48,192241,31243,15.2483,-33.3678,10.5837,4.72649,0),
(49,192241,31243,1.91814,-32.9286,10.0097,4.6891,0),
(50,192241,31243,-11.0915,-32.8872,10.5819,4.68507,0),
(51,192241,31243,-11.2408,33.2155,10.5949,1.58668,0),
(52,192241,31243,1.99373,33.0756,10.0105,1.53853,0),
(53,192241,31243,15.239,32.5832,10.5826,1.52441,0),
(54,192241,30755,8.85995,18.8224,8.7027,4.69035,0),
(55,192241,30755,-4.43012,18.742,8.62646,4.66286,0),
(56,192241,30755,-4.46811,-18.5567,8.62604,1.53698,0),
(57,192241,30755,9.06884,-18.7113,8.70787,1.56054,0),
(58,192241,30753,1.98831,-18.0873,9.16057,4.66993,0),
(59,192241,30753,2.15579,17.0338,9.16353,1.54405,0),
(60,192241,30752,15.4321,28.6642,9.92277,1.54012,0),
(61,192241,30752,2.01988,28.7211,9.33565,1.58332,0),
(62,192241,30752,-11.241,28.5576,9.91826,1.5519,0),
(68,192241,30826,55.0542,-3.74557,30.0955,2.77577,0),
(69,192241,30755,29.8693,-29.5825,89.7663,3.05267,0),
(67,192241,30824,55.5028,0.080449,30.5268,3.15669,0),
(1,192242,30352,48.8813,8.78624,40.0817,3.1426,433),
(2,192242,30352,48.8649,-8.72834,40.0818,3.12642,433),
(3,192242,30352,-17.337,3.98796,20.7652,3.1541,433),
(4,192242,30351,39.976,44.3876,25.0331,3.16019,0),
(5,192242,30867,36.8757,45.226,25.0331,2.16509,0),
(6,192242,30352,-17.2379,-3.94242,20.7667,3.1541,433),
(7,192242,30867,36.9277,-44.9241,25.0318,4.11052,0),
(8,192242,32566,34.6465,-41.7087,25.0325,3.20731,0),
(9,192242,29799,34.5332,-38.5618,25.0323,3.15234,0),
(10,192242,30351,2.42088,-23.0053,22.5625,0.046087,432),
(11,192242,30867,-11.0475,-22.7053,22.5096,4.51265,0),
(12,192242,30867,-32.9158,-22.1469,22.5861,4.59982,0),
(13,192242,30394,-57.9337,6.01148,23.5029,1.54855,432),
(14,192242,30351,-36.4471,6.81573,20.4485,4.73177,432),
(15,192242,30351,-36.1811,-6.90251,20.4501,1.6483,432),
(16,192242,30352,-49.1048,0.044213,20.6694,0.029782,433),
(17,192242,30351,1.44228,9.63379,20.4566,3.15096,432),
(18,192242,30351,1.29162,-9.37181,20.458,3.17295,432),
(19,192242,30833,6.18656,-0.008156,20.5756,6.28313,0),
(20,192242,30352,16.5684,2.46962,20.4252,3.1329,44),
(64,192242,30350,16.4056,-2.2827,20.4235,3.11453,0),
(22,192242,30392,28.7566,7.6217,23.2872,6.08285,0),
(23,192242,30347,28.6378,-7.55243,23.2873,0.157027,0),
(24,192242,30344,43.6738,0.121325,25.1341,3.10227,0),
(25,192242,32777,42.9517,4.20903,25.1088,3.47298,0),
(26,192242,31259,16.8761,-17.8635,20.4597,2.02864,0),
(27,192242,30351,0.773476,22.5004,22.5503,3.2248,432),
(28,192242,30867,-10.0824,23.2226,22.5129,1.54405,0),
(29,192242,30867,-33.4747,22.2096,22.5895,1.56211,0),
(30,192242,30346,25.0778,-0.047958,9.59893,3.13291,0),
(31,192242,30352,36.4909,6.11523,9.60666,3.01117,433),
(32,192242,30352,36.436,-6.06257,9.60687,3.09364,433),
(33,192242,30380,3.92454,20.827,9.67354,1.30372,0),
(34,192242,30380,-6.13984,21.6533,9.991,1.48436,0),
(35,192242,30380,-17.4619,22.2092,9.60018,1.58254,0),
(36,192242,30380,-30.2521,21.9534,9.5974,1.54169,0),
(37,192242,30380,-37.3836,19.9617,9.59771,1.87549,0),
(38,192242,30380,-37.1975,-20.2765,9.65711,4.32467,0),
(39,192242,30380,-30.1731,-21.9358,9.59686,4.72914,0),
(40,192242,30380,-18.0212,-22.0926,9.60068,4.66788,0),
(41,192242,30380,-6.33308,-21.7722,9.99575,4.85167,0),
(42,192242,30380,3.99105,-21.2539,9.67311,4.9577,0),
(43,192242,30394,-11.7295,-24.7904,9.58663,1.63703,0),
(44,192242,30394,-11.9688,25.5424,9.58513,4.66945,0),
(45,192242,30352,-67.4841,3.50927,9.60209,5.83577,433),
(46,192242,30352,-67.1723,-3.73439,9.60211,0.318344,433),
(47,192242,30394,-48.1449,-3.10366,-5.21617,3.11436,0),
(48,192242,30345,-48.0654,-0.185737,-4.98898,3.11436,0),
(49,192242,30352,-60.5592,0.055898,-5.27774,0.004184,433),
(50,192242,30394,-14.1505,23.0373,-5.24869,0.027745,0),
(51,192242,30380,-8.79147,30.0334,-0.157799,0.471494,0),
(52,192242,30380,1.92073,28.7498,0.101361,0.232732,0),
(53,192242,30394,-14.3898,-23.2398,-5.25039,6.16013,0),
(54,192242,30380,-7.54172,-30.0747,0.101348,4.17752,0),
(55,192242,30380,3.45962,-28.1289,0.101388,4.29376,0),
(56,192242,30380,-24.7068,-29.9771,0.101334,3.66623,0),
(57,192242,30380,-39.6946,-26.8419,0.82802,2.93659,0),
(58,192242,30380,-41.0289,25.7685,1.20385,1.49696,0),
(59,192242,30380,-26.5726,29.6008,-0.15773,0.856857,0),
(60,192242,30352,43.7981,13.0009,-2.07474,4.61776,433),
(72,192241,30753,15.254,-0.009458,86.0904,3.14299,0),
(65,192242,32302,54.6648,-6.9431,40.0874,3.0302,0),
(63,192242,32193,-21.6978,0.127903,-18.1897,3.12341,0),
(1,175080,24935,9.42351,-11.8801,-23.5908,3.08558,0),
(2,175080,24934,9.56883,-3.62246,-23.5893,3.07458,0),
(3,175080,24924,-1.61694,-10.1641,-23.7649,0.008681,0),
(4,175080,24926,-5.41824,-2.06021,-17.7263,1.97218,0),
(5,175080,25080,-4.65078,-4.74596,-17.7144,1.65016,0),
(6,175080,25081,-5.03417,-10.8253,-17.689,4.69751,0),
(7,175080,24931,7.15704,-3.89011,-17.7735,5.15776,432),
(1,164871,25083,-5.86083,-5.09646,-17.6306,1.1754,0),
(2,164871,25071,6.71222,-4.1415,-17.794,4.99008,432),
(3,164871,25074,4.49415,-7.97789,-17.8975,0.065626,432),
(4,164871,25072,7.03763,-11.1073,-17.7946,1.2987,432),
(5,164871,25079,-5.00414,-10.5989,-17.6843,4.66884,0),
(6,164871,25070,-9.52824,-7.63628,-17.2095,3.16716,0),
(7,164871,25076,-1.27746,-7.88328,-23.7608,3.14124,432),
(8,164871,24934,-4.77478,-12.8175,-22.6773,4.60522,0),
(9,164871,24935,-6.29228,-12.7502,-22.6769,4.66805,0),
(1,190549,3084,-4.75387,-10.8675,-17.7074,4.59518,0),
(2,190549,3084,-5.13627,-4.61703,-17.6884,1.65007,0),
(3,190549,34715,-9.9527,-7.70295,-17.0973,3.12662,0),
(4,190549,34723,-17.7755,-5.62641,-14.9376,3.69996,0),
(5,190549,34717,-13.0353,-12.0914,-16.2584,4.22853,0),
(6,190549,34719,7.35889,-11.108,-17.7826,1.57997,28),
(7,190549,34721,-0.488628,-5.93246,-23.7484,3.81128,0),
(8,190549,34730,-0.979586,-7.9528,-23.7559,3.0456,0),
(9,190549,24934,9.49791,-3.56853,-23.5906,6.28222,0),
(10,190549,24935,9.32634,-12.0478,-23.5942,6.24295,0),
(11,190549,34718,13.5225,-5.26085,-24.1585,0.03595,207),
(1,186238,31725,11.1323,-7.8428,-16.6839,3.15041,0),
(2,186238,31724,5.72734,-3.28376,-17.8139,1.55213,0),
(3,186238,31727,-4.01569,-2.02455,-17.6298,1.16964,0),
(4,186238,31726,-3.59444,-13.8231,-17.678,5.47991,0),
(5,186238,31723,-11.0334,-12.5191,-16.8298,4.64346,0),
(6,186238,31720,-15.8872,-5.06557,-16.1287,2.13411,0),
(1,176495,25105,-9.54405,-7.94072,-17.2053,3.17242,0),
(2,176495,25106,-4.93938,-10.9634,-17.6988,4.76285,0),
(3,176495,25107,-4.98215,-4.67863,-17.696,1.59455,0),
(4,176495,25101,7.56919,-4.02088,-17.7543,4.77071,0),
(5,176495,25103,7.59398,-11.5166,-17.7745,1.62204,0),
(6,176495,25102,-11.0882,-3.47446,-16.7988,2.00924,0),
(7,186238,25075,9.86442,-7.77519,-16.6839,0.043302,0),
(8,176495,25104,-0.898213,-7.76559,-23.7548,3.11116,0),
(9,176495,25100,-0.411733,-5.7239,-23.7457,3.70414,0),
(10,176495,24934,9.63549,-3.67192,-23.588,6.25904,0),
(11,176495,24935,9.79838,-11.8681,-23.5848,6.25118,0),
(1,181689,31706,-16.8964,-10.8497,-15.9745,1.45699,0),
(2,181689,31708,-2.74581,-1.47146,-17.7765,4.67712,0),
(3,181689,31708,-3.54276,-13.8752,-17.684,1.53946,0),
(4,181689,31705,5.07824,-13.1188,-17.8135,5.24182,0),
(5,181689,31716,11.5731,-7.65137,-16.6839,3.20372,0),
(6,181689,31704,5.21605,-2.36685,-17.8223,1.04622,0),
(8,190536,31788,26.1618,-2.95068,19.2448,2.72126,0),
(1,176244,24996,-0.258897,-7.62734,4.80823,5.66423,0),
(2,176244,24997,-0.416482,4.39825,4.79739,5.10346,0),
(3,176244,24993,13.1874,7.71381,6.07001,3.09834,0),
(4,176244,24995,13.3456,-7.63689,6.09325,3.06064,0),
(5,176244,25007,21.2462,1.87803,11.7334,3.19572,0),
(6,176244,24456,29.5627,0.150031,16.6147,3.18002,0),
(1,181646,25052,13.5093,7.8287,6.11039,3.12838,0),
(3,181646,25051,13.4899,-7.71638,6.11067,3.11424,0),
(4,181646,25056,20.3045,1.2971,11.7088,3.06319,0),
(5,181646,25050,29.8662,-0.374622,16.6206,3.09382,0),
(6,181646,25054,-21.8863,-2.61623,4.33103,6.14509,0),
(7,181646,25055,-21.4646,2.87105,4.31055,6.26055,0),
(1,20808,25097,-11.4014,6.67999,6.09785,2.93715,0),
(2,20808,25082,15.6121,1.09944,6.09764,2.52482,0),
(5,20808,25089,17.8437,-7.84575,6.09877,1.64493,0),
(6,20808,25078,34.095,3.54049,17.8892,5.50987,0),
(11,20808,25094,34.0585,-0.04162,18.2865,3.17017,0),
(13,20808,25095,9.39981,9.17899,11.5941,1.52083,432),
(14,20808,25093,15.8067,-5.80051,11.9732,1.86484,0),
(15,20808,25111,6.20811,0.005208,14.0554,2.54813,0),
(73,192241,30755,8.83021,-4.6978,84.7137,2.34582,0),
(74,192241,30755,8.67689,4.88796,84.7137,3.90012,0),
(75,192241,30755,29.4588,29.8761,89.7684,3.15321,0),
(76,192241,30754,-19.0109,27.0177,89.9667,6.22411,0),
(12,164871,25075,10.6353,-12.1104,-23.5736,3.01351,0),
(13,164871,25075,10.6391,-3.68298,-23.5737,3.14703,0),
(14,164871,25075,4.53411,-2.57645,-23.6704,4.7411,0),
(18,164871,25075,-2.82445,-6.38118,-23.7807,4.71631,432),
(16,164871,25075,-3.59545,-7.90852,-23.7812,6.26982,0),
(17,164871,25075,-2.95326,-9.17582,-23.7804,1.60848,0),
(8,175080,25075,-3.59016,-7.79262,-23.7806,6.27391,0),
(12,176495,25075,-3.59133,-7.84061,-23.7802,6.1969,0),
(12,190549,25075,-3.59986,-8.08202,-23.7802,0.039869,0),
(2,195276,34935,-21.401,-31.343,34.173,4.62057,0),
(3,195276,34935,-12.1064,-31.9697,34.3807,4.62057,0),
(4,195276,34935,-2.4877,-31.9885,34.8384,4.62057,0),
(5,195276,34935,10.2664,-32.0713,35.7357,4.62057,0),
(6,195276,34935,19.4636,-30.794,36.2254,4.83106,0),
(1,195121,34929,-41.7122,23.1838,22.5605,1.60659,0),
(2,195121,34929,-31.0354,25.1286,21.6921,1.60659,0),
(3,195121,34929,-21.4492,25.8326,21.6309,1.60659,0),
(4,195121,34929,-12.4734,26.321,21.6237,1.60659,0),
(5,195121,34929,-2.81125,26.2077,21.6566,1.60659,0);

ALTER TABLE db_version CHANGE COLUMN required_243_world_creature_transport required_280_world_pit_of_saron bit;

-- npcs for pit of saron
DELETE FROM `creature` WHERE `id` IN (36840, 36893, 36892, 36841, 36842, 36874, 36877, 36658, 38189, 38188, 37583, 37774, 37779, 37582, 36661) AND `map` = 658;
INSERT INTO `creature` VALUES 
(117110, 36658, 658, 3, 1, 0, 0, 1014.51, 170.423, 628.156, 5.31184, 43200, 0, 0, 653828, 0, 0, 0),
(125749, 36840, 658, 3, 1, 0, 0, 882.177, 41.2741, 522.097, 3.95888, 7200, 0, 0, 81900, 0, 0, 0),
(125753, 36840, 658, 3, 1, 0, 0, 886.136, 64.1428, 533.154, 3.75861, 7200, 0, 0, 81900, 0, 0, 0),
(125754, 36840, 658, 3, 1, 0, 0, 913.474, 67.6754, 550.663, 3.91962, 7200, 0, 0, 81900, 0, 0, 0),
(125757, 36840, 658, 3, 1, 0, 0, 917.57, 84.9234, 556.676, 3.75468, 7200, 0, 0, 81900, 0, 0, 0),
(131125, 36841, 658, 3, 1, 0, 0, 947.581, 34.0093, 571.633, 1.40239, 7200, 0, 0, 81900, 0, 0, 0),
(131126, 36841, 658, 3, 1, 0, 0, 951.159, 33.5683, 571.75, 1.44952, 7200, 0, 0, 81900, 0, 0, 0),
(131127, 36841, 658, 3, 1, 0, 0, 944.023, 34.4286, 571.594, 1.38826, 7200, 0, 0, 81900, 0, 0, 0),
(131128, 36841, 658, 3, 1, 0, 0, 939.562, 35.252, 571.669, 1.38826, 7200, 0, 0, 81900, 0, 0, 0),
(131131, 36841, 658, 3, 1, 0, 0, 929.059, -20.3498, 586.029, 1.41574, 7200, 0, 0, 81900, 0, 0, 0),
(131132, 36841, 658, 3, 1, 0, 0, 932.611, -21.3107, 586.766, 1.40396, 7200, 0, 0, 81900, 0, 0, 0),
(131133, 36841, 658, 3, 1, 0, 0, 925.708, -20.2347, 585.547, 1.41574, 7200, 0, 0, 81900, 0, 0, 0),
(131134, 36841, 658, 3, 1, 0, 0, 922.202, -19.6826, 584.918, 1.41967, 7200, 0, 0, 81900, 0, 0, 0),
(131137, 36841, 658, 3, 1, 0, 0, 994.85, -138.133, 614.399, 2.53934, 7200, 0, 0, 81900, 0, 0, 0),
(131138, 36841, 658, 3, 1, 0, 0, 999.423, -128.53, 615.554, 2.61396, 7200, 0, 0, 81900, 0, 0, 0),
(131139, 36841, 658, 3, 1, 0, 0, 1048.1, -114.391, 629.424, 3.78029, 7200, 0, 0, 81900, 0, 0, 0),
(131140, 36841, 658, 3, 1, 0, 0, 1043.74, -109.28, 629.596, 4.20048, 7200, 0, 0, 81900, 0, 0, 0),
(127040, 36841, 658, 3, 1, 0, 0, 1069.92, -38.0944, 633.657, 4.55392, 7200, 0, 0, 81900, 0, 0, 0),
(127041, 36841, 658, 3, 1, 0, 0, 1063.65, -37.3515, 633.866, 4.59711, 7200, 0, 0, 81900, 0, 0, 0),
(127044, 36841, 658, 3, 1, 0, 0, 1068.29, 100.874, 631.011, 4.88379, 7200, 0, 0, 81900, 0, 0, 0),
(102307, 36841, 658, 3, 1, 0, 0, 1060.86, 98.6396, 631.014, 4.96233, 7200, 0, 0, 81900, 0, 0, 0),
(131129, 36842, 658, 3, 1, 0, 0, 938.636, 30.7012, 572.706, 1.37255, 7200, 0, 0, 81900, 11982, 0, 0),
(131130, 36842, 658, 3, 1, 0, 0, 949.152, 28.2762, 572.978, 1.33328, 7200, 0, 0, 81900, 11982, 0, 0),
(131135, 36842, 658, 3, 1, 0, 0, 925.383, -23.7866, 586.518, 1.40396, 7200, 0, 0, 81900, 11982, 0, 0),
(131136, 36842, 658, 3, 1, 0, 0, 932.371, -24.7884, 587.913, 1.47857, 7200, 0, 0, 81900, 11982, 0, 0),
(131141, 36874, 658, 3, 1, 0, 0, 1053.98, -93.1026, 632.772, 4.33794, 7200, 0, 0, 252000, 3994, 0, 0),
(131142, 36877, 658, 3, 1, 0, 0, 1048.02, -89.2714, 632.862, 4.15337, 7200, 0, 0, 12600, 0, 0, 0),
(127039, 36877, 658, 3, 1, 0, 0, 1060.64, -96.576, 632.739, 4.07876, 7200, 0, 0, 12600, 0, 0, 0),
(127042, 36877, 658, 3, 1, 0, 0, 1065.42, -33.8081, 633.793, 4.49501, 7200, 0, 0, 12600, 0, 0, 0),
(127043, 36877, 658, 3, 1, 0, 0, 1067.96, -34.4012, 633.718, 4.48323, 7200, 0, 0, 12600, 0, 0, 0),
(125751, 36892, 658, 3, 1, 0, 0, 883.563, 53.5074, 528.023, 3.68007, 7200, 0, 0, 126000, 79880, 0, 0),
(125756, 36892, 658, 3, 1, 0, 0, 916.021, 76.8641, 554.391, 3.71541, 7200, 0, 0, 126000, 79880, 0, 0),
(125750, 36893, 658, 3, 1, 0, 0, 879.753, 60.3149, 528.601, 3.88819, 7200, 0, 0, 81900, 31952, 0, 0),
(125752, 36893, 658, 3, 1, 0, 0, 886.291, 46.5289, 526.211, 3.55833, 7200, 0, 0, 81900, 31952, 0, 0),
(125755, 36893, 658, 3, 1, 0, 0, 909.752, 81.9853, 551.412, 3.75076, 7200, 0, 0, 81900, 31952, 0, 0),
(125758, 36893, 658, 3, 1, 0, 0, 923.682, 75.5856, 559.362, 3.57797, 7200, 0, 0, 81900, 31952, 0, 0),
(124334, 37582, 658, 3, 128, 0, 0, 441.213, 215.893, 528.71, 6.1897, 7200, 0, 0, 60480, 176280, 0, 0),
(123585, 37582, 658, 3, 128, 0, 0, 1079.01, 205.893, 628.156, 3.63306, 7200, 0, 0, 60480, 176280, 0, 0),
(124333, 37583, 658, 3, 64, 0, 0, 441.213, 215.893, 528.71, 6.1897, 7200, 0, 0, 126000, 0, 0, 0),
(123745, 37583, 658, 3, 64, 0, 0, 1076.62, 209.063, 628.156, 3.79407, 7200, 0, 0, 126000, 0, 0, 0),
(124335, 37774, 658, 3, 128, 0, 0, 440.351, 211.155, 528.71, 6.15829, 7200, 0, 0, 100800, 264420, 0, 0),
(123548, 37774, 658, 3, 128, 0, 0, 1076.62, 209.063, 628.156, 3.79407, 7200, 0, 0, 100800, 264420, 0, 0),
(124332, 37779, 658, 3, 64, 0, 0, 440.351, 211.155, 528.71, 6.15829, 7200, 0, 0, 126000, 0, 0, 0),
(123584, 37779, 658, 3, 64, 0, 0, 1079.01, 205.893, 628.156, 3.63306, 7200, 0, 0, 126000, 0, 0, 0),
(124329, 38188, 658, 3, 128, 0, 1221, 1060.82, 97.608, 630.996, 2.12527, 7200, 0, 0, 5040000, 881400, 0, 0),
(124328, 38189, 658, 3, 64, 0, 1290, 1060.82, 97.608, 630.996, 2.12527, 7200, 0, 0, 6972500, 85160, 0, 0);

ALTER TABLE db_version CHANGE COLUMN required_280_world_pit_of_saron required_295_world_forge_of_souls bit;

DELETE FROM `creature` where `id` IN (38161,38160);
-- Lady Sylvanas Windrunner
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`) VALUES ('82810', '38161', '632', '3', '64', '5614.04', '2447.03', '705.852', '0.952404', '7200', '5040000');
-- Lady Jaina Proudmoore
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`) VALUES ('82809', '38160', '632', '3', '128', '5614.04', '2447.03', '705.852', '0.952404', '7200', '5040000');

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


#Fix Cyclone piercing through Divine Shield
INSERT INTO spell_linked_spell VALUES (642, -33786, 2, 'Divine Shield Immune to Cyclone');

#Bladestorm immunity fixes
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(46924, -13810, 2, 'Bladestorm immune at Frost Trap aura');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(46924, -68766, 2, 'Bladestorm immune at Desecration');

ALTER TABLE db_version CHANGE COLUMN required_370_world_north_quest required_423_world_isle_of_conquest bit;

-- Isle Of Conquest 
INSERT INTO `trinity_string` VALUES ('11101', 'The battle will begin in two minutes!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11102', 'The battle will begin in one minute!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11103', 'The battle will begin in 30 seconds!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11104', 'The battle has begun!', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11105', 'Hangar', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11106', 'Quarry', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11107', 'Refinery', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11108', 'Docks', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11109', 'Workshop', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11110', 'The %s has taken the %s', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11111', 'Horde', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11112', 'Alliance', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11113', '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', '', null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('11114', '$n has defended the %s', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('11115', '$n has assaulted the %s', '', '', '', '', '', '', '', '');

ALTER TABLE db_version CHANGE COLUMN required_423_world_isle_of_conquest required_424_argent_quests bit;

-- Scriptname for training_dummy_argent
-- with this now you can ride the mount and use the skills on the dummies
UPDATE `creature_template` SET `ScriptName`='npc_training_dummy_argent' WHERE `entry` IN ('33172','33243');
-- Horde
-- The argent tournament Premier
DELETE FROM `creature_questrelation` WHERE `quest`=13668;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (33817, 13668);
-- Icone monture de la horde
UPDATE `creature_template` SET IconName='vehichleCursor' WHERE entry IN (33842,33796,33798,33791,33792,33799);
-- Vehicule id des monture 
UPDATE `creature_template` SET `VehicleId`=349 WHERE entry IN (33320,33321,33322,33323,33324);
-- Vitesse des montures
UPDATE creature_template SET speed_run = 1.571429 WHERE entry IN (33844, 33320, 33321, 33322, 33323, 33324);
-- Spells des montures
UPDATE `creature_template` SET `spell1`=62544, `spell2`=62575, `spell3`=62960, `spell4`=62552, `spell5`=64077 WHERE `entry` IN (33844, 33320, 33321, 33322, 33323, 33324);
-- Immune to Confuse
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 2 WHERE `entry` IN (33844, 33320, 33321, 33322, 33323, 33324);

-- Ajouts des spellclick_spells pour les montures ? l'?curie
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (33842,33796,33798,33791,33792,33799);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(33842, 63791, 13668, 1, 13680, 1, 0, 0, 0), -- Aspirant
-- Orgrimmar
(33799, 62783, 13726, 0, 0, 1, 0, 0, 0), -- Champion Of Orgrimmar
(33799, 62783, 13691, 0, 0, 1, 0, 0, 0), -- A Valiant Of Orgrimmar
(33799, 62783, 13707, 0, 0, 1, 0, 0, 0), -- Valiant Of Orgrimmar
-- Sen'jin
(33796, 62784, 13727, 0, 0, 1, 0, 0, 0), -- Champion Of Sen'jin
(33796, 62784, 13693, 0, 0, 1, 0, 0, 0), -- A Valiant Of Sen'jin
(33796, 62784, 13708, 0, 0, 1, 0, 0, 0), -- Valiant Of Sen'jin
-- Thunder Bluff
(33792, 62785, 13728, 0, 0, 1, 0, 0, 0), -- Champion Of Thunder Bluff
(33792, 62785, 13694, 0, 0, 1, 0, 0, 0), -- A Valiant Of Thunder Bluff
(33792, 62785, 13709, 0, 0, 1, 0, 0, 0), -- Valiant Of Thunder Bluff
-- Undercity
(33798, 62787, 13729, 0, 0, 1, 0, 0, 0), -- Champion Of Undercity
(33798, 62787, 13695, 0, 0, 1, 0, 0, 0), -- A Valiant Of Undercity
(33798, 62787, 13710, 0, 0, 1, 0, 0, 0), -- Valiant Of Undercity
-- Silvermoon
(33791, 62786, 13731, 0, 0, 1, 0, 0, 0), -- Champion Of Silvermoon
(33791, 62786, 13696, 0, 0, 1, 0, 0, 0), -- A Valiant Of Silvermoon
(33791, 62786, 13711, 0, 0, 1, 0, 0, 0); -- Valiant Of Silvermoon

-- Horde ArgentTournament
	-- Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13668;
UPDATE `quest_template` SET `PrevQuestId`=13668, `NextQuestId`=13678, `ExclusiveGroup`=-13829, `NextQuestInChain`=0 WHERE `entry` IN (13829, 13839, 13838);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13680 WHERE `entry`=13678;
	-- Daily Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13673;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13675;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13674;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13676;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13677;
	-- End Of Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13680;
	-- Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13680 WHERE `entry` IN (13691, 13693, 13694, 13695, 13696);

UPDATE `quest_template` SET `RequiredRaces`=2, `NextQuestId`=13697, `NextQuestInChain`=13697, `ExclusiveGroup`=13691 WHERE `entry`=13691;
UPDATE `quest_template` SET `RequiredRaces`=128, `NextQuestId`=13719, `NextQuestInChain`=13719, `ExclusiveGroup`=13693 WHERE `entry`=13693;
UPDATE `quest_template` SET `RequiredRaces`=32, `NextQuestId`=13720, `NextQuestInChain`=13720, `ExclusiveGroup`=13694 WHERE `entry`=13694;
UPDATE `quest_template` SET `RequiredRaces`=16, `NextQuestId`=13721, `NextQuestInChain`=13721, `ExclusiveGroup`=13695 WHERE `entry`=13695;
UPDATE `quest_template` SET `RequiredRaces`=512, `NextQuestId`=13722, `NextQuestInChain`=13722, `ExclusiveGroup`=13696 WHERE `entry`=13696;

-- INFOS DEV -- Premiere Quete (Admissibilit?) : 13687 -- Deuxieme Quete (Champion) : 13701
UPDATE `quest_template` SET `PrevQuestId`=13701 WHERE `entry` IN (13707, 13708, 13709, 13710, 13711); -- TOScript into the core (check of 13687)

UPDATE `quest_template` SET `NextQuestId`=13697, `NextQuestInChain`=13697, `ExclusiveGroup`=13691 WHERE `entry`=13707;
UPDATE `quest_template` SET `NextQuestId`=13719, `NextQuestInChain`=13719, `ExclusiveGroup`=13693 WHERE `entry`=13708;
UPDATE `quest_template` SET `NextQuestId`=13720, `NextQuestInChain`=13720, `ExclusiveGroup`=13694 WHERE `entry`=13709;
UPDATE `quest_template` SET `NextQuestId`=13721, `NextQuestInChain`=13721, `ExclusiveGroup`=13695 WHERE `entry`=13710;
UPDATE `quest_template` SET `NextQuestId`=13722, `NextQuestInChain`=13722, `ExclusiveGroup`=13696 WHERE `entry`=13711;

UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `entry` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `NextQuestId`=13726, `NextQuestInChain`=13726 WHERE `entry`=13697;
UPDATE `quest_template` SET `NextQuestId`=13727, `NextQuestInChain`=13727  WHERE `entry`=13719;
UPDATE `quest_template` SET `NextQuestId`=13728, `NextQuestInChain`=13728  WHERE `entry`=13720;
UPDATE `quest_template` SET `NextQuestId`=13729, `NextQuestInChain`=13729  WHERE `entry`=13721;
UPDATE `quest_template` SET `NextQuestId`=13731, `NextQuestInChain`=13731  WHERE `entry`=13722;
	-- Valiant Daily Quests
		-- A Blade Fit For A Champion
		-- The Edge Of Winter
		-- A Worthy Weapon
UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=13762, `NextQuestInChain`=0 WHERE `entry` IN (13762, 13763, 13764);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=13768, `NextQuestInChain`=0 WHERE `entry` IN (13768, 13769, 13770);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=13773, `NextQuestInChain`=0 WHERE `entry` IN (13773, 13774, 13775);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=13778, `NextQuestInChain`=0 WHERE `entry` IN (13778, 13779, 13780);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=13783, `NextQuestInChain`=0 WHERE `entry` IN (13783, 13784, 13785);
		-- A Valiant's Field Training
		-- The Grand Melee
		-- At The Enemy's Gates
UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13765, 13767, 13856);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13771, 13772, 13857);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13776, 13777, 13858);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13781, 13782, 13860);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13786, 13787, 13859);
	-- End Of Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13697, `NextQuestId`=13736, `ExclusiveGroup`=0, `NextQuestInChain`=13736 WHERE `entry`=13726;
UPDATE `quest_template` SET `PrevQuestId`=13719, `NextQuestId`=13737, `ExclusiveGroup`=0, `NextQuestInChain`=13737 WHERE `entry`=13727;
UPDATE `quest_template` SET `PrevQuestId`=13720, `NextQuestId`=13738, `ExclusiveGroup`=0, `NextQuestInChain`=13738 WHERE `entry`=13728;
UPDATE `quest_template` SET `PrevQuestId`=13721, `NextQuestId`=13739, `ExclusiveGroup`=0, `NextQuestInChain`=13739 WHERE `entry`=13729;
UPDATE `quest_template` SET `PrevQuestId`=13722, `NextQuestId`=13740, `ExclusiveGroup`=0, `NextQuestInChain`=13740 WHERE `entry`=13731;
	-- A Champion Rises (Final Quest of a Branch)
UPDATE `quest_template` SET `PrevQuestId`=13726, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13736;
UPDATE `quest_template` SET `PrevQuestId`=13727, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13737;
UPDATE `quest_template` SET `PrevQuestId`=13728, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13738;
UPDATE `quest_template` SET `PrevQuestId`=13729, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13739;
UPDATE `quest_template` SET `PrevQuestId`=13740, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13740;

-- Debug Quest Requirements
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13726, 13727, 13728, 13729, 13731);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13736, 13737, 13738, 13739, 13740);
	
-- Alliance
-- Premiere quete : Le tournoi d'argent
DELETE FROM `creature_questrelation` WHERE `quest`=13667;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (33817, 13667);
-- Icone monture de la horde
UPDATE `creature_template` SET IconName='vehichleCursor' WHERE `entry` IN (33843,33794,33800,33793,33795,33790);
-- Vehicule id des montures
UPDATE `creature_template` SET `VehicleId`=349 WHERE `entry` IN (33319,33317,33318,33217,33316);
-- Vitesse des montures
UPDATE `creature_template` SET `speed_run`= 1.571429 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);
-- Spells des montures
UPDATE `creature_template` SET `spell1`=62544, `spell2`=62575, `spell3`=62960, `spell4`=62552, `spell5`=64077 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);
-- Immune to Confuse
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 2 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);

-- Ajouts des spellclick_spells pour les montures ? l'?curie
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (33843,33800,33795,33790,33793,33794);

INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(33843, 63792, 13667, 1, 13679, 1, 0, 0, 0), -- Aspirant
-- Darnassus
(33794, 62782, 13725, 0, 0, 1, 0, 0, 0), -- Champion Of Darnassus
(33794, 62782, 13689, 0, 0, 1, 0, 0, 0), -- A Valiant Of Darnassus
(33794, 62782, 13706, 0, 0, 1, 0, 0, 0), -- Valiant Of Darnassus
-- Hurlevent
(33800, 62774, 13699, 0, 0, 1, 0, 0, 0), -- Champion Of Sen'jin
(33800, 62774, 13593, 0, 0, 1, 0, 0, 0), -- A Valiant Of Sen'jin
(33800, 62774, 13684, 0, 0, 1, 0, 0, 0), -- Valiant Of Sen'jin
-- Gnomregan
(33793, 62780, 13723, 0, 0, 1, 0, 0, 0), -- Champion Of Thunder Bluff
(33793, 62780, 13688, 0, 0, 1, 0, 0, 0), -- A Valiant Of Thunder Bluff
(33793, 62780, 13704, 0, 0, 1, 0, 0, 0), -- Valiant Of Thunder Bluff
-- Forgefer
(33795, 62779, 13713, 0, 0, 1, 0, 0, 0), -- Champion Of Forgefer
(33795, 62779, 13685, 0, 0, 1, 0, 0, 0), -- A Valiant Of Undercity
(33795, 62779, 13703, 0, 0, 1, 0, 0, 0), -- Valiant Of Forgefer
-- Exodar
(33790, 62781, 13724, 0, 0, 1, 0, 0, 0), -- Champion Of Exodar
(33790, 62781, 13690, 0, 0, 1, 0, 0, 0), -- A Valiant Of Exodar
(33790, 62781, 13705, 0, 0, 1, 0, 0, 0); -- Valiant Of Exodar


-- Alliance ArgentTournament
	-- Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13667;
UPDATE `quest_template` SET `PrevQuestId`=13667, `NextQuestId`=13672, `ExclusiveGroup`=-13828, `NextQuestInChain`=0 WHERE `entry` IN (13828, 13837, 13835);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13679 WHERE `entry`=13672;
	-- Daily Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13666;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13670;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13669;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13671;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13625;
	-- End Of Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13679;
	-- Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13679 WHERE `entry` IN (13684, 13685, 13689, 13688, 13690);

UPDATE `quest_template` SET `RequiredRaces`=1, `NextQuestId`=13718, `NextQuestInChain`=13718, `ExclusiveGroup`=13684 WHERE `entry`=13684;
UPDATE `quest_template` SET `RequiredRaces`=4, `NextQuestId`=13714, `NextQuestInChain`=13714, `ExclusiveGroup`=13685 WHERE `entry`=13685;
UPDATE `quest_template` SET `RequiredRaces`=8, `NextQuestId`=13717, `NextQuestInChain`=13717, `ExclusiveGroup`=13689 WHERE `entry`=13689;
UPDATE `quest_template` SET `RequiredRaces`=64, `NextQuestId`=13715, `NextQuestInChain`=13715, `ExclusiveGroup`=13688 WHERE `entry`=13688;
UPDATE `quest_template` SET `RequiredRaces`=1024, `NextQuestId`=13716, `NextQuestInChain`=13716, `ExclusiveGroup`=13690 WHERE `entry`=13690;

-- INFOS DEV -- Premiere Quete (Admissibilit?) : 13686 -- Deuxieme Quete (Champion) : 13700
UPDATE `quest_template` SET `PrevQuestId`=13700 WHERE `entry` IN (13593, 13703, 13706, 13704, 13705); -- TOScript into the core (check of 13686)

UPDATE `quest_template` SET `NextQuestId`=13718, `NextQuestInChain`=13718, `ExclusiveGroup`=13718 WHERE `entry`=13593;
UPDATE `quest_template` SET `NextQuestId`=13714, `NextQuestInChain`=13714, `ExclusiveGroup`=13714 WHERE `entry`=13703;
UPDATE `quest_template` SET `NextQuestId`=13717, `NextQuestInChain`=13717, `ExclusiveGroup`=13717 WHERE `entry`=13706;
UPDATE `quest_template` SET `NextQuestId`=13715, `NextQuestInChain`=13715, `ExclusiveGroup`=13715 WHERE `entry`=13704;
UPDATE `quest_template` SET `NextQuestId`=13716, `NextQuestInChain`=13716, `ExclusiveGroup`=13716 WHERE `entry`=13705;

UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `entry` IN (13718, 13714, 13717, 13715, 13716);

UPDATE `quest_template` SET `NextQuestId`=13699, `NextQuestInChain`=13699 WHERE `entry`=13718;
UPDATE `quest_template` SET `NextQuestId`=13713, `NextQuestInChain`=13713  WHERE `entry`=13714;
UPDATE `quest_template` SET `NextQuestId`=13725, `NextQuestInChain`=13725  WHERE `entry`=13717;
UPDATE `quest_template` SET `NextQuestId`=13723, `NextQuestInChain`=13723  WHERE `entry`=13715;
UPDATE `quest_template` SET `NextQuestId`=13724, `NextQuestInChain`=13724  WHERE `entry`=13716;
	-- Valiant Daily Quests
		-- A Blade Fit For A Champion
		-- The Edge Of Winter
		-- A Worthy Weapon
UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=13603, `NextQuestInChain`=0 WHERE `entry` IN (13603, 13600, 13616);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=13741, `NextQuestInChain`=0 WHERE `entry` IN (13741, 13742, 13743);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=13757, `NextQuestInChain`=0 WHERE `entry` IN (13757, 13758, 13759);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=13746, `NextQuestInChain`=0 WHERE `entry` IN (13746, 13747, 13748);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=13752, `NextQuestInChain`=0 WHERE `entry` IN (13752, 13753, 13754);
		-- A Valiant's Field Training
		-- The Grand Melee
		-- At The Enemy's Gates
UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13592, 13665, 13847);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13744, 13745, 13851);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13760, 13761, 13855);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13749, 13750, 13852);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13755, 13756, 13854);
	-- End Of Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13718, `NextQuestId`=13702, `ExclusiveGroup`=0, `NextQuestInChain`=13702 WHERE `entry`=13699;
UPDATE `quest_template` SET `PrevQuestId`=13714, `NextQuestId`=13732, `ExclusiveGroup`=0, `NextQuestInChain`=13732 WHERE `entry`=13713;
UPDATE `quest_template` SET `PrevQuestId`=13717, `NextQuestId`=13735, `ExclusiveGroup`=0, `NextQuestInChain`=13735 WHERE `entry`=13725;
UPDATE `quest_template` SET `PrevQuestId`=13715, `NextQuestId`=13733, `ExclusiveGroup`=0, `NextQuestInChain`=13733 WHERE `entry`=13723;
UPDATE `quest_template` SET `PrevQuestId`=13716, `NextQuestId`=13734, `ExclusiveGroup`=0, `NextQuestInChain`=13734 WHERE `entry`=13724;
	-- A Champion Rises (Final Quest of a Branch)
UPDATE `quest_template` SET `PrevQuestId`=13699, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13702;
UPDATE `quest_template` SET `PrevQuestId`=13713, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13732;
UPDATE `quest_template` SET `PrevQuestId`=13725, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13735;
UPDATE `quest_template` SET `PrevQuestId`=13723, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13733;
UPDATE `quest_template` SET `PrevQuestId`=13734, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13734;

-- Debug Quest Requirements
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13718, 13714, 13717, 13715, 13716);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13699, 13713, 13725, 13723, 13724);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13702, 13732, 13735, 13733, 13734);


-- Black Night chain
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=13641, `ExclusiveGroup`=13633, `NextQuestInChain`=13641 WHERE `entry` IN (13633, 13634);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13643 WHERE `entry`=13641;
UPDATE `quest_template` SET `PrevQuestId`=13641, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13654 WHERE `entry`=13643;
UPDATE `quest_template` SET `PrevQuestId`=13643, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13663 WHERE `entry`=13654;
UPDATE `quest_template` SET `PrevQuestId`=13654, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13664 WHERE `entry`=13663;
UPDATE `quest_template` SET `PrevQuestId`=13663, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=14016 WHERE `entry`=13664;
UPDATE `quest_template` SET `PrevQuestId`=13664, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=14017 WHERE `entry`=14016;
UPDATE `quest_template` SET `PrevQuestId`=14016, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=14017;

-- Champion Dailies
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13794; -- Eadric the Pure -- Works yet, but might bug with The Scourgebane
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13795; -- The Scourgebane
	-- Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13790; -- Alliance Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13793; -- Alliance DK Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13811; -- Horde Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13814; -- Horde DK Among The Champions
	-- Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13861; -- Alliance Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13864; -- Alliance DK Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13862; -- Horde Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13863; -- Horde DK Battle Before The Citadel
	-- Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13789; -- Alliance Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13791; -- Alliance DK Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13810; -- Horde Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13813; -- Horde DK Taking Battle To The Enemy
	-- Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13682; -- Alliance Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13788; -- Alliance DK Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13809; -- Horde Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13812; -- Horde DK Threat From Above

-- Crusader dailies
	-- Mistcaller Yngvar
	-- Drottinn Hrothgar
	-- Ornolf The Scarred
	-- Deathspeaker Kharos
UPDATE `quest_template` SET `ExclusiveGroup`=14102, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14102, 14101, 14104, 14105);
	-- The Fate Of The Fallen
	-- Get Kraken!
	-- Identifying the Remains
UPDATE `quest_template` SET `ExclusiveGroup`=14107, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14107, 14108, 14095);

-- Covenant Quests
UPDATE `quest_template` SET `PrevQuestId`=13700, `RequiredMinRepFaction`=1094, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14112, 14076, 14090, 14096, 14152, 14080, 14077, 14074); -- Alliance
UPDATE `quest_template` SET `PrevQuestId`=13701, `RequiredMinRepFaction`=1124, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14145, 14092, 14141, 14142, 14136, 14140, 14144, 14143); -- Horde
	-- What Do You Feed A Yeti, Anyway?
	-- Breakfast Of Champions
	-- Gormok Wants His Snobolds
UPDATE `quest_template` SET `ExclusiveGroup`=14112 WHERE `entry` IN (14112, 14145, 14076, 14092, 14090, 14141); -- A1, H1, A2, H2, A3, H3
	-- You've Really Done It This Time, Kul
	--
	-- Rescue At Sea
	-- Stop The Agressors
	-- The Light's Mercy
	-- A Leg Up
UPDATE `quest_template` SET `ExclusiveGroup`=14152 WHERE `entry` IN (14152, 14136, 14080, 14140, 14077, 14144, 14074, 14143); -- A1, H1, A2, H2, A3, H3, A4, H4

-- Champion Marker
UPDATE `quest_template` SET `NextQuestId`=13846, `ExclusiveGroup`=13700 WHERE `entry` IN (13700, 13701); -- Alliance, Horde

-- Contributin' To The Cause
UPDATE `quest_template` SET `RequiredMaxRepFaction`=1106, `RequiredMaxRepValue`=42000 WHERE `entry`=13846;

-- Goblin Dailies Removing
	-- The Blastbolt Brothers
	-- A Chip Off the Ulduar Block
	-- Jack Me Some Lumber
DELETE FROM `creature_questrelation` WHERE `quest` IN (13820, 13681, 13627);

-- DK Quests Restrictions
	-- The Scourgebane
	-- Taking Battle To The Enemy (A, H)
	-- Threat From Above (A, H)
	-- Among the Champions (A, H)
	-- Battle Before The Citadel (A, H)
UPDATE `quest_template` SET `SkillOrClassMask`=-32 WHERE `entry` IN (13795, 13791, 13813, 13788, 13812, 13793, 13814, 13864, 13863);
-- Non DK Quests Restrictions
	-- Eadric The Pure
	-- Taking Battle To The Enemy (A, H)
	-- Threat From Above (A, H)
	-- Among the Champions (A, H)
	-- Battle Before The Citadel (A, H)
UPDATE `quest_template` SET `SkillOrClassMask`=-1503 WHERE `entry` IN (13794, 13788, 13789, 13810, 13682, 13809, 13790, 13811, 13861, 13862);

-- Teleports Locations
DELETE FROM `spell_target_position` WHERE `id` IN (63986,63987);
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(63986,571,8574.87,700.595,547.29,5.48),
(63987,571,8460,700,547.4,3.839);

-- Armor Modificator set to null for Targets
UPDATE `creature_template` SET `Armor_mod`=0 WHERE `entry` IN (33243, 33272, 33229);

-- Add Scripts to NPCs
UPDATE `creature_template` SET `ScriptName`='npc_quest_givers_argent_tournament' WHERE `entry` IN (33593, 33592, 33225, 33312, 33335, 33379, 33373, 33361, 33403, 33372);
UPDATE `creature_template` SET `ScriptName`='npc_quest_givers_for_crusaders' WHERE `entry` IN (34882, 35094);
UPDATE `creature_template` SET `ScriptName`='npc_crusader_rhydalla' WHERE `entry`=33417;
UPDATE `creature_template` SET `ScriptName`='npc_eadric_the_pure' WHERE `entry`=33759;
UPDATE `creature_template` SET `ScriptName`='npc_crok_scourgebane' WHERE `entry`=33762;
UPDATE `creature_template` SET `ScriptName`='npc_valis_windchaser' WHERE `entry`=33974;
UPDATE `creature_template` SET `ScriptName`='npc_rugan_steelbelly' WHERE `entry`=33972;
UPDATE `creature_template` SET `ScriptName`='npc_jeran_lockwood' WHERE `entry`=33973;
UPDATE `creature_template` SET `Scriptname`='npc_justicar_mariel_trueheart' WHERE `entry` = '33817';


-- Debug QuestRelation A2
DELETE FROM `creature_questrelation` WHERE `quest` IN (13828, 13672, 13679, 13684, 13685, 13689, 13688, 13690);
INSERT `creature_questrelation` (`id`, `quest`) VALUES (33625, 13828), (33625, 13672), (33625, 13679), (33625, 13684), (33625, 13685), (33625,13689), (33625, 13688), (33625, 13690);

-- Debug QuestRelation H2
DELETE FROM `creature_questrelation` WHERE `quest` IN (13691, 13693, 13694, 13695, 13696, 13829, 13680, 13678);
INSERT `creature_questrelation` (`id`, `quest`) VALUES (33542, 13691), (33542, 13693), (33542, 13694), (33542, 13695), (33542, 13696), (33542,13829), (33542, 13680), (33542, 13678);

-- Quest 13666 & 13673:  Une lame digne d'un champion!
-- Lake Frog
-- Maiden Of Ahswood Lake
UPDATE `creature_template` SET `ScriptName` = 'npc_lake_frog' WHERE `creature_template`.`entry` =33211 LIMIT 1 ;
UPDATE `creature_template` SET `npcflag` = `npcflag` | 1, `ScriptName` = 'npc_maiden_of_ashwood_lake' WHERE `creature_template`.`entry` =33220;
-- frog speed from sniff
UPDATE creature_template SET speed_run = 1 WHERE entry = 33211;
UPDATE creature_template SET speed_walk = 1.6 WHERE entry = 33211;

-- Quest : Le fil de l'hiver
DELETE FROM creature WHERE guid = '336364';
INSERT INTO creature VALUES  (336364,33289,571,1,1,0,0,5136.74,-83.3769,347.326,1.44434,300,0,0,12600,3994,0,0);
DELETE FROM `creature_loot_template` WHERE `entry`=33289 AND `item`=45005;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES (33289, 45005, -100);

-- Quete : Une arme remarquable
DELETE FROM `script_texts` WHERE `entry` IN (-1850000,-1850001,-1850002,-1850003);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc2`,`comment`) VALUES
(0, -1850000, 'Oh, ce sont des jacinthes d\'hiver ? Pour moi ?', 'Oh, ce sont des jacinthes d\'hiver ? Pour moi ?',''),
(0, -1850001, 'On ne m\'avait pas apport? de fleurs ici depuis si longtemps.', 'On ne m\'avait pas apport? de fleurs ici depuis si longtemps.',''),
(0, -1850002, 'Le lac est un endroit bien solitaire depuis quelques ann?es. Les voyageurs n\'y viennent plus, et le mal en a envahi les eaux.', 'Le lac est un endroit bien solitaire depuis quelques ann?es. Les voyageurs n\'y viennent plus, et le mal en a envahi les eaux.',''),
(0, -1850003, 'Votre cadeau r?v?le une rare bont?, voyageur. Je vous en prie, prenez cette lame en gage de ma gratitude. Il y a bien longtemps, c\'est un autre voyageur qui l\'avait laiss?e ici, mais je n\'en ai pas l\'utilit?.', 'Votre cadeau r?v?le une rare bont?, voyageur. Je vous en prie, prenez cette lame en gage de ma gratitude. Il y a bien longtemps, c\'est un autre voyageur qui l\'avait laiss?e ici, mais je n\'en ai pas l\'utilit?.','');
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES (20990, 0, 10, 33273, 42000, 4602.977, -1600.141, 156.7834, 0.7504916);
UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_maiden_of_drak_mar' WHERE `entry`=33273;
DELETE FROM `creature_template_addon` WHERE `entry`=33273;
INSERT INTO `creature_template_addon` (`entry`, `emote`) VALUES (33273, 13); -- 13 = EMOTE_STATE_SIT

-- Quete Entrainement sur le terrain:
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE entry IN (29720,29719,29722);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(NULL, 29720, 571, 1, 1, 0, 0, 8562.48, 2771.93, 759.958, 6.10672, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8584.64, 2760.8, 759.958, 2.59599, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8617.49, 2735.11, 759.958, 2.32895, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8420.8, 2688.71, 759.957, 1.33806, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8417.11, 2641.07, 759.957, 1.57604, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8435.89, 2596.91, 759.957, 2.30577, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8477.25, 2565.16, 759.957, 2.51783, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8522.14, 2556.99, 759.957, 3.11709, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8571.58, 2559.95, 759.957, 4.05564, 300, 0, 0, 12600, 0, 0, 0),
(NULL, 29720, 571, 1, 1, 0, 0, 8609.24, 2589.19, 759.958, 0.155352, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8637.35, 2651.77, 759.958, 4.15303, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8636.85, 2679.47, 759.958, 4.93842, 300, 15, 0, 12175, 0, 0, 1);

-- Quest : A Worthy Weapon
DELETE FROM `script_texts` WHERE `entry` IN (-1850000,-1850001,-1850002,-1850003);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc2`,`comment`) VALUES
(0, -1850000, 'Oh, these are hyacinths \ winter? For me ?', 'Oh, these are hyacinths \ winter? For me  ?',''),
(0, -1850001, 'We don\'t had not brought flowers here for so long.', 'We don\'t had not brought flowers here for so long.',''),
(0, -1850002, 'The lake is a lonely spot some years. Travelers to come over, and evil has invaded the waters.', 'The lake is a lonely spot some years. Travelers to come over, and evil has invaded the waters.',''),
(0, -1850003, 'Your gift shows a rare kindness, traveler. Please, take this blade as a token of my gratitude. There has long, is another traveler who had left here, but I do not need. ',' Your gift reveals a rare kindness, traveler. Please, take this blade as a token of my gratitude. Long ago, another passenger who had left here, but I have no use.','');
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES (20990, 0, 10, 33273, 42000, 4602.977, -1600.141, 156.7834, 0.7504916);
UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_maiden_of_drak_mar' WHERE `entry`=33273;
DELETE FROM `creature_template_addon` WHERE `entry`=33273;
INSERT INTO `creature_template_addon` (`entry`, `emote`) VALUES (33273, 13); -- 13 = EMOTE_STATE_SIT


-- Text campioni
-- Quest : A Worthy Weapon
DELETE FROM `script_texts` WHERE `entry` IN (-1850000,-1850001,-1850002,-1850003);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc2`,`comment`) VALUES
(0, -1850004, 'Stand ready !', 'Stand ready !',''),
(0, -1850005, 'Let the battle begins !', 'Let the battle begins !',''),
(0, -1850006, 'Prepare your self !', 'Prepare your self! !',''),
(0, -1850007, 'You think you have the courage in you? Will see.', 'You think you have the courage in you? Will see.',''),
(0, -1850008, 'Impressive demonstration. I think you\re quite able to join the ranks of the valiant.', 'Impressive demonstration. I think you\re quite able to join the ranks of the valiant.',''),
(0, -1850009, 'I\'ve won. You\'ll probably have more luck next time.', 'I\'ve won. You\'ll probably have more luck next time.',''),
(0, -1850010, 'I am defeated. Nice battle !', 'I am defeated. Nice battle !',''),
(0, -1850011, 'It seems that I\'ve underestimated your skills. Well done.', 'It seems that I\'ve underestimated your skills. Well done.',''),
(0, -1850012, 'You\'ll probably have more luck next time.', '','');

ALTER TABLE db_version CHANGE COLUMN required_424_argent_quests required_436_world_command bit;

-- Achievement lookup & add
DELETE FROM command WHERE NAME IN ('lookup achievement', 'achievement add', 'achievement remove');
INSERT INTO command (name, security, help) VALUES
('lookup achievement', 1, 'Syntax: .lookup achievement $achievementname\r\n\r\nLooks up an achievement by $achievementname, and returns all matches with their Achievement ID\'s.');
INSERT INTO command (name, security, help) VALUES
('achievement add', 2, 'Syntax: .achievement add $achievementID\r\n\r\Adds the achievement with selected ID\'s.');
INSERT INTO command (name, security, help) VALUES
('achievement remove', 2, 'Syntax: .achievement remove $achievementID\r\n\r\removes the achievement with selected ID\'s.');

ALTER TABLE db_version CHANGE COLUMN required_436_world_command required_507_world_wintergrasp bit;

DELETE FROM `trinity_string` WHERE entry IN (756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,780,781);
INSERT INTO `trinity_string` VALUES ('756', 'Battle begins!', '', '', '', '', '', '', '', 'Битва началась');
INSERT INTO `trinity_string` VALUES ('757', '%s has successfully defended the fortress!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('758', '%s has taken over the fortress!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('759', 'The %s siege workshop has been damaged by the %s!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('760', 'The %s siege workshop has been destroyed by the %s!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('761', 'The %s tower has been damaged!', '', '', '', '', '', '', '', '%s башня повреждена');
INSERT INTO `trinity_string` VALUES ('762', 'The %s tower has been destroyed!', '', '', '', '', '', '', '', '%s башня уничтожена!');
INSERT INTO `trinity_string` VALUES ('763', 'Wintergrasp fortress is under attack!', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('764', 'Wintergrasp is now under the control of the %s.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('765', 'Wintergrasp timer set to %s.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('766', 'Wintergrasp battle started.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('767', 'Wintergrasp battle finished.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('769', 'Wintergrasp outdoorPvP is disabled.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('770', 'Wintergrasp outdoorPvP is enabled.', '', '', '', '', '', '', '', '');
INSERT INTO `trinity_string` VALUES ('771', 'You have reached Rank 1: Corporal', '', '', '', '', '', '', '', 'Вы достигли Ранга 1: Капрал');
INSERT INTO `trinity_string` VALUES ('772', 'You have reached Rank 2: First Lieutenant', '', '', '', '', '', '', '', 'Вы достигли Ранга 2: Лейтенант');
REPLACE INTO `trinity_string` VALUES ('780', 'Before the Battle of  Wintergrasp left 30 minutes!', '', '', '', '', '', '', '', 'До битвы на  Озере Ледяных Оков осталось 30 минут!');
REPLACE INTO `trinity_string` VALUES ('781', 'Before the Battle of  Wintergrasp left 10 minutes!', '', '', '', '', '', '', '', 'До битвы на  Озере Ледяных Оков осталось 10 минут!');
REPLACE INTO `trinity_string` VALUES ('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', '', '', '', '', '', '', '', 'Битва за Озеро Ледяных Оков Остановлена. Не хватает защитников. Крепость переходит атакующей  стороне.');
REPLACE INTO `trinity_string` VALUES ('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', '', '', '', '', '', '', '', 'Битва за Озеро Ледяных Оков Остановлена. Не хватает нападающих. Крепость остается защитникам.');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` VALUES ('wg', '3', 'Syntax: .wg $subcommand.');
INSERT INTO `command` VALUES ('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.');
INSERT INTO `command` VALUES ('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.');
INSERT INTO `command` VALUES ('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.');
INSERT INTO `command` VALUES ('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).');
INSERT INTO `command` VALUES ('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.');
INSERT INTO `command` VALUES ('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

/* Temp removed gameobject stopping you getting to the relic
* 60070 - [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
* 60476 - [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]*/
DELETE FROM gameobject WHERE id IN ('194323', '194162');

/*Defender's Portal Activate Proper Spell*/
REPLACE INTO `spell_linked_spell` VALUES ('54640','54643','0','Defender\'s Portal Activate Proper Spell');

/* Teleport WG SPELLs*/
REPLACE INTO `spell_target_position` VALUES ('59096', '571', '4561.58', '2835.33', '389.79', '0.34');
REPLACE INTO `spell_target_position` VALUES ('60035', '571', '5325.06', '2843.36', '409.285', '3.20278');

DELETE FROM `outdoorpvp_template` WHERE `TypeId` IN (7);
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `Comment`) VALUES (7, 'outdoorpvp_wg', 'Wintergrasp');

-- Script Names for quest Free Your Mind
ALTER TABLE db_version CHANGE COLUMN required_507_world_wintergrasp required_516_world_quest_free_your_mind bit;
-- Leaper
UPDATE `creature_template` SET `ScriptName`='npc_leaper' WHERE `entry`='29840';
-- Lady Nightswood
UPDATE `creature_template` SET `ScriptName`='npc_lady_nightswood' WHERE `entry`='29770';
-- The Vile
UPDATE `creature_template` SET `ScriptName`='npc_vile' WHERE `entry`='29769';