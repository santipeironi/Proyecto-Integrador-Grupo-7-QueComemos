SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS quecomemos DEFAULT CHARACTER SET utf8 ;
USE quecomemos;

-- Table categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS categoria (
  id_cate INT NOT NULL AUTO_INCREMENT,
  descr_cate VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_cate))
ENGINE = InnoDB;

-- Table formapago
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS formapago (
  id_forpago INT NOT NULL AUTO_INCREMENT,
  descr_forpago VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_forpago))
ENGINE = InnoDB;

-- Table restaurante
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS restaurante (
  id_rest INT NOT NULL AUTO_INCREMENT,
  nombre_rest VARCHAR(100) NOT NULL,
  domicilio_rest VARCHAR(100) NOT NULL,
  redes_rest VARCHAR(100) NULL,
  cant_tenedores INT NOT NULL CHECK (cant_tenedores >= 0 and cant_tenedores <= 5),
  UNIQUE INDEX id_rest_idx (id_rest ASC),
  CONSTRAINT id_rest_UNIQUE PRIMARY KEY (id_rest))
ENGINE = InnoDB;

-- Table menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS menu (
  id_menu INT NOT NULL,
  descr_menu VARCHAR(100) NOT NULL,
  id_cate INT NULL,
  id_promo INT NULL,
  id_rest INT NULL,
  PRIMARY KEY (id_menu),
  UNIQUE INDEX id_menu_UNIQUE (id_menu ASC),
  INDEX id_menu_cate_idx (id_cate ASC),
  INDEX id_menu_promo_idx (id_promo ASC),
  INDEX id_menu_rest_idx (id_rest ASC),
  CONSTRAINT fk_menu_id_cate FOREIGN KEY (id_cate) REFERENCES categoria (id_cate),
  CONSTRAINT fk_menu_id_promo FOREIGN KEY (id_promo) REFERENCES promo (id_promo),
  CONSTRAINT fk_menu_id_rest FOREIGN KEY (id_rest)  REFERENCES restaurante (id_rest))
ENGINE = InnoDB;

-- Table promo
-- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS promo (
  id_promo INT NOT NULL,
  id_menu INT NOT NULL,
  fecha_promo DATE NULL,
  descr_promo VARCHAR(100) NULL,
  precio_promo FLOAT NOT NULL,
  PRIMARY KEY (id_promo, id_menu),
  UNIQUE INDEX id_promo_idx (id_promo ASC),
  UNIQUE INDEX id_promo_menu_idx (id_menu ASC))
 ENGINE = InnoDB;

-- Table usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  dni INT NOT NULL,
  nombre_usu VARCHAR(100) NOT NULL,
  domicilio_usu VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefono_usu INT NULL,
  redes_usu VARCHAR(100) NULL,
  PRIMARY KEY (`dni`),
  UNIQUE INDEX email_UNIQUE (email ASC),
  UNIQUE INDEX dni_UNIQUE (dni ASC))
ENGINE = InnoDB;

-- Table pagousu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pagousu (
  id_pago INT NOT NULL,
  dni INT NOT NULL,
  id_forpago INT NOT NULL,
  importe_pago FLOAT NULL,
  fecha_pago DATETIME NOT NULL,
  id_rest INT NOT NULL,
  PRIMARY KEY (id_pago),
  UNIQUE INDEX id_pago_UNIQUE (id_pago ASC),
  INDEX dni_idx (dni ASC),
  INDEX id_rest_idx (id_rest ASC),
  CONSTRAINT fk_id_forpago FOREIGN KEY (id_forpago) REFERENCES formapago (id_forpago),
  CONSTRAINT fk_pago_dni  FOREIGN KEY (dni) REFERENCES usuario (dni),
  CONSTRAINT fk_pago_id_rest  FOREIGN KEY (id_rest) REFERENCES restaurante (id_rest))
ENGINE = InnoDB;

-- Table resenausuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS resenausuario (
  id_resenarest INT NOT NULL AUTO_INCREMENT,
  dni INT NOT NULL,
  id_rest INT NULL,
  fecha_resena DATETIME NOT NULL,
  comentario VARCHAR(200) NOT NULL,
  calificacion INT NOT NULL CHECK (calificacion >= 0 and calificacion <= 5),
  PRIMARY KEY (id_resenarest),
  UNIQUE INDEX id_resenarest_UNIQUE (id_resenarest ASC),
  INDEX id_rest_idx (id_rest ASC),
  INDEX dni_idx (dni ASC),
  CONSTRAINT fk_rese_dni FOREIGN KEY (dni)  REFERENCES usuario (dni),
  CONSTRAINT fk_rese_id_rest FOREIGN KEY (id_rest)  REFERENCES restaurante (id_rest))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

