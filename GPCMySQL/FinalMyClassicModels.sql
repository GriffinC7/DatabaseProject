-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema myclassicmodels
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema myclassicmodels
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `myclassicmodels` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema myclassicmodels
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema myclassicmodels
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `myclassicmodels` DEFAULT CHARACTER SET utf8mb4 ;
USE `myclassicmodels` ;

-- -----------------------------------------------------
-- Table `myclassicmodels`.`ProductLines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`ProductLines` (
  `productLine` VARCHAR(50) NOT NULL COMMENT 'Primary Key - character based',
  `textDescription` VARCHAR(400) NULL,
  `htmlDescription` MEDIUMTEXT NULL,
  `image` MEDIUMBLOB NULL,
  PRIMARY KEY (`productLine`),
  UNIQUE INDEX `productLine_UNIQUE` (`productLine` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myclassicmodels`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`Products` (
  `productCode` VARCHAR(15) NOT NULL COMMENT 'Primary Key',
  `productName` VARCHAR(70) NULL,
  `productScale` VARCHAR(10) NULL,
  `productVendor` VARCHAR(50) NULL,
  `productDescription` VARCHAR(400) NULL,
  `quantityInStock` INT NULL,
  `purchasePrice` DECIMAL(10,2) NULL,
  `retailPrice` DECIMAL(10,2) NULL,
  PRIMARY KEY (`productCode`))
ENGINE = InnoDB;


USE `myclassicmodels` ;

-- -----------------------------------------------------
-- Table `myclassicmodels`.`offices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`offices` (
  `officeCode` VARCHAR(10) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `addressLine1` VARCHAR(50) NOT NULL,
  `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  `country` VARCHAR(50) NOT NULL,
  `postalCode` VARCHAR(15) NOT NULL,
  `territory` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`officeCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `myclassicmodels`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`employees` (
  `employeeNumber` INT NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `firstName` VARCHAR(50) NOT NULL,
  `extension` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `officeCode` VARCHAR(10) NOT NULL,
  `reportsTo` INT NULL DEFAULT NULL,
  `jobTitle` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`),
  INDEX `reportsTo` (`reportsTo` ASC) VISIBLE,
  INDEX `officeCode` (`officeCode` ASC) VISIBLE,
  CONSTRAINT `employees_ibfk_1`
    FOREIGN KEY (`reportsTo`)
    REFERENCES `myclassicmodels`.`employees` (`employeeNumber`),
  CONSTRAINT `employees_ibfk_2`
    FOREIGN KEY (`officeCode`)
    REFERENCES `myclassicmodels`.`offices` (`officeCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `myclassicmodels`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`customers` (
  `customerNumber` INT NOT NULL,
  `customerName` VARCHAR(50) NOT NULL,
  `contactLastName` VARCHAR(50) NOT NULL,
  `contactFirstName` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `addressLine1` VARCHAR(50) NOT NULL,
  `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  `postalCode` VARCHAR(15) NULL DEFAULT NULL,
  `country` VARCHAR(50) NOT NULL,
  `salesRepEmployeeNumber` INT NULL DEFAULT NULL,
  `creditLimit` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`customerNumber`),
  INDEX `salesRepEmployeeNumber` (`salesRepEmployeeNumber` ASC) VISIBLE,
  CONSTRAINT `customers_ibfk_1`
    FOREIGN KEY (`salesRepEmployeeNumber`)
    REFERENCES `myclassicmodels`.`employees` (`employeeNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `myclassicmodels`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`orders` (
  `orderNumber` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `requiredDate` DATE NOT NULL,
  `shippedDate` DATE NULL DEFAULT NULL,
  `status` VARCHAR(15) NOT NULL,
  `comments` TEXT NULL DEFAULT NULL,
  `customerNumber` INT NOT NULL,
  PRIMARY KEY (`orderNumber`),
  INDEX `customerNumber` (`customerNumber` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`customerNumber`)
    REFERENCES `myclassicmodels`.`customers` (`customerNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `myclassicmodels`.`productlines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`productlines` (
  `productLine` VARCHAR(50) NOT NULL,
  `textDescription` VARCHAR(4000) NULL DEFAULT NULL,
  `htmlDescription` MEDIUMTEXT NULL DEFAULT NULL,
  `image` MEDIUMBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`productLine`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `myclassicmodels`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`products` (
  `productCode` VARCHAR(15) NOT NULL,
  `productName` VARCHAR(70) NOT NULL,
  `productLine` VARCHAR(50) NOT NULL,
  `productScale` VARCHAR(10) NOT NULL,
  `productVendor` VARCHAR(50) NOT NULL,
  `productDescription` TEXT NOT NULL,
  `quantityInStock` SMALLINT NOT NULL,
  `buyPrice` DECIMAL(10,2) NOT NULL,
  `MSRP` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`productCode`),
  INDEX `productLine` (`productLine` ASC) VISIBLE,
  CONSTRAINT `products_ibfk_1`
    FOREIGN KEY (`productLine`)
    REFERENCES `myclassicmodels`.`productlines` (`productLine`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `myclassicmodels`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`orderdetails` (
  `orderNumber` INT NOT NULL,
  `productCode` VARCHAR(15) NOT NULL,
  `quantityOrdered` INT NOT NULL,
  `priceEach` DECIMAL(10,2) NOT NULL,
  `orderLineNumber` SMALLINT NOT NULL,
  PRIMARY KEY (`orderNumber`, `productCode`),
  INDEX `productCode` (`productCode` ASC) VISIBLE,
  CONSTRAINT `orderdetails_ibfk_1`
    FOREIGN KEY (`orderNumber`)
    REFERENCES `myclassicmodels`.`orders` (`orderNumber`)
    )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `myclassicmodels`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myclassicmodels`.`payments` (
  `customerNumber` INT NOT NULL,
  `checkNumber` VARCHAR(50) NOT NULL,
  `paymentDate` DATE NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`customerNumber`, `checkNumber`),
  CONSTRAINT `payments_ibfk_1`
    FOREIGN KEY (`customerNumber`)
    REFERENCES `myclassicmodels`.`customers` (`customerNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




