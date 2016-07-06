-- ______________________________________________________________EXCLUSIVOS DO SISTEMA_______________________________________________

-- ------------------------------------------------------------------------------------------------------ licagro.td_status
INSERT INTO licagro.td_status (id, nome, sigla) VALUES 
(1, "Licença Prévia", "LP"),
(2, "Licença de Instalação", "LI"), 
(3, "Licença de Operação", "LO");

-- ------------------------------------------------------------------------------------------------------ licagro.td_tipo_limite
INSERT INTO licagro.td_tipo_limite (id, nome) VALUES 
(1, "Limite da licença"), 
(2, "Limite da avaliação");


-- ------------------------------------------------------------------------------------------------------ licagro.td_situacao
INSERT INTO licagro.td_situacao (id, td_status_id, nome, dta_criacao, dta_atualizacao) VALUES
(1, 1, "Normal", now(), now()), 
(2, 1, "Cancelado", now(), now()), 
(3, 1, "Prorrogado", now(), now()),
(4, 2, "Normal", now(), now()),
(5, 2, "Cancelado", now(), now()), 
(6, 2, "Prorrogado", now(), now()), 
(7, 3, "Normal", now(), now()), 
(8, 3, "Cancelado", now(), now()),
(9, 3, "Renovado", now(), now());


-- ______________________________________________________________ Tabelas de dominio do USUARIO_______________________________________________

-- ------------------------------------------------------------------------------------------------------ licagro.td_tipos_avaliacao
INSERT INTO licagro.td_tipos_avaliacao (nome, dta_criacao, dta_atualizacao) VALUES 
("Defirido", now(), now()),
("Indefirido", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.td_tipo_atividade
INSERT INTO licagro.td_tipo_atividade (nome, dta_criacao, dta_atualizacao) VALUES 
("Comércio", now(), now()),
("Indústria", now(), now()),
("Educação", now(), now()),
("Prestação de Serviços", now(), now()),
("Lazer", now(), now()), 
("Pecuária", now(), now()), 
("Construção", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.td_destino_efluente
INSERT INTO licagro.td_destino_efluente (nome, dta_criacao, dta_atualizacao) VALUES 
("CAESB", now(), now()), 
("Fossa séptica", now(), now()),
("Córrego/lago", now(), now()),
("Rede de água pluvial", now(), now());
 
-- ------------------------------------------------------------------------------------------------------ licagro.td_fase_empreendimento
INSERT INTO licagro.td_fase_empreendimento (nome, dta_criacao, dta_atualizacao) VALUES 
("Projeto", now(), now()),
("Em implantação", now(), now()), 
("Implantado/instalado", now(), now()),
("Ampliação/reforma", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.td_abastecimento_agua
INSERT INTO licagro.td_abastecimento_agua (nome, dta_criacao, dta_atualizacao) VALUES
("Rede (CAESB)", now(), now()), 
("Poço/cisterna", now(), now()), 
("Córrego/rio/lago", now(), now()),
("Nascente/mina", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.td_destino_lixo
INSERT INTO licagro.td_destino_lixo (nome, dta_criacao, dta_atualizacao) VALUES
("SLU", now(), now()), 
("Contêner (lixeira)", now(), now()),
("Outro", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.td_situacao_imovel
INSERT INTO licagro.td_situacao_imovel (nome, dta_criacao, dta_atualizacao) VALUES 
("Particular", now(), now()),
("Arrendado", now(), now()),
("Posse", now(), now()),
("Alugado", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.td_tipo_lixo_gerado
INSERT INTO licagro.td_tipo_lixo_gerado (nome, dta_criacao, dta_atualizacao) VALUES
("Doméstico", now(), now()), 
("Comercial", now(), now()),
("Industrial", now(), now()), 
("Hospitalar", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.td_efluente_liquido
INSERT INTO licagro.td_efluente_liquido (nome, dta_criacao, dta_atualizacao) VALUES
("Doméstico", now(), now()), 
("Óleo", now(), now()),
("Químico", now(), now()), 
("Hospitalar", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.tb_limites
INSERT INTO licagro.tb_limites (td_status_id, td_tipo_limite_id, qtd, dta_criacao, dta_atualizacao) VALUES
(1, 1, 5, now(), now()),
(2, 1, 6, now(), now()),
(3, 1, 4, now(), now()),
(3, 1, 5, now(), now()), 
(3, 1, 6, now(), now()),
(3, 1, 7, now(), now()), 
(3, 1, 8, now(), now()),
(3, 1, 9, now(), now()),
(3, 1, 10, now(), now()), 
(1, 2, 12, now(), now()), 
(2, 2, 6, now(), now());


-- ______________________________________________________________LICENCIAMENTO_______________________________________________

-- ------------------------------------------------------------------------------------------------------ licagro.tb_logradouro
INSERT INTO licagro.tb_logradouro (bairro, cidade, cep, endereco) VALUES 
("Asa Norte", "Brasilia", "70673-411", "SCRN 714/715 bloco K loja 5"),
("Asa Sul", "Brasilia", "70675-555", "SCS quadra 02 lote 34"), 
("Asa Norte", "Brasilia", "70456-333", "SCN quadra 03 lote 05"), 
("Jardim Botânico", "Brasilia", "71661-477", "Etapa 01 S/N Lote 02 loja 209"),
("Planaltina", "Brasilia", "70115-78", "Av. Independencia Quadra 50 Lote 16"), 
("SIA", "Brasilia", "70322-425", "Trecho 07 Pav. B4 Lote 100"),
("SIA", "Brasilia", "70325-444", "Trecho 10 Lote 10/05 Pav. B8 Box6/8"),
("SOF Sul", "Brasilia", "70322-498", "Quadra 15 Conjunto B Lote 1/4"), 
("Sobradinho", "Brasilia", "71856-742", "Quadra 05 Cl 07 lojas 2 e 5"),
("Sobradinho", "Brasília", "71753-951", "Quadra 07 Cl 08 loja 2"),
("SAAN", "Brasília", "78456-357", "SAAN Quadra 01 número 380/390"),
("Taguatinga Norte", "Brasília", "76547-741", "Av. Heliio Prates QI 01 Lote 41 a 44"), 
("Gama", "Brasília", "71145-357", "Quadra 36 Lote 12/13 - Setor Leste");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_empreendimento
INSERT INTO licagro.tb_empreendimento (tb_logradouro_id, localizacao) VALUES 
( 1, "Super Quadra Norte 714 ao lado da farmacia Drogasil"),
( 2, "Setor Comercial Sul proximo ao restaurante Ki Delicia"),
( 3, "Setor Comercial Norte quadra 3 ao lado da agencia dos Correios"),
( 4, "Bairro Jundiaí de frente ao supermercado Tatico"),
( 5, "Bairro Maracanã ao lado da Universidade"),
( 6, "Setor de Indústria e Abastecimento Bueno"),
( 7, "Setor de Indústria e Abastecimento Bueno"),
( 8, "Setor de Oficinas Sul"),
( 9, "Sobradinho II, proximo a padaria kipão"),
( 10, "Sobradinho II, proximo a farmácia droga sobradinho"),
( 11, "Setor de Armazenagem e Abastecimento Norte"),
( 12, "Taguatinga Sul, proximo ao feirão Modas"),
( 13, "Gama, proximo a farmacia drogamais");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_requerente
INSERT INTO licagro.tb_requerente (tb_logradouro_id, nome, cf_df, cpf_cnpj, telefone) VALUES
(1, "I.G. Produtos Agrícolas", NULL, "09.274.298/0001-00", "(61)93272-0011"),
(2, "Crop Agrícola Ltda", NULL, "12.355.774/0001-00", "(61)98186-2315"), 
(3, "Agroconstruções Ltda.", NULL, "31.444.987/0001-00", "(61)98477-8798"), 
(4, "Agrojardim", NULL, "48.664.981/0001-00", "(61)3427-1101"), 
(5, "Vigor Insumos Agricolas", NULL, "23.364.081/0001-00", "(61)96657-6252"),
(6, "Adubos Araguaia", NULL, "23.778.512/0001-00", "(61)3324-6874"),
(7, "Vegetal Prod. Agropecuários", NULL, "41.758.912/0001-00", "(61)3328-5274"),
(8, "Agrocen", NULL, "58.758.789/0001-00", "(61)3324-6874"),
(9, "Avicultura Nayra", NULL, "35.851.777/0001-00", "(61)3591-6195"),
(10, "Cada Fazenda", NULL, "45.562.711/0001-00", "(61)3591-4411"),
(11, "Agromaster", NULL, "78.854.458/0001-00", "(61)3039-3181"),
(12, "Adubos Araguaia", NULL, "23.778.512/0001-00", "(61)3355-9600"),
(13, "Cada Lavoura", NULL, "21.224.452/0001-00", "(61)3556-3983");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_responsavel
INSERT INTO licagro.tb_responsavel (nome, email, rg, cpf, telefone) VALUES 
("José Guimarães Neto", "joseguima@gmail.com", "3215.654", "445.887.957-58", "(61)98186-2315"), 
("Ângelo Roberto Siqueira", "angsiq@gmail.com", "1547.687", "915.753.954-87", "(61)94874-8888"), 
("Maria Augusta Cunha", "maricu@agrotox.com", "7549.987", "159.754.456-91", "(61)96578-0048"), 
("Francisco Xavier Amaro", "chicoamaro@bol.com.br", "4956.654", "423.456.951-77", "(61)94526-4448"), 
("Marcos José Júnior Neto Filho", "marcosfilho@ig.com.br", "3249.789", "495.756.984-00", "(61)98874-0054"),
("Abadio Amancio de Araujo" , "abadioaa@gmail.com", "2560.745" , "058.669.475-12" , "(61)999627451"),
("Madalena Carvalho de Oliveira" , "madalenaco@gmail.com", "2446.995" , "031.447.524-35", "(61) 99984-1034"),
("Wagner Antonio Alves" , "wagneraa@gmail.com" , "2340.779" , "032.008.541-34", "(61)98841-1102"),
("Simone Pereira de Jesus", "simonepereira@gmail.com" , "2355.769", "034.011.512-31", "(61)98741-2556"),
("Vanessa Texeira Arruda", "vanessata@gmail.com" , "7708.006", "069.390.469-09", "(61)98771-2578"),
("Salu Rezende de Moura", "salurm@gmail.com" , "2441.849", "076.221.517-70", "(61)99975-2588"),
("Mauro Antonio Gomes Cordeiro", "mauroagc@gmail.com" , "3443.389", "411.244.729-91", "(61)99986-2556"),
("Anderson da Silva", "andersonsilva@gmail.com" , "2258.669", "050.030.451-31", "(61)99974-7758");

-- ------------------------------------------------------------------------------------------------------ licagro.tb_correspondencia
INSERT INTO licagro.tb_correspondencia (tb_logradouro_id, nome, telefone) VALUES
(1, "Centro de Comunicação 1", "(61)98419-4487"),
(2, "Ouvidoria", "(61)98445-1203"), 
(3, "Correspondência 3", "(61)98756-4848"), 
(4, "Secretaria de Relacionamento", "(61)96745-5548"), 
(5, "SAC", "(12)98478-1126"), 
(6, "Caixa Postal", "(61)98745-5654"),
(7, "SAC", "(61)99975-5788"), 
(8, "Secretaria de Relacionamento", "(61)3355-5548"), 
(9, "Secretaria de Relacionamento", "(61)3364-5778"), 
(10, "Correspondência 1", "(61)3225-5648"), 
(11, "Recursos Humanos - RH", "(61)3368-7784"), 
(12, "Recursos Humanos - RH", "(61)3224-1148"), 
(13, "SAC", "(61)3445-1157"); 

-- ------------------------------------------------------------------------------------------------------ licagro.tb_licenciamento
INSERT INTO licagro.tb_licenciamento (td_situacao_imovel_id, td_destino_efluente_id, td_fase_empreendimento_id, td_destino_lixo_id, td_efluente_liquido_id1, td_abastecimento_agua_id, td_tipo_lixo_gerado_id, tb_correspondencia_id, tb_requerente_id, tb_empreendimento_id, td_tipo_atividade_id, tb_responsavel_id, num_processo, volume_lixo_m_por_dia, atividade_area, atividade_descricao, ibram_processo, observacao, dta_criacao, dta_atualizacao) VALUES 
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, "9999/2016", 41, 50, "Revender agrotóxicos", "2222.222/001-00", NULL, now(), now()),
(1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 2, "9881/2016", 46, 60, "Revender agrotóxicos", "3260.247/001-00", NULL, now(), now()),
(1, 1, 2, 2, 1, 1, 1, 3, 3, 3, 1, 3, "9888/2016", 51, 70, "Revender agrotóxicos", "4586.282/001-00", NULL, now(), now()),
(1, 1, 4, 1, 1, 1, 1, 4, 4, 4, 1, 4, "9887/2016", 49, 80, "Revender agrotóxicos", "1212.222/001-00", NULL, now(), now()),
(2, 2, 2, 2, 2, 2, 2, 5, 5, 5, 1, 5, "9886/2016", 55, 120, "Revender agrotóxicos.", "2563.333/001-00", NULL, now(), now()), 
(2, 1, 1, 1, 1, 1, 1, 6, 6, 6, 1, 6, "9885/2016", 410, 50, "I.G. Produtos Agrícolas", "1416.204/001-00", NULL, now(), now()),
(3, 3, 3, 3, 3, 1, 3, 7, 7, 7, 1, 7, "9884/2016", 502, 300, "Revender agrotóxicos", "3644.458/001-00", NULL, now(), now()),
(4, 4, 2, 3, 2, 2, 1, 8, 8, 8, 1, 8, "9883/2016", 500, 12, "Revender agrotóxicos", "6678.555/001-01", NULL, now(), now()), 
(4, 1, 2, 2, 1, 1, 1, 9, 9, 9, 1, 9, "9881/2016", 200, 550, "Revender agrotóxicos", "1594.789/001-00", NULL, now(), now()),
(4, 1, 4, 1, 1, 1, 1, 10, 10, 10, 1, 10, "9998/2016", 410, 50, "Revender agrotóxicos", "7856.000/001-00", NULL, now(), now()),
(4, 3, 2, 2, 1, 1, 1, 11, 11, 11, 1, 11, "9997/2016", 200, 50, "Revender agrotóxicos", "1853.719/001-00", NULL, now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.tb_licenciamento_status
INSERT INTO licagro.tb_licenciamento_status (tb_licenciamento_id, td_situacao_id, dta_inicial, dta_limite, dta_criacao, dta_atualizacao) VALUES
(1, 1, "2010-01-01", "2015-01-01", now(), now()), 
(2, 1, "2016-08-17", "2021-08-17", now(), now()), 
(2, 4, "2016-09-02", "2022-09-01", now(), now()),
(3, 1, "2016-01-01", "2021-01-01", now(), now()),
(3, 4, "2016-03-09", "2022-03-09", now(), now()),
(3, 7, "2016-05-09", "2022-05-09", now(), now()),
(3, 8, "2016-01-03", null, now(), now()),
(4, 1, "2016-01-01", "2021-01-01", now(), now()),
(5, 1, "2016-05-08", "2021-05-08", now(), now()),
(4, 3, "2016-03-20", "2022-03-20", now(), now()),
(4, 1, "2016-03-01", "2021-03-01", now(), now()),
(5, 2, "2016-04-07", "2021-04-07", now(), now()),
(6, 3, "2016-07-01", "2022-07-01", now(), now()),
(7, 1, "2016-02-01", "2022-02-01", now(), now()),
(7, 4, "2016-03-01", "2022-03-01", now(), now()),
(8, 1, "2016-02-01", "2022-02-01", now(), now()),
(8, 5, "2016-12-18", "2019-12-18", now(), now()),
(9, 1, "2016-02-01", "2022-02-01", now(), now()),
(9, 6, "2016-06-01", "2022-06-01", now(), now()),
(9, 7, "2016-08-01", "2024-08-01", now(), now()),
(10, 1, "2016-08-01", "2021-08-01", now(), now()),
(10, 4, "2016-09-02", "2022-09-01", now(), now()),
(10, 8, "2016-10-10", "2025-10-10", now(), now()),
(11, 1, "2016-01-01", "2021-01-01", now(), now()),
(11, 4, "2016-02-02", "2022-02-01", now(), now()),
(11, 9, "2016-03-01", "2026-03-01", now(), now());

-- ------------------------------------------------------------------------------------------------------ licagro.tb_avaliacao
INSERT INTO licagro.tb_avaliacao (td_tipos_avaliacao_id, tb_licenciamento_status_id, dta, observacao, dta_criacao, dta_atualizacao) VALUES 
(1, 3, "2016-01-03", null, now(), now()), 
(1, 5, "2016-02-07", null, now(), now()),
(2, 2, "2016-02-10", "Documentação incorreta", now(), now()), 
(1, 9, "2016-02-12", "Documentação correta, autorizado prorrogar licença", now(), now()), 
(2, 13, "2016-03-20", "Necessita de vistória no local", now(), now()), 
(1, 2, "2016-03-20", null, now(), now()), 
(2, 14, "2016-03-20", "Licença cancelada", now(), now()), 
(1, 15, "2016-04-20", "Pedido de prorrogação aprovado", now(), now()), 
(2, 16, "2016-04-20", "Documentação incorreta", now(), now()), 
(1, 17, "2016-04-20", null, now(), now()), 
(2, 2, "2016-05-20", "Cancelar licença", now(), now()), 
(1, 18, "2016-05-20", "Renovação da licença aprovado", now(), now());