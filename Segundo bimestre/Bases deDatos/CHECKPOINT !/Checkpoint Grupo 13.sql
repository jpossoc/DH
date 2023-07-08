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
-- Table `mydb`.`formaspago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`formaspago` (
  `idFormasPago` INT NOT NULL,
  `TipoPago` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idFormasPago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`decoracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`decoracion` (
  `idDecoracion` INT NOT NULL,
  `TipoDecoracion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDecoracion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`tipohabitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipohabitacion` (
  `idTipoHabitacion` INT NOT NULL,
  `CostoDiario` DECIMAL(10,2) NULL DEFAULT NULL,
  `ClaseHabitacion` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoHabitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habitacion` (
  `idHabitacion` INT NOT NULL,
  `Numero` VARCHAR(5) NOT NULL,
  `TipoHabitacion_idTipoHabitacion` INT NOT NULL,
  `Decoracion_idDecoracion` INT NOT NULL,
  `Capacidad` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`idHabitacion`),
  INDEX `fk_Habitacion_TipoHabitacion_idx` (`TipoHabitacion_idTipoHabitacion` ASC) VISIBLE,
  INDEX `fk_Habitacion_Decoracion1_idx` (`Decoracion_idDecoracion` ASC) VISIBLE,
  CONSTRAINT `fk_Habitacion_Decoracion1`
    FOREIGN KEY (`Decoracion_idDecoracion`)
    REFERENCES `mydb`.`decoracion` (`idDecoracion`),
  CONSTRAINT `fk_Habitacion_TipoHabitacion`
    FOREIGN KEY (`TipoHabitacion_idTipoHabitacion`)
    REFERENCES `mydb`.`tipohabitacion` (`idTipoHabitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pais` (
  `idPais` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`huespedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`huespedes` (
  `idHuespedes` INT NOT NULL,
  `Apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Pasaporte` VARCHAR(20) NULL DEFAULT NULL,
  `FechaNacimiento` DATE NULL DEFAULT NULL,
  `Domicilio` VARCHAR(100) NULL DEFAULT NULL,
  `Pais_idPais` INT NOT NULL,
  `TelefonoMovil` CHAR(13) NULL DEFAULT NULL,
  `Correo` VARCHAR(45) NULL DEFAULT NULL,
  `Habitacion_idHabitacion` INT NOT NULL,
  PRIMARY KEY (`idHuespedes`),
  INDEX `fk_Huespedes_Pais1_idx` (`Pais_idPais` ASC) VISIBLE,
  INDEX `fk_Huespedes_Habitacion1_idx` (`Habitacion_idHabitacion` ASC) VISIBLE,
  CONSTRAINT `fk_Huespedes_Habitacion1`
    FOREIGN KEY (`Habitacion_idHabitacion`)
    REFERENCES `mydb`.`habitacion` (`idHabitacion`),
  CONSTRAINT `fk_Huespedes_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `mydb`.`pais` (`idPais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`checkin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`checkin` (
  `idCheckIn` INT NOT NULL,
  `FechaHoraEntrada` DATETIME NULL DEFAULT NULL,
  `FechaHoraSalida` DATETIME NULL DEFAULT NULL,
  `Importe` DECIMAL(10,2) NULL DEFAULT NULL,
  `FormasPago_idFormasPago` INT NOT NULL,
  `Habitacion_idHabitacion` INT NOT NULL,
  `Huespedes_idHuespedes` INT NOT NULL,
  PRIMARY KEY (`idCheckIn`, `Habitacion_idHabitacion`),
  INDEX `fk_CheckIn_FormasPago1_idx` (`FormasPago_idFormasPago` ASC) VISIBLE,
  INDEX `fk_CheckIn_Habitacion1_idx` (`Habitacion_idHabitacion` ASC) VISIBLE,
  INDEX `fk_CheckIn_Huespedes1_idx` (`Huespedes_idHuespedes` ASC) VISIBLE,
  CONSTRAINT `fk_CheckIn_FormasPago1`
    FOREIGN KEY (`FormasPago_idFormasPago`)
    REFERENCES `mydb`.`formaspago` (`idFormasPago`),
  CONSTRAINT `fk_CheckIn_Habitacion1`
    FOREIGN KEY (`Habitacion_idHabitacion`)
    REFERENCES `mydb`.`habitacion` (`idHabitacion`),
  CONSTRAINT `fk_CheckIn_Huespedes1`
    FOREIGN KEY (`Huespedes_idHuespedes`)
    REFERENCES `mydb`.`huespedes` (`idHuespedes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`sectorhotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sectorhotel` (
  `idSectorHotel` INT NOT NULL,
  `NombreSector` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idSectorHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleado` (
  `idEmpleado` INT NOT NULL,
  `NumeroLegajo` INT NULL DEFAULT NULL,
  `Apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `Nombres` VARCHAR(45) NULL DEFAULT NULL,
  `NumeroDocumento` INT NULL DEFAULT NULL,
  `FechaNacimiento` DATE NULL DEFAULT NULL,
  `Domicilio` VARCHAR(100) NULL DEFAULT NULL,
  `Pais_idPais` INT NOT NULL,
  `TelefonoMovil` CHAR(13) NULL DEFAULT NULL,
  `Correo` VARCHAR(45) NULL DEFAULT NULL,
  `SectorHotel_idSectorHotel` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_Empleado_SectorHotel1_idx` (`SectorHotel_idSectorHotel` ASC) VISIBLE,
  INDEX `fk_Empleado_Pais1_idx` (`Pais_idPais` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `mydb`.`pais` (`idPais`),
  CONSTRAINT `fk_Empleado_SectorHotel1`
    FOREIGN KEY (`SectorHotel_idSectorHotel`)
    REFERENCES `mydb`.`sectorhotel` (`idSectorHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`registroempleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`registroempleados` (
  `idRegistroPersonal` INT NOT NULL,
  `Estado` VARCHAR(45) NULL DEFAULT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idRegistroPersonal`),
  INDEX `fk_RegistroEmpleados_Empleado1_idx` (`Empleado_idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroEmpleados_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`empleado` (`idEmpleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`serviciosextra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`serviciosextra` (
  `idServiciosExtra` INT NOT NULL,
  `TipoServicio` VARCHAR(45) NULL DEFAULT NULL,
  `Precio` DECIMAL(7,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idServiciosExtra`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`reservaservicioextra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reservaservicioextra` (
  `idReservaServicioExtra` INT NOT NULL,
  `FechaHoraReserva` DATETIME NULL DEFAULT NULL,
  `HorasReserva` TINYINT NULL DEFAULT NULL,
  `Huespedes_idHuespedes` INT NOT NULL,
  `ServiciosExtra_idServiciosExtra` INT NOT NULL,
  `Importes` DECIMAL(10,2) NULL DEFAULT NULL,
  `FormasPago_idFormasPago` INT NOT NULL,
  PRIMARY KEY (`idReservaServicioExtra`),
  INDEX `fk_Reserva_Huespedes1_idx` (`Huespedes_idHuespedes` ASC) VISIBLE,
  INDEX `fk_Reserva_ServiciosExtra1_idx` (`ServiciosExtra_idServiciosExtra` ASC) VISIBLE,
  INDEX `fk_Reserva_FormasPago1_idx` (`FormasPago_idFormasPago` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_FormasPago1`
    FOREIGN KEY (`FormasPago_idFormasPago`)
    REFERENCES `mydb`.`formaspago` (`idFormasPago`),
  CONSTRAINT `fk_Reserva_Huespedes1`
    FOREIGN KEY (`Huespedes_idHuespedes`)
    REFERENCES `mydb`.`huespedes` (`idHuespedes`),
  CONSTRAINT `fk_Reserva_ServiciosExtra1`
    FOREIGN KEY (`ServiciosExtra_idServiciosExtra`)
    REFERENCES `mydb`.`serviciosextra` (`idServiciosExtra`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`serviciosbasicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`serviciosbasicos` (
  `idServicios` INT NOT NULL,
  `TipoServicios` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idServicios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`serviciosbasicos_has_habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`serviciosbasicos_has_habitacion` (
  `ServiciosBasicos_idServicios` INT NOT NULL,
  `Habitacion_idHabitacion` INT NOT NULL,
  PRIMARY KEY (`ServiciosBasicos_idServicios`, `Habitacion_idHabitacion`),
  INDEX `fk_ServiciosBasicos_has_Habitacion_Habitacion1_idx` (`Habitacion_idHabitacion` ASC) VISIBLE,
  INDEX `fk_ServiciosBasicos_has_Habitacion_ServiciosBasicos1_idx` (`ServiciosBasicos_idServicios` ASC) VISIBLE,
  CONSTRAINT `fk_ServiciosBasicos_has_Habitacion_Habitacion1`
    FOREIGN KEY (`Habitacion_idHabitacion`)
    REFERENCES `mydb`.`habitacion` (`idHabitacion`),
  CONSTRAINT `fk_ServiciosBasicos_has_Habitacion_ServiciosBasicos1`
    FOREIGN KEY (`ServiciosBasicos_idServicios`)
    REFERENCES `mydb`.`serviciosbasicos` (`idServicios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
