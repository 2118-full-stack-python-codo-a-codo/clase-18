-- MySQL Workbench Synchronization
-- Generated: 2021-05-31 20:20
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: aleja

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `dni` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nacimiento` DATETIME NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `idProductos` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`idProductos`),
  UNIQUE INDEX `idProductos_UNIQUE` (`idProductos` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`pedidos` (
  `idpedidos` INT(11) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `clientes_dni` INT(11) NOT NULL,
  `Productos_idProductos` INT(11) NOT NULL,
  UNIQUE INDEX `idpedidos_UNIQUE` (`idpedidos` ASC) VISIBLE,
  PRIMARY KEY (`idpedidos`, `clientes_dni`, `Productos_idProductos`),
  INDEX `fk_pedidos_clientes_idx` (`clientes_dni` ASC) VISIBLE,
  INDEX `fk_pedidos_Productos1_idx` (`Productos_idProductos` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes`
    FOREIGN KEY (`clientes_dni`)
    REFERENCES `mydb`.`clientes` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_Productos1`
    FOREIGN KEY (`Productos_idProductos`)
    REFERENCES `mydb`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
