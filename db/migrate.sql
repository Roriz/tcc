SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `licagro` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `licagro` ;

-- -----------------------------------------------------
-- Table `licagro`.`td_situacao_imovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_situacao_imovel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_destino_efluente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_destino_efluente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_fase_empreendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_fase_empreendimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_destino_lixo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_destino_lixo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_efluente_liquido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_efluente_liquido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_abastecimento_agua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_abastecimento_agua` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_tipo_lixo_gerado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_tipo_lixo_gerado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_logradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_logradouro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bairro` VARCHAR(255) NOT NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `cep` VARCHAR(10) NOT NULL DEFAULT '00.000-000',
  `endereco` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_correspondencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_correspondencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tb_logradouro_id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL DEFAULT '(00) 0000-00000',
  PRIMARY KEY (`id`),
  INDEX `fk_tb_correspondencia_tb_logradouro1_idx` (`tb_logradouro_id` ASC),
  CONSTRAINT `fk_tb_correspondencia_tb_logradouro1`
    FOREIGN KEY (`tb_logradouro_id`)
    REFERENCES `licagro`.`tb_logradouro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_requerente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_requerente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tb_logradouro_id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `cf_df` VARCHAR(45) NULL,
  `cpf_cnpj` VARCHAR(18) NOT NULL DEFAULT '00.000.000/0000-00',
  `telefone` VARCHAR(15) NOT NULL DEFAULT '(00) 0000-00000',
  PRIMARY KEY (`id`),
  INDEX `fk_tb_requerente_tb_logradouro1_idx` (`tb_logradouro_id` ASC),
  CONSTRAINT `fk_tb_requerente_tb_logradouro1`
    FOREIGN KEY (`tb_logradouro_id`)
    REFERENCES `licagro`.`tb_logradouro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_empreendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_empreendimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tb_logradouro_id` INT NOT NULL,
  `localizacao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_empreendimento_tb_logradouro1_idx` (`tb_logradouro_id` ASC),
  CONSTRAINT `fk_tb_empreendimento_tb_logradouro1`
    FOREIGN KEY (`tb_logradouro_id`)
    REFERENCES `licagro`.`tb_logradouro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_tipo_atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_tipo_atividade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_responsavel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `rg` VARCHAR(10) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `telefone` VARCHAR(15) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_licenciamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_licenciamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `td_situacao_imovel_id` INT NOT NULL,
  `td_destino_efluente_id` INT NOT NULL,
  `td_fase_empreendimento_id` INT NOT NULL,
  `td_destino_lixo_id` INT NOT NULL,
  `td_efluente_liquido_id` INT NOT NULL,
  `td_abastecimento_agua_id` INT NOT NULL,
  `td_tipo_lixo_gerado_id` INT NOT NULL,
  `tb_correspondencia_id` INT NOT NULL,
  `tb_requerente_id` INT NOT NULL,
  `tb_empreendimento_id` INT NOT NULL,
  `td_tipo_atividade_id` INT NOT NULL,
  `tb_responsavel_id` INT NOT NULL,
  `num_processo` VARCHAR(45) NOT NULL,
  `volume_lixo_m_por_dia` DECIMAL NULL,
  `atividade_area` INT NOT NULL,
  `atividade_descricao` TEXT NOT NULL,
  `ibram_processo` VARCHAR(45) NOT NULL DEFAULT 'IB-XXXX',
  `prorrogacao_processo` VARCHAR(45) NULL,
  `renovacao_processo` VARCHAR(45) NULL,
  `observacao` TEXT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_licenciamento_td_situacao_imovel_idx` (`td_situacao_imovel_id` ASC),
  INDEX `fk_tb_licenciamento_td_destino_efluente1_idx` (`td_destino_efluente_id` ASC),
  INDEX `fk_tb_licenciamento_td_fase_empreendimento1_idx` (`td_fase_empreendimento_id` ASC),
  INDEX `fk_tb_licenciamento_td_destino_lixo1_idx` (`td_destino_lixo_id` ASC),
  INDEX `fk_tb_licenciamento_td_efluente_liquido2_idx` (`td_efluente_liquido_id` ASC),
  INDEX `fk_tb_licenciamento_td_abastecimento_agua1_idx` (`td_abastecimento_agua_id` ASC),
  INDEX `fk_tb_licenciamento_td_tipo_lixo_gerado1_idx` (`td_tipo_lixo_gerado_id` ASC),
  INDEX `fk_tb_licenciamento_tb_correspondencia1_idx` (`tb_correspondencia_id` ASC),
  INDEX `fk_tb_licenciamento_tb_requerente1_idx` (`tb_requerente_id` ASC),
  INDEX `fk_tb_licenciamento_tb_empreendimento1_idx` (`tb_empreendimento_id` ASC),
  INDEX `fk_tb_licenciamento_td_tipo_atividade1_idx` (`td_tipo_atividade_id` ASC),
  INDEX `fk_tb_licenciamento_tb_responsavel1_idx` (`tb_responsavel_id` ASC),
  UNIQUE INDEX `ibram_processo_UNIQUE` (`ibram_processo` ASC),
  CONSTRAINT `fk_tb_licenciamento_td_situacao_imovel`
    FOREIGN KEY (`td_situacao_imovel_id`)
    REFERENCES `licagro`.`td_situacao_imovel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_td_destino_efluente1`
    FOREIGN KEY (`td_destino_efluente_id`)
    REFERENCES `licagro`.`td_destino_efluente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_td_fase_empreendimento1`
    FOREIGN KEY (`td_fase_empreendimento_id`)
    REFERENCES `licagro`.`td_fase_empreendimento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_td_destino_lixo1`
    FOREIGN KEY (`td_destino_lixo_id`)
    REFERENCES `licagro`.`td_destino_lixo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_td_efluente_liquido2`
    FOREIGN KEY (`td_efluente_liquido_id`)
    REFERENCES `licagro`.`td_efluente_liquido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_td_abastecimento_agua1`
    FOREIGN KEY (`td_abastecimento_agua_id`)
    REFERENCES `licagro`.`td_abastecimento_agua` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_td_tipo_lixo_gerado1`
    FOREIGN KEY (`td_tipo_lixo_gerado_id`)
    REFERENCES `licagro`.`td_tipo_lixo_gerado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_tb_correspondencia1`
    FOREIGN KEY (`tb_correspondencia_id`)
    REFERENCES `licagro`.`tb_correspondencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_tb_requerente1`
    FOREIGN KEY (`tb_requerente_id`)
    REFERENCES `licagro`.`tb_requerente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_tb_empreendimento1`
    FOREIGN KEY (`tb_empreendimento_id`)
    REFERENCES `licagro`.`tb_empreendimento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_td_tipo_atividade1`
    FOREIGN KEY (`td_tipo_atividade_id`)
    REFERENCES `licagro`.`td_tipo_atividade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_tb_responsavel1`
    FOREIGN KEY (`tb_responsavel_id`)
    REFERENCES `licagro`.`tb_responsavel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `sigla` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `sigla_UNIQUE` (`sigla` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_situacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_situacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `td_status_id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_td_situacao_td_status1_idx` (`td_status_id` ASC),
  CONSTRAINT `fk_td_situacao_td_status1`
    FOREIGN KEY (`td_status_id`)
    REFERENCES `licagro`.`td_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_licenciamento_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_licenciamento_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tb_licenciamento_id` INT NOT NULL,
  `td_situacao_id` INT NOT NULL,
  `dta_inicial` DATE NOT NULL,
  `dta_limite` DATE NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_licenciamento_status_tb_licenciamento1_idx` (`tb_licenciamento_id` ASC),
  INDEX `fk_tb_licenciamento_status_td_situacao1_idx` (`td_situacao_id` ASC),
  CONSTRAINT `fk_tb_licenciamento_status_tb_licenciamento1`
    FOREIGN KEY (`tb_licenciamento_id`)
    REFERENCES `licagro`.`tb_licenciamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_licenciamento_status_td_situacao1`
    FOREIGN KEY (`td_situacao_id`)
    REFERENCES `licagro`.`td_situacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_tipos_avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_tipos_avaliacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_avaliacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `td_tipos_avaliacao_id` INT NOT NULL,
  `tb_licenciamento_status_id` INT NOT NULL,
  `dta` DATE NOT NULL,
  `dta_limite` DATE NOT NULL,
  `observacao` TEXT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_avaliacao_tb_licenciamento_status1_idx` (`tb_licenciamento_status_id` ASC),
  INDEX `fk_tb_avaliacao_td_tipos_avaliacao1_idx` (`td_tipos_avaliacao_id` ASC),
  CONSTRAINT `fk_tb_avaliacao_tb_licenciamento_status1`
    FOREIGN KEY (`tb_licenciamento_status_id`)
    REFERENCES `licagro`.`tb_licenciamento_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_avaliacao_td_tipos_avaliacao1`
    FOREIGN KEY (`td_tipos_avaliacao_id`)
    REFERENCES `licagro`.`td_tipos_avaliacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`td_tipo_limite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`td_tipo_limite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licagro`.`tb_limites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licagro`.`tb_limites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `td_status_id` INT NOT NULL,
  `td_tipo_limite_id` INT NOT NULL,
  `qtd` INT NOT NULL,
  `dta_criacao` DATETIME NOT NULL,
  `dta_atualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_limites_td_status1_idx` (`td_status_id` ASC),
  INDEX `fk_tb_limites_td_tipo_limite1_idx` (`td_tipo_limite_id` ASC),
  CONSTRAINT `fk_tb_limites_td_status1`
    FOREIGN KEY (`td_status_id`)
    REFERENCES `licagro`.`td_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_limites_td_tipo_limite1`
    FOREIGN KEY (`td_tipo_limite_id`)
    REFERENCES `licagro`.`td_tipo_limite` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
