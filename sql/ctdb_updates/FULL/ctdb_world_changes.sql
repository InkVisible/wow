-- 1_world_paladin_trainer.sql
-- Paladin trainer was training spell that he shouldn't
DELETE FROM `npc_trainer` WHERE `entry`='925' AND `spell`='20217'

-- 2_world_blood_elf_hunter_quest.sql
-- This fixes bug that you could use Seek the Farstriders as quest chain start quest.
UPDATE `quest_temlpate` SET `PrevQuestId` = '0' WHERE `entry` = '9484'; 