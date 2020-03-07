USE [LoginDB]
GO
/****** StoredProcedure [dbo].[Validate_User] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Validate_User]
      @Username NVARCHAR(20),
      @Password NVARCHAR(20)
AS
BEGIN
      SET NOCOUNT ON;
      DECLARE @UserId INT, @LastLoginDate DATETIME, @RoleId INT
     
      SELECT @UserId = UserId, @LastLoginDate = LastLoginDate, @RoleId = RoleId
      FROM Users WHERE Username = @Username AND [Password] = @Password
     
      IF @UserId IS NOT NULL
      BEGIN
            IF NOT EXISTS(SELECT UserId FROM UserActivation WHERE UserId = @UserId)
            BEGIN
                  UPDATE Users
                  SET LastLoginDate = GETDATE()
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