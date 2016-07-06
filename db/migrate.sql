SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `licagro` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `licagro` ;

-- -----------------------------------------------------
-- Table `licagro`.`td_situacao_imovel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_situacao_imovel` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_situacao_imovel` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados das situações de imóvel possível dentro do sistema.';


-- -----------------------------------------------------
-- Table `licagro`.`td_destino_efluente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_destino_efluente` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_destino_efluente` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados dos destinos de efluentes possíveis dentro do sistema.';


-- -----------------------------------------------------
-- Table `licagro`.`td_fase_empreendimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_fase_empreendimento` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_fase_empreendimento` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados dos fases do empreendimento possíveis dentro do sistema.';


-- -----------------------------------------------------
-- Table `licagro`.`td_destino_lixo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_destino_lixo` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_destino_lixo` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados dos destinos de lixo possíveis dentro do sistema.';


-- -----------------------------------------------------
-- Table `licagro`.`td_efluente_liquido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_efluente_liquido` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_efluente_liquido` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados dos efluentes líquido possíveis dentro do sistema.';


-- -----------------------------------------------------
-- Table `licagro`.`td_abastecimento_agua`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_abastecimento_agua` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_abastecimento_agua` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados dos abastecimentos de água possíveis dentro do sistema.';


-- -----------------------------------------------------
-- Table `licagro`.`td_tipo_lixo_gerado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_tipo_lixo_gerado` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_tipo_lixo_gerado` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados dos tipos de lixo gerados no licenciamento possíveis dentro do sistema.';


-- -----------------------------------------------------
-- Table `licagro`.`tb_logradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_logradouro` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_logradouro` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `bairro` VARCHAR(255) NOT NULL COMMENT 'Nome do bairro',
  `cidade` VARCHAR(255) NOT NULL COMMENT 'Nome da cidade',
  `cep` VARCHAR(10) NOT NULL DEFAULT '00.000-000' COMMENT 'Código de Endereçamento Postal',
  `endereco` VARCHAR(255) NOT NULL COMMENT 'Endereço de localização, Rua, Travessia , Setor, etc',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Tabela resposável por centralizar os dados de logradouro';


-- -----------------------------------------------------
-- Table `licagro`.`tb_correspondencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_correspondencia` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_correspondencia` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `tb_logradouro_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_logradouro',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome do destinatário',
  `telefone` VARCHAR(15) NOT NULL DEFAULT '(00) 0000-00000' COMMENT 'Telefone com código de área',
  PRIMARY KEY (`id`),
  INDEX `fk_tb_correspondencia_tb_logradouro1_idx` (`tb_logradouro_id` ASC),
  CONSTRAINT `fk_tb_correspondencia_tb_logradouro1`
    FOREIGN KEY (`tb_logradouro_id`)
    REFERENCES `licagro`.`tb_logradouro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela resposável por centralizar os dados de correspondência';


-- -----------------------------------------------------
-- Table `licagro`.`tb_requerente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_requerente` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_requerente` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `tb_logradouro_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_logradouro',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome do requerente',
  `cf_df` VARCHAR(45) NULL COMMENT 'Código Fiscal do DF, campo exclusivo para empresas',
  `cpf_cnpj` VARCHAR(18) NOT NULL DEFAULT '00.000.000/0000-00' COMMENT 'CPF para pessoa fisica ou CNPJ para pessoa juridica',
  `telefone` VARCHAR(15) NOT NULL DEFAULT '(00) 0000-00000' COMMENT 'Telefone com código de área',
  PRIMARY KEY (`id`),
  INDEX `fk_tb_requerente_tb_logradouro1_idx` (`tb_logradouro_id` ASC),
  CONSTRAINT `fk_tb_requerente_tb_logradouro1`
    FOREIGN KEY (`tb_logradouro_id`)
    REFERENCES `licagro`.`tb_logradouro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela resposável por centralizar os dados de requerente';


-- -----------------------------------------------------
-- Table `licagro`.`tb_empreendimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_empreendimento` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_empreendimento` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `tb_logradouro_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_logradouro',
  `localizacao` VARCHAR(255) NOT NULL COMMENT 'Nome ou facilitador do empreendimento, exemplo: Setor de Armazenagem e Abastecimento Norte',
  PRIMARY KEY (`id`),
  INDEX `fk_tb_empreendimento_tb_logradouro1_idx` (`tb_logradouro_id` ASC),
  CONSTRAINT `fk_tb_empreendimento_tb_logradouro1`
    FOREIGN KEY (`tb_logradouro_id`)
    REFERENCES `licagro`.`tb_logradouro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela responsável por todos os dados de empreendimento';


-- -----------------------------------------------------
-- Table `licagro`.`td_tipo_atividade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_tipo_atividade` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_tipo_atividade` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados dos tipos de atividades possíveis dentro do sistema.';


-- -----------------------------------------------------
-- Table `licagro`.`tb_responsavel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_responsavel` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_responsavel` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome do Responsável pelo licenciamento',
  `email` VARCHAR(255) NOT NULL COMMENT 'E-mail do responsável',
  `rg` VARCHAR(10) NOT NULL COMMENT 'Código do rg do responsável',
  `cpf` VARCHAR(14) NOT NULL COMMENT 'CPF do responsável',
  `telefone` VARCHAR(15) NULL COMMENT 'Telefone com código de área',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Tabela resposável por centralizar os dados de responsável';


-- -----------------------------------------------------
-- Table `licagro`.`tb_licenciamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_licenciamento` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_licenciamento` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `td_situacao_imovel_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_situacao_imovel',
  `td_destino_efluente_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_destino_efluente',
  `td_fase_empreendimento_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_fase_empreendimento',
  `td_destino_lixo_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_destino_lixo',
  `td_efluente_liquido_id1` INT NOT NULL COMMENT 'Foreign Key da tabela td_efluente_liquido',
  `td_abastecimento_agua_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_abastecimento_agua',
  `td_tipo_lixo_gerado_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_tipo_lixo_gerado',
  `tb_correspondencia_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_correspondencia',
  `tb_requerente_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_requerente',
  `tb_empreendimento_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_empreendimento',
  `td_tipo_atividade_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_tipo_atividade',
  `tb_responsavel_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_responsavel',
  `num_processo` VARCHAR(45) NOT NULL COMMENT 'Número gerado automaticamente pelo sistema, com o objetivo de melhor controle e facilidade na manipulação do processo por parte do usuário.',
  `volume_lixo_m_por_dia` DECIMAL NULL COMMENT 'Valor em m³ médio gerado de lixo por dia',
  `atividade_area` INT NOT NULL COMMENT 'Valor área total do licenciamento',
  `atividade_descricao` TEXT NOT NULL COMMENT 'Descrição da atividade do licenciamento',
  `ibram_processo` VARCHAR(45) NOT NULL COMMENT 'Código do protocolo interno de documentos.',
  `observacao` TEXT NULL COMMENT 'Observação sobre o licencimaneto',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`),
  INDEX `fk_tb_licenciamento_td_situacao_imovel_idx` (`td_situacao_imovel_id` ASC),
  INDEX `fk_tb_licenciamento_td_destino_efluente1_idx` (`td_destino_efluente_id` ASC),
  INDEX `fk_tb_licenciamento_td_fase_empreendimento1_idx` (`td_fase_empreendimento_id` ASC),
  INDEX `fk_tb_licenciamento_td_destino_lixo1_idx` (`td_destino_lixo_id` ASC),
  INDEX `fk_tb_licenciamento_td_efluente_liquido2_idx` (`td_efluente_liquido_id1` ASC),
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
    FOREIGN KEY (`td_efluente_liquido_id1`)
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
ENGINE = InnoDB
COMMENT = 'Tabela principal do sistema, tendo como objetivo mater os dados dos licenciamentos e suas associações';


-- -----------------------------------------------------
-- Table `licagro`.`td_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_status` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_status` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `sigla` VARCHAR(2) NOT NULL COMMENT 'Sigla de 2 caracteres únicos para o status',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `sigla_UNIQUE` (`sigla` ASC))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do sistema, pretende manter os dados dos status possíveis';


-- -----------------------------------------------------
-- Table `licagro`.`td_situacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_situacao` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_situacao` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `td_status_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_status',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  `precisa_novo_limite` TINYINT NOT NULL DEFAULT 1 COMMENT 'Parametro para o código definir dta_limite ao cadastro da tabela tb_licenciamento_status',
  PRIMARY KEY (`id`),
  INDEX `fk_td_situacao_td_status1_idx` (`td_status_id` ASC),
  CONSTRAINT `fk_td_situacao_td_status1`
    FOREIGN KEY (`td_status_id`)
    REFERENCES `licagro`.`td_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela de domínio responsável por manter as possiveis situações que um status pode ter';


-- -----------------------------------------------------
-- Table `licagro`.`tb_licenciamento_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_licenciamento_status` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_licenciamento_status` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `tb_licenciamento_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_licenciamento',
  `td_situacao_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_situacao',
  `dta_inicial` DATE NOT NULL COMMENT 'Data inicial do status do licenciamento',
  `dta_limite` DATE NULL COMMENT 'Data limite deste status, valor dado por um resultado da regra de negocio',
  `dta_limite_avaliacao` DATE NULL COMMENT 'Data limite para a primeira avaliação, valor dado por um resultado da regra de negocio.',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
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
ENGINE = InnoDB
COMMENT = 'Tabela responsável por manter os dados e histórico de status atribuido ao licenciamento';


-- -----------------------------------------------------
-- Table `licagro`.`td_tipos_avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_tipos_avaliacao` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_tipos_avaliacao` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do usuário, pretende manter os dados dos tipos de avalições possíveis';


-- -----------------------------------------------------
-- Table `licagro`.`tb_avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_avaliacao` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_avaliacao` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `td_tipos_avaliacao_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_tipos_avaliacao',
  `tb_licenciamento_status_id` INT NOT NULL COMMENT 'Foreign Key da tabela tb_licenciamento_status',
  `dta` DATE NOT NULL COMMENT 'Data de realização da avaliação',
  `observacao` TEXT NULL COMMENT 'Observação da avaliação',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
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
ENGINE = InnoDB
COMMENT = 'Tabela responsável por manter os dados de avaliações atribuidos ao status do licenciamento';


-- -----------------------------------------------------
-- Table `licagro`.`td_tipo_limite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`td_tipo_limite` ;

CREATE TABLE IF NOT EXISTS `licagro`.`td_tipo_limite` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nome` VARCHAR(255) NOT NULL COMMENT 'Nome descritivo',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Tabela de domínio do sistema, pretende manter os dados dos tipos de limite possíveis';


-- -----------------------------------------------------
-- Table `licagro`.`tb_limites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `licagro`.`tb_limites` ;

CREATE TABLE IF NOT EXISTS `licagro`.`tb_limites` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `td_status_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_status',
  `td_tipo_limite_id` INT NOT NULL COMMENT 'Foreign Key da tabela td_tipo_limite',
  `qtd` INT NOT NULL COMMENT 'Quantidade temporal do limite, a unidade é dinamica de acordo com o tipo de limite associado.',
  `dta_criacao` DATETIME NOT NULL COMMENT 'Data e hora de criação do registro',
  `dta_atualizacao` DATETIME NOT NULL COMMENT 'Data e hora da última atualização do registro',
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
ENGINE = InnoDB
COMMENT = 'Tabela responsável por manter as regras de negócio para as datas limite';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
