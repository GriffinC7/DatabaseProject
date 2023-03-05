-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bakery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bakery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bakery` DEFAULT CHARACTER SET utf8 ;
USE `bakery` ;

-- -----------------------------------------------------
-- Table `bakery`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakery`.`Customers` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `customerFirstName` VARCHAR(30) NULL,
  `customerLastName` VARCHAR(45) NULL,
  `customerAddress1` VARCHAR(45) NULL,
  `customerAddress2` VARCHAR(45) NULL,
  `customerCity` VARCHAR(45) NULL,
  `customerState` VARCHAR(45) NULL,
  `customerZipCode` VARCHAR(45) NULL,
  `customerPhoneNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery`.`InventoryType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakery`.`InventoryType` (
  `inventoryTypeID` INT NOT NULL AUTO_INCREMENT,
  `typeName` VARCHAR(45) NULL,
  `typeDescription` VARCHAR(45) NULL,
  PRIMARY KEY (`inventoryTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery`.`Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakery`.`Inventory` (
  `inventoryID` INT NOT NULL AUTO_INCREMENT,
  `inventoryName` VARCHAR(45) NULL,
  `inventoryPrice` VARCHAR(45) NULL,
  `InventoryType_inventoryTypeID` INT NOT NULL,
  PRIMARY KEY (`inventoryID`),
  INDEX `fk_Inventory_InventoryType1_idx` (`InventoryType_inventoryTypeID` ASC) VISIBLE,
  CONSTRAINT `fk_Inventory_InventoryType1`
    FOREIGN KEY (`InventoryType_inventoryTypeID`)
    REFERENCES `bakery`.`InventoryType` (`inventoryTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakery`.`Orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATETIME NULL,
  `Customers_customerID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `fk_Orders_Customers1_idx` (`Customers_customerID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`Customers_customerID`)
    REFERENCES `bakery`.`Customers` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery`.`Vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakery`.`Vendors` (
  `vendorID` INT NOT NULL AUTO_INCREMENT,
  `vendorName` VARCHAR(45) NULL,
  `vendorAddress1` VARCHAR(45) NULL,
  `vendorAddress2` VARCHAR(45) NULL,
  `vendorCity` VARCHAR(45) NULL,
  `vendorState` VARCHAR(45) NULL,
  `vendorZipCode` VARCHAR(45) NULL,
  `vendorPhoneNumber` VARCHAR(45) NULL,
  `vendorEmail` VARCHAR(45) NULL,
  PRIMARY KEY (`vendorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakery`.`OrderDetails` (
  `Orders_orderID` INT NOT NULL,
  `Inventory_inventoryID` INT NOT NULL,
  `orderQuantity` INT NULL,
  `OrderDetailscol` INT NULL,
  PRIMARY KEY (`Orders_orderID`, `Inventory_inventoryID`),
  INDEX `fk_Orders_has_Inventory_Inventory1_idx` (`Inventory_inventoryID` ASC) VISIBLE,
  INDEX `fk_Orders_has_Inventory_Orders_idx` (`Orders_orderID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_has_Inventory_Orders`
    FOREIGN KEY (`Orders_orderID`)
    REFERENCES `bakery`.`Orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_Inventory_Inventory1`
    FOREIGN KEY (`Inventory_inventoryID`)
    REFERENCES `bakery`.`Inventory` (`inventoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bakery`.`Inventory_has_Vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakery`.`Inventory_has_Vendors` (
  `Inventory_inventoryID` INT NOT NULL,
  `Vendors_vendorID` INT NOT NULL,
  PRIMARY KEY (`Inventory_inventoryID`, `Vendors_vendorID`),
  INDEX `fk_Inventory_has_Vendors_Vendors1_idx` (`Vendors_vendorID` ASC) VISIBLE,
  INDEX `fk_Inventory_has_Vendors_Inventory1_idx` (`Inventory_inventoryID` ASC) VISIBLE,
  CONSTRAINT `fk_Inventory_has_Vendors_Inventory1`
    FOREIGN KEY (`Inventory_inventoryID`)
    REFERENCES `bakery`.`Inventory` (`inventoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inventory_has_Vendors_Vendors1`
    FOREIGN KEY (`Vendors_vendorID`)
    REFERENCES `bakery`.`Vendors` (`vendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
