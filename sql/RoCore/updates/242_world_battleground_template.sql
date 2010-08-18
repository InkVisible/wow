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