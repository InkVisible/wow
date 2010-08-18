ALTER TABLE db_version CHANGE COLUMN required_280_world_pit_of_saron required_295_world_forge_of_souls bit;

DELETE FROM `creature` where `id` IN (38161,38160);
-- Lady Sylvanas Windrunner
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`) VALUES ('82810', '38161', '632', '3', '64', '5614.04', '2447.03', '705.852', '0.952404', '7200', '5040000');
-- Lady Jaina Proudmoore
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`) VALUES ('82809', '38160', '632', '3', '128', '5614.04', '2447.03', '705.852', '0.952404', '7200', '5040000');