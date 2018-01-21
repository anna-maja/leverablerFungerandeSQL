-- 2018-01-21  //  Anna-Maja Lithner
-- all code to populate the tables colour, garn, item, mottagare, garn_has_colour samt view alltomalster
-- code to alster_has_garn still not functioning

-- populate colour
INSERT INTO `individualprojectstickalster`.`colour` (`ID`, `colour`) VALUES ('1', 'cerise');
INSERT INTO `individualprojectstickalster`.`colour` (`ID`, `colour`) VALUES ('2', 'neonrosa');
INSERT INTO `individualprojectstickalster`.`colour` (`colour`) VALUES ('karamellrosa');
INSERT INTO `individualprojectstickalster`.`colour` (`colour`) VALUES ('ljusgrå');
INSERT INTO `individualprojectstickalster`.`colour` (`colour`) VALUES ('mellangrå');
INSERT INTO `individualprojectstickalster`.`colour` (`colour`) VALUES ('mörkgrå');
INSERT INTO `individualprojectstickalster`.`colour` (`colour`) VALUES ('svart');
INSERT INTO `individualprojectstickalster`.`colour` (`colour`) VALUES ('kritvit');
INSERT INTO `individualprojectstickalster`.`colour` (`colour`) VALUES ('naturvit');
INSERT INTO `individualprojectstickalster`.`colour` (`colour`) VALUES ('hallonrosa');


-- populate garn
INSERT INTO `individualprojectstickalster`.`garn` (`ID`, `nameManuf`, `material`) VALUES ('1', 'Ullcentrum entrådigt ullgarn', '100% ull');
INSERT INTO `individualprojectstickalster`.`garn` (`ID`, `nameManuf`, `material`) VALUES ('2', 'Ullcentrum tvåtrådigt ullgarn', '100% ull');
INSERT INTO `individualprojectstickalster`.`garn` (`nameManuf`, `material`) VALUES ('Svarta Katten Siri', '100% akryl');
INSERT INTO `individualprojectstickalster`.`garn` (`nameManuf`, `material`) VALUES ('Svarta Katten Freja', '100% akryl');
INSERT INTO `individualprojectstickalster`.`garn` (`nameManuf`, `material`) VALUES ('Järbo Lady', '100% akryl');
INSERT INTO `individualprojectstickalster`.`garn` (`nameManuf`, `material`) VALUES ('Svarta Katten Galaxy reflexgarn', 'akryl, reflex');
INSERT INTO `individualprojectstickalster`.`garn` (`nameManuf`, `material`) VALUES ('Järbo reflexgarn', 'ull, reflex');
INSERT INTO `individualprojectstickalster`.`garn` (`nameManuf`, `material`) VALUES ('Järbo Molly', '100% akryl');


-- populate item
INSERT INTO `individualprojectstickalster`.`item` (`ID`, `modellTyp`) VALUES ('1', 'Trekantssjal, nacke till spets, v-form');
INSERT INTO `individualprojectstickalster`.`item` (`ID`, `modellTyp`) VALUES ('2', 'Trekantssjal, spets till topp');
INSERT INTO `individualprojectstickalster`.`item` (`modellTyp`) VALUES ('Dragspelssockar');
INSERT INTO `individualprojectstickalster`.`item` (`modellTyp`) VALUES ('Pussyhat');
INSERT INTO `individualprojectstickalster`.`item` (`modellTyp`) VALUES ('Halsduk');


-- set values to .item.kategori 
UPDATE `individualprojectstickalster`.`item` SET `kategori`='sjal' WHERE `ID`='1';
UPDATE `individualprojectstickalster`.`item` SET `kategori`='sjal' WHERE `ID`='2';
UPDATE `individualprojectstickalster`.`item` SET `kategori`='sockar' WHERE `ID`='3';
UPDATE `individualprojectstickalster`.`item` SET `kategori`='mössa' WHERE `ID`='4';
UPDATE `individualprojectstickalster`.`item` SET `kategori`='halsduk' WHERE `ID`='5';


-- populate mottagare
INSERT INTO `individualprojectstickalster`.`mottagare` (`ID`, `namn`) VALUES ('1', 'Kim');
INSERT INTO `individualprojectstickalster`.`mottagare` (`ID`, `namn`) VALUES ('2', 'Hugo');
INSERT INTO `individualprojectstickalster`.`mottagare` (`namn`) VALUES ('Sami');
INSERT INTO `individualprojectstickalster`.`mottagare` (`namn`, `kontakt`) VALUES ('Marie', 'messenger');
INSERT INTO `individualprojectstickalster`.`mottagare` (`namn`, `kontakt`) VALUES ('Eira', 'Marie');
INSERT INTO `individualprojectstickalster`.`mottagare` (`namn`) VALUES ('Mamma');


-- populate garn_has_colour
INSERT INTO `individualprojectstickalster`.`garn_has_colour` (`Garn_ID`, `colour_ID`) VALUES ('5', '1');
INSERT INTO `individualprojectstickalster`.`garn_has_colour` (`Garn_ID`, `colour_ID`) VALUES ('3', '2');
INSERT INTO `individualprojectstickalster`.`garn_has_colour` (`Garn_ID`, `colour_ID`) VALUES ('6', '2');


-- create view alltomalster
USE `individualprojectstickalster`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `alltomalster` AS
    SELECT 
    `mottagare`.`ID` AS `MottagarID`,
        `mottagare`.`namn` AS `Namn`,
        `item`.`modellTyp` AS `Föremål`,
        `garn`.`nameManuf` AS `Garn`,
        `colour`.`colour` AS `Färg`
    FROM
        ((((`alster`
        JOIN `item`)
        JOIN `mottagare`)
        JOIN `garn`)
        JOIN `colour`);
        
        
-- this insert may not function ---     
INSERT INTO `individualprojectstickalster`.`alster_has_garn` (`Alster_ID`, `Alster_Mottagare_ID`, `Garn_ID`) VALUES ('1', '4', '8');