USE [Testando]
GO
/****** Object:  Table [dbo].[DL_CadEquipe]    Script Date: 12/01/2022 13:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DL_CadEquipe](
	[id_equipe] [int] IDENTITY(1,1) NOT NULL,
	[NomeCompleto] [varchar](100) NOT NULL,
	[Cargo] [varchar](100) NOT NULL,
	[AnexoFoto] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DL_CadEquipe] PRIMARY KEY CLUSTERED 
(
	[id_equipe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DL_CadLogin]    Script Date: 12/01/2022 13:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DL_CadLogin](
	[idLogin] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](15) NOT NULL,
	[NomeCompleto] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Senha] [varchar](50) NOT NULL,
	[Telefone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DL_CadLogin] PRIMARY KEY CLUSTERED 
(
	[idLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DL_CadPortfolio]    Script Date: 12/01/2022 13:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DL_CadPortfolio](
	[id_CadPortfolio] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[AnexoPortfolio] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DL_CadPortfolio] PRIMARY KEY CLUSTERED 
(
	[id_CadPortfolio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DL_CadServico]    Script Date: 12/01/2022 13:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DL_CadServico](
	[id_CadServico] [int] IDENTITY(1,1) NOT NULL,
	[NomeServico] [varchar](100) NOT NULL,
	[Anexo] [varchar](100) NOT NULL,
	[Tipo_Servico] [int] NOT NULL,
 CONSTRAINT [PK_DL_CadServico] PRIMARY KEY CLUSTERED 
(
	[id_CadServico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DL_Servico]    Script Date: 12/01/2022 13:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DL_Servico](
	[id_servico] [int] IDENTITY(1,1) NOT NULL,
	[Nome_Servico] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DL_Servico] PRIMARY KEY CLUSTERED 
(
	[id_servico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DL_CadPortfolio] ON 

INSERT [dbo].[DL_CadPortfolio] ([id_CadPortfolio], [nome], [AnexoPortfolio]) VALUES (2, N'asdasd', N'2022112122122.png')
INSERT [dbo].[DL_CadPortfolio] ([id_CadPortfolio], [nome], [AnexoPortfolio]) VALUES (3, N'teste', N'2022112122716.jpg')
SET IDENTITY_INSERT [dbo].[DL_CadPortfolio] OFF
GO
SET IDENTITY_INSERT [dbo].[DL_CadServico] ON 

INSERT [dbo].[DL_CadServico] ([id_CadServico], [NomeServico], [Anexo], [Tipo_Servico]) VALUES (4, N'Cozinha Casa Tal', N'2022112122031.png', 1)
SET IDENTITY_INSERT [dbo].[DL_CadServico] OFF
GO
SET IDENTITY_INSERT [dbo].[DL_Servico] ON 

INSERT [dbo].[DL_Servico] ([id_servico], [Nome_Servico]) VALUES (1, N'Cozinha')
INSERT [dbo].[DL_Servico] ([id_servico], [Nome_Servico]) VALUES (2, N'Dormitórios')
INSERT [dbo].[DL_Servico] ([id_servico], [Nome_Servico]) VALUES (3, N'Escritório')
INSERT [dbo].[DL_Servico] ([id_servico], [Nome_Servico]) VALUES (4, N'Area Gourmet')
SET IDENTITY_INSERT [dbo].[DL_Servico] OFF
GO
ALTER TABLE [dbo].[DL_CadServico]  WITH CHECK ADD  CONSTRAINT [FK_DL_CadServico_DL_Servico] FOREIGN KEY([Tipo_Servico])
REFERENCES [dbo].[DL_Servico] ([id_servico])
GO
ALTER TABLE [dbo].[DL_CadServico] CHECK CONSTRAINT [FK_DL_CadServico_DL_Servico]
GO
