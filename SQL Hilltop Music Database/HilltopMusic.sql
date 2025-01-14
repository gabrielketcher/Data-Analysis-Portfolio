USE [master]
GO
/****** Object:  Database [HilltopMusic]    Script Date: 12/1/2024 11:44:57 PM ******/
CREATE DATABASE [HilltopMusic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HilltopMusic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HilltopMusic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HilltopMusic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HilltopMusic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HilltopMusic] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HilltopMusic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HilltopMusic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HilltopMusic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HilltopMusic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HilltopMusic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HilltopMusic] SET ARITHABORT OFF 
GO
ALTER DATABASE [HilltopMusic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HilltopMusic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HilltopMusic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HilltopMusic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HilltopMusic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HilltopMusic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HilltopMusic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HilltopMusic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HilltopMusic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HilltopMusic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HilltopMusic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HilltopMusic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HilltopMusic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HilltopMusic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HilltopMusic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HilltopMusic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HilltopMusic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HilltopMusic] SET RECOVERY FULL 
GO
ALTER DATABASE [HilltopMusic] SET  MULTI_USER 
GO
ALTER DATABASE [HilltopMusic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HilltopMusic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HilltopMusic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HilltopMusic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HilltopMusic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HilltopMusic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HilltopMusic', N'ON'
GO
ALTER DATABASE [HilltopMusic] SET QUERY_STORE = OFF
GO
USE [HilltopMusic]
GO
/****** Object:  Table [dbo].[SetList]    Script Date: 12/1/2024 11:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetList](
	[SetListID] [int] NOT NULL,
	[SetListDate] [date] NULL,
	[VideoLink] [nvarchar](max) NULL,
 CONSTRAINT [PK_SetList] PRIMARY KEY CLUSTERED 
(
	[SetListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetListSongVersion]    Script Date: 12/1/2024 11:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetListSongVersion](
	[SetListSongID] [int] NOT NULL,
	[SongVersionID] [nvarchar](25) NOT NULL,
	[SetListID] [int] NOT NULL,
	[OrderInSet] [tinyint] NULL,
 CONSTRAINT [PK_SetListSongVersion] PRIMARY KEY CLUSTERED 
(
	[SetListSongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Singer]    Script Date: 12/1/2024 11:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Singer](
	[SingerID] [nvarchar](10) NOT NULL,
	[SingerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Singer] PRIMARY KEY CLUSTERED 
(
	[SingerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingerVocalGroup]    Script Date: 12/1/2024 11:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingerVocalGroup](
	[VocalGroupID] [int] NOT NULL,
	[SingerID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_SingerVocalGroup] PRIMARY KEY CLUSTERED 
(
	[VocalGroupID] ASC,
	[SingerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 12/1/2024 11:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongID] [nvarchar](25) NOT NULL,
	[SongName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongVersion]    Script Date: 12/1/2024 11:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongVersion](
	[SongVersionID] [nvarchar](25) NOT NULL,
	[SongID] [nvarchar](25) NOT NULL,
	[SongKey] [nchar](3) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SongVersion] PRIMARY KEY CLUSTERED 
(
	[SongVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VocalGroup]    Script Date: 12/1/2024 11:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VocalGroup](
	[VocalGroupID] [int] NOT NULL,
	[VocalGroupType] [nvarchar](10) NULL,
 CONSTRAINT [PK_VocalGroup] PRIMARY KEY CLUSTERED 
(
	[VocalGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VocalGroupSongVersion]    Script Date: 12/1/2024 11:44:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VocalGroupSongVersion](
	[SongVersionID] [nvarchar](25) NOT NULL,
	[VocalGroupID] [int] NOT NULL,
 CONSTRAINT [PK_VocalGroupSongVersion] PRIMARY KEY CLUSTERED 
(
	[SongVersionID] ASC,
	[VocalGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (1, CAST(N'2024-12-01' AS Date), N'')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (2, CAST(N'2024-11-24' AS Date), N'https://samketcher.sermon.net/main/main/22342690')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (3, CAST(N'2024-11-17' AS Date), N'https://www.youtube.com/watch?v=6mj5ePJVHwk&ab_channel=HilltopFreeWillBaptistChurchWewoka%2COk')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (4, CAST(N'2024-11-10' AS Date), N'https://youtu.be/Cb4LVAbnmf0?si=GVDUwPPxO1Y9abec')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (5, CAST(N'2024-11-03' AS Date), N'https://youtu.be/ZW9DSsKOxO4?si=tb9LcrOkcLixEv8f')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (6, CAST(N'2024-10-27' AS Date), N'https://youtu.be/zbxRGH99R-w?si=Mrb5wY9IlewnZtUj')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (7, CAST(N'2024-10-20' AS Date), N'https://youtu.be/BIpOb0F3QI4?si=N2tIvU8KHodcV2lz')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (8, CAST(N'2024-10-13' AS Date), N'https://youtu.be/YEpOnUk80yg?si=u3CuyX9Uk6awLrmo')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (9, CAST(N'2024-10-06' AS Date), N'https://youtu.be/F2Wj6rjvaus?si=KCI-kDcS95U6NUEB')
INSERT [dbo].[SetList] ([SetListID], [SetListDate], [VideoLink]) VALUES (10, CAST(N'2024-09-09' AS Date), N'https://youtu.be/V5VOXp7u4Z4?si=rMaVmv2kBMZdQYqM')
GO
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (1, N'godleadsus1', 1, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (2, N'holyholyholy1', 1, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (3, N'ocomeallye1', 1, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (4, N'beautifulstar1', 1, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (5, N'stones1', 1, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (6, N'areyouwashed1', 2, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (7, N'fartheralong1', 2, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (8, N'blessedassurance1', 2, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (9, N'soonandverysoon1', 2, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (10, N'seekyefirst1', 2, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (11, N'heavensjubilee1', 3, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (12, N'stormybanks1', 3, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (13, N'longblacktrain1', 3, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (14, N'highways1', 3, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (15, N'havethineownway1', 3, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (16, N'whentheroll1', 4, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (17, N'downatthecross1', 4, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (18, N'lordsmyshepherd1', 4, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (19, N'tissosweet1', 4, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (20, N'helpisonway1', 4, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (21, N'littletalk1', 5, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (22, N'comethoufount1', 5, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (23, N'homesick1', 5, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (24, N'heabides1', 5, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (25, N'loveofgod1', 5, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (26, N'oiwanttosee1', 6, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (27, N'wheretheroses1', 6, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (28, N'angelband1', 6, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (29, N'whenthesaints1', 6, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (30, N'downtotheriver1', 6, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (31, N'overingloryland1', 7, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (32, N'solidrock1', 7, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (33, N'singuntothelord1', 7, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (34, N'oldtimereligion1', 7, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (35, N'ruggedcross1', 7, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (36, N'radioon1', 8, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (37, N'opentheeyes1', 8, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (38, N'onedayatatime1', 8, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (39, N'firingline1', 8, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (40, N'lordofhosts1', 8, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (41, N'sendthelight1', 9, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (42, N'cantevenwalk1', 9, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (43, N'nevermeetagain1', 9, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (44, N'twohands1', 9, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (45, N'jesuspaidall1', 9, 5)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (46, N'glorylandway1', 10, 1)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (47, N'comemorning1', 10, 2)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (48, N'comforterhascome1', 10, 3)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (49, N'iamblessed1', 10, 4)
INSERT [dbo].[SetListSongVersion] ([SetListSongID], [SongVersionID], [SetListID], [OrderInSet]) VALUES (50, N'iwantjesus1', 10, 5)
GO
INSERT [dbo].[Singer] ([SingerID], [SingerName]) VALUES (N'darlene', N'Darlene Bingham')
INSERT [dbo].[Singer] ([SingerID], [SingerName]) VALUES (N'gabe', N'Gabe Ketcher')
INSERT [dbo].[Singer] ([SingerID], [SingerName]) VALUES (N'jack', N'Jackson Keesee')
INSERT [dbo].[Singer] ([SingerID], [SingerName]) VALUES (N'nena', N'Nena Ray')
INSERT [dbo].[Singer] ([SingerID], [SingerName]) VALUES (N'sam', N'Sam Ketcher')
INSERT [dbo].[Singer] ([SingerID], [SingerName]) VALUES (N'shawna', N'Shawna Ketcher')
INSERT [dbo].[Singer] ([SingerID], [SingerName]) VALUES (N'tim', N'Tim Sharp')
GO
INSERT [dbo].[SingerVocalGroup] ([VocalGroupID], [SingerID]) VALUES (1, N'sam')
INSERT [dbo].[SingerVocalGroup] ([VocalGroupID], [SingerID]) VALUES (2, N'gabe')
INSERT [dbo].[SingerVocalGroup] ([VocalGroupID], [SingerID]) VALUES (3, N'gabe')
INSERT [dbo].[SingerVocalGroup] ([VocalGroupID], [SingerID]) VALUES (3, N'shawna')
INSERT [dbo].[SingerVocalGroup] ([VocalGroupID], [SingerID]) VALUES (4, N'shawna')
INSERT [dbo].[SingerVocalGroup] ([VocalGroupID], [SingerID]) VALUES (5, N'tim')
GO
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'achristianhome', N'A Christian Home')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'aintnograve', N'Ain''t No Grave')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'allglorybetochrist', N'All Glory Be to Christ')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'amazinggrace', N'Amazing Grace')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ancientwords', N'Ancient Words')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'anewname', N'A New Name in Glory')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'angelband', N'O Come, Angel Band')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'areyouwashed', N'Are You Washed in the Blood')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'asiam', N'Just As I Am')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'asthedeer', N'As the Deer Paneth for the Water')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'atcalvary', N'At Calvary')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'atthecross', N'At the Cross')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'awayinamanger', N'Away in a Manger')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'beautifulstar', N'Beautiful Star of Bethlehem')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'becausehelives', N'Because He LIves')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'bethoumyvision', N'Be Thou My Vision')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'beulahland', N'Beulah Land')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'blessedassurance', N'Blessed Assurance')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'blessedbethename', N'Blessed Be the Name of Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'blessingsonme', N'Thank You Lord for Your Blessings on Me')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'bloodcovered', N'The Blood Covered it All')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'borntoserve', N'Born to Serve the Lord')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'burdensarelifted', N'Burdens are Lifted at Calvary')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'bythemark', N'By the Mark')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'canaansland', N'On My Way to Canaan''s Land')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'cantevenwalk', N'I Can''t Even Walk Without You Holding My Hand')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'chainbreaker', N'Chain Breaker')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'closerwalk', N'Just a Closer Walk With Thee')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'comeanddine', N'Come and Dine')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'comechurch', N'Come Church Now Rise Up')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'comeemmanuel', N'O Come, O Come, Emmanuel')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'comejesuscome', N'Come Jesus Come')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'comemorning', N'Come Morning')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'comethoufount', N'Come Thou Fount')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'comeuntome', N'Come Unto Me')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'comforterhascome', N'The Comforter Has Come')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'cominghome', N'Lord I''m Coming Home')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'darkesthour', N'The Darkest Hour is Just Before Dawn')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'dolord', N'Do Lord')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'dontknowwhat', N'I Don''t Know What You Came to Do')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'downatthecross', N'Down at the Cross')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'downtotheriver', N'Down to the River to Pray')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'doxology', N'Doxology')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'dwellinginbeulah', N'Dwelling in Beulah Land')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'easterngate', N'The Eastern Gate')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'everybodywillbehappy', N'Everybody Will Be Happy')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'everykneeshallbow', N'Every Knee Shall Bow')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'fairestofall', N'Fairest of All (Psalm 45)')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'familyofgod', N'Family of God')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'fartheralong', N'Farther Along')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'fartoowonderful', N'Far Too Wonderful (Psalm 139)')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'fathersworld', N'This is My Father''s World')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'firingline', N'Keep on the Firing Line')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'fountainfilled', N'There is a Fountain Filled with Blood')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'glorylandway', N'The Gloryland Way')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'godissogood', N'God is So Good')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'godleadsus', N'God Leads Us Along')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'gospelship', N'Gospel Ship')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'gotellit', N'Go Tell It on the Mountain')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'gracelikerain', N'Grace Like Rain')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'greatisthyfaithfulness', N'Great is Thy Faithfulness')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'greatlightofworld', N'Great Light of the World')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'hallelujahsavior', N'Hallelujah, What a Savior')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'havenofrest', N'The Haven of Rest')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'havethineownway', N'Have Thine Own Way Lord')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'heabides', N'He Abides')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'heavencamedown', N'Heaven Came Down')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'heavenlysunlight', N'Heavenly Sunlight')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'heavensjubilee', N'Heaven''s Jubilee')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'helives', N'He LIves')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'helpisonway', N'Help is on the Way')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'hereiamtoworship', N'Here I Am to Worship')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'hesetmefree', N'He Set Me Free')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'hetouchedme', N'He Touched Me')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'higherground', N'Higher Ground')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'highways', N'In the Highways')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'hislovereaches', N'His Love Reaches High')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'hisnameiswonderful', N'His Name is Wonderful')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'holdtogodshand', N'Hold to God''s Unchanging Hand')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'holyholyholy', N'Holy Holy Holy')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'holyshroud', N'Holy Shroud')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'homesick', N'I''ve Never Been This Homesick Before')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'hourofprayer', N'Sweet Hour of Prayer')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'howbeautifulheaven', N'How Beautiful Heaven Must Be')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'howgreatthouart', N'How Great Thou Art')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'humblethyself', N'Humble Thyself/Awesome God')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'iamblessed', N'I Am Blessed')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'iamthine', N'I Am Thine, O Lord')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'idratherhavejesus', N'I''d Rather Have Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ifeelliketraveling', N'I Feel Like Traveling On')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ifgodisdead', N'If God is Dead Who is This Living In My Soul')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ihavecome', N'I Have Come')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ihavedecided', N'I Have Decided to Follow Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'iknowthatmyredeemer', N'I Know that My Redeemer Lives')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'illflyaway', N'I''ll Fly Away')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'imgonnabemovin', N'I''m Gonna Be Movin')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'imsoglad', N'I''m So Glad Jesus Lifted Me')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'inevershall', N'I Never Shall Forget the Day')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'inmylifelord', N'In My Life Lord')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'inthegarden', N'In the Garden')
GO
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'isawthelight', N'I Saw the Light')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ishallnotbe', N'I Shall Not Be Moved')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'isurrenderall', N'I Surrender All')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'itiswell', N'It is Well With My Soul')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'iwantjesus', N'I Want Jesus to Walk with Me')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'iwanttoknowmore', N'I Want to Know More About my Lord')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'iwanttostroll', N'I Want to Stroll Over Heaven with You')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'iwillarise', N'I Will Arise and Go to Jesus (Come Ye Sinners)')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'iwillenterhisgates', N'I Will Enter His Gates')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'jesusdontturn', N'Jesus Don''t Turn Me Away')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'jesusholdmyhand', N'Jesus, Hold My Hand')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'jesusislord', N'Jesus Is Lord of All')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'jesusloveschildren', N'Jesus Loves the Little Children')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'jesuslovesme', N'Jesus Loves Me')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'jesuspaidall', N'Jesus Paid it All')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'joytoworld', N'Joy to the World')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'joyunspeakable', N'Joy Unspeakable')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'lambofgod', N'Lamb of God')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'leaningarms', N'Leaning on the Everlasting Arms')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'lighthouse', N'The LightHouse')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'lightofmine', N'This Little Light of Mine')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'littletalk', N'Just a Little Talk with Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'livingbyfaith', N'Living By Faith')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'longblacktrain', N'Long Black Train')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'lookwhatthelord', N'Look What the Lord Has Done')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'lordofhosts', N'Lord of Hosts (Psalm 46)')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'lordsarmy', N'I''m in the Lord''s Army')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'lordsmyshepherd', N'The Lord''s My Shepherd')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'lordsprayer', N'The Lord''s Prayer')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'loveofgod', N'The Love of God')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'loverolled', N'Love Rolled Away the Stone')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'mainline', N'Jesus on the Main Line')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'mansionhilltop', N'Mansion Over the Hilltop')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'mightygod', N'What a Mighty God We Serve')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'nearthecross', N'Near the Cross')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'nevermeetagain', N'If We Never Meet Again')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'nohidingplace', N'There''s No Hiding Place')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'nonotone', N'No Not One')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'nothingbutblood', N'Nothing but the Blood')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'notmyhome', N'This World is Not My Home')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ocomeallye', N'O Come All Ye Faithful')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'oholynight', N'O Holy Night')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ohowilovejesus', N'O How I Love Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'oiwanttosee', N'O I Want To See Him')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'oldaccount', N'The Old Account Was Settled Long Ago')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'oldtimereligion', N'Old Time Religion')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'onedayatatime', N'One Day at a Time')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'onlytrusthim', N'Only Trust Him')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'opentheeyes', N'Open the Eyes of My Heart')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'overingloryland', N'Just Over in the Glory Land')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'passmenot', N'Pass Me Not, O Gentle Savior')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'peacevalley', N'Peace in the Valley')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'powerintheblood', N'There is Power in the Blood')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'praisehim', N'Praise Him')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'preciouslord', N'Precious Lord, Take My Hand')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'preciousmemories', N'Precious Memories')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'radioon', N'Turn Your Radio On')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'reviveus', N'Revive Us Again')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'riveroflife', N'I''ve Got a River of LIfe')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'rockmoses', N'On the Rock Where Moses Stood')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'rockofages', N'Rock of Ages')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'ruggedcross', N'The Old Rugged Cross')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'sanctuary', N'Sanctuary')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'savingmysoul', N'Thank You Lord for Saving My Soul')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'saviorslove', N'My Savior''s Love')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'seekyefirst', N'Seek Ye First the Kingdom of God')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'sendthelight', N'Send the Light')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'shallwegather', N'Shall We Gather at the River')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'shoesoffmoses', N'Take Your Shoes Off Moses')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'silentnight', N'Silent Night')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'sincejesus', N'Since Jesus Came Into My Heart')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'singuntothelord', N'Sing Unto the Lord (Psalm 98)')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'softlytenderly', N'Softly and Tenderly')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'solidrock', N'The Solid Rock')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'somebodytouchedme', N'Somebody Touched Me')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'somethingaboutname', N'Something About That Name')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'soonandverysoon', N'Soon and Very Soon')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'standingpromises', N'Standing on the Promises')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'standup', N'Stand Up for Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'stepintowater', N'Step into the Water')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'stones', N'Stones')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'stormpassesby', N'Til the Storm Passes By')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'stormybanks', N'On Jordan''s Stormy Banks')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'storyofjesus', N'Tell Me the Story of Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'sunnyside', N'Keep on the Sunny Side')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'sweetbyandby', N'Sweet By and By')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'takemylife', N'Take My Life and Let it Be')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'takethesehands', N'Take These Hands')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'tasteandsee', N'Taste and See (Psalm 34)')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'theangelscried', N'The Angels Cried')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'thebible', N'The B-I-B-L-E')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'thereisapeace', N'There is a Peace')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'thousandtongues', N'O for a Thousand Tongues to Sing')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'throughthefire', N'Through the FIre')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'tissosweet', N'Tis So Sweet to Trust in Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'toetotoe', N'Toe to Toe with the Devil')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'tothetable', N'To the Table')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'turnyoureyes', N'Turn Your Eyes Upon Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'twohands', N'Two Hands')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'uncloudyday', N'Uncloudy Day')
GO
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'victoryinjesus', N'Victory In Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'walkaround', N'Walk Around Me Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wellwork', N'We''ll Work Til Jesus Comes')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wereyouthere', N'Were You There When They Crucified My Lord')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wevegotpower', N'We''ve Got the Power')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'whataday', N'What a Day That Will Be')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'whatafriend', N'What a Friend We Have in Jesus')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'whatchild', N'What Child Is This')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wheniseeblood', N'When I See the Blood')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'whentheroll', N'When the Roll is Called Up Yonder')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'whenthesaints', N'When the Saints Go Marching In')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'whenweall', N'When We All Get to Heaven')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wherecouldigo', N'Where Could I Go')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'whereeverheleads', N'Wherever He Leads I''ll Go')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wheretheroses', N'Where the Roses Never Fade')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wherethesoul', N'Where the Soul Never Dies')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'willthecircle', N'Will the Circle Be Unbroken')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wingsofdove', N'On the Wings of a Dove')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'withouthim', N'Without Him')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wonderfulwords', N'Wonderful Words of Life')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wontitbewonderful', N'Won''t It Be Wonderful There')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'workingonbuilding', N'I''m Working on a Building')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'worthitafterall', N'It''ll Be Worth It After All')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wouldnotbedenied', N'I Would Not Be Denied')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'wouldnttakenothing', N'I Wouldn''t Take Nothing for my Journey Now')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'youbetterrun', N'You Better Run (City of Refuge)')
INSERT [dbo].[Song] ([SongID], [SongName]) VALUES (N'yourbodyistemple', N'Your Body is a Temple of the Lord')
GO
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'achristianhome1', N'achristianhome', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'aintnograve1', N'aintnograve', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'allglorybetochrist1', N'allglorybetochrist', N'F  ', N'Gabe strings')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'amazinggrace1', N'amazinggrace', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ancientwords1', N'ancientwords', N'F  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'anewname1', N'anewname', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'angelband1', N'angelband', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'areyouwashed1', N'areyouwashed', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'asiam1', N'asiam', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'asthedeer1', N'asthedeer', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'atcalvary1', N'atcalvary', N'F  ', N'Capo 1st fret E')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'atthecross1', N'atthecross', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'awayinamanger1', N'awayinamanger', N'E  ', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'beautifulstar1', N'beautifulstar', N'E  ', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'becausehelives1', N'becausehelives', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'bethoumyvision1', N'bethoumyvision', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'beulahland1', N'beulahland', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'blessedassurance1', N'blessedassurance', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'blessedbethename1', N'blessedbethename', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'blessingsonme1', N'blessingsonme', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'bloodcovered1', N'bloodcovered', NULL, N'Soundtrack')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'borntoserve1', N'borntoserve', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'burdensarelifted1', N'burdensarelifted', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'bythemark1', N'bythemark', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'canaansland1', N'canaansland', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'cantevenwalk1', N'cantevenwalk', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'chainbreaker1', N'chainbreaker', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'closerwalk1', N'closerwalk', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'comeanddine1', N'comeanddine', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'comechurch1', N'comechurch', N'Am ', N'Sam songs')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'comeemmanuel1', N'comeemmanuel', N'C#m', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'comejesuscome1', N'comejesuscome', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'comemorning1', N'comemorning', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'comethoufount1', N'comethoufount', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'comeuntome1', N'comeuntome', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'comforterhascome1', N'comforterhascome', N'A  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'cominghome1', N'cominghome', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'darkesthour1', N'darkesthour', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'dolord1', N'dolord', N'G  ', N'Can be played with Somebody Touched Me')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'dontknowwhat1', N'dontknowwhat', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'downatthecross1', N'downatthecross', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'downtotheriver1', N'downtotheriver', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'downtotheriver2', N'downtotheriver', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'doxology1', N'doxology', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'dwellinginbeulah1', N'dwellinginbeulah', NULL, N'NEW')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'easterngate1', N'easterngate', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'everybodywillbehappy1', N'everybodywillbehappy', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'everykneeshallbow1', N'everykneeshallbow', N'Am ', N'Sam songs')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'fairestofall1', N'fairestofall', NULL, N'NEW')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'familyofgod1', N'familyofgod', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'fartheralong1', N'fartheralong', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'fartoowonderful1', N'fartoowonderful', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'fathersworld1', N'fathersworld', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'firingline1', N'firingline', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'fountainfilled1', N'fountainfilled', N'A  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'glorylandway1', N'glorylandway', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'godissogood1', N'godissogood', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'godleadsus1', N'godleadsus', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'gospelship1', N'gospelship', N'F# ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'gotellit1', N'gotellit', N'G  ', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'gracelikerain1', N'gracelikerain', N'C#m', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'greatisthyfaithfulness1', N'greatisthyfaithfulness', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'greatlightofworld1', N'greatlightofworld', N'E  ', N'Capo 4th fret in C')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'hallelujahsavior1', N'hallelujahsavior', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'havenofrest1', N'havenofrest', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'havethineownway1', N'havethineownway', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'heabides1', N'heabides', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'heavencamedown1', N'heavencamedown', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'heavenlysunlight1', N'heavenlysunlight', N'A  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'heavensjubilee1', N'heavensjubilee', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'helives1', N'helives', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'helpisonway1', N'helpisonway', NULL, NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'hereiamtoworship1', N'hereiamtoworship', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'hesetmefree1', N'hesetmefree', N'G  ', N'Can be played with Jesus on the Main Line')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'hetouchedme1', N'hetouchedme', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'higherground1', N'higherground', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'highways1', N'highways', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'hislovereaches1', N'hislovereaches', N'D  ', N'Sam songs')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'hisnameiswonderful1', N'hisnameiswonderful', N'C  ', N'Can be played with Without Him')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'holdtogodshand1', N'holdtogodshand', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'holyholyholy1', N'holyholyholy', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'holyshroud1', N'holyshroud', N'Am ', N'Sam songs')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'homesick1', N'homesick', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'hourofprayer1', N'hourofprayer', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'howbeautifulheaven1', N'howbeautifulheaven', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'howgreatthouart1', N'howgreatthouart', N'F  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'humblethyself1', N'humblethyself', N'Em ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'iamblessed1', N'iamblessed', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'iamthine1', N'iamthine', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'idratherhavejesus1', N'idratherhavejesus', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ifeelliketraveling1', N'ifeelliketraveling', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ifgodisdead1', N'ifgodisdead', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ihavecome1', N'ihavecome', N'Bm ', N'Sam songs')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ihavedecided1', N'ihavedecided', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'iknowthatmyredeemer1', N'iknowthatmyredeemer', N'Em ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'illflyaway1', N'illflyaway', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'imgonnabemovin1', N'imgonnabemovin', N'G  ', N'NEW')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'imsoglad1', N'imsoglad', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'inevershall1', N'inevershall', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'inmylifelord1', N'inmylifelord', NULL, N'Missing')
GO
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'inthegarden1', N'inthegarden', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'isawthelight1', N'isawthelight', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ishallnotbe1', N'ishallnotbe', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'isurrenderall1', N'isurrenderall', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'itiswell1', N'itiswell', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'itiswell2', N'itiswell', N'Bb ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'iwantjesus1', N'iwantjesus', N'Cm ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'iwanttoknowmore1', N'iwanttoknowmore', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'iwanttostroll1', N'iwanttostroll', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'iwillarise1', N'iwillarise', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'iwillenterhisgates1', N'iwillenterhisgates', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'jesusdontturn1', N'jesusdontturn', N'D  ', N'NEW')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'jesusholdmyhand1', N'jesusholdmyhand', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'jesusislord1', N'jesusislord', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'jesusloveschildren1', N'jesusloveschildren', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'jesuslovesme1', N'jesuslovesme', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'jesuspaidall1', N'jesuspaidall', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'joytoworld1', N'joytoworld', N'A  ', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'joyunspeakable1', N'joyunspeakable', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'lambofgod1', N'lambofgod', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'leaningarms1', N'leaningarms', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'lighthouse1', N'lighthouse', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'lightofmine1', N'lightofmine', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'littletalk1', N'littletalk', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'livingbyfaith1', N'livingbyfaith', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'longblacktrain1', N'longblacktrain', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'lookwhatthelord1', N'lookwhatthelord', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'lordofhosts1', N'lordofhosts', N'E  ', N'Capo 2nd fret in G')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'lordsarmy1', N'lordsarmy', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'lordsmyshepherd1', N'lordsmyshepherd', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'lordsprayer1', N'lordsprayer', N'D  ', N'Capo 3rd fret in G')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'loveofgod1', N'loveofgod', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'loverolled1', N'loverolled', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'mainline1', N'mainline', N'C  ', N'Can be played with He Set Me Free')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'mansionhilltop1', N'mansionhilltop', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'mightygod1', N'mightygod', N'C  ', N'Can be played with I Will Enter His Gates')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'nearthecross1', N'nearthecross', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'nevermeetagain1', N'nevermeetagain', N'F  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'nohidingplace1', N'nohidingplace', N'A  ', N'Gabe organ')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'nonotone1', N'nonotone', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'nothingbutblood1', N'nothingbutblood', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'notmyhome1', N'notmyhome', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ocomeallye1', N'ocomeallye', N'G  ', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'oholynight1', N'oholynight', N'G  ', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ohowilovejesus1', N'ohowilovejesus', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'oiwanttosee1', N'oiwanttosee', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'oldaccount1', N'oldaccount', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'oldtimereligion1', N'oldtimereligion', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'onedayatatime1', N'onedayatatime', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'onlytrusthim1', N'onlytrusthim', N'F  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'opentheeyes1', N'opentheeyes', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'overingloryland1', N'overingloryland', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'passmenot1', N'passmenot', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'peacevalley1', N'peacevalley', N'A  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'powerintheblood1', N'powerintheblood', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'praisehim1', N'praisehim', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'preciouslord1', N'preciouslord', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'preciousmemories1', N'preciousmemories', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'radioon1', N'radioon', N'F  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'reviveus1', N'reviveus', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'riveroflife1', N'riveroflife', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'rockmoses1', N'rockmoses', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'rockofages1', N'rockofages', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'ruggedcross1', N'ruggedcross', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'sanctuary1', N'sanctuary', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'savingmysoul1', N'savingmysoul', N'D  ', N'Can be played with Something About That Name')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'saviorslove1', N'saviorslove', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'seekyefirst1', N'seekyefirst', N'D  ', N'Same folder as Standing on the Promises')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'sendthelight1', N'sendthelight', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'shallwegather1', N'shallwegather', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'shoesoffmoses1', N'shoesoffmoses', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'shoesoffmoses2', N'shoesoffmoses', N'F  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'silentnight1', N'silentnight', N'G  ', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'sincejesus1', N'sincejesus', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'singuntothelord1', N'singuntothelord', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'softlytenderly1', N'softlytenderly', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'solidrock1', N'solidrock', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'somebodytouchedme1', N'somebodytouchedme', N'G  ', N'Can be played with Do Lord')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'somethingaboutname1', N'somethingaboutname', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'soonandverysoon1', N'soonandverysoon', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'standingpromises1', N'standingpromises', N'G  ', N'Same folder as Seek Ye First the Kingdom of God')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'standup1', N'standup', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'stepintowater1', N'stepintowater', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'stones1', N'stones', N'E  ', N'Sam songs')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'stormpassesby1', N'stormpassesby', N'A  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'stormybanks1', N'stormybanks', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'storyofjesus1', N'storyofjesus', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'sunnyside1', N'sunnyside', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'sweetbyandby1', N'sweetbyandby', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'takemylife1', N'takemylife', N'F  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'takethesehands1', N'takethesehands', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'tasteandsee1', N'tasteandsee', N'D  ', N'Capo 3rd fret in G')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'theangelscried1', N'theangelscried', N'D  ', N'Christmas')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'thebible1', N'thebible', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'thereisapeace1', N'thereisapeace', N'D  ', N'Gabe strings. Capo 2nd fret in C')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'thousandtongues1', N'thousandtongues', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'throughthefire1', N'throughthefire', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'tissosweet1', N'tissosweet', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'toetotoe1', N'toetotoe', N'D  ', N'NEW')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'tothetable1', N'tothetable', N'G  ', NULL)
GO
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'tothetable2', N'tothetable', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'tothetable3', N'tothetable', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'turnyoureyes1', N'turnyoureyes', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'twohands1', N'twohands', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'uncloudyday1', N'uncloudyday', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'victoryinjesus1', N'victoryinjesus', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'walkaround1', N'walkaround', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wellwork1', N'wellwork', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wereyouthere1', N'wereyouthere', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wevegotpower1', N'wevegotpower', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'whataday1', N'whataday', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'whatafriend1', N'whatafriend', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'whatchild1', N'whatchild', N'Am ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wheniseeblood1', N'wheniseeblood', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'whentheroll1', N'whentheroll', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'whenthesaints1', N'whenthesaints', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'whenweall1', N'whenweall', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wherecouldigo1', N'wherecouldigo', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'whereeverheleads1', N'whereeverheleads', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wheretheroses1', N'wheretheroses', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wherethesoul1', N'wherethesoul', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'willthecircle1', N'willthecircle', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wingsofdove1', N'wingsofdove', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'withouthim1', N'withouthim', N'C  ', N'Can be played with His Name is Wonderful')
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wonderfulwords1', N'wonderfulwords', N'D  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wontitbewonderful1', N'wontitbewonderful', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'workingonbuilding1', N'workingonbuilding', N'A  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'worthitafterall1', N'worthitafterall', N'E  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wouldnotbedenied1', N'wouldnotbedenied', N'F  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'wouldnttakenothing1', N'wouldnttakenothing', N'C  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'youbetterrun1', N'youbetterrun', N'G  ', NULL)
INSERT [dbo].[SongVersion] ([SongVersionID], [SongID], [SongKey], [Notes]) VALUES (N'yourbodyistemple1', N'yourbodyistemple', N'C  ', NULL)
GO
INSERT [dbo].[VocalGroup] ([VocalGroupID], [VocalGroupType]) VALUES (1, N'Solo')
INSERT [dbo].[VocalGroup] ([VocalGroupID], [VocalGroupType]) VALUES (2, N'Solo')
INSERT [dbo].[VocalGroup] ([VocalGroupID], [VocalGroupType]) VALUES (3, N'Duet')
INSERT [dbo].[VocalGroup] ([VocalGroupID], [VocalGroupType]) VALUES (4, N'Solo')
INSERT [dbo].[VocalGroup] ([VocalGroupID], [VocalGroupType]) VALUES (5, N'Solo')
GO
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'angelband1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'areyouwashed1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'beautifulstar1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'blessedassurance1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'cantevenwalk1', 2)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'comemorning1', 2)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'comethoufount1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'comforterhascome1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'downatthecross1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'downtotheriver1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'fartheralong1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'firingline1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'glorylandway1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'godleadsus1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'havethineownway1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'heabides1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'heavensjubilee1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'helpisonway1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'highways1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'holyholyholy1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'homesick1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'iamblessed1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'iwantjesus1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'jesuspaidall1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'littletalk1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'longblacktrain1', 2)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'lordofhosts1', 3)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'lordsmyshepherd1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'loveofgod1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'nevermeetagain1', 2)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'ocomeallye1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'oiwanttosee1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'oldtimereligion1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'onedayatatime1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'opentheeyes1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'overingloryland1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'radioon1', 2)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'ruggedcross1', 4)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'seekyefirst1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'sendthelight1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'singuntothelord1', 3)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'solidrock1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'soonandverysoon1', 4)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'stones1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'stormybanks1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'tissosweet1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'twohands1', 2)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'whentheroll1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'whenthesaints1', 1)
INSERT [dbo].[VocalGroupSongVersion] ([SongVersionID], [VocalGroupID]) VALUES (N'wheretheroses1', 2)
GO
ALTER TABLE [dbo].[SetListSongVersion]  WITH CHECK ADD  CONSTRAINT [FK_SetListSongVersion_SetList] FOREIGN KEY([SetListID])
REFERENCES [dbo].[SetList] ([SetListID])
GO
ALTER TABLE [dbo].[SetListSongVersion] CHECK CONSTRAINT [FK_SetListSongVersion_SetList]
GO
ALTER TABLE [dbo].[SetListSongVersion]  WITH CHECK ADD  CONSTRAINT [FK_SetListSongVersion_SongVersion] FOREIGN KEY([SongVersionID])
REFERENCES [dbo].[SongVersion] ([SongVersionID])
GO
ALTER TABLE [dbo].[SetListSongVersion] CHECK CONSTRAINT [FK_SetListSongVersion_SongVersion]
GO
ALTER TABLE [dbo].[SingerVocalGroup]  WITH CHECK ADD  CONSTRAINT [FK_SingerVocalGroup_Singer] FOREIGN KEY([SingerID])
REFERENCES [dbo].[Singer] ([SingerID])
GO
ALTER TABLE [dbo].[SingerVocalGroup] CHECK CONSTRAINT [FK_SingerVocalGroup_Singer]
GO
ALTER TABLE [dbo].[SingerVocalGroup]  WITH CHECK ADD  CONSTRAINT [FK_SingerVocalGroup_VocalGroup] FOREIGN KEY([VocalGroupID])
REFERENCES [dbo].[VocalGroup] ([VocalGroupID])
GO
ALTER TABLE [dbo].[SingerVocalGroup] CHECK CONSTRAINT [FK_SingerVocalGroup_VocalGroup]
GO
ALTER TABLE [dbo].[SongVersion]  WITH CHECK ADD  CONSTRAINT [FK_SongVersion_Song] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
GO
ALTER TABLE [dbo].[SongVersion] CHECK CONSTRAINT [FK_SongVersion_Song]
GO
ALTER TABLE [dbo].[VocalGroupSongVersion]  WITH CHECK ADD  CONSTRAINT [FK_VocalGroupSongVersion_SongVersion] FOREIGN KEY([SongVersionID])
REFERENCES [dbo].[SongVersion] ([SongVersionID])
GO
ALTER TABLE [dbo].[VocalGroupSongVersion] CHECK CONSTRAINT [FK_VocalGroupSongVersion_SongVersion]
GO
ALTER TABLE [dbo].[VocalGroupSongVersion]  WITH CHECK ADD  CONSTRAINT [FK_VocalGroupSongVersion_VocalGroup] FOREIGN KEY([VocalGroupID])
REFERENCES [dbo].[VocalGroup] ([VocalGroupID])
GO
ALTER TABLE [dbo].[VocalGroupSongVersion] CHECK CONSTRAINT [FK_VocalGroupSongVersion_VocalGroup]
GO
USE [master]
GO
ALTER DATABASE [HilltopMusic] SET  READ_WRITE 
GO
