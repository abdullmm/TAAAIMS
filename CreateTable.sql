USE [master]
GO

CREATE DATABASE [LoginDB]

GO

USE [LoginDB]
GO

/* Table [dbo].[Roles]  */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/* Table [dbo].[Users]  */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Salt] [UNIQUEIDENTIFIER] Null,
	[Name] [varchar](50) Null,
	[Email] [nvarchar](30) NULL,
	[Organization] [varchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[RoleId] [INT] NULL FOREIGN KEY (RoleId) REFERENCES Roles(RoleId),
	[LastUpdated] [DATETIME],
	[LastUpdatedBy] [varchar](30),
	[Image] [varchar](30),
	
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

Create table [dbo].[TeamOwner]
([UserId] [INT] Primary Key FOREIGN KEY (UserId) REFERENCES Users(UserId),
[LastUpdated] [DATETIME],
[LastUpdatedBy] [varchar](30)
)

Create table [dbo].[TeamMember]
([UserId] [INT] Primary Key FOREIGN KEY (UserId) REFERENCES Users(UserId),
[OwnerId] [INT] NULL FOREIGN KEY (OwnerId) REFERENCES TeamOwner(UserId),
[LastUpdated] [DATETIME],
[LastUpdatedBy] [varchar](30)
)

Create table [dbo].[Project] 
([ProjectId] [INT] IDENTITY(1,1) Primary Key,
[OwnerId] [INT] NULL FOREIGN KEY (OwnerId) REFERENCES TeamOwner(UserId),
[ProjectName] [varchar](20),
[LastUpdated] [DATETIME],
[LastUpdatedBy] [varchar](30)
)

Create table Device
([DeviceID] [int] IDENTITY(1,1) Primary Key,
[ActivationCode] [varchar](30),
[Nickname] [varchar](30),
[Bluetooth] [Int],
[Wifi] [Int],
[MediaMode] [varchar](15),
[IntervalDelay] [Int],
[VideoDuration] [Int],
[NumberImages] [Int],
[WgtUnit] [varchar](15),
[BattLife] [Int],
[Latitude] [Decimal](12, 10),
[Longitude] [Decimal](12, 10),
[OwnerID] [INT] NULL FOREIGN KEY (OwnerID) REFERENCES TeamOwner(UserId),
[ProjectId] [INT] NULL FOREIGN KEY (ProjectId) REFERENCES Project(ProjectId)
)

Insert into Device values ('hello', 'device_1_bryan', 1, NULL, 'video', 3, 5, 2, 'grams', 82, 35.52477, -78.999561, NULL, NULL);
Insert into Device values ('yes', 'device_2_bryan', 1, 1, 'video', 3, 5, 2, 'grams', 52, 38.11451, -78.127201, NULL, NULL);

Create Table Record
([RecordID] [int] IDENTITY(1,1) Primary Key,
[TimeStamp] [DateTime],
[Weight] [DECIMAL](6, 2),
[Temperature] [DECIMAL](6, 2),
[Humidity] [DECIMAL](6, 2),
[Media_Filepath] [Varchar](50),
[Length] [DECIMAL](6, 2),
[Science_Name] [Varchar](30),
[Common_Name] [Varchar](30),
[Validate_Status] [Int], 
[DeviceID] [INT] NOT NULL FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID)
)

Insert into Record values ('10/20/2019 23:28', 20, 26, 42, 'null', 1.61, 'Sorex Arizonae', 'Saint Lawrence Island shrew', 1, 1)
Insert into Record values ('10/21/2019 22:28', 20, 26, 42, 'null', 1, 'Sorex Arizonae', 'Saint Lawrence Island shrew', 1, 1)
Insert into Record values ('10/20/2019 20:29', 20, 26, 42, 'null', 1.25, 'Sorex Arizonae', 'Arizona shrew', 1, 1)
Insert into Record values ('10/20/2019 23:29', 20, 26, 42, 'null', 1, 'Sorex alakanus', 'Glacier Bay water shrew', 1, 1)
Insert into Record values ('10/20/2019 23:28', 20, 26, 42, 'null', 3, 'Sorex sonomae', 'Fog shrew', 1, 1)

USE [LoginDB]
GO

/****** Object:  Table [dbo].[ResetPasswordRequests]    Script Date: 3/11/2020 4:08:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ResetPasswordRequests](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [int] NULL,
	[ResetRequestDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ResetPasswordRequests]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO

GO

USE [LoginDB]
GO

/* StoredProcedure [dbo].[Insert_User]  */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Insert_User]
	@Username NVARCHAR(20),
	@Password NVARCHAR(50),
	@Email NVARCHAR(30),
	@Role [int],
	@Image [varchar](30)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Salt UNIQUEIDENTIFIER = NEWID()
	
	IF EXISTS(SELECT UserId FROM Users WHERE Username = @Username)
	BEGIN
		SELECT -1 -- Username exists.
	END
	ELSE IF EXISTS(SELECT UserId FROM Users WHERE Email = @Email)
	BEGIN
		SELECT -2 -- Email exists.
	END
	ELSE
	BEGIN 
		INSERT INTO [Users]
			   ([Username]
			   ,[Password]
			   ,[Salt]
			   ,[Email]
			   ,[CreatedDate]
			   ,[RoleId]
			   ,[Image])
		VALUES
			   (@Username
			   ,HASHBYTES('SHA2_512', @Password+CAST(@salt AS NVARCHAR(36)))
			   ,@Salt
			   ,@Email
			   ,GETDATE()
			   ,@Role
			   ,@Image)
		
		SELECT SCOPE_IDENTITY() -- UserId			   
     END
END

GO
CREATE  PROCEDURE [dbo].[Validate_User]
	@Username NVARCHAR(20),
	@Password NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @UserId INT, @LastLoginDate DATETIME
	
	SELECT @UserId = UserId, @LastLoginDate = LastLoginDate 
	FROM Users WHERE Username = @Username AND [Password] = @Password
	
	IF @UserId IS NOT NULL
	BEGIN
		IF NOT EXISTS(SELECT UserId FROM UserActivation WHERE UserId = @UserId)
		BEGIN
			UPDATE Users
			SET LastLoginDate =  GETDATE()
			WHERE UserId = @UserId
			SELECT @UserId [UserId] -- User Valid
		END
		ELSE
		BEGIN
			SELECT -2 -- User not activated.
		END
	END
	ELSE
	BEGIN
		SELECT -1 -- User invalid.
	END
END
GO
USE [LoginDB]
GO

INSERT INTO Roles
SELECT 1, 'Administrator'
UNION ALL
SELECT 2, 'User'
UNION ALL
SELECT 3, 'Owner'
GO


ALTER  PROCEDURE [dbo].[Validate_User]
	@Username NVARCHAR(20),
	@Password NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @UserId INT, @LastLoginDate DATETIME, @RoleId INT
	
	SELECT @UserId = UserId, @LastLoginDate = LastLoginDate, @RoleId = RoleId 
	FROM Users WHERE Username = @Username AND [Password] = HASHBYTES('SHA2_512', @Password+CAST(Salt AS NVARCHAR(36)))

	



			
			SELECT @UserId [UserId], 
					(SELECT RoleName FROM Roles 
					 WHERE RoleId = @RoleId) [Roles] -- User Valid
	
	

END

