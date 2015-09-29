-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`city` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`publisher` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `city_id` INT(11) UNSIGNED NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_publisher_city1_idx` (`city_id` ASC),
  CONSTRAINT `fk_publisher_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `mydb`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`book` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title_th` VARCHAR(100) NULL,
  `title_en` VARCHAR(100) NULL,
  `edition` SMALLINT(6) NULL DEFAULT NULL,
  `isbn` VARCHAR(13) NULL DEFAULT NULL,
  `published_year` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `publisher_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `isbn_UNIQUE` (`isbn` ASC),
  INDEX `fk_book_publisher1_idx` (`publisher_id` ASC),
  CONSTRAINT `fk_book_publisher`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `mydb`.`publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`author` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `middlename` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`book_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`book_author` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` INT(11) UNSIGNED NOT NULL,
  `author_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_author_book_idx` (`book_id` ASC),
  INDEX `fk_book_author_author1_idx` (`author_id` ASC),
  CONSTRAINT `fk_book_author_book`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_author_author`
    FOREIGN KEY (`author_id`)
    REFERENCES `mydb`.`author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`filetype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`filetype` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `extension` VARCHAR(10) NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`book_filetype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`book_filetype` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `filename_original` VARCHAR(45) NOT NULL,
  `filename_system` VARCHAR(45) NOT NULL,
  `book_id` INT(11) UNSIGNED NOT NULL,
  `filetype_id` SMALLINT(6) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_filetype_book1_idx` (`book_id` ASC),
  INDEX `fk_book_filetype_filetype1_idx` (`filetype_id` ASC),
  CONSTRAINT `fk_book_filetype_book`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_filetype_filetype`
    FOREIGN KEY (`filetype_id`)
    REFERENCES `mydb`.`filetype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`series_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`series_book` (
  `id` INT(11) UNSIGNED NOT NULL,
  `title_th` VARCHAR(100) NULL,
  `title_en` VARCHAR(100) NULL,
  `edition` SMALLINT(3) NULL DEFAULT NULL,
  `issn` VARCHAR(8) NULL DEFAULT NULL,
  `book_number` SMALLINT(3) NULL DEFAULT 1,
  `published_year` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tag` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tag_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tag_book` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` INT(11) UNSIGNED NOT NULL,
  `book_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tag_book_tag1_idx` (`tag_id` ASC),
  INDEX `fk_tag_book_book1_idx` (`book_id` ASC),
  CONSTRAINT `fk_tag_book_tag`
    FOREIGN KEY (`tag_id`)
    REFERENCES `mydb`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_book_book`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
