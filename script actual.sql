-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyectoyael
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectoyael
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoyael` DEFAULT CHARACTER SET utf8 ;
USE `proyectoyael` ;

-- -----------------------------------------------------
-- Table `proyectoyael`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoyael`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `profileImage` LONGTEXT NULL,
  `subtitulo` VARCHAR(45) NULL,
  `acercadeMi` LONGTEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoyael`.`estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoyael`.`estudio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `institucion` VARCHAR(45) NULL,
  `logo` LONGTEXT NULL,
  `inicio` YEAR NULL,
  `fin` YEAR NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_estudio_persona_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_estudio_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `proyectoyael`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoyael`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoyael`.`experiencia` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `puesto` VARCHAR(45) NULL,
  `inicio` YEAR NULL,
  `imagen` LONGTEXT NULL,
  `descripcion` LONGTEXT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_experiencia_laboral_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_laboral_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `proyectoyael`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoyael`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoyael`.`proyecto` (
  `id` INT NOT NULL,
  `img` LONGTEXT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` LONGTEXT NULL,
  `url` LONGTEXT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_proyecto_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `proyectoyael`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoyael`.`habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoyael`.`habilidad` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `porcentaje` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_habilidad_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidad_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `proyectoyael`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
