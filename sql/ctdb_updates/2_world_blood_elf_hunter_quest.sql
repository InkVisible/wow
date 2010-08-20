-- This fixes bug that you could use Seek the Farstriders as quest chain start quest.
UPDATE `quest_template` SET `PrevQuestId` = '0' WHERE `entry` = '9484'; 
