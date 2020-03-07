[DeviceID] [INT] NULL FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID),


CREATE PROCEDURE Add_Unit
@userId int, 
@deviceId int
AS
UPDATE [dbo].[Users] SET DeviceID = @deviceId where UserId = @userId
GO;

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

ALTER TABLE Users
ADD [DeviceID] [INT] NULL FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID);