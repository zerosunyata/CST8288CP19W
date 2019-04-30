-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ScoreDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ScoreDB` ;

-- -----------------------------------------------------
-- Schema ScoreDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ScoreDB` DEFAULT CHARACTER SET utf8 ;
USE `ScoreDB` ;

-- -----------------------------------------------------
-- Table `ScoreDB`.`Player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScoreDB`.`Player` ;

CREATE TABLE IF NOT EXISTS `ScoreDB`.`Player` (
  `id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `joined` DATE NOT NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScoreDB`.`Username`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScoreDB`.`Username` ;

CREATE TABLE IF NOT EXISTS `ScoreDB`.`Username` (
  `Player_id` INT UNSIGNED NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Player_id`),
  CONSTRAINT `fk_Username_Player`
    FOREIGN KEY (`Player_id`)
    REFERENCES `ScoreDB`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScoreDB`.`Score`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScoreDB`.`Score` ;

CREATE TABLE IF NOT EXISTS `ScoreDB`.`Score` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Player_id` INT UNSIGNED NOT NULL,
  `score` INT UNSIGNED NOT NULL,
  `submission` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Score_Player1_idx` (`Player_id` ASC),
  CONSTRAINT `fk_Score_Player1`
    FOREIGN KEY (`Player_id`)
    REFERENCES `ScoreDB`.`Player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;USE ScoreDB;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Player;
DELETE FROM Username;
DELETE FROM Score;

SET SQL_SAFE_UPDATES = 1;

INSERT INTO `Player` (`id`, `first_name`, `last_name`, `joined`, `email`) VALUES 
(100000001, 'John1', 'Doe1', '1901-01-01', 'jd1@ac.ca'),
(100000002, 'John2', 'Doe2', '1902-02-02', 'jd2@ac.ca'),
(100000003, 'John3', 'Doe3', '1903-03-03', 'jd3@ac.ca'),
(100000004, 'John4', 'Doe4', '1904-04-04', 'jd4@ac.ca'),
(100000005, 'John5', 'Doe5', '1905-05-05', 'jd5@ac.ca'),
(100000006, 'John6', 'Doe6', '1906-06-06', 'jd6@ac.ca'),
(100000007, 'John7', 'Doe7', '1907-07-07', 'jd7@ac.ca'),
(100000008, 'John8', 'Doe8', '1908-08-08', 'jd8@ac.ca'),
(100000009, 'John9', 'Doe9', '1909-09-09', 'jd9@ac.ca');

INSERT INTO `Username` (`Player_id`, `username`) VALUES 
(100000001, 'JohnDoe1'),
(100000002, 'JohnDoe2'),
(100000003, 'JohnDoe3'),
(100000004, 'JohnDoe4'),
(100000005, 'JohnDoe5'),
(100000006, 'JohnDoe6'),
(100000007, 'JohnDoe7'),
(100000008, 'JohnDoe8'),
(100000009, 'JohnDoe9');

INSERT INTO `Score` (`Player_id`, `score`, `submission`) VALUES 
(100000001, 111, '2018-1-1 01:01:01'),
(100000002, 222, '2018-2-2 02:02:02'),
(100000003, 333, '2018-3-3 03:03:03'),
(100000004, 444, '2018-4-4 04:04:04'),
(100000005, 555, '2018-5-5 05:05:05'),
(100000006, 666, '2018-6-6 06:06:06'),
(100000007, 777, '2018-7-7 07:07:07'),
(100000008, 888, '2018-8-8 08:08:08'),
(100000009, 999, '2018-9-9 09:09:09');
