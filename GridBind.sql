GO
CREATE PROCEDURE grid_Bind
@userId int 

AS
BEGIN
SELECT [DeviceID], [Nickname], [Bluetooth],
[Wifi],
[MediaMode],
[IntervalDelay],
[VideoDuration],
[NumberImages],
[WgtUnit],
[BattLife],
[Latitude],
[Longitude] 
FROM [dbo].[Device] INNER JOIN [dbo].[Users] ON Device.UserId = Users.UserId WHERE(Users.UserId = @userid)
END

GO
CREATE PROCEDURE device_Bind
@userId int 

AS
BEGIN
SELECT * 
FROM [dbo].[Device] INNER JOIN [dbo].[Users] ON Device.UserId = Users.UserId WHERE(Users.UserId = @userid)
END

Create table TeamOwner
([OwnerID] [int] IDENTITY(1,1) Primary Key,
[UserId] [INT] NULL FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE,
[LastUpdated] [DATETIME],
[LastUpdatedBy] [varchar](30)
)

Create table TeamMember
([MemberID] [int] IDENTITY(1,1) Primary Key,
[UserId] [INT] NULL FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE,
[LastUpdated] [DATETIME],
[LastUpdatedBy] [varchar](30)
)

Create table Project 
([ProjectId] [INT] IDENTITY(1,1) Primary Key,
[OwnerId] [INT] NULL FOREIGN KEY (OwnerId) REFERENCES TeamOwner(OwnerId) ON UPDATE CASCADE,
[ProjectName] [varchar](20)
[LastUpdated] [DATETIME],
[LastUpdatedBy] [varchar](30)
)

