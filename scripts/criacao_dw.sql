
CREATE TABLE dim_problema (
                sk_problema INTEGER NOT NULL,
                nk_problema INTEGER NOT NULL,
                desc_problema VARCHAR(60) NOT NULL,
                CONSTRAINT dim_problema_pk PRIMARY KEY (sk_problema)
);


CREATE TABLE dim_data_abertura (
                sk_data_abertura INTEGER NOT NULL,
                data_abertura DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano VARCHAR(2) NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_ano_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(60) NOT NULL,
                ano_mes VARCHAR(60) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(60) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano VARCHAR(30) NOT NULL,
                nm_dia_semana VARCHAR(60) NOT NULL,
                flag_final_semana VARCHAR(10) NOT NULL,
                dt_carga DATE NOT NULL,
                CONSTRAINT dim_data_abertura_pk PRIMARY KEY (sk_data_abertura)
);


COMMENT ON COLUMN dim_data_abertura.sk_data_abertura IS '20160101';
COMMENT ON COLUMN dim_data_abertura.data_abertura IS '01/01/2017';
COMMENT ON COLUMN dim_data_abertura.desc_data_completa IS 'Descrição da data completa, mês escrito por extenso. Ex: 01 janeiro de 2017';
COMMENT ON COLUMN dim_data_abertura.nr_ano IS 'Número do Ano. Ex: 2017';
COMMENT ON COLUMN dim_data_abertura.nm_trimestre IS 'Número do trimestre. Em que trimestre do ano
aquela data está. EX:1T';
COMMENT ON COLUMN dim_data_abertura.nr_ano_trimestre IS 'Ano e número do trimestre, é como uma
junção dos dois campos anteriores. Ex: 2017/1T';
COMMENT ON COLUMN dim_data_abertura.nr_mes IS 'Número do mês. ex: 01';
COMMENT ON COLUMN dim_data_abertura.nm_mes IS 'Nome do mês. Ex: Janeiro';
COMMENT ON COLUMN dim_data_abertura.ano_mes IS 'Ano e número do mês juntos. Ex: 2017/01';
COMMENT ON COLUMN dim_data_abertura.nr_semana IS 'Número daquela semana no ano. Ex: 34';
COMMENT ON COLUMN dim_data_abertura.ano_semana IS 'Ano e número da semana juntos. Ex: 2017/34';
COMMENT ON COLUMN dim_data_abertura.nr_dia IS 'Número do dia no mês Ex: 31';
COMMENT ON COLUMN dim_data_abertura.nr_dia_ano IS 'Ano e número da semana juntos. Ex: 2017/31';
COMMENT ON COLUMN dim_data_abertura.nm_dia_semana IS 'Nome do dia da semana. Ex: quinta-feira';
COMMENT ON COLUMN dim_data_abertura.flag_final_semana IS 'Flag para indicar se é final de semana ou
não. Ex: Sim';


CREATE TABLE dim_estado (
                sk_estado INTEGER NOT NULL,
                nk_estado VARCHAR(2) NOT NULL,
                nm_estado VARCHAR(60) NOT NULL,
                CONSTRAINT dim_estado_pk PRIMARY KEY (sk_estado)
);


CREATE TABLE dim_data_arquivamento (
                sk_data_arquivamento INTEGER NOT NULL,
                data DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano VARCHAR(2) NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_ano_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(60) NOT NULL,
                ano_mes VARCHAR(60) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(60) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano VARCHAR(30) NOT NULL,
                nm_dia_semana VARCHAR(60) NOT NULL,
                flag_final_semana VARCHAR(10) NOT NULL,
                dt_carga DATE NOT NULL,
                CONSTRAINT dim_data_arquivamento_pk PRIMARY KEY (sk_data_arquivamento)
);
COMMENT ON COLUMN dim_data_arquivamento.sk_data_arquivamento IS '20160101';
COMMENT ON COLUMN dim_data_arquivamento.data IS '01/01/2017';
COMMENT ON COLUMN dim_data_arquivamento.desc_data_completa IS 'Descrição da data completa, mês escrito por extenso. Ex: 01 janeiro de 2017';
COMMENT ON COLUMN dim_data_arquivamento.nr_ano IS 'Número do Ano. Ex: 2017';
COMMENT ON COLUMN dim_data_arquivamento.nm_trimestre IS 'Número do trimestre. Em que trimestre do ano
aquela data está. EX:1T';
COMMENT ON COLUMN dim_data_arquivamento.nr_ano_trimestre IS 'Ano e número do trimestre, é como uma
junção dos dois campos anteriores. Ex: 2017/1T';
COMMENT ON COLUMN dim_data_arquivamento.nr_mes IS 'Número do mês. ex: 01';
COMMENT ON COLUMN dim_data_arquivamento.nm_mes IS 'Nome do mês. Ex: Janeiro';
COMMENT ON COLUMN dim_data_arquivamento.ano_mes IS 'Ano e número do mês juntos. Ex: 2017/01';
COMMENT ON COLUMN dim_data_arquivamento.nr_semana IS 'Número daquela semana no ano. Ex: 34';
COMMENT ON COLUMN dim_data_arquivamento.ano_semana IS 'Ano e número da semana juntos. Ex: 2017/34';
COMMENT ON COLUMN dim_data_arquivamento.nr_dia IS 'Número do dia no mês Ex: 31';
COMMENT ON COLUMN dim_data_arquivamento.nr_dia_ano IS 'Ano e número da semana juntos. Ex: 2017/31';
COMMENT ON COLUMN dim_data_arquivamento.nm_dia_semana IS 'Nome do dia da semana. Ex: quinta-feira';
COMMENT ON COLUMN dim_data_arquivamento.flag_final_semana IS 'Flag para indicar se é final de semana ou
não. Ex: Sim';


CREATE TABLE dim_cnae (
                sk_cnae INTEGER NOT NULL,
                nk_cnae INTEGER NOT NULL,
                nm_cnae VARCHAR(120) NOT NULL,
                desc_cnae_principal VARCHAR(120) NOT NULL,
                CONSTRAINT dim_cnae_pk PRIMARY KEY (sk_cnae)
);


CREATE TABLE dim_empresas (
                sk_empresas INTEGER NOT NULL,
                nk_cnpj INTEGER NOT NULL,
                razao_social VARCHAR(240) NOT NULL,
                nome_fantasia VARCHAR(120) NOT NULL,
                CONSTRAINT dim_empresas_pk PRIMARY KEY (sk_empresas)
);


CREATE TABLE dim_regiao (
                sk_regiao INTEGER NOT NULL,
                nk_codigo_regiao INTEGER NOT NULL,
                nm_regiao VARCHAR(60) NOT NULL,
                CONSTRAINT dim_regiao_pk PRIMARY KEY (sk_regiao)
);


CREATE TABLE dim_assunto (
                sk_assunto INTEGER NOT NULL,
                nk_codigo_assunto INTEGER NOT NULL,
                desc_assunto VARCHAR(120) NOT NULL,
                CONSTRAINT dim_assunto_pk PRIMARY KEY (sk_assunto)
);


CREATE TABLE ft_reclamacao (
                sk_data_abertura INTEGER NOT NULL,
                sk_data_arquivamento INTEGER NOT NULL,
                sk_problema INTEGER NOT NULL,
                sk_assunto INTEGER NOT NULL,
                sk_cnae INTEGER NOT NULL,
                sk_regiao INTEGER NOT NULL,
                sk_estado INTEGER NOT NULL,
                sk_empresas INTEGER NOT NULL,
                flag_atendida CHAR(1) NOT NULL
);
COMMENT ON COLUMN ft_reclamacao.sk_data_abertura IS '20160101';
COMMENT ON COLUMN ft_reclamacao.sk_data_arquivamento IS '20160101';
COMMENT ON COLUMN ft_reclamacao.flag_atendida IS 'Mostra se a reclamação foi atendida ou não';


ALTER TABLE ft_reclamacao ADD CONSTRAINT dim_problema_ft_reclamacao_fk
FOREIGN KEY (sk_problema)
REFERENCES dim_problema (sk_problema)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT dim_dt_abertura_ft_recl_fk
FOREIGN KEY (sk_data_abertura)
REFERENCES dim_data_abertura (sk_data_abertura)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT dim_estado_ft_reclamacao_fk
FOREIGN KEY (sk_estado)
REFERENCES dim_estado (sk_estado)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT dim_data_ft_reclamacao_fk
FOREIGN KEY (sk_data_arquivamento)
REFERENCES dim_data_arquivamento (sk_data_arquivamento)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT dim_cnae_ft_reclamacao_fk
FOREIGN KEY (sk_cnae)
REFERENCES dim_cnae (sk_cnae)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT dim_empresas_ft_reclamacao_fk
FOREIGN KEY (sk_empresas)
REFERENCES dim_empresas (sk_empresas)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT dim_regiao_ft_reclamacao_fk
FOREIGN KEY (sk_regiao)
REFERENCES dim_regiao (sk_regiao)
NOT DEFERRABLE;

ALTER TABLE ft_reclamacao ADD CONSTRAINT dim_assunto_ft_reclamacao_fk
FOREIGN KEY (sk_assunto)
REFERENCES dim_assunto (sk_assunto)
NOT DEFERRABLE;