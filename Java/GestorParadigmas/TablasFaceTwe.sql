-- -----------------------------------------------------
-- Schema proyecto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8 COLLATE
utf8_general_ci ;
USE `proyecto` ;
-- -----------------------------------------------------
-- Table `proyecto`.`Facebook`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Facebook (
 `usuario` VARCHAR(60) NOT NULL,
 `mensaje` VARCHAR(400) NOT NULL,
 `hora` DATETIME NOT NULL,
 `lugar` VARCHAR(40) NOT NULL,
 `hastag` BIT DEFAULT 0,
 `medio` VARCHAR(30) NOT NULL,
 `tema` VARCHAR(30) NOT NULL,
 `estado` VARCHAR(30) NOT NULL,
 PRIMARY KEY (usuario, hora)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyecto`.`Twitter`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Twitter (
 `usuario` VARCHAR(60) NOT NULL,
 `mensaje` VARCHAR(400) NOT NULL,
 `hora` DATETIME NOT NULL,
 `lugar` VARCHAR(40) NOT NULL,
 `hastag` BIT DEFAULT 0,
 `medio` VARCHAR(30) NOT NULL,
 `tema` VARCHAR(30) NOT NULL,
 `estado` VARCHAR(30) NOT NULL,
 PRIMARY KEY (usuario, hora)
)ENGINE = InnoDB;


-- formato del datetime 'YYYY-MM-DD HH:MM:SS'


select *from Facebook;
select *from Twitter;
-- drop table Twitter;
-- DROP PROCEDURE IF EXISTS hora_cant_tema_Post;
