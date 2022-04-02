UPDATE `gameservers` SET
`ID` = '1',
`ServerIP` = 'ancestra-game.beblood.fr',
`ServerPort` = '5555',
`State` = '0',
`ServerBDD` = 'mysql',
`ServerDBName` = 'ancestra_game',
`ServerUser` = 'root',
`ServerPassword` = 'toor',
`key` = 'server1'
WHERE `ID` = '1';

INSERT INTO `accounts` (`guid`, `account`, `pass`, `level`, `subscription`, `email`, `lastIP`, `lastConnectionDate`, `question`, `reponse`, `pseudo`, `banned`, `curIP`, `logged`, `giftID`) VALUES
(11,	'admin',	'admin',	4,	0,	'',	'',	'',	'DELETE?',	'DELETE',	'admin',	0,	'',	0,	'');