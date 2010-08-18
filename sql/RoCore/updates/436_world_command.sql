ALTER TABLE db_version CHANGE COLUMN required_424_argent_quests required_436_world_command bit;

-- Achievement lookup & add
DELETE FROM command WHERE NAME IN ('lookup achievement', 'achievement add', 'achievement remove');
INSERT INTO command (name, security, help) VALUES
('lookup achievement', 1, 'Syntax: .lookup achievement $achievementname\r\n\r\nLooks up an achievement by $achievementname, and returns all matches with their Achievement ID\'s.');
INSERT INTO command (name, security, help) VALUES
('achievement add', 2, 'Syntax: .achievement add $achievementID\r\n\r\Adds the achievement with selected ID\'s.');
INSERT INTO command (name, security, help) VALUES
('achievement remove', 2, 'Syntax: .achievement remove $achievementID\r\n\r\removes the achievement with selected ID\'s.');