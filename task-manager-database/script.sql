USE [TaskManagerDatabase]
GO
/****** Object:  Table [dbo].[DailyStatistics]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyStatistics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CoffeAmount] [int] NULL,
	[TimeOnProjects] [bigint] NULL,
	[TasksDone] [int] NULL,
	[DailyTasksAmount] [int] NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quotes]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sentence] [varchar](2048) NULL,
	[Author] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TagPriority]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TagPriority](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NULL,
	[Name] [varchar](63) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[PriorityID] [int] NULL,
	[ParentTagID] [int] NULL,
	[UserID] [int] NOT NULL,
	[Color] [varchar](7) NULL,
 CONSTRAINT [PK__Tags__3214EC27F1656F38] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](512) NOT NULL,
	[TaskRegisterID] [int] NULL CONSTRAINT [DF_Tasks_TaskRegisterID]  DEFAULT (NULL),
	[Deadline] [date] NULL,
	[DateOfCreation] [date] NOT NULL DEFAULT (getdate()),
	[IsDone] [bit] NOT NULL DEFAULT ((0)),
	[Reminder] [bit] NOT NULL DEFAULT ((0)),
	[IsInArchive] [bit] NOT NULL DEFAULT ((0)),
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TasksRegisters]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TasksRegisters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[UserID] [int] NULL,
	[Deadline] [date] NULL,
	[DateOfCreation] [date] NOT NULL DEFAULT (getdate()),
	[IsInArchive] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TasksRegisterStatistics]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TasksRegisterStatistics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskRegisterID] [int] NULL,
	[TimeOnProject] [bigint] NULL,
	[Percentage] [numeric](5, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TasksTags]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TasksTags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](128) NOT NULL,
	[LastName] [varchar](128) NOT NULL,
	[Username] [varchar](128) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[PasswordHash] [varbinary](64) NOT NULL,
	[PasswordSalt] [varbinary](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersStatistics]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersStatistics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UpcomingTasks] [int] NULL,
	[TotalTasksDone] [int] NULL,
	[TotalCoffeAmount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[TasksTagsMap]    Script Date: 14.02.2018 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TasksTagsMap]
AS
SELECT        dbo.Tags.UserID, dbo.Tags.ParentTagID, dbo.Tags.PriorityID, dbo.Tags.Name, dbo.TasksTags.ID, dbo.TasksTags.TagID, dbo.TasksTags.TaskID, dbo.TagPriority.Value AS PriorityValue, dbo.TagPriority.Name AS PriorityName, 
                         dbo.Tags.Color
FROM            dbo.Tags INNER JOIN
                         dbo.TasksTags ON dbo.Tags.ID = dbo.TasksTags.TagID INNER JOIN
                         dbo.TagPriority ON dbo.Tags.PriorityID = dbo.TagPriority.ID



GO
SET IDENTITY_INSERT [dbo].[Quotes] ON 

INSERT [dbo].[Quotes] ([ID], [Sentence], [Author]) VALUES (1, N'Czytanie książek to najpiękniejsza zabawa, jaką sobie ludzkość wymyśliła', N'Wisława Szymborska')
INSERT [dbo].[Quotes] ([ID], [Sentence], [Author]) VALUES (2, N'Książki są lustrem: widzisz w nich tylko to co, już masz w sobie.', N'Carlos Ruiz Zafón')
INSERT [dbo].[Quotes] ([ID], [Sentence], [Author]) VALUES (3, N'Kto czyta książki, żyje podwójnie.', N'Umberto Eco')
INSERT [dbo].[Quotes] ([ID], [Sentence], [Author]) VALUES (4, N'Pozbierać jest się dziesięć razy trudniej, niż rozsypać.', N'Suzanne Collins')
INSERT [dbo].[Quotes] ([ID], [Sentence], [Author]) VALUES (5, N'Życie jest jak pudełko czekoladek - nigdy nie wiesz, co ci się trafi.', N'Winston Groom')
INSERT [dbo].[Quotes] ([ID], [Sentence], [Author]) VALUES (6, N'Nigdy nie ma się drugiej okazji, żeby zrobić pierwsze wrażenie.', N'Andrzej Sapkowski')
INSERT [dbo].[Quotes] ([ID], [Sentence], [Author]) VALUES (7, N'To możliwość spełnienia marzeń sprawia, że życie jest tak fascynujące.', N'Paulo Coelho')
INSERT [dbo].[Quotes] ([ID], [Sentence], [Author]) VALUES (8, N'Lepiej bez celu iść naprzód niż bez celu stać w miejscu, a z pewnością o niebo lepiej, niż bez celu się cofać.', N'Andrzej Sapkowski')
SET IDENTITY_INSERT [dbo].[Quotes] OFF
SET IDENTITY_INSERT [dbo].[TagPriority] ON 

INSERT [dbo].[TagPriority] ([ID], [Value], [Name]) VALUES (1, 1, N'Bardzo ważne')
INSERT [dbo].[TagPriority] ([ID], [Value], [Name]) VALUES (2, 2, N'Ważne')
INSERT [dbo].[TagPriority] ([ID], [Value], [Name]) VALUES (3, 3, N'Normalne')
SET IDENTITY_INSERT [dbo].[TagPriority] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([ID], [Name], [PriorityID], [ParentTagID], [UserID], [Color]) VALUES (5, N'Na już', 1, NULL, 1, N'#8c2164')
INSERT [dbo].[Tags] ([ID], [Name], [PriorityID], [ParentTagID], [UserID], [Color]) VALUES (6, N'Weekend', 2, NULL, 1, N'#1cb2f3')
INSERT [dbo].[Tags] ([ID], [Name], [PriorityID], [ParentTagID], [UserID], [Color]) VALUES (7, N'Czas wolny', 3, NULL, 1, N'#20dd46')
INSERT [dbo].[Tags] ([ID], [Name], [PriorityID], [ParentTagID], [UserID], [Color]) VALUES (8, N'Zdrowie', 2, NULL, 1, N'#1cb2f3')
INSERT [dbo].[Tags] ([ID], [Name], [PriorityID], [ParentTagID], [UserID], [Color]) VALUES (9, N'Książka', 2, NULL, 1, N'#1cb2f3')
INSERT [dbo].[Tags] ([ID], [Name], [PriorityID], [ParentTagID], [UserID], [Color]) VALUES (11, N'Komiks', 3, 9, 1, N'#20dd46')
INSERT [dbo].[Tags] ([ID], [Name], [PriorityID], [ParentTagID], [UserID], [Color]) VALUES (12, N'Podstawy', 1, NULL, 1, N'#8c2164')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (51, N'Naprawić łódź z Noe/Mojżeszem', 1, CAST(N'2018-01-12' AS Date), CAST(N'2018-01-21' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (54, N'Nauka na bazy danych - ogarnąć wszystkie podstawowe zapytania', NULL, CAST(N'2018-02-28' AS Date), CAST(N'2018-01-21' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (55, N'Sprowadzić plagę na Egipt', NULL, CAST(N'2018-03-29' AS Date), CAST(N'2018-01-21' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (61, N'Dodać coś', NULL, CAST(N'2018-01-31' AS Date), CAST(N'2018-01-21' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (65, N'testowezadanie', NULL, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-21' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (71, N'Testowezadanie', NULL, CAST(N'2018-01-30' AS Date), CAST(N'2018-01-21' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (73, N'Stworzyć rysunek budynku na sieci', NULL, CAST(N'2018-01-31' AS Date), CAST(N'2018-01-21' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (74, N'Stworzyć rysunek budynku do pracy', 1, CAST(N'2018-01-31' AS Date), CAST(N'2018-01-21' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (75, N'Dodaję zadanie', NULL, CAST(N'2018-02-01' AS Date), CAST(N'2018-01-23' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (77, N'Test bez ddl i rejestru - edytowany', NULL, CAST(N'2018-02-25' AS Date), CAST(N'2018-01-23' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (79, N'Zadanie bez rejestru', NULL, CAST(N'2018-01-27' AS Date), CAST(N'2018-01-23' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (84, N'Naprawić arkę z Noe', NULL, NULL, CAST(N'2018-01-23' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (87, N'Naprawić łódź z Noe', 1, CAST(N'2018-01-31' AS Date), CAST(N'2018-01-23' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (89, N'Testowanie zadanek po przerwie', NULL, CAST(N'2018-02-24' AS Date), CAST(N'2018-02-07' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (90, N'Coś na studiaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, CAST(N'2018-01-12' AS Date), CAST(N'2018-02-14' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (91, N'Naprawić łódź z Noe/Mojżeszem', 1, CAST(N'2018-01-12' AS Date), CAST(N'2018-02-14' AS Date), 1, 0, 0, 1)
INSERT [dbo].[Tasks] ([ID], [Name], [TaskRegisterID], [Deadline], [DateOfCreation], [IsDone], [Reminder], [IsInArchive], [UserID]) VALUES (97, N'Praca nad aplikacją webową do portfolio, stworzyć wersję desktopową, potem mobilną, refaktoryzacja kodu, usunięcie niepotrzebnych linijek', 1, CAST(N'2018-02-14' AS Date), CAST(N'2018-02-14' AS Date), 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET IDENTITY_INSERT [dbo].[TasksRegisters] ON 

INSERT [dbo].[TasksRegisters] ([ID], [Name], [UserID], [Deadline], [DateOfCreation], [IsInArchive]) VALUES (1, N'Studia', 1, CAST(N'2018-05-05' AS Date), CAST(N'2018-01-21' AS Date), 0)
INSERT [dbo].[TasksRegisters] ([ID], [Name], [UserID], [Deadline], [DateOfCreation], [IsInArchive]) VALUES (2, N'Praca', 1, NULL, CAST(N'2018-01-21' AS Date), 0)
INSERT [dbo].[TasksRegisters] ([ID], [Name], [UserID], [Deadline], [DateOfCreation], [IsInArchive]) VALUES (3, N'Podróże', 1, NULL, CAST(N'2018-01-23' AS Date), 0)
SET IDENTITY_INSERT [dbo].[TasksRegisters] OFF
SET IDENTITY_INSERT [dbo].[TasksTags] ON 

INSERT [dbo].[TasksTags] ([ID], [TaskID], [TagID]) VALUES (2, 51, 6)
INSERT [dbo].[TasksTags] ([ID], [TaskID], [TagID]) VALUES (3, 51, 7)
INSERT [dbo].[TasksTags] ([ID], [TaskID], [TagID]) VALUES (5, 54, 7)
INSERT [dbo].[TasksTags] ([ID], [TaskID], [TagID]) VALUES (6, 61, 9)
SET IDENTITY_INSERT [dbo].[TasksTags] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (1, N'Szymon', N'Konopka', N'admin', N'samzonee@gmail.com', 0x7E047030E50D366F49A5648F454E24ADD13E174987F0E0B95AA1B49764AE6D5B3E9D6D45DC60F3B4BF3EA2A906FC06E811DFA568649E449CB7C2D26736E1E036, 0x193B5727E2D5D1398A84467B407EF93164A6C0D379EF20B1FAA270BF5B0E0A5A8CBEDB638A053B0AAAD66E6B93ACEF6EE026CCE5979034074A32F69B37A252B7A338460C4A75CDB6F7B8B042FB16E01A800EBE420EC1A30AE2E57A3C4C5F86E649B4DEE59E63A05CF38B3C6301A725ED473CE3775107C91C2B92456C1ADD92D8)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (2, N'Szymon', N'Konopka', N'admin2', N'samzonee@gmail.com', 0x3B9C8F612EC9EC866CAD6D6CE5A2B09DF654B51FAEF0ABCFB6FE16F05073BEC398F9346750C7B70D43118E85EBE685D265826B73F9B6D9C9027C744D0F37805F, 0xE228CDAD4BC44F655E6089A62F24028EBA814E8F48F3F6D983184AA1E3DADD03A0EDC5766C1D8C654012CE60049AC491E3FB55C9A4FE169EC1359B43FB1B45DA6B99BE48FAAD8CDD1A28F0B3B9116600EE83A487CB2FE44E956CE62E6FE46FB6CD6F9C3C9E74F0AF32962E853B687461C027EB4F9EA7D2A0DC92C07EE8411AE9)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (3, N'Franciszek', N'Mokotów', N'Franek123', N'franko@gmail.com', 0x03D119637C3928473A495D982714CC5DD0160E74EE09CA7291FD52FA88780F74EE7F3B4DDF9F22F43AD69B467434FC2C77C2DE5917DADA8774E43DBF99307664, 0x4A75C3B2D236E095AF7641AFCD85267A1DA8EA118DC61FAD841D2400A6EEE2CF35356BE35A4F48D50E96071672F4C521297D60844955D05447521D771005B9F757447A53082F454DC5B576015DEF2F7EE56987FDB41FBBABBE022448F05025F91380A0F7E70A654427A22AF272748626B420985C3DFF44780E59C06606D6CCBE)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (4, N'Janusz', N'Pazdzioch', N'padzioch', N'pazdzioch@gmail.com', 0xE843173AC4E43E96F62BC9ABC70DFAB66E07DCBAFBC6AEBAE644541EBE379CED17781107B602669D12AA22A0BE57F7832E418024F43DCC539DF8062CA6821996, 0xE13E28E8E9C10DA2B9678498AA22355B615572D727B6B260B9B4735CF14F204817879FAAC0A835C84FF4AA8BB3F7B66C91D316089DCEE1447D21C5647E5C2DD41349C31567508ECC330B690F5389E7DFD6B59DC645382E65336BE24C4A23AE26CA7F054E61B51EBE08DB1D4CAA6C1C3913509D2027DD670EF6D2AB58FE25F588)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (5, N'test', N'test', N'testowy', N'testowy@gmail.com', 0x9FD83D51BB52F64365FFD3E575F0736B7E99987BA5ECDB360DAE0FBD81383E5FD6EFD125AB8A14DE81CC86120136EF3FA5CCF3B7EF1490DC459A8F257C4C72AC, 0xC7E33949D66D09B52292837554066F532FB0F0A6CAFCFD49481D7F439F177BA18CE17FB5FD8AAF8E1E13A5B7D73C52E706B2857EA8F04CD9A414528A24C11FBAAD5B7DD5C91AECDA826EE9D9785E8CBC3976B2DDFE023194D2652892722F9F2F5E848ED891E999DC3C822FA9195DA0F8695C72AB8D0C7E10AB8DCD17E12EE804)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (6, N'testowy2', N'testowy2', N'testowy2', N'testowy2@gmail.com', 0xC37DC8D8B00FE8D84F9A53A069C088361347F48783C239A9F8BBFC5034E8E5BFD548DAF0588EDAAF94480B0964B9E210C4EE84CE2EF07B621C0D047A618D9953, 0x69DEF165572855C40489E1583288409D680A9721AA54164E1ED02559D93F595702C454E1839B180D0821BE68CA8020F545CC04396D8EC94D18C68832C1FD3A9159858DCD4F5E3E1EEF4E0533D3450DD821810AECF02B6FD84A8E42EE7AC37AA56DC4D4D0A3D84FCEB21EED881E47D56F30EB659BA637F952343F0478EA4DD148)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (7, N'testowy3', N'testowy3', N'testowy3', N'testowy3@gmail.com', 0x7537412E950831737AEA0292ABA8E1A4732E8F6A19FCA192393630D09592A91AEF320CBAF297D2985B6BCB288571FFD71A0A42EB092938E923F80A5C42B09755, 0x97073D09F27C4411DBFBBC5B451234D0411134A705C9FDDD2856E4108F3C6FCBD99FB26266A35579EDCA5005D738FB5130C2CA0289612498FD381E15875C08BAFC1AB33969DEB25117DE9844AFEF68F4D83140991AD9D66691FB4AEDC61178CD8B37AC7E45DB685C2B10DA7B60621016DF25B33284B2BFDFD3EC5A27473A3377)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (8, N'teste', N'teste', N'teste', N'teste@gmail.com', 0xDAE2B1CF01771756211819A04329E86F72047442B29BD9B0F1C9695A228F399A729E110333A5213488ECA3641E81F64EADABE79AF5D958378E5AFFEA696DDEE1, 0x975BE1E5AB19D4866A0DD834938BFA74C60CF0119212FFBD973CAC1F9B38F17319D78FDA7775EFD959264BE6094932A37302FA853C91132E10C01D65C28D1163EC54CD00E57C6490DB6069CDDB3CD9CC35DAF3363020DBC73D11DBDF0562B13E60307039E9ECA0821468F904C1997AF65258A022429F9D10AF6D79755F13C418)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (9, N'Janek123', N'Janek123', N'Janek123', N'Janek123@gmail.com', 0xC57B84ABADAC3802CE44A011EBD30DCF19F9D58EC6E454807EC5349482294AF6E3817384C9D09ED84CB4EF568643A0E2DEB86168B80B2A720CF63371BB86FD65, 0xE000E30BCAC4F46A2E78F09E37966045BB315F4D7A1016D5F1D4C5A7461E253D24D30096EE254315A3405292887140581A9A70829C6EFFD26340FDAE6AD45C3D6C80965267F9D0C8601D1EC446E8309F3869E6819D15CECD5FE60292840CE3CCDB8193D6F9546E4AC606A668C88FA6352C6C4406BF135E26680C57B9141E1328)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (10, N'Testkolejny', N'Testkolejny', N'Testkolejny', N'Testkolejny@gmail.com', 0x22733AD221BFA5DF347143B110391A57A6FE22D56867126888CC5DB3B516549680521B632E2A42ECB07A867A6C8D6F513657DE126D50DEE63BBE7F14DA9C959A, 0xC8B16578D66AAE0797F3010E7BDAB39DF20161C2126B25627C25A0156D37FA6EE1164E7023BFD695B852F5A01251B0EEA465CDDCD9EA7C52721DE4308E72D68A3FFCF09FE0265C48E9B5C0CE259D7665A263E7E10DFB64F930A16657414F30242B56C2D6D804EBD234698CD09B33108A17B00870958E6C74947CDAEA5846BA97)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Username], [Email], [PasswordHash], [PasswordSalt]) VALUES (11, N'test', N'test', N'test', N'test', 0xE87743D41D00BDD81814FF218D1AE2AD1B24CE2773849362DC3FF017F2B4580330803797F7EC870D2F0E11FEAD9032122146399562EEB4E31A9ED5CDC8A77E62, 0x89FE757D6E14168F5F4672E157A631D0E1D5371CE35D73F5D7056CBB5D62626E73165A26AE609FA948E6B61FA904AF4A943C29973CDFC8D3649EDF201CBDD99A4C61C06890C6EA059E27A7EB74807862D1CE1D845D257FDDA713E9FA37EE1596D0DC962010FDCCA923ED02CBF1B008851BB65B7F07BB3B87D7D4A55430832095)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[DailyStatistics]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK__Tags__ParentTagI__1ED998B2] FOREIGN KEY([ParentTagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK__Tags__ParentTagI__1ED998B2]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK__Tags__UserID__25869641] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK__Tags__UserID__25869641]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_TagPriority] FOREIGN KEY([PriorityID])
REFERENCES [dbo].[TagPriority] ([ID])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_TagPriority]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD FOREIGN KEY([TaskRegisterID])
REFERENCES [dbo].[TasksRegisters] ([ID])
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TasksRegisters]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TasksRegisterStatistics]  WITH CHECK ADD FOREIGN KEY([TaskRegisterID])
REFERENCES [dbo].[TasksRegisters] ([ID])
GO
ALTER TABLE [dbo].[TasksTags]  WITH CHECK ADD  CONSTRAINT [FK__TasksTags__TagID__22AA2996] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[TasksTags] CHECK CONSTRAINT [FK__TasksTags__TagID__22AA2996]
GO
ALTER TABLE [dbo].[TasksTags]  WITH CHECK ADD FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[UsersStatistics]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TasksTags"
            Begin Extent = 
               Top = 29
               Left = 511
               Bottom = 142
               Right = 681
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TagPriority"
            Begin Extent = 
               Top = 193
               Left = 128
               Bottom = 323
               Right = 298
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tags"
            Begin Extent = 
               Top = 3
               Left = 174
               Bottom = 133
               Right = 344
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TasksTagsMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TasksTagsMap'
GO
