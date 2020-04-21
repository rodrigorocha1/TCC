CREATE TABLE dim_data (
                sk_data NUMBER NOT NULL,
                data_completa DATE NOT NULL,
                desc_data_completa VARCHAR2(60) NOT NULL,
                nr_ano VARCHAR2(60) NOT NULL,
                nm_trimestre VARCHAR2(20) NOT NULL,
                nr_ano_trimestre VARCHAR2(20) NOT NULL,
                nr_mes NUMBER NOT NULL,
                nm_mes VARCHAR2(60) NOT NULL,
                ano_mes VARCHAR2(60) NOT NULL,
                nr_semana NUMBER NOT NULL,
                ano_semana VARCHAR2(60) NOT NULL,
                nr_dia NUMBER NOT NULL,
                nr_dia_ano VARCHAR2(30) NOT NULL,
                nm_dia_semana VARCHAR2(60) NOT NULL,
                flag_final_semana VARCHAR2(10) NOT NULL,
                dt_carga DATE DEFAULT SYSDATE NOT NULL,
                CONSTRAINT DIM_DATA_PK PRIMARY KEY (sk_data)
);


COMMENT ON COLUMN dim_data.sk_data IS '20160101';
COMMENT ON COLUMN dim_data.data_completa IS '01/01/2017';
COMMENT ON COLUMN dim_data.desc_data_completa IS 'Descrição da data completa, mês escrito por extenso. Ex: 01 janeiro de 2017';
COMMENT ON COLUMN dim_data.nr_ano IS 'Número do Ano. Ex: 2017';
COMMENT ON COLUMN dim_data.nm_trimestre IS 'Número do trimestre. Em que trimestre do ano
aquela data está. EX:1T';
COMMENT ON COLUMN dim_data.nr_ano_trimestre IS 'Ano e número do trimestre, é como uma
junção dos dois campos anteriores. Ex: 2017/1T';
COMMENT ON COLUMN dim_data.nr_mes IS 'Número do mês. ex: 01';
COMMENT ON COLUMN dim_data.nm_mes IS 'Nome do mês. Ex: Janeiro';
COMMENT ON COLUMN dim_data.ano_mes IS 'Ano e número do mês juntos. Ex: 2017/01';
COMMENT ON COLUMN dim_data.nr_semana IS 'Número daquela semana no ano. Ex: 34';
COMMENT ON COLUMN dim_data.ano_semana IS 'Ano e número da semana juntos. Ex: 2017/34';
COMMENT ON COLUMN dim_data.nr_dia IS 'Número do dia no mês Ex: 31';
COMMENT ON COLUMN dim_data.nr_dia_ano IS 'Ano e número da semana juntos. Ex: 2017/31';
COMMENT ON COLUMN dim_data.nm_dia_semana IS 'Nome do dia da semana. Ex: quinta-feira';
COMMENT ON COLUMN dim_data.flag_final_semana IS 'Flag para indicar se é final de semana ou
não. Ex: Sim';


CREATE SEQUENCE DIM_CNAE_SK_CNAE_SEQ;

CREATE TABLE dim_cnae (
                sk_cnae NUMBER NOT NULL,
                nk_cnae NUMBER NOT NULL,
                nm_cnae VARCHAR2(120) NOT NULL,
                desc_cnae_principal VARCHAR2(120) NOT NULL,
                CONSTRAINT DIM_CNAE_PK PRIMARY KEY (sk_cnae)
);


CREATE SEQUENCE DIM_EMPRESAS_SK_EMPRESAS_SEQ;

CREATE TABLE dim_empresas (
                sk_empresas NUMBER NOT NULL,
                nk_cnpj NUMBER NOT NULL,
                razao_social VARCHAR2(240) NOT NULL,
                nome_fantasia VARCHAR2(120) NOT NULL,
                CONSTRAINT DIM_EMPRESAS_PK PRIMARY KEY (sk_empresas)
);


CREATE SEQUENCE DIM_REGIAO_SK_REGIAO_SEQ;

CREATE TABLE dim_regiao (
                sk_regiao NUMBER NOT NULL,
                nk_codigo_regiao NUMBER NOT NULL,
                nm_regiao VARCHAR2(60) NOT NULL,
                nm_estado VARCHAR2(2) NOT NULL,
                CONSTRAINT DIM_REGIAO_PK PRIMARY KEY (sk_regiao)
);


CREATE SEQUENCE DIM_ASSUNTO_SK_ASSUNTO_SEQ;

CREATE TABLE dim_assunto (
                sk_assunto NUMBER NOT NULL,
                nk_codigo_assunto NUMBER NOT NULL,
                desc_assunto VARCHAR2(120) NOT NULL,
                CONSTRAINT DIM_ASSUNTO_PK PRIMARY KEY (sk_assunto)
);


CREATE TABLE ft_reclamacao (
                sk_assunto NUMBER NOT NULL,
                sk_regiao NUMBER NOT NULL,
                sk_empresas NUMBER NOT NULL,
                sk_cnae NUMBER NOT NULL,
                sk_data NUMBER NOT NULL,
                flag_atendida VARCHAR(1) NOT NULL
);

COMMENT ON COLUMN ft_reclamacao.sk_data IS '20160101';
COMMENT ON COLUMN ft_reclamacao.flag_atendida IS 'Mostra se a reclamação foi atendida ou não';


ALTER TABLE ft_reclamacao ADD CONSTRAINT DIM_DATA_FT_RECLAMACAO_FK
FOREIGN KEY (sk_data)
REFERENCES dim_data (sk_data)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT DIM_CNAE_FT_RECLAMACAO_FK
FOREIGN KEY (sk_cnae)
REFERENCES dim_cnae (sk_cnae)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT DIM_EMPRESAS_FT_RECLAMACAO_FK
FOREIGN KEY (sk_empresas)
REFERENCES dim_empresas (sk_empresas)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT DIM_REGIAO_FT_RECLAMACAO_FK
FOREIGN KEY (sk_regiao)
REFERENCES dim_regiao (sk_regiao)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT DIM_ASSUNTO_FT_RECLAMACAO_FK
FOREIGN KEY (sk_assunto)
REFERENCES dim_assunto (sk_assunto)
NOT DEFERRABLE;