USE [Colegio]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 18/09/2018 23:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido1] [varchar](50) NOT NULL,
	[edad] [varchar](3) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignaturas]    Script Date: 18/09/2018 23:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaturas](
	[cod] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripción] [varchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
 CONSTRAINT [PK_Asignaturas] PRIMARY KEY CLUSTERED 
(
	[cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignaturasAlumnos]    Script Date: 18/09/2018 23:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignaturasAlumnos](
	[idAlumno] [int] NOT NULL,
	[codAsignatura] [int] NOT NULL,
 CONSTRAINT [PK_AsignaturasAlumnos] PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC,
	[codAsignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[becas]    Script Date: 18/09/2018 23:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[becas](
	[id] [int] NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 18/09/2018 23:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[hours] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores2]    Script Date: 18/09/2018 23:20:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores2](
	[horas] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AsignaturasAlumnos]  WITH CHECK ADD  CONSTRAINT [FK_AsignaturasAlumnos_Alumnos] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AsignaturasAlumnos] CHECK CONSTRAINT [FK_AsignaturasAlumnos_Alumnos]
GO
ALTER TABLE [dbo].[AsignaturasAlumnos]  WITH CHECK ADD  CONSTRAINT [FK_AsignaturasAlumnos_Asignaturas] FOREIGN KEY([codAsignatura])
REFERENCES [dbo].[Asignaturas] ([cod])
GO
ALTER TABLE [dbo].[AsignaturasAlumnos] CHECK CONSTRAINT [FK_AsignaturasAlumnos_Asignaturas]
GO
