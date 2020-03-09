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

