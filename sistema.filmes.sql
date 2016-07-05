-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sistemadefilmes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistemadefilmes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistemadefilmes` DEFAULT CHARACTER SET latin1 ;
USE `sistemadefilmes` ;

-- -----------------------------------------------------
-- Table `sistemadefilmes`.`Artista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sistemadefilmes`.`Artista` ;

CREATE TABLE IF NOT EXISTS `sistemadefilmes`.`Artista` (
  `codAtor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `cache` DECIMAL NOT NULL,
  `nascimento` DATE NOT NULL,
  PRIMARY KEY (`codAtor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemadefilmes`.`Participacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sistemadefilmes`.`Participacao` ;

CREATE TABLE IF NOT EXISTS `sistemadefilmes`.`Participacao` (
  `codParticipacao` INT NOT NULL AUTO_INCREMENT,
  `personagem` VARCHAR(45) NOT NULL,
  `desconto` DECIMAL NOT NULL,
  `cachePago` DECIMAL NOT NULL,
  `Artista_codAtor` INT NOT NULL,
  PRIMARY KEY (`codParticipacao`),
  INDEX `fk_Participacao_Artista1_idx` (`Artista_codAtor` ASC),
  CONSTRAINT `fk_Participacao_Artista1`
    FOREIGN KEY (`Artista_codAtor`)
    REFERENCES `sistemadefilmes`.`Artista` (`codAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemadefilmes`.`Filme`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sistemadefilmes`.`Filme` ;

CREATE TABLE IF NOT EXISTS `sistemadefilmes`.`Filme` (
  `codFilme` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `duracao` INT NOT NULL,
  `ano` INT NOT NULL,
  `cachetotal` DECIMAL NOT NULL,
  `Participacao_codParticipacao` INT NOT NULL,
  PRIMARY KEY (`codFilme`),
  INDEX `fk_Filme_Participacao_idx` (`Participacao_codParticipacao` ASC),
  CONSTRAINT `fk_Filme_Participacao`
    FOREIGN KEY (`Participacao_codParticipacao`)
    REFERENCES `sistemadefilmes`.`Participacao` (`codParticipacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
