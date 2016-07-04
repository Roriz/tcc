-- -- ______________________________________________________________EXCLUSIVOS DO SISTEMA_______________________________________________



-- ------------------------------------------------------------------------------------------------------ licagro.td_status
INSERT INTO licagro.td_status (id, nome, sigla) VALUES (1, "Licença Prévia", "LP"), (2, "Licença de Instalação", "LI"), (3, "Licençca de Operação", "LO");



-- ------------------------------------------------------------------------------------------------------ licagro.td_tipo_limite
INSERT INTO licagro.td_tipo_limite (id, nome) VALUES (1, "Limite da licença"), (2, "Limite da avaliação");


-- -- ______________________________________________________________Tabelas de dominio do USUARIO_______________________________________________

-- ------------------------------------------------------------------------------------------------------ licagro.td_tipos_avaliacao
INSERT INTO licagro.td_tipos_avaliacao (nome, dta_criacao, dta_atualizacao) VALUES ("Defirido", now(), now()), ("Indefirido", now(), now());


-- ------------------------------------------------------------------------------------------------------ licagro.td_tipo_atividade
INSERT INTO licagro.td_tipo_atividade (nome, dta_criacao, dta_atualizacao) VALUES ("Comércio", now(), now()), ("Indústria", now(), now()), ("Educação", now(), now()), ("Prestação de Serviços", now(), now()), ("Lazer", now(), now()), ("Pecuária", now(), now()), ("Construção", now(), now());


-- ------------------------------------------------------------------------------------------------------ licagro.td_destino_efluente
INSERT INTO licagro.td_destino_efluente (nome, dta_criacao, dta_atualizacao) VALUES ("CAESB", now(), now()), ("Fossa séptica", now(), now()), ("Córrego/lago", now(), now()), ("Rede de água pluvial", now(), now());

 
-- ------------------------------------------------------------------------------------------------------ licagro.td_fase_empreendimento
INSERT INTO licagro.td_fase_empreendimento (nome, dta_criacao, dta_atualizacao) VALUES ("Projeto", now(), now()), ("Em implantação", now(), now()), ("Implantado/instalado", now(), now()), ("Ampliação/reforma", now(), now());


-- ------------------------------------------------------------------------------------------------------ licagro.td_abastecimento_agua
INSERT INTO licagro.td_abastecimento_agua (nome, dta_criacao, dta_atualizacao) VALUES ("Rede (CAESB)", now(), now()), ("Poço/cisterna", now(), now()), ("Córrego/rio/lago", now(), now()), ("Nascente/mina", now(), now());



-- ------------------------------------------------------------------------------------------------------ licagro.td_destino_lixo
INSERT INTO licagro.td_destino_lixo (nome, dta_criacao, dta_atualizacao) VALUES ("SLU", now(), now()), ("Contêner (lixeira)", now(), now()), ("Outro", now(), now());



-- ------------------------------------------------------------------------------------------------------ licagro.td_situacao_imovel
INSERT INTO licagro.td_situacao_imovel (nome, dta_criacao, dta_atualizacao) VALUES ("Particular", now(), now()), ("Arrendado", now(), now()), ("Posse", now(), now()), ("Alugado", now(), now());



-- ------------------------------------------------------------------------------------------------------ licagro.td_tipo_lixo_gerado
INSERT INTO licagro.td_tipo_lixo_gerado (nome, dta_criacao, dta_atualizacao) VALUES ("Doméstico", now(), now()), ("Comercial", now(), now()), ("Industrial", now(), now()), ("Hospitalar", now(), now());



-- ------------------------------------------------------------------------------------------------------ licagro.td_efluente_liquido
INSERT INTO licagro.td_efluente_liquido (nome, dta_criacao, dta_atualizacao) VALUES ("Doméstico", now(), now()), ("Óleo", now(), now()), ("Químico", now(), now()), ("Hospitalar", now(), now());


-- ------------------------------------------------------------------------------------------------------ licagro.tb_limites
INSERT INTO licagro.tb_limites (td_status_id, td_tipo_limite_id, qtd, dta_criacao, dta_atualizacao) VALUES (1, 1, 5, now(), now()), (2, 1, 6, now(), now()), (3, 1, 4, now(), now()), (3, 1, 5, now(), now()), (3, 1, 6, now(), now()), (3, 1, 7, now(), now()), (3, 1, 8, now(), now()), (3, 1, 9, now(), now()), (3, 1, 10, now(), now()), (1, 2, 12, now(), now()), (2, 2, 6, now(), now());



-- ------------------------------------------------------------------------------------------------------ licagro.td_situacao
INSERT INTO licagro.td_situacao (td_status_id, nome, dta_criacao, dta_atualizacao) VALUES (1, "Normal", now(), now()), (1, "Cancelado", now(), now()), (1, "Prorrogado", now(), now()), (2, "Normal", now(), now()), (2, "Cancelado", now(), now()), (2, "Prorrogado", now(), now()), (3, "Normal", now(), now()), (3, "Cancelado", now(), now()), (3, "Renovado", now(), now());


-- -- ______________________________________________________________LICENCIAMENTO_______________________________________________

-- ------------------------------------------------------------------------------------------------------ licagro.tb_logradouro
INSERT INTO licagro.tb_logradouro (bairro, cidade, cep, endereco) VALUES ("Asa Norte", "Brasilia", "70673-411", "SCRN 714/715 bloco K loja 5"), ("Asa Sul", "Brasilia", "70675-555", "SCS quadra 02 lote 34"), ("Asa Norte", "Brasilia", "70456-333", "SCN quadra 03 lote 05"), ("Jundiaí", "Anápolis", "70111-477", "Rua 23 lote 4 loja 30"), ("Maracanã", "Anápolis", "70115-78", "Rua 12 lote 423 loja 55"), ("Setor Bueno", "Goiânia", "70322-425", "Avenida T-36 edifício Commerce 03"), ("Setor Universitário", "Goiania", "70325-444", "Rua General Osório número 25 loja 23"), ("Setor Bueno", "Goiania", "70322-498", "Avenida Anhanguera numero 15 loja 45"), ("SIA", "Brasilia", "70666-487", "Trecho 3 loja 45"), ("SIA", "Brasília", "70667-897", "Trech 2 loja 34");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_empreendimento
INSERT INTO licagro.tb_empreendimento (tb_logradouro_id, localizacao) VALUES ( 1, "Super Quadra Norte 714 ao lado da farmacia Drogasil"), ( 2, "Setor Comercial Sul proximo ao restaurante Ki Delicia"), ( 3, "Setor Comercial Norte quadra 3 ao lado da agencia dos Correios"), ( 4, "Bairro Jundiaí de frente ao supermercado Tatico"), ( 5, "Bairro Maracanã ao lado da Universidade"), ( 6, "Setor Bueno ao lado do Goiânia Shopping");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_requerente
INSERT INTO licagro.tb_requerente (tb_logradouro_id, nome, cf_df, cpf_cnpj, telefone) VALUES (1, "I.G. Produtos Agrícolas", NULL, "09.274.298/0001-00", "(61)93272-0011"), (2, "Crop Agrícola Ltda", NULL, "12.355.774/0001-00", "(61)98186-2315"), (3, "Agroconstruções Ltda.", NULL, "31.444.987/0001-00", "(61)98477-8798"), (4, "Death to Bugs Agrotóxicos", NULL, "48.664.981/0001-00", "(62)97657-0054"), (5, "Vigor Insumos Agricolas", NULL, "23.364.081/0001-00", "(62)96657-6252");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_responsavel
INSERT INTO licagro.tb_responsavel (nome, email, rg, cpf, telefone) VALUES ("José Guimarães Neto", "joseguima@gmail.com", "3215.654", "445.887.957-58", "(61)98186-2315"), ("Ângelo Roberto Siqueira", "angsiq@gmail.com", "1547.687", "915.753.954-87", "(61)94874-8888"), ("Maria Augusta Cunha", "maricu@agrotox.com", "7549.987", "159.754.456-91", "(61)96578-0048"), ("Francisco Xavier Amaro", "chicoamaro@bol.com.br", "4956.654", "423.456.951-77", "(62)94526-4448"), ("Marcos José Júnior Neto Filho", "marcosfilho@ig.com.br", "3249.789", "495.756.984-00", "(62)98874-0054");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_correspondencia
INSERT INTO licagro.tb_correspondencia (tb_logradouro_id, nome, telefone) VALUES (1, "Centro de Comunicação 1", "(61)98419-4487"), (2, "Ouvidoria", "(61)98445-1203"), (3, "Correspondência 3", "(61)98756-4848"), (4, "Secretaria de Relacionamento", "(62)96745-5548"), (5, "SAC", "(62)98478-1126"), (6, "Caixa Postal", "(62)98745-5654");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_licenciamento
INSERT INTO licagro.tb_licenciamento (td_situacao_imovel_id, td_destino_efluente_id, td_fase_empreendimento_id, td_destino_lixo_id, td_efluente_liquido_id, td_abastecimento_agua_id, td_tipo_lixo_gerado_id, tb_correspondencia_id, tb_requerente_id, tb_empreendimento_id, td_tipo_atividade_id, tb_responsavel_id, num_processo, volume_lixo_m_por_dia, atividade_area, atividade_descricao, ibram_processo, prorrogacao_processo, renovacao_processo, observacao, dta_criacao, dta_atualizacao) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, "2222.222/001-00", 41, 50, "I.G. Produtos Agrícolas", "2222.222/001-00", NULL, NULL, NULL, now(), now()), (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, "2563.333/001-00", 50, 120, "Crop Agrícola Ltda.", "2563.333/001-00", NULL, NULL, NULL, now(), now()), (3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 2, 3, "3644.458/001-00", 50, 300, "Agroconstruções Ltda.", "3644.458/001-00", NULL, NULL, NULL, now(), now()), (4, 4, 2, 3, 2, 2, 1, 4, 4, 4, 2, 4, "6678.555/123-01", 500, 12, "Death to Bugs Ltda.", "6678.555/123-01", NULL, NULL, NULL, now(), now()), (4, 3, 2, 2, 1, 1, 1, 5, 5, 5, 1, 5, "1594.789/001-00", 20, 50, "Vigor Insumos Agricolas", "1594.789/001-00", NULL, NULL, NULL, now(), now());


-- ------------------------------------------------------------------------------------------------------ licagro.tb_licenciamento_status
INSERT INTO licagro.tb_licenciamento_status (tb_licenciamento_id, td_situacao_id, dta_inicial, dta_limite, dta_criacao, dta_atualizacao) VALUES (1, 1, "2016-01-01", "2021-01-01", now(), now()), (2, 1, "2016-01-01", "2021-01-01", now(), now()), (2, 4, "2016-01-02", "2020-01-01", now(), now()), (3, 1, "2016-01-01", "2021-01-01", now(), now()),(3, 7, "2016-01-02", "2022-01-01", now(), now()),(3, 8, "2016-01-03", null, now(), now()),(4, 1, "2016-01-01", "2021-01-01", now(), now()),(5, 1, "2016-01-01", "2021-01-01", now(), now());


-- ------------------------------------------------------------------------------------------------------ licagro.tb_avaliacao
INSERT INTO licagro.tb_avaliacao (td_tipos_avaliacao_id, tb_licenciamento_status_id, dta, dta_limite, observacao, dta_criacao, dta_atualizacao) VALUES (1, 3, "2016-01-03", "2016-07-03", null, now(), now()), (2, 5, "2016-01-03", "2016-07-03", "Qualidade apresentada não esta no mínimo padrão exigido", now(), now());



