/****** Script for SelectTopNRows command from SSMS  ******/
truncate table armazem

select *
from armazem
where strRazaoSocial = 'TOKIO MARINE';

CREATE TABLE [dbo].[armazem](
	[AnoCalendario] [varchar](100) NULL,
	[DataArquivamento] [varchar](100) NULL,
	[DataAbertura] [varchar](100) NULL,
	[CodigoRegiao] [bigint] NULL,
	[Regiao] [varchar](80) NULL,
	[UF] [varchar](2) NULL,
	[strRazaoSocial] [varchar](120) NULL,
	[strNomeFantasia] [varchar](120) NULL,
	[Tipo] [bigint] NULL,
	[NumeroCNPJ] [varchar](20) NULL,
	[RadicalCNPJ] [varchar](15) NULL,
	[RazaoSocialRFB] [varchar](400) NULL,
	[NomeFantasiaRFB] [varchar](400) NULL,
	[CNAEPrincipal] [varchar](20) NULL,
	[DescCNAEPrincipal] [varchar](300) NULL,
	[Atendida] [varchar](1) NULL,
	[CodigoAssunto] [bigint] NULL,
	[DescricaoAssunto] [varchar](300) NULL,
	[CodigoProblema] [varchar](12) NULL,
	[DescricaoProblema] [varchar](160) NULL,
	[SexoConsumidor] [varchar](1) NULL,
	[FaixaEtariaConsumidor] [varchar](100) NULL,
	[CEPConsumidor] [varchar](18) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
INSERT INTO armazem
values (2018, null, null, 5, 
'Centro-Oeste', 'MS', 'TOKIO MARINE', '********',
1, null, null, 'TOKIO MARINE SEGURADORA S.A.', null,
'6512000', 'SEGUROS NÃO-VIDA', 'N', 282,
'Seguro', null, null, null, 'Nao Informada', null

)

