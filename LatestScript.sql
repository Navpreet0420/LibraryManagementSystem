USE [master]
GO

CREATE DATABASE [LibraryDB]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryDB', N'ON'
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE [LibraryDB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'3.1.1')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'User', N'USER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'59fb24c6-f9f2-43e6-ae4b-4f5cc1f0c0c5', N'1')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'39fb24c6-f9f2-43e6-ae4b-4f5cc1f0c0c3', N'2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'59fb24c6-f9f2-43e6-ae4b-4f5cc1f0c0c5', N'akshayjamwal2016@gmail.com', N'AKSHAYJAMWAL2016@GMAIL.COM', N'akshayjamwal2016@gmail.com', N'AKSHAYJAMWAL2016@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEC/uMBcmRFnepoG3voIZkq0laG8PxfTZrCAuyD+nyBVtwBLuKTxO+gkU/1z9G6YiIA==', N'53AKI7F7QGIQI6IOTH6XIDJ6XOWGGA6D', N'65849028-65e6-4ebe-8b1e-ee7bb1bdd4ed', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'39fb24c6-f9f2-43e6-ae4b-4f5cc1f0c0c3', N'akshayjamwal2017@gmail.com', N'AKSHAYJAMWAL2017@GMAIL.COM', N'akshayjamwal2017@gmail.com', N'AKSHAYJAMWAL2017@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEC/uMBcmRFnepoG3voIZkq0laG8PxfTZrCAuyD+nyBVtwBLuKTxO+gkU/1z9G6YiIA==', N'53AKI7F7QGIQI6IOTH6XIDJ6XOWGGA6D', N'65849028-65e6-4ebe-8b1e-ee7bb1bdd4ed', NULL, 0, 0, NULL, 1, 0)
GO

SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [LibraryDB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [char](1) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Pincode] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Author] [varchar](100) NULL,
	[ISBN] [varchar](20) NULL,
	[Publisher] [varchar](100) NULL,
	[Language] [varchar](50) NULL
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[IssuedBook](
	[IssuedBookId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NULL,
	[CustomerId] [int] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[IssuedBookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[IssuedBook] WITH CHECK ADD CONSTRAINT [FK_IssuedBook_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
ALTER TABLE [dbo].[IssuedBook] CHECK CONSTRAINT [FK_IssuedBook_Book]

ALTER TABLE [dbo].[IssuedBook] WITH CHECK ADD CONSTRAINT [FK_IssuedBook_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
ALTER TABLE [dbo].[IssuedBook] CHECK CONSTRAINT [FK_IssuedBook_Customer]
GO

SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerId], [Gender], [FirstName], [LastName], [Address], [Pincode], [City], [State], [Country], [Phone], [Email], [CreationDate]) VALUES (1, N'F', N'Sony', N'Singh', N'Flat No. 321, West Apartment, Karolbagh', N'100100', N'New Delhi', N'New Delhi', N'India', N'9988776655', N'sony@sample.com', CAST(N'2020-11-10T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([CustomerId], [Gender], [FirstName], [LastName], [Address], [Pincode], [City], [State], [Country], [Phone], [Email], [CreationDate]) VALUES (2, N'M', N'Danny', N'Gonzales', N'House No. 786, Baga, Panjim', N'403516', N'Panjim', N'Goa', N'India', N'4433221100', N'danny@sample.com', CAST(N'2020-11-06T10:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([BookId], [Name], [Author], [ISBN], [Publisher], [Language]) VALUES (1, N'Think and Grow Rich', N'Napolean Hill', N'978-9389717426', N'Fingerprint! Publishing', N'English')
GO
INSERT [dbo].[Book] ([BookId], [Name], [Author], [ISBN], [Publisher], [Language]) VALUES (2, N'The Power of Your Subconscious Mind', N'Dr. Joseph Murphy', N'978-9389717341', N'Fingerprint! Publishing', N'English')
GO
INSERT [dbo].[Book] ([BookId], [Name], [Author], [ISBN], [Publisher], [Language]) VALUES (3, N'One Arranged Murder', N'Chetan Bhagat', N'978-1542094139', N'Westland', N'English')
GO
INSERT [dbo].[Book] ([BookId], [Name], [Author], [ISBN], [Publisher], [Language]) VALUES (4, N'Great Stories for Children', N'Ruskin Bond', N'978-8129118929', N'Rupa', N'English')
GO
INSERT [dbo].[Book] ([BookId], [Name], [Author], [ISBN], [Publisher], [Language]) VALUES (5, N'Time Management (Hindi)', N'Sudhir Dixit', N'978-8183220187', N'MANJUL PUBLISHING HOUSE PVT LTD', N'Hindi')
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[IssuedBook] ON 
GO
INSERT [dbo].[IssuedBook] ([IssuedBookId], [BookId], [CustomerId], [DateFrom], [DateTo], [ReturnDate]) VALUES (1, 1, 1, CAST(N'2020-11-10T14:00:00.000' AS DateTime), CAST(N'2020-11-15T14:00:00.000' AS DateTime), CAST(N'2020-11-16T14:00:00.000' AS DateTime))
GO
INSERT [dbo].[IssuedBook] ([IssuedBookId], [BookId], [CustomerId], [DateFrom], [DateTo], [ReturnDate]) VALUES (2, 5, 2, CAST(N'2020-11-10T14:00:00.000' AS DateTime), CAST(N'2020-11-19T14:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[IssuedBook] ([IssuedBookId], [BookId], [CustomerId], [DateFrom], [DateTo], [ReturnDate]) VALUES (3, 2, 1, CAST(N'2020-11-17T14:00:00.000' AS DateTime), CAST(N'2020-11-22T14:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[IssuedBook] OFF
GO
USE [master]
GO
ALTER DATABASE [LibraryDB] SET  READ_WRITE 
GO
