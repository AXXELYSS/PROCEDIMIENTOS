USE [master]
GO
/****** Object:  Database [PROYECTO]    Script Date: 12/06/2025 06:42:36 p. m. ******/
CREATE DATABASE [PROYECTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROYECTO', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\PROYECTO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROYECTO_log', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\PROYECTO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PROYECTO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROYECTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROYECTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROYECTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROYECTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROYECTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROYECTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROYECTO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PROYECTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROYECTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROYECTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROYECTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROYECTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROYECTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROYECTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROYECTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROYECTO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PROYECTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROYECTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROYECTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROYECTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROYECTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROYECTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROYECTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROYECTO] SET RECOVERY FULL 
GO
ALTER DATABASE [PROYECTO] SET  MULTI_USER 
GO
ALTER DATABASE [PROYECTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROYECTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROYECTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROYECTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROYECTO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PROYECTO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PROYECTO', N'ON'
GO
ALTER DATABASE [PROYECTO] SET QUERY_STORE = ON
GO
ALTER DATABASE [PROYECTO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PROYECTO]
GO
/****** Object:  Table [dbo].[TCliente]    Script Date: 12/06/2025 06:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Telefono] [varchar](15) NULL,
	[Correo] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDetallePedido]    Script Date: 12/06/2025 06:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDetallePedido](
	[IdDetallePedido] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdPlato] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetallePedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEmpleado]    Script Date: 12/06/2025 06:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEmpleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Cargo] [varchar](50) NULL,
	[Telefono] [varchar](15) NULL,
	[Correo] [varchar](100) NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMesa]    Script Date: 12/06/2025 06:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMesa](
	[IdMesa] [int] IDENTITY(1,1) NOT NULL,
	[NumeroMesa] [int] NOT NULL,
	[Capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TPedido]    Script Date: 12/06/2025 06:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPedido](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TPlato]    Script Date: 12/06/2025 06:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPlato](
	[IdPlato] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Categoria] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPlato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TReserva]    Script Date: 12/06/2025 06:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TReserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdMesa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUsuario]    Script Date: 12/06/2025 06:42:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUsuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Clave] [varchar](100) NOT NULL,
	[TipoUsuario] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TCliente] ON 

INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (1, N'Carlos', N'Gonzales', N'987654322', N'carlosgonzales@email.com', N'Avenida Central 456')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (2, N'Lucía', N'Pérez', N'912345678', N'lucia@email.com', N'Calle Lima 456')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (3, N'Juan', N'Gonzales', N'987654322', N'juan@email.com', N'Av. Morales 789')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (4, N'María', N'Lopez', N'912345679', N'maria@email.com', N'Calle Balta 101')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (5, N'Pedro', N'Martínez', N'987654323', N'pedro@email.com', N'Av. San Martín 202')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (6, N'Ana', N'Rodríguez', N'912345680', N'ana@email.com', N'Calle Jirón 303')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (7, N'Luis', N'Fernández', N'987654324', N'luis@email.com', N'Av. Grau 404')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (8, N'Sofía', N'García', N'912345681', N'sofia@email.com', N'Calle Ayacucho 505')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (9, N'Miguel', N'Díaz', N'987654325', N'miguel@email.com', N'Av. Arequipa 606')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (10, N'Laura', N'González', N'912345682', N'laura@email.com', N'Calle Santa Teresa 707')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (11, N'Carlos', N'Ramírez', N'987654326', N'carlosr@email.com', N'Calle Puno 808')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (12, N'Gloria', N'Sánchez', N'912345683', N'gloria@email.com', N'Av. Javier Prado 909')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (13, N'José', N'Torres', N'987654327', N'jose@email.com', N'Calle Cajamarca 1010')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (14, N'Elena', N'Martínez', N'912345684', N'elena@email.com', N'Av. Belén 1111')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (15, N'David', N'López', N'987654328', N'david@email.com', N'Calle San Pedro 1212')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (16, N'Gabriela', N'Morales', N'912345685', N'gabriela@email.com', N'Av. Colón 1313')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (17, N'Andrés', N'Hernández', N'987654329', N'andres@email.com', N'Calle San José 1414')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (18, N'Rosa', N'Ramírez', N'912345686', N'rosa@email.com', N'Av. Santa Cruz 1515')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (19, N'Carlos', N'Cruz', N'987654330', N'carloscruz@email.com', N'Calle Los Álamos 1616')
INSERT [dbo].[TCliente] ([IdCliente], [Nombre], [Apellido], [Telefono], [Correo], [Direccion]) VALUES (20, N'Sandra', N'Fernández', N'912345687', N'sandra@email.com', N'Av. El Sol 1717')
SET IDENTITY_INSERT [dbo].[TCliente] OFF
GO
SET IDENTITY_INSERT [dbo].[TDetallePedido] ON 

INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (3, 3, 3, 1, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (4, 4, 4, 2, CAST(18.75 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (5, 5, 5, 1, CAST(12.50 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (8, 8, 3, 2, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (9, 9, 4, 1, CAST(18.75 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (10, 10, 5, 2, CAST(12.50 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (11, 11, 3, 1, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (12, 12, 4, 2, CAST(18.75 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (13, 13, 5, 1, CAST(12.50 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (16, 16, 3, 2, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (17, 17, 4, 1, CAST(18.75 AS Decimal(10, 2)))
INSERT [dbo].[TDetallePedido] ([IdDetallePedido], [IdPedido], [IdPlato], [Cantidad], [PrecioUnitario]) VALUES (18, 18, 5, 2, CAST(12.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[TDetallePedido] OFF
GO
SET IDENTITY_INSERT [dbo].[TEmpleado] ON 

INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (1, N'Carlos', N'Gonzales', N'Mesero', N'987654322', N'carlosgonzales@email.com', 2)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (2, N'María', N'Lopez', N'Mesero', N'999111223', N'maria@quinta.com', 2)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (3, N'José', N'García', N'Chef', N'999111224', N'jose@quinta.com', 3)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (4, N'Luis', N'Martínez', N'Administrador', N'999111225', N'luis@quinta.com', 4)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (5, N'Ana', N'Rodríguez', N'Mesero', N'999111226', N'ana@quinta.com', 5)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (6, N'Miguel', N'Fernández', N'Chef', N'999111227', N'miguel@quinta.com', 6)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (7, N'Carlos', N'Díaz', N'Administrador', N'999111228', N'carlos@quinta.com', 7)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (8, N'Laura', N'González', N'Mesero', N'999111229', N'laura@quinta.com', 8)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (9, N'Elena', N'Sánchez', N'Chef', N'999111230', N'elena@quinta.com', 9)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (10, N'David', N'Torres', N'Administrador', N'999111231', N'david@quinta.com', 10)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (11, N'Gabriela', N'López', N'Mesero', N'999111232', N'gabriela@quinta.com', 11)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (12, N'Andrés', N'Martínez', N'Chef', N'999111233', N'andres@quinta.com', 12)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (13, N'Rosa', N'Ramírez', N'Administrador', N'999111234', N'rosa@quinta.com', 13)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (14, N'Carlos', N'Hernández', N'Mesero', N'999111235', N'carlos@quinta.com', 14)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (15, N'Sandra', N'Cruz', N'Chef', N'999111236', N'sandra@quinta.com', 15)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (16, N'José', N'Sánchez', N'Administrador', N'999111237', N'jose@quinta.com', 16)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (17, N'Marta', N'García', N'Mesero', N'999111238', N'marta@quinta.com', 17)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (18, N'Juan', N'Martínez', N'Chef', N'999111239', N'juan@quinta.com', 18)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (19, N'Gloria', N'López', N'Administrador', N'999111240', N'gloria@quinta.com', 19)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (20, N'Sofía', N'Fernández', N'Mesero', N'999111241', N'sofia@quinta.com', 20)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (21, N'Juan', N'Perez', N'Chef', N'987654321', N'juanperez@email.com', 1)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (22, N'Juan', N'Perez', N'Chef', N'987654321', N'juanperez@email.com', 1)
INSERT [dbo].[TEmpleado] ([IdEmpleado], [Nombre], [Apellido], [Cargo], [Telefono], [Correo], [IdUsuario]) VALUES (23, N'Juan', N'Perez', N'Chef', N'987654321', N'juanperez@email.com', 1)
SET IDENTITY_INSERT [dbo].[TEmpleado] OFF
GO
SET IDENTITY_INSERT [dbo].[TMesa] ON 

INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (1, 1, 4)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (2, 2, 2)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (3, 3, 6)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (4, 4, 4)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (5, 5, 8)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (6, 6, 2)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (7, 7, 4)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (8, 8, 6)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (9, 9, 2)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (10, 10, 4)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (11, 11, 6)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (12, 12, 8)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (13, 13, 4)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (14, 14, 2)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (15, 15, 4)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (16, 16, 6)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (17, 17, 2)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (18, 18, 4)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (19, 19, 6)
INSERT [dbo].[TMesa] ([IdMesa], [NumeroMesa], [Capacidad]) VALUES (20, 20, 4)
SET IDENTITY_INSERT [dbo].[TMesa] OFF
GO
SET IDENTITY_INSERT [dbo].[TPedido] ON 

INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (2, CAST(N'2025-06-02' AS Date), CAST(N'13:00:00' AS Time), 2, 2)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (3, CAST(N'2025-06-03' AS Date), CAST(N'14:15:00' AS Time), 3, 3)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (4, CAST(N'2025-06-04' AS Date), CAST(N'15:45:00' AS Time), 4, 4)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (5, CAST(N'2025-06-05' AS Date), CAST(N'16:00:00' AS Time), 5, 5)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (6, CAST(N'2025-06-06' AS Date), CAST(N'17:20:00' AS Time), 6, 6)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (7, CAST(N'2025-06-07' AS Date), CAST(N'18:05:00' AS Time), 7, 7)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (8, CAST(N'2025-06-08' AS Date), CAST(N'19:30:00' AS Time), 8, 8)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (9, CAST(N'2025-06-09' AS Date), CAST(N'20:10:00' AS Time), 9, 9)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (10, CAST(N'2025-06-10' AS Date), CAST(N'21:25:00' AS Time), 10, 10)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (11, CAST(N'2025-06-11' AS Date), CAST(N'12:45:00' AS Time), 11, 11)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (12, CAST(N'2025-06-12' AS Date), CAST(N'14:00:00' AS Time), 12, 12)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (13, CAST(N'2025-06-13' AS Date), CAST(N'15:30:00' AS Time), 13, 13)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (14, CAST(N'2025-06-14' AS Date), CAST(N'16:15:00' AS Time), 14, 14)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (15, CAST(N'2025-06-15' AS Date), CAST(N'17:50:00' AS Time), 15, 15)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (16, CAST(N'2025-06-16' AS Date), CAST(N'18:25:00' AS Time), 16, 16)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (17, CAST(N'2025-06-17' AS Date), CAST(N'19:00:00' AS Time), 17, 17)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (18, CAST(N'2025-06-18' AS Date), CAST(N'20:30:00' AS Time), 18, 18)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (19, CAST(N'2025-06-19' AS Date), CAST(N'21:10:00' AS Time), 19, 19)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (20, CAST(N'2025-06-20' AS Date), CAST(N'22:00:00' AS Time), 20, 20)
INSERT [dbo].[TPedido] ([IdPedido], [Fecha], [Hora], [IdCliente], [IdEmpleado]) VALUES (21, CAST(N'2025-06-12' AS Date), CAST(N'19:30:00' AS Time), 1, 2)
SET IDENTITY_INSERT [dbo].[TPedido] OFF
GO
SET IDENTITY_INSERT [dbo].[TPlato] ON 

INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (3, N'Pizza Margherita Deluxe', N'Pizza con tomate, mozzarella, albahaca y aceite de oliva extra virgen', CAST(18.99 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (4, N'Arroz Chaufa', N'Arroz frito con pollo y vegetales', CAST(18.75 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (5, N'Ceviche', N'Pescado marinado con limón, cebolla y cilantro', CAST(12.50 AS Decimal(10, 2)), N'Entradas')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (6, N'Pasta Alfredo', N'Pasta con salsa cremosa de queso', CAST(10.00 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (7, N'Pescado a la Parrilla', N'Pescado fresco a la parrilla con guarnición', CAST(20.00 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (8, N'Tacos de Pollo', N'Tacos con pollo, lechuga y salsa', CAST(18.75 AS Decimal(10, 2)), N'Entradas')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (9, N'Pizza Margarita', N'Pizza con salsa de tomate, queso y albahaca', CAST(12.50 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (10, N'Sándwich Club', N'Sándwich con jamón, pollo, lechuga y tomate', CAST(15.50 AS Decimal(10, 2)), N'Entradas')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (11, N'Sopa Criolla', N'Sopa con carne de res, papas y fideos', CAST(10.00 AS Decimal(10, 2)), N'Entradas')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (12, N'Chicharrón de Pollo', N'Pollo empanado con papas fritas', CAST(20.00 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (13, N'Lasaña', N'Lasaña con carne molida y salsa bechamel', CAST(18.75 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (14, N'Tiradito de Pescado', N'Pescado crudo con salsa picante', CAST(12.50 AS Decimal(10, 2)), N'Entradas')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (15, N'Pollo a la Brasa', N'Pollo asado con papas y ensalada', CAST(15.50 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (16, N'Paella', N'Arroz con mariscos y vegetales', CAST(10.00 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (17, N'Chupe de Camarones', N'Sopa de camarones con papa y leche', CAST(20.00 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (18, N'Arroz con Mariscos', N'Arroz con mariscos frescos', CAST(18.75 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (19, N'Sushi', N'Rollos de sushi con pescado y aguacate', CAST(12.50 AS Decimal(10, 2)), N'Entradas')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (20, N'Lomo de Cerdo', N'Lomo de cerdo al horno con ensalada', CAST(15.50 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (21, N'Pizza Margherita', N'Pizza con tomate, mozzarella y albahaca', CAST(15.99 AS Decimal(10, 2)), N'Plato de Fondo')
INSERT [dbo].[TPlato] ([IdPlato], [Nombre], [Descripcion], [Precio], [Categoria]) VALUES (22, N'Pizza Americana', N'Pizza con tomate, mozzarella y albahaca', CAST(15.99 AS Decimal(10, 2)), N'Plato de Fondo')
SET IDENTITY_INSERT [dbo].[TPlato] OFF
GO
SET IDENTITY_INSERT [dbo].[TReserva] ON 

INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (2, CAST(N'2025-06-02' AS Date), CAST(N'13:00:00' AS Time), 2, 2)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (3, CAST(N'2025-06-03' AS Date), CAST(N'14:15:00' AS Time), 3, 3)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (4, CAST(N'2025-06-04' AS Date), CAST(N'15:45:00' AS Time), 4, 4)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (5, CAST(N'2025-06-05' AS Date), CAST(N'16:00:00' AS Time), 5, 5)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (6, CAST(N'2025-06-06' AS Date), CAST(N'17:20:00' AS Time), 6, 6)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (7, CAST(N'2025-06-07' AS Date), CAST(N'18:05:00' AS Time), 7, 7)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (8, CAST(N'2025-06-08' AS Date), CAST(N'19:30:00' AS Time), 8, 8)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (9, CAST(N'2025-06-09' AS Date), CAST(N'20:10:00' AS Time), 9, 9)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (10, CAST(N'2025-06-10' AS Date), CAST(N'21:25:00' AS Time), 10, 10)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (11, CAST(N'2025-06-11' AS Date), CAST(N'12:45:00' AS Time), 11, 11)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (12, CAST(N'2025-06-12' AS Date), CAST(N'14:00:00' AS Time), 12, 12)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (13, CAST(N'2025-06-13' AS Date), CAST(N'15:30:00' AS Time), 13, 13)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (14, CAST(N'2025-06-14' AS Date), CAST(N'16:15:00' AS Time), 14, 14)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (15, CAST(N'2025-06-15' AS Date), CAST(N'17:50:00' AS Time), 15, 15)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (16, CAST(N'2025-06-16' AS Date), CAST(N'18:25:00' AS Time), 16, 16)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (17, CAST(N'2025-06-17' AS Date), CAST(N'19:00:00' AS Time), 17, 17)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (18, CAST(N'2025-06-18' AS Date), CAST(N'20:30:00' AS Time), 18, 18)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (19, CAST(N'2025-06-19' AS Date), CAST(N'21:10:00' AS Time), 19, 19)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (20, CAST(N'2025-06-20' AS Date), CAST(N'22:00:00' AS Time), 20, 20)
INSERT [dbo].[TReserva] ([IdReserva], [Fecha], [Hora], [IdCliente], [IdMesa]) VALUES (21, CAST(N'2025-06-12' AS Date), CAST(N'19:00:00' AS Time), 1, 3)
SET IDENTITY_INSERT [dbo].[TReserva] OFF
GO
SET IDENTITY_INSERT [dbo].[TUsuario] ON 

INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (1, N'admin_updated', N'newpassword123', N'Chef')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (2, N'chef1', N'chefpass', N'Chef')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (3, N'mesero1', N'meseropass', N'Mesero')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (4, N'admin2', N'adminpass2', N'Administrador')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (5, N'chef2', N'chefpass2', N'Chef')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (6, N'mesero2', N'meseropass2', N'Mesero')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (7, N'admin3', N'adminpass3', N'Administrador')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (8, N'chef3', N'chefpass3', N'Chef')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (9, N'mesero3', N'meseropass3', N'Mesero')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (10, N'admin4', N'adminpass4', N'Administrador')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (11, N'chef4', N'chefpass4', N'Chef')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (12, N'mesero4', N'meseropass4', N'Mesero')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (13, N'admin5', N'adminpass5', N'Administrador')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (14, N'chef5', N'chefpass5', N'Chef')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (15, N'mesero5', N'meseropass5', N'Mesero')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (16, N'admin6', N'adminpass6', N'Administrador')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (17, N'chef6', N'chefpass6', N'Chef')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (18, N'mesero6', N'meseropass6', N'Mesero')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (19, N'admin7', N'adminpass7', N'Administrador')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (20, N'chef7', N'chefpass7', N'Chef')
INSERT [dbo].[TUsuario] ([IdUsuario], [NombreUsuario], [Clave], [TipoUsuario]) VALUES (21, N'admin123', N'password123', N'Administrador')
SET IDENTITY_INSERT [dbo].[TUsuario] OFF
GO
ALTER TABLE [dbo].[TDetallePedido]  WITH CHECK ADD FOREIGN KEY([IdPedido])
REFERENCES [dbo].[TPedido] ([IdPedido])
GO
ALTER TABLE [dbo].[TDetallePedido]  WITH CHECK ADD FOREIGN KEY([IdPlato])
REFERENCES [dbo].[TPlato] ([IdPlato])
GO
ALTER TABLE [dbo].[TEmpleado]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TPedido]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[TCliente] ([IdCliente])
GO
ALTER TABLE [dbo].[TPedido]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[TEmpleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[TReserva]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[TCliente] ([IdCliente])
GO
ALTER TABLE [dbo].[TReserva]  WITH CHECK ADD FOREIGN KEY([IdMesa])
REFERENCES [dbo].[TMesa] ([IdMesa])
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCliente]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spActualizarCliente]
    @IdCliente INT,
    @NuevoNombre VARCHAR(100),
    @NuevoApellido VARCHAR(100),
    @NuevoTelefono VARCHAR(15),
    @NuevoCorreo VARCHAR(100),
    @NuevaDireccion VARCHAR(200)
AS
BEGIN
    -- Verificar si el cliente existe
    IF EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        -- Actualizar los campos del cliente
        UPDATE TCliente
        SET Nombre = @NuevoNombre, 
            Apellido = @NuevoApellido, 
            Telefono = @NuevoTelefono, 
            Correo = @NuevoCorreo, 
            Direccion = @NuevaDireccion
        WHERE IdCliente = @IdCliente

        SELECT CodError = 0, Mensaje = 'Cliente actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDetallePedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDetallePedido]
    @IdDetallePedido INT, 
    @NuevoIdPedido INT, 
    @NuevoIdPlato INT, 
    @NuevaCantidad INT, 
    @NuevoPrecioUnitario DECIMAL(10,2)
AS
BEGIN
    -- Verificar si el detalle de pedido existe
    IF EXISTS (SELECT IdDetallePedido FROM TDetallePedido WHERE IdDetallePedido = @IdDetallePedido)
    BEGIN
        -- Verificar si el nuevo pedido existe
        IF NOT EXISTS (SELECT IdPedido FROM TPedido WHERE IdPedido = @NuevoIdPedido)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El nuevo pedido no existe'
            RETURN
        END

        -- Verificar si el nuevo plato existe
        IF NOT EXISTS (SELECT IdPlato FROM TPlato WHERE IdPlato = @NuevoIdPlato)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El nuevo plato no existe'
            RETURN
        END

        -- Actualizar el detalle del pedido
        UPDATE TDetallePedido
        SET IdPedido = @NuevoIdPedido, 
            IdPlato = @NuevoIdPlato, 
            Cantidad = @NuevaCantidad, 
            PrecioUnitario = @NuevoPrecioUnitario
        WHERE IdDetallePedido = @IdDetallePedido

        SELECT CodError = 0, Mensaje = 'Detalle del pedido actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El detalle del pedido no existe'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarEmpleado]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spActualizarEmpleado]
    @IdEmpleado INT,
    @NuevoNombre VARCHAR(100),
    @NuevoApellido VARCHAR(100),
    @NuevoCargo VARCHAR(50),
    @NuevoTelefono VARCHAR(15),
    @NuevoCorreo VARCHAR(100),
    @NuevoIdUsuario INT
AS
BEGIN
    -- Verificar si el empleado existe
    IF EXISTS (SELECT IdEmpleado FROM TEmpleado WHERE IdEmpleado = @IdEmpleado)
    BEGIN
        -- Verificar si el nuevo Usuario asociado al empleado existe
        IF EXISTS (SELECT IdUsuario FROM TUsuario WHERE IdUsuario = @NuevoIdUsuario)
        BEGIN
            -- Actualizar los campos del empleado
            UPDATE TEmpleado
            SET Nombre = @NuevoNombre, 
                Apellido = @NuevoApellido, 
                Cargo = @NuevoCargo, 
                Telefono = @NuevoTelefono, 
                Correo = @NuevoCorreo, 
                IdUsuario = @NuevoIdUsuario
            WHERE IdEmpleado = @IdEmpleado

            SELECT CodError = 0, Mensaje = 'Empleado actualizado correctamente'
        END
        ELSE 
            SELECT CodError = 1, Mensaje = 'Error: El nuevo Usuario no existe'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El empleado no existe'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarMesa]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarMesa]
    @IdMesa INT, 
    @NuevoNumeroMesa INT, 
    @NuevaCapacidad INT
AS
BEGIN
    -- Verificar si la mesa existe
    IF EXISTS (SELECT IdMesa FROM TMesa WHERE IdMesa = @IdMesa)
    BEGIN
        -- Verificar si el nuevo número de mesa ya está en uso
        IF EXISTS (SELECT IdMesa FROM TMesa WHERE NumeroMesa = @NuevoNumeroMesa AND IdMesa <> @IdMesa)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El número de mesa ya está en uso'
            RETURN
        END

        -- Actualizar la mesa
        UPDATE TMesa
        SET NumeroMesa = @NuevoNumeroMesa, 
            Capacidad = @NuevaCapacidad
        WHERE IdMesa = @IdMesa

        SELECT CodError = 0, Mensaje = 'Mesa actualizada correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: La mesa no existe'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarPedido]
    @IdPedido INT, 
    @NuevaFecha DATE, 
    @NuevaHora TIME, 
    @NuevoIdCliente INT, 
    @NuevoIdEmpleado INT
AS
BEGIN
    -- Verificar si el pedido existe
    IF EXISTS (SELECT IdPedido FROM TPedido WHERE IdPedido = @IdPedido)
    BEGIN
        -- Verificar si el nuevo cliente existe
        IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @NuevoIdCliente)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El nuevo cliente no existe'
            RETURN
        END

        -- Verificar si el nuevo empleado existe
        IF NOT EXISTS (SELECT IdEmpleado FROM TEmpleado WHERE IdEmpleado = @NuevoIdEmpleado)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El nuevo empleado no existe'
            RETURN
        END

        -- Actualizar el pedido
        UPDATE TPedido
        SET Fecha = @NuevaFecha, 
            Hora = @NuevaHora, 
            IdCliente = @NuevoIdCliente, 
            IdEmpleado = @NuevoIdEmpleado
        WHERE IdPedido = @IdPedido

        SELECT CodError = 0, Mensaje = 'Pedido actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El pedido no existe'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPlato]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spActualizarPlato]
    @IdPlato INT,
    @NuevoNombre VARCHAR(100),
    @NuevaDescripcion VARCHAR(255),
    @NuevoPrecio DECIMAL(10,2),
    @NuevaCategoria VARCHAR(100)
AS
BEGIN
    -- Verificar si el plato existe
    IF EXISTS (SELECT IdPlato FROM TPlato WHERE IdPlato = @IdPlato)
    BEGIN
        -- Actualizar los campos del plato
        UPDATE TPlato
        SET Nombre = @NuevoNombre, 
            Descripcion = @NuevaDescripcion, 
            Precio = @NuevoPrecio, 
            Categoria = @NuevaCategoria
        WHERE IdPlato = @IdPlato

        SELECT CodError = 0, Mensaje = 'Plato actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El plato no existe'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarReserva]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarReserva]
    @IdReserva INT,
    @NuevaFecha DATE, 
    @NuevaHora TIME, 
    @NuevoIdCliente INT, 
    @NuevoIdMesa INT
AS
BEGIN
    -- Verificar si la reserva existe
    IF EXISTS (SELECT IdReserva FROM TReserva WHERE IdReserva = @IdReserva)
    BEGIN
        -- Verificar si el cliente existe
        IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @NuevoIdCliente)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
            RETURN
        END

        -- Verificar si la mesa existe
        IF NOT EXISTS (SELECT IdMesa FROM TMesa WHERE IdMesa = @NuevoIdMesa)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: La mesa no existe'
            RETURN
        END

        -- Actualizar la reserva
        UPDATE TReserva
        SET Fecha = @NuevaFecha, 
            Hora = @NuevaHora, 
            IdCliente = @NuevoIdCliente, 
            IdMesa = @NuevoIdMesa
        WHERE IdReserva = @IdReserva

        SELECT CodError = 0, Mensaje = 'Reserva actualizada correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: La reserva no existe'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsuario]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spActualizarUsuario]
    @IdUsuario INT,
    @NuevoNombreUsuario VARCHAR(50),
    @NuevaClave VARCHAR(100),
    @NuevoTipoUsuario VARCHAR(50)
AS
BEGIN
    -- Verificar si el usuario existe
    IF EXISTS (SELECT IdUsuario FROM TUsuario WHERE IdUsuario = @IdUsuario)
    BEGIN
        -- Actualizar los campos del usuario
        UPDATE TUsuario
        SET NombreUsuario = @NuevoNombreUsuario, 
            Clave = @NuevaClave, 
            TipoUsuario = @NuevoTipoUsuario
        WHERE IdUsuario = @IdUsuario

        SELECT CodError = 0, Mensaje = 'Usuario actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El usuario no existe'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCliente]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarCliente]
    @IdCliente INT, 
    @Nombre VARCHAR(100), 
    @Apellido VARCHAR(100), 
    @Telefono VARCHAR(15), 
    @Correo VARCHAR(100), 
    @Direccion VARCHAR(200)
AS
BEGIN
    -- Verificar si el IdCliente no está duplicado
    IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        INSERT INTO TCliente (Nombre, Apellido, Telefono, Correo, Direccion) 
        VALUES (@Nombre, @Apellido, @Telefono, @Correo, @Direccion)
        SELECT CodError = 0, Mensaje = 'Correcto, cliente insertado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: IdCliente duplicado'
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarDetallePedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarDetallePedido]
    @IdPedido INT, 
    @IdPlato INT, 
    @Cantidad INT, 
    @PrecioUnitario DECIMAL(10,2)
AS
BEGIN
    -- Verificar si el pedido existe
    IF NOT EXISTS (SELECT IdPedido FROM TPedido WHERE IdPedido = @IdPedido)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El pedido no existe'
        RETURN
    END

    -- Verificar si el plato existe
    IF NOT EXISTS (SELECT IdPlato FROM TPlato WHERE IdPlato = @IdPlato)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El plato no existe'
        RETURN
    END

    -- Insertar detalle de pedido
    INSERT INTO TDetallePedido (IdPedido, IdPlato, Cantidad, PrecioUnitario)
    VALUES (@IdPedido, @IdPlato, @Cantidad, @PrecioUnitario)

    SELECT CodError = 0, Mensaje = 'Detalle del pedido agregado correctamente'
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarEmpleado]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarEmpleado]
    @Nombre VARCHAR(100), 
    @Apellido VARCHAR(100), 
    @Cargo VARCHAR(50), 
    @Telefono VARCHAR(15), 
    @Correo VARCHAR(100), 
    @IdUsuario INT
AS
BEGIN
    -- Verificar si el Usuario asociado al empleado existe
    IF EXISTS (SELECT IdUsuario FROM TUsuario WHERE IdUsuario = @IdUsuario)
    BEGIN
        INSERT INTO TEmpleado (Nombre, Apellido, Cargo, Telefono, Correo, IdUsuario) 
        VALUES (@Nombre, @Apellido, @Cargo, @Telefono, @Correo, @IdUsuario)
        SELECT CodError = 0, Mensaje = 'Correcto, empleado insertado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El Usuario no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarMesa]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarMesa]
    @NumeroMesa INT, 
    @Capacidad INT
AS
BEGIN
    -- Verificar si el número de mesa ya existe
    IF NOT EXISTS (SELECT NumeroMesa FROM TMesa WHERE NumeroMesa = @NumeroMesa)
    BEGIN
        INSERT INTO TMesa (NumeroMesa, Capacidad)
        VALUES (@NumeroMesa, @Capacidad)
        SELECT CodError = 0, Mensaje = 'Correcto, mesa insertada'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: Número de mesa duplicado'
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarPedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarPedido]
    @Fecha DATE, 
    @Hora TIME, 
    @IdCliente INT, 
    @IdEmpleado INT
AS
BEGIN
    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
        RETURN
    END

    -- Verificar si el empleado existe
    IF NOT EXISTS (SELECT IdEmpleado FROM TEmpleado WHERE IdEmpleado = @IdEmpleado)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El empleado no existe'
        RETURN
    END

    -- Insertar nuevo pedido
    INSERT INTO TPedido (Fecha, Hora, IdCliente, IdEmpleado)
    VALUES (@Fecha, @Hora, @IdCliente, @IdEmpleado)

    SELECT CodError = 0, Mensaje = 'Pedido agregado correctamente'
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarPlato]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarPlato]
    @Nombre VARCHAR(100), 
    @Descripcion VARCHAR(255), 
    @Precio DECIMAL(10,2), 
    @Categoria VARCHAR(100)
AS
BEGIN
    -- Verificar si el Nombre del Plato no está duplicado
    IF NOT EXISTS (SELECT Nombre FROM TPlato WHERE Nombre = @Nombre)
    BEGIN
        INSERT INTO TPlato (Nombre, Descripcion, Precio, Categoria) 
        VALUES (@Nombre, @Descripcion, @Precio, @Categoria)
        SELECT CodError = 0, Mensaje = 'Correcto, plato insertado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: Plato duplicado'
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarReserva]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarReserva]
    @Fecha DATE, 
    @Hora TIME, 
    @IdCliente INT, 
    @IdMesa INT
AS
BEGIN
    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
        RETURN
    END

    -- Verificar si la mesa existe
    IF NOT EXISTS (SELECT IdMesa FROM TMesa WHERE IdMesa = @IdMesa)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: La mesa no existe'
        RETURN
    END

    -- Verificar si ya existe una reserva para esa fecha y hora para esa mesa
    IF EXISTS (SELECT IdReserva FROM TReserva WHERE IdMesa = @IdMesa AND Fecha = @Fecha AND Hora = @Hora)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: Ya existe una reserva para esta mesa en ese horario'
        RETURN
    END

    -- Insertar nueva reserva
    INSERT INTO TReserva (Fecha, Hora, IdCliente, IdMesa)
    VALUES (@Fecha, @Hora, @IdCliente, @IdMesa)

    SELECT CodError = 0, Mensaje = 'Reserva agregada correctamente'
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarUsuario]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarUsuario]
    @NombreUsuario VARCHAR(50), 
    @Clave VARCHAR(100), 
    @TipoUsuario VARCHAR(50)
AS
BEGIN
    -- Verificar si el NombreUsuario no está duplicado
    IF NOT EXISTS (SELECT NombreUsuario FROM TUsuario WHERE NombreUsuario = @NombreUsuario)
    BEGIN
        INSERT INTO TUsuario (NombreUsuario, Clave, TipoUsuario) 
        VALUES (@NombreUsuario, @Clave, @TipoUsuario)
        SELECT CodError = 0, Mensaje = 'Correcto, usuario insertado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: NombreUsuario duplicado'
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarCliente]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spBuscarCliente]
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdCliente')
        -- Búsqueda exacta por IdCliente
        SELECT IdCliente, Nombre, Apellido, Direccion 
        FROM TCliente
        WHERE IdCliente = @Texto
    ELSE IF (@Criterio = 'Nombre')
        -- Búsqueda sensitiva por Nombre
        SELECT Nombre, Apellido, Direccion
        FROM TCliente
        WHERE Nombre LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Apellido')
        -- Búsqueda sensitiva por Apellido
        SELECT Nombre, Apellido, Direccion
        FROM TCliente
        WHERE Apellido LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Direccion')
        -- Búsqueda sensitiva por Dirección
        SELECT Nombre, Apellido, Direccion
        FROM TCliente
        WHERE Direccion LIKE '%' + @Texto + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarDetallePedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarDetallePedido]
    @Texto INT, 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdDetallePedido')
        -- Búsqueda exacta por IdDetallePedido
        SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
        FROM TDetallePedido
        WHERE IdDetallePedido = @Texto
    ELSE IF (@Criterio = 'IdPedido')
        -- Búsqueda sensitiva por IdPedido
        SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
        FROM TDetallePedido
        WHERE IdPedido = @Texto
    ELSE IF (@Criterio = 'IdPlato')
        -- Búsqueda sensitiva por IdPlato
        SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
        FROM TDetallePedido
        WHERE IdPlato = @Texto
    ELSE IF (@Criterio = 'Cantidad')
        -- Búsqueda sensitiva por Cantidad
        SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
        FROM TDetallePedido
        WHERE Cantidad = @Texto
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarEmpleado]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spBuscarEmpleado]
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdEmpleado')
        -- Búsqueda exacta por IdEmpleado
        SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
        FROM TEmpleado
        WHERE IdEmpleado = @Texto
    ELSE IF (@Criterio = 'Nombre')
        -- Búsqueda sensitiva por Nombre
        SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
        FROM TEmpleado
        WHERE Nombre LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Apellido')
        -- Búsqueda sensitiva por Apellido
        SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
        FROM TEmpleado
        WHERE Apellido LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Cargo')
        -- Búsqueda sensitiva por Cargo
        SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
        FROM TEmpleado
        WHERE Cargo LIKE '%' + @Texto + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarMesa]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarMesa]
    @Texto INT, 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdMesa')
        -- Búsqueda exacta por IdMesa
        SELECT IdMesa, NumeroMesa, Capacidad
        FROM TMesa
        WHERE IdMesa = @Texto
    ELSE IF (@Criterio = 'NumeroMesa')
        -- Búsqueda sensitiva por NumeroMesa
        SELECT IdMesa, NumeroMesa, Capacidad
        FROM TMesa
        WHERE NumeroMesa = @Texto
    ELSE IF (@Criterio = 'Capacidad')
        -- Búsqueda sensitiva por Capacidad
        SELECT IdMesa, NumeroMesa, Capacidad
        FROM TMesa
        WHERE Capacidad = @Texto
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarPedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarPedido]
    @Texto INT, 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdPedido')
        -- Búsqueda exacta por IdPedido
        SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
        FROM TPedido
        WHERE IdPedido = @Texto
    ELSE IF (@Criterio = 'IdCliente')
        -- Búsqueda sensitiva por IdCliente
        SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
        FROM TPedido
        WHERE IdCliente = @Texto
    ELSE IF (@Criterio = 'IdEmpleado')
        -- Búsqueda sensitiva por IdEmpleado
        SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
        FROM TPedido
        WHERE IdEmpleado = @Texto
    ELSE IF (@Criterio = 'Fecha')
        -- Búsqueda sensitiva por Fecha
        SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
        FROM TPedido
        WHERE Fecha LIKE '%' + @Texto + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarPlato]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spBuscarPlato]
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdPlato')
        -- Búsqueda exacta por IdPlato
        SELECT IdPlato, Nombre, Descripcion, Precio, Categoria
        FROM TPlato
        WHERE IdPlato = @Texto
    ELSE IF (@Criterio = 'Nombre')
        -- Búsqueda sensitiva por Nombre
        SELECT IdPlato, Nombre, Descripcion, Precio, Categoria
        FROM TPlato
        WHERE Nombre LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Categoria')
        -- Búsqueda sensitiva por Categoria
        SELECT IdPlato, Nombre, Descripcion, Precio
        FROM TPlato
        WHERE Categoria LIKE '%' + @Texto + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarReserva]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarReserva]
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdReserva')
        -- Búsqueda exacta por IdReserva
        SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
        FROM TReserva
        WHERE IdReserva = @Texto
    ELSE IF (@Criterio = 'IdCliente')
        -- Búsqueda sensitiva por IdCliente
        SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
        FROM TReserva
        WHERE IdCliente = @Texto
    ELSE IF (@Criterio = 'IdMesa')
        -- Búsqueda sensitiva por IdMesa
        SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
        FROM TReserva
        WHERE IdMesa = @Texto
    ELSE IF (@Criterio = 'Fecha')
        -- Búsqueda sensitiva por Fecha
        SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
        FROM TReserva
        WHERE Fecha LIKE '%' + @Texto + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarUsuario]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spBuscarUsuario]
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdUsuario')
        -- Búsqueda exacta por IdUsuario
        SELECT IdUsuario, NombreUsuario, TipoUsuario
        FROM TUsuario
        WHERE IdUsuario = @Texto
    ELSE IF (@Criterio = 'NombreUsuario')
        -- Búsqueda sensitiva por NombreUsuario
        SELECT IdUsuario, NombreUsuario, TipoUsuario
        FROM TUsuario
        WHERE NombreUsuario LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'TipoUsuario')
        -- Búsqueda sensitiva por TipoUsuario
        SELECT IdUsuario, NombreUsuario
        FROM TUsuario
        WHERE TipoUsuario LIKE '%' + @Texto + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCliente]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spEliminarCliente]
    @IdCliente INT
AS
BEGIN
    -- Verificar si el cliente existe
    IF EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        -- Verificar si el cliente está relacionado con alguna reserva
        IF EXISTS (SELECT IdCliente FROM TReserva WHERE IdCliente = @IdCliente)
        BEGIN
            -- Si está relacionado, no eliminar y dar mensaje de error
            SELECT CodError = 1, Mensaje = 'Error: El cliente está relacionado con reservas y no se puede eliminar'
        END
        ELSE
        BEGIN
            -- Eliminar el cliente si no está relacionado
            DELETE FROM TCliente WHERE IdCliente = @IdCliente
            SELECT CodError = 0, Mensaje = 'Correcto, cliente eliminado'
        END
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarDetallePedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarDetallePedido]
    @IdDetallePedido INT
AS
BEGIN
    -- Verificar si el detalle de pedido existe
    IF EXISTS (SELECT IdDetallePedido FROM TDetallePedido WHERE IdDetallePedido = @IdDetallePedido)
    BEGIN
        -- Eliminar el detalle del pedido
        DELETE FROM TDetallePedido WHERE IdDetallePedido = @IdDetallePedido
        SELECT CodError = 0, Mensaje = 'Detalle del pedido eliminado correctamente'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El detalle del pedido no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarEmpleado]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spEliminarEmpleado]
    @IdEmpleado INT
AS
BEGIN
    -- Verificar si el empleado existe
    IF EXISTS (SELECT IdEmpleado FROM TEmpleado WHERE IdEmpleado = @IdEmpleado)
    BEGIN
        -- Verificar si el empleado está relacionado con algún pedido
        IF EXISTS (SELECT IdEmpleado FROM TPedido WHERE IdEmpleado = @IdEmpleado)
        BEGIN
            -- Si está relacionado, no eliminar y dar mensaje de error
            SELECT CodError = 1, Mensaje = 'Error: El empleado está relacionado con pedidos y no se puede eliminar'
        END
        ELSE
        BEGIN
            -- Eliminar el empleado si no está relacionado
            DELETE FROM TEmpleado WHERE IdEmpleado = @IdEmpleado
            SELECT CodError = 0, Mensaje = 'Correcto, empleado eliminado'
        END
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El empleado no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMesa]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spEliminarMesa]
    @IdMesa INT
AS
BEGIN
    -- Verificar si la mesa existe
    IF EXISTS (SELECT IdMesa FROM TMesa WHERE IdMesa = @IdMesa)
    BEGIN
        -- Verificar si la mesa está asociada a alguna reserva
        IF EXISTS (SELECT IdMesa FROM TReserva WHERE IdMesa = @IdMesa)
        BEGIN
            -- Si está asociada, no eliminar y dar mensaje de error
            SELECT CodError = 1, Mensaje = 'Error: La mesa está asociada a una reserva y no se puede eliminar'
        END
        ELSE
        BEGIN
            -- Eliminar la mesa si no está asociada
            DELETE FROM TMesa WHERE IdMesa = @IdMesa
            SELECT CodError = 0, Mensaje = 'Correcto, mesa eliminada'
        END
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: La mesa no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarPedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPedido]
    @IdPedido INT
AS
BEGIN
    -- Verificar si el pedido existe
    IF EXISTS (SELECT IdPedido FROM TPedido WHERE IdPedido = @IdPedido)
    BEGIN
        -- Eliminar el pedido
        DELETE FROM TPedido WHERE IdPedido = @IdPedido
        SELECT CodError = 0, Mensaje = 'Pedido eliminado correctamente'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El pedido no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarPlato]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spEliminarPlato]
    @IdPlato INT
AS
BEGIN
    -- Verificar si el plato existe
    IF EXISTS (SELECT IdPlato FROM TPlato WHERE IdPlato = @IdPlato)
    BEGIN
        -- Verificar si el plato está relacionado con algún detalle de pedido
        IF EXISTS (SELECT IdPlato FROM TDetallePedido WHERE IdPlato = @IdPlato)
        BEGIN
            -- Eliminar primero los detalles del pedido que contienen el plato
            DELETE FROM TDetallePedido WHERE IdPlato = @IdPlato
            SELECT CodError = 0, Mensaje = 'Detalles de pedido eliminados'
        END
        
        -- Ahora eliminar el plato
        DELETE FROM TPlato WHERE IdPlato = @IdPlato
        SELECT CodError = 0, Mensaje = 'Correcto, plato eliminado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El plato no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarReserva]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarReserva]
    @IdReserva INT
AS
BEGIN
    -- Verificar si la reserva existe
    IF EXISTS (SELECT IdReserva FROM TReserva WHERE IdReserva = @IdReserva)
    BEGIN
        -- Eliminar la reserva
        DELETE FROM TReserva WHERE IdReserva = @IdReserva
        SELECT CodError = 0, Mensaje = 'Reserva eliminada correctamente'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: La reserva no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spEliminarUsuario]
    @IdUsuario INT
AS
BEGIN
    -- Verificar si el usuario existe
    IF EXISTS (SELECT IdUsuario FROM TUsuario WHERE IdUsuario = @IdUsuario)
    BEGIN
        -- Verificar si el usuario está relacionado con algún empleado
        IF EXISTS (SELECT IdUsuario FROM TEmpleado WHERE IdUsuario = @IdUsuario)
        BEGIN
            -- Si está relacionado, no eliminar y dar mensaje de error
            SELECT CodError = 1, Mensaje = 'Error: El usuario está relacionado con empleados y no se puede eliminar'
        END
        ELSE
        BEGIN
            -- Eliminar el usuario si no está relacionado
            DELETE FROM TUsuario WHERE IdUsuario = @IdUsuario
            SELECT CodError = 0, Mensaje = 'Correcto, usuario eliminado'
        END
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El usuario no existe'
END
GO
/****** Object:  StoredProcedure [dbo].[spListarCliente]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spListarCliente]
AS
BEGIN
    SELECT IdCliente, Nombre, Apellido, Direccion
    FROM TCliente
END
GO
/****** Object:  StoredProcedure [dbo].[spListarDetallePedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarDetallePedido]
AS
BEGIN
    SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
    FROM TDetallePedido
END
GO
/****** Object:  StoredProcedure [dbo].[spListarEmpleado]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spListarEmpleado]
AS
BEGIN
    SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
    FROM TEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[spListarMesa]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spListarMesa]
AS
BEGIN
    SELECT IdMesa, NumeroMesa, Capacidad
    FROM TMesa
END
GO
/****** Object:  StoredProcedure [dbo].[spListarPedido]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarPedido]
AS
BEGIN
    SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
    FROM TPedido
END
GO
/****** Object:  StoredProcedure [dbo].[spListarPlato]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spListarPlato]
AS
BEGIN
    SELECT IdPlato, Nombre, Descripcion, Precio, Categoria
    FROM TPlato
END
GO
/****** Object:  StoredProcedure [dbo].[spListarReserva]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarReserva]
AS
BEGIN
    SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
    FROM TReserva
END
GO
/****** Object:  StoredProcedure [dbo].[spListarUsuario]    Script Date: 12/06/2025 06:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spListarUsuario]
AS
BEGIN
    SELECT IdUsuario, NombreUsuario, TipoUsuario
    FROM TUsuario
END
GO
USE [master]
GO
ALTER DATABASE [PROYECTO] SET  READ_WRITE 
GO
