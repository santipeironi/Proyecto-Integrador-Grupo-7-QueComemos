-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pago_USU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pago_USU` (
  `COD_PAG` INT NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD_PAG`, `DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idDNI` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Domicilio` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Redes` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Pago_USU_COD_PAG` INT NOT NULL,
  `Pago_USU_DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDNI`),
  INDEX `fk_Usuarios_Pago_USU1_idx` (`Pago_USU_COD_PAG` ASC, `Pago_USU_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Pago_USU1`
    FOREIGN KEY (`Pago_USU_COD_PAG` , `Pago_USU_DNI`)
    REFERENCES `mydb`.`Pago_USU` (`COD_PAG` , `DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CATEGORIA` (
  `id_CODIGO_CAT` INT NOT NULL,
  `TIPO` VARCHAR(45) NULL,
  PRIMARY KEY (`id_CODIGO_CAT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REST_USU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REST_USU` (
  `idDNI` INT NOT NULL,
  `COD_RES` VARCHAR(45) NOT NULL,
  `Usuarios_idDNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDNI`, `COD_RES`),
  INDEX `fk_REST_USU_Usuarios1_idx` (`Usuarios_idDNI` ASC) VISIBLE,
  CONSTRAINT `fk_REST_USU_Usuarios1`
    FOREIGN KEY (`Usuarios_idDNI`)
    REFERENCES `mydb`.`Usuarios` (`idDNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REST_PROMO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REST_PROMO` (
  `COD_RES` INT NOT NULL,
  `COD_PRO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD_RES`, `COD_PRO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Restaurantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Restaurantes` (
  `idRestaurante` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Domicilio` VARCHAR(45) NULL,
  `Redes` VARCHAR(45) NULL,
  `CATEGORIA_id_CODIGO_CAT` INT NOT NULL,
  `REST_USU_idDNI` INT NOT NULL,
  `REST_USU_COD_RES` VARCHAR(45) NOT NULL,
  `REST_PROMO_COD_RES` INT NOT NULL,
  `REST_PROMO_COD_PRO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRestaurante`),
  INDEX `fk_Restaurantes_CATEGORIA_idx` (`CATEGORIA_id_CODIGO_CAT` ASC) VISIBLE,
  INDEX `fk_Restaurantes_REST_USU1_idx` (`REST_USU_idDNI` ASC, `REST_USU_COD_RES` ASC) VISIBLE,
  INDEX `fk_Restaurantes_REST_PROMO1_idx` (`REST_PROMO_COD_RES` ASC, `REST_PROMO_COD_PRO` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurantes_CATEGORIA`
    FOREIGN KEY (`CATEGORIA_id_CODIGO_CAT`)
    REFERENCES `mydb`.`CATEGORIA` (`id_CODIGO_CAT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurantes_REST_USU1`
    FOREIGN KEY (`REST_USU_idDNI` , `REST_USU_COD_RES`)
    REFERENCES `mydb`.`REST_USU` (`idDNI` , `COD_RES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurantes_REST_PROMO1`
    FOREIGN KEY (`REST_PROMO_COD_RES` , `REST_PROMO_COD_PRO`)
    REFERENCES `mydb`.`REST_PROMO` (`COD_RES` , `COD_PRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Promociones` (
  `idCod_Promo` INT NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Promo` VARCHAR(45) NULL,
  `REST_PROMO_COD_RES` INT NOT NULL,
  `REST_PROMO_COD_PRO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCod_Promo`),
  INDEX `fk_Promociones_REST_PROMO1_idx` (`REST_PROMO_COD_RES` ASC, `REST_PROMO_COD_PRO` ASC) VISIBLE,
  CONSTRAINT `fk_Promociones_REST_PROMO1`
    FOREIGN KEY (`REST_PROMO_COD_RES` , `REST_PROMO_COD_PRO`)
    REFERENCES `mydb`.`REST_PROMO` (`COD_RES` , `COD_PRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REST_PAGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REST_PAGO` (
  `COD_RES` INT NOT NULL,
  `COD_PAG` VARCHAR(45) NOT NULL,
  `Restaurantes_idRestaurante` INT NOT NULL,
  PRIMARY KEY (`COD_RES`, `COD_PAG`),
  INDEX `fk_REST_PAGO_Restaurantes1_idx` (`Restaurantes_idRestaurante` ASC) VISIBLE,
  CONSTRAINT `fk_REST_PAGO_Restaurantes1`
    FOREIGN KEY (`Restaurantes_idRestaurante`)
    REFERENCES `mydb`.`Restaurantes` (`idRestaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Forma de pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Forma de pago` (
  `idCod_Pag` INT NOT NULL,
  `Debito` VARCHAR(45) NULL,
  `Credito` VARCHAR(45) NULL,
  `Efectivo` VARCHAR(45) NULL,
  `REST_PAGO_COD_RES` INT NOT NULL,
  `REST_PAGO_COD_PAG` VARCHAR(45) NOT NULL,
  `Pago_USU_COD_PAG` INT NOT NULL,
  `Pago_USU_DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCod_Pag`),
  INDEX `fk_Forma de pago_REST_PAGO1_idx` (`REST_PAGO_COD_RES` ASC, `REST_PAGO_COD_PAG` ASC) VISIBLE,
  INDEX `fk_Forma de pago_Pago_USU1_idx` (`Pago_USU_COD_PAG` ASC, `Pago_USU_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Forma de pago_REST_PAGO1`
    FOREIGN KEY (`REST_PAGO_COD_RES` , `REST_PAGO_COD_PAG`)
    REFERENCES `mydb`.`REST_PAGO` (`COD_RES` , `COD_PAG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Forma de pago_Pago_USU1`
    FOREIGN KEY (`Pago_USU_COD_PAG` , `Pago_USU_DNI`)
    REFERENCES `mydb`.`Pago_USU` (`COD_PAG` , `DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RESEÑA_REST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RESEÑA_REST` (
  `COD_RES` INT NOT NULL,
  `COD_RESEÑA` VARCHAR(45) NOT NULL,
  `REST_USU_idDNI` INT NOT NULL,
  `REST_USU_COD_RES` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD_RESEÑA`, `COD_RES`),
  INDEX `fk_RESEÑA_REST_REST_USU1_idx` (`REST_USU_idDNI` ASC, `REST_USU_COD_RES` ASC) VISIBLE,
  CONSTRAINT `fk_RESEÑA_REST_REST_USU1`
    FOREIGN KEY (`REST_USU_idDNI` , `REST_USU_COD_RES`)
    REFERENCES `mydb`.`REST_USU` (`idDNI` , `COD_RES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RESEÑA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RESEÑA` (
  `COD_RESEÑA` INT NOT NULL,
  `Comentario` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `Usuarios_idDNI` VARCHAR(45) NOT NULL,
  `RESEÑA_REST_COD_RESEÑA` VARCHAR(45) NOT NULL,
  `RESEÑA_REST_COD_RES` INT NOT NULL,
  PRIMARY KEY (`COD_RESEÑA`),
  INDEX `fk_RESEÑA_Usuarios1_idx` (`Usuarios_idDNI` ASC) VISIBLE,
  INDEX `fk_RESEÑA_RESEÑA_REST1_idx` (`RESEÑA_REST_COD_RESEÑA` ASC, `RESEÑA_REST_COD_RES` ASC) VISIBLE,
  CONSTRAINT `fk_RESEÑA_Usuarios1`
    FOREIGN KEY (`Usuarios_idDNI`)
    REFERENCES `mydb`.`Usuarios` (`idDNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESEÑA_RESEÑA_REST1`
    FOREIGN KEY (`RESEÑA_REST_COD_RESEÑA` , `RESEÑA_REST_COD_RES`)
    REFERENCES `mydb`.`RESEÑA_REST` (`COD_RESEÑA` , `COD_RES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MENU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MENU` (
  `idCOD_MENU` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `COD_CAT` VARCHAR(45) NULL,
  `COD_PRO` VARCHAR(45) NULL,
  `CATEGORIA_id_CODIGO_CAT` INT NOT NULL,
  `Promociones_idCod_Promo` INT NOT NULL,
  PRIMARY KEY (`idCOD_MENU`),
  INDEX `fk_MENU_CATEGORIA1_idx` (`CATEGORIA_id_CODIGO_CAT` ASC) VISIBLE,
  INDEX `fk_MENU_Promociones1_idx` (`Promociones_idCod_Promo` ASC) VISIBLE,
  CONSTRAINT `fk_MENU_CATEGORIA1`
    FOREIGN KEY (`CATEGORIA_id_CODIGO_CAT`)
    REFERENCES `mydb`.`CATEGORIA` (`id_CODIGO_CAT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MENU_Promociones1`
    FOREIGN KEY (`Promociones_idCod_Promo`)
    REFERENCES `mydb`.`Promociones` (`idCod_Promo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
