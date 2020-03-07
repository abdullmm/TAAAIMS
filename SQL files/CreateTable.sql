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
	[Salt] UNIQUEIDENTIFIER Null,
	[Email] [nvarchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[RoleId] [INT] NULL FOREIGN KEY (RoleId) REFERENCES Roles(RoleId),
	
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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
	@Role [int]
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
			   ,[RoleId])
		VALUES
			   (@Username
			   ,HASHBYTES('SHA2_512', @Password+CAST(@salt AS NVARCHAR(36)))
			   ,@Salt
			   ,@Email
			   ,GETDATE()
			   ,@Role)
		
		SELECT SCOPE_IDENTITY() -- UserId			   
     END
END

GO

/* Table [dbo].[UserActivation] */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserActivation](
	[UserId] [int] NOT NULL,
	[ActivationCode] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserActivation] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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

--[Validate_User] 'Mudassar', '12345'
ALTER  PROCEDURE [dbo].[Validate_User]
	@Username NVARCHAR(20),
	@Password NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @UserId INT, @LastLoginDate DATETIME, @RoleId INT
	
	SELECT @UserId = UserId, @LastLoginDate = LastLoginDate, @RoleId = RoleId 
	FROM Users WHERE Username = @Username AND [Password] = HASHBYTES('SHA2_512', @Password+CAST(Salt AS NVARCHAR(36)))

	
	IF @UserId IS NOT NULL
	BEGIN
		IF NOT EXISTS(SELECT UserId FROM UserActivation WHERE UserId = @UserId)
		BEGIN
			UPDATE Users
			SET LastLoginDate =  GETDATE()
			WHERE UserId = @UserId
			
			SELECT @UserId [UserId], 
					(SELECT RoleName FROM Roles 
					 WHERE RoleId = @RoleId) [Roles] -- User Valid
		END
		ELSE
		BEGIN
			SELECT -2 [UserId], '' [Roles]-- User not activated.
		END
	END
	ELSE
	BEGIN
		SELECT -1 [UserId], '' [Roles] -- User invalid.
	END
END

