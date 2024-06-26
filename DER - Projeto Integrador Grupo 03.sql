-- MySQL Script generated by MySQL Workbench
-- Mon Apr 15 14:26:30 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_projeto_integrador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_projeto_integrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_projeto_integrador` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `db_projeto_integrador` ;

-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`tb_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`tb_categorias` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tipoServico` VARCHAR(255) NOT NULL,
  `vagas` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`tb_usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`tb_servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`tb_servicos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `duracao` VARCHAR(255) NOT NULL,
  `preco` DECIMAL(6,2) NOT NULL,
  `ingresso` VARCHAR(255) NOT NULL,
  `tb_categorias_id` BIGINT NULL,
  `tb_usuarios_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_servicos_tb_categorias_idx` (`tb_categorias_id` ASC) VISIBLE,
  INDEX `fk_tb_servicos_tb_usuarios1_idx` (`tb_usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_servicos_tb_categorias`
    FOREIGN KEY (`tb_categorias_id`)
    REFERENCES `db_projeto_integrador`.`tb_categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_servicos_tb_usuarios1`
    FOREIGN KEY (`tb_usuarios_id`)
    REFERENCES `db_projeto_integrador`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
