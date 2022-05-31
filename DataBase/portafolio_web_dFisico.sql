-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portafolio_web
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portafolio_web
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portafolio_web` DEFAULT CHARACTER SET utf8 ;
USE `portafolio_web` ;

-- -----------------------------------------------------
-- Table `portafolio_web`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portafolio_web`.`USUARIO` (
  `id` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portafolio_web`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portafolio_web`.`PERSONA` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `domicilio` VARCHAR(45) NULL,
  `fecha_Nac` DATE NULL,
  `telefono` VARCHAR(15) NULL,
  `email` VARCHAR(45) NULL,
  `acerca_de` VARCHAR(200) NULL,
  `USUARIO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `USUARIO_id`),
  INDEX `fk_PERSONA_USUARIO_idx` (`USUARIO_id` ASC) VISIBLE,
  CONSTRAINT `fk_PERSONA_USUARIO`
    FOREIGN KEY (`USUARIO_id`)
    REFERENCES `portafolio_web`.`USUARIO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portafolio_web`.`TIPO_EMPLEO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portafolio_web`.`TIPO_EMPLEO` (
  `id` INT NOT NULL,
  `nombre_Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portafolio_web`.`EXPERIENCIA_LABORAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portafolio_web`.`EXPERIENCIA_LABORAL` (
  `id` INT NOT NULL,
  `cargo` VARCHAR(45) NULL,
  `nombre_Empresa` VARCHAR(45) NULL,
  `es_Trabajo_Actual` TINYINT NULL,
  `fecha_Inicio` DATE NULL,
  `fecha_Fin` DATE NULL,
  `ubicacion` VARCHAR(45) NULL,
  `PERSONA_id` INT NOT NULL,
  `PERSONA_USUARIO_id` INT NOT NULL,
  `TIPO_EMPLEO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PERSONA_id`, `PERSONA_USUARIO_id`, `TIPO_EMPLEO_id`),
  INDEX `fk_EXPERIENCIA_LABORAL_PERSONA1_idx` (`PERSONA_id` ASC, `PERSONA_USUARIO_id` ASC) VISIBLE,
  INDEX `fk_EXPERIENCIA_LABORAL_TIPO_EMPLEO1_idx` (`TIPO_EMPLEO_id` ASC) VISIBLE,
  CONSTRAINT `fk_EXPERIENCIA_LABORAL_PERSONA1`
    FOREIGN KEY (`PERSONA_id` , `PERSONA_USUARIO_id`)
    REFERENCES `portafolio_web`.`PERSONA` (`id` , `USUARIO_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EXPERIENCIA_LABORAL_TIPO_EMPLEO1`
    FOREIGN KEY (`TIPO_EMPLEO_id`)
    REFERENCES `portafolio_web`.`TIPO_EMPLEO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portafolio_web`.`PROYECTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portafolio_web`.`PROYECTO` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descripcion` VARCHAR(200) NULL,
  `fecha_Inicio` DATE NULL,
  `fecha_Fin` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portafolio_web`.`TECNOLOGIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portafolio_web`.`TECNOLOGIA` (
  `id` INT NOT NULL,
  `nombre_Tecnologia` VARCHAR(200) NULL,
  `PROYECTO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PROYECTO_id`),
  INDEX `fk_TECNOLOGIA_PROYECTO1_idx` (`PROYECTO_id` ASC) VISIBLE,
  CONSTRAINT `fk_TECNOLOGIA_PROYECTO1`
    FOREIGN KEY (`PROYECTO_id`)
    REFERENCES `portafolio_web`.`PROYECTO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portafolio_web`.`EDUCACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portafolio_web`.`EDUCACION` (
  `id` INT NOT NULL,
  `institucion_Educativa` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `fecha_Inicio` DATE NULL,
  `fecha_Fin` DATE NULL,
  `TECNOLOGIA_id` INT NOT NULL,
  `PERSONA_id` INT NOT NULL,
  `PERSONA_USUARIO_id` INT NOT NULL,
  `TECNOLOGIA_id1` INT NOT NULL,
  PRIMARY KEY (`id`, `TECNOLOGIA_id`, `PERSONA_id`, `PERSONA_USUARIO_id`, `TECNOLOGIA_id1`),
  INDEX `fk_EDUCACION_PERSONA1_idx` (`PERSONA_id` ASC, `PERSONA_USUARIO_id` ASC) VISIBLE,
  INDEX `fk_EDUCACION_TECNOLOGIA1_idx` (`TECNOLOGIA_id1` ASC) VISIBLE,
  CONSTRAINT `fk_EDUCACION_PERSONA1`
    FOREIGN KEY (`PERSONA_id` , `PERSONA_USUARIO_id`)
    REFERENCES `portafolio_web`.`PERSONA` (`id` , `USUARIO_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EDUCACION_TECNOLOGIA1`
    FOREIGN KEY (`TECNOLOGIA_id1`)
    REFERENCES `portafolio_web`.`TECNOLOGIA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
