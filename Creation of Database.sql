-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Elidek
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Elidek
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Elidek` DEFAULT CHARACTER SET utf8 ;
USE `Elidek` ;

-- -----------------------------------------------------
-- Table `Elidek`.`Stem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Stem` (
  `ID Stem` INT NOT NULL AUTO_INCREMENT,
  `Full Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID Stem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Scientific Field`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Scientific Field` (
  `Scientific Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Scientific Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Program` (
  `Program Name` VARCHAR(45) NOT NULL,
  `Management` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Program Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Organization` (
  `Organization Name` VARCHAR(45) NOT NULL,
  `Abbreviation` VARCHAR(45) NOT NULL,
  `Telephones` INT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Address Name` VARCHAR(45) NOT NULL,
  `Address Number` INT NOT NULL,
  `Postal Code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Organization Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Company` (
  `Organization Name` VARCHAR(45) NOT NULL,
  `Funds` INT NOT NULL,
  PRIMARY KEY (`Organization Name`),
  INDEX `fk_Company_Organization_idx` (`Organization Name` ASC) ,
  CONSTRAINT `fk_Company_Organization`
    FOREIGN KEY (`Organization Name`)
    REFERENCES `Elidek`.`Organization` (`Organization Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`University`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`University` (
  `Organization Name` VARCHAR(45) NOT NULL,
  `Private Budget` INT NOT NULL,
  PRIMARY KEY (`Organization Name`),
  CONSTRAINT `fk_University_Organization1`
    FOREIGN KEY (`Organization Name`)
    REFERENCES `Elidek`.`Organization` (`Organization Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Research Center`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Research Center` (
  `Organization_Organization Name` VARCHAR(45) NOT NULL,
  `Private Funds` VARCHAR(45) NOT NULL,
  `Public Funds` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Organization_Organization Name`),
  CONSTRAINT `fk_Research Center_Organization1`
    FOREIGN KEY (`Organization_Organization Name`)
    REFERENCES `Elidek`.`Organization` (`Organization Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Researcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Researcher` (
  `ID Researcher` INT NOT NULL AUTO_INCREMENT,
  `Full Name` VARCHAR(45) NOT NULL,
  `DoB` DATE NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `Age` INT NOT NULL,
  `Organization Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID Researcher`),
  INDEX `fk_Researcher_Organization1_idx` (`Organization Name` ASC) ,
  CONSTRAINT `fk_Researcher_Organization1`
    FOREIGN KEY (`Organization Name`)
    REFERENCES `Elidek`.`Organization` (`Organization Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Project` (
  `ID Project` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `Brief` VARCHAR(45) NOT NULL,
  `Amount` INT NOT NULL,
  `Duration` INT NOT NULL,
  `Start Date` DATE NOT NULL,
  `End Date` DATE NOT NULL,
  `Evaluation` INT NOT NULL,
  `Evaluation Date` DATE NOT NULL,
  `Researcher_ID Researcher` INT NOT NULL,
  `Organization_Organization Name` VARCHAR(45) NOT NULL,
  `Program_Program Name` VARCHAR(45) NOT NULL,
  `Stem_ID Stem` INT NOT NULL,
  PRIMARY KEY (`ID Project`),
  INDEX `fk_Project_Researcher1_idx` (`Researcher_ID Researcher` ASC) ,
  INDEX `fk_Project_Organization1_idx` (`Organization_Organization Name` ASC) ,
  INDEX `fk_Project_Program1_idx` (`Program_Program Name` ASC) ,
  INDEX `fk_Project_Stem1_idx` (`Stem_ID Stem` ASC) ,
  CONSTRAINT `fk_Project_Researcher1`
    FOREIGN KEY (`Researcher_ID Researcher`)
    REFERENCES `Elidek`.`Researcher` (`ID Researcher`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Project_Organization1`
    FOREIGN KEY (`Organization_Organization Name`)
    REFERENCES `Elidek`.`Organization` (`Organization Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Project_Program1`
    FOREIGN KEY (`Program_Program Name`)
    REFERENCES `Elidek`.`Program` (`Program Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Project_Stem1`
    FOREIGN KEY (`Stem_ID Stem`)
    REFERENCES `Elidek`.`Stem` (`ID Stem`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Deliveries` (
  `Title` VARCHAR(45) NOT NULL,
  `Brief` VARCHAR(45) NOT NULL,
  `Project_ID Project` INT NOT NULL,
  `Delivery Date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Title`, `Brief`, `Project_ID Project`),
  INDEX `fk_Deliveries_Project1_idx` (`Project_ID Project` ASC) ,
  CONSTRAINT `fk_Deliveries_Project1`
    FOREIGN KEY (`Project_ID Project`)
    REFERENCES `Elidek`.`Project` (`ID Project`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Project_has_Researcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Project_has_Researcher` (
  `Project_ID Project` INT NOT NULL,
  `Researcher_ID Researcher` INT NOT NULL,
  PRIMARY KEY (`Project_ID Project`, `Researcher_ID Researcher`),
  INDEX `fk_Project_has_Researcher_Researcher1_idx` (`Researcher_ID Researcher` ASC) ,
  INDEX `fk_Project_has_Researcher_Project1_idx` (`Project_ID Project` ASC) ,
  CONSTRAINT `fk_Project_has_Researcher_Project1`
    FOREIGN KEY (`Project_ID Project`)
    REFERENCES `Elidek`.`Project` (`ID Project`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Project_has_Researcher_Researcher1`
    FOREIGN KEY (`Researcher_ID Researcher`)
    REFERENCES `Elidek`.`Researcher` (`ID Researcher`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elidek`.`Project_has_Scientific Field`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Elidek`.`Project_has_Scientific Field` (
  `Project_ID Project` INT NOT NULL,
  `Scientific Field_Scientific Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Project_ID Project`, `Scientific Field_Scientific Name`),
  INDEX `fk_Project_has_Scientific Field_Scientific Field1_idx` (`Scientific Field_Scientific Name` ASC) ,
  INDEX `fk_Project_has_Scientific Field_Project1_idx` (`Project_ID Project` ASC) ,
  CONSTRAINT `fk_Project_has_Scientific Field_Project1`
    FOREIGN KEY (`Project_ID Project`)
    REFERENCES `Elidek`.`Project` (`ID Project`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Project_has_Scientific Field_Scientific Field1`
    FOREIGN KEY (`Scientific Field_Scientific Name`)
    REFERENCES `Elidek`.`Scientific Field` (`Scientific Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
