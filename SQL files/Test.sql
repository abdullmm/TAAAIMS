Create table Device
([DeviceID] [int] IDENTITY(1,1) Primary Key,
[ActivationCode] [varchar](30),
[Nickname] [varchar](30),
[Bluetooth] [Int],
[Wifi] [Int],
[Mode] [varchar](15),
[Interval Delay] [Int],
[Video Duration] [Int],
[Number Images] [Int],
[Wgt Unit] [varchar](15),
[Batt Life] [Int],
[Latitude] [Decimal
[Longitude] [Decimal]
)

Insert into Device values ('', 'device_1_bryan', 1, NULL, 'video',  );
Insert into Device values ('', 'device_2_bryan', 1, 1, 'video', );

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
[DeviceID] [INT] NOT NULL FOREIGN KEY (UnitID) REFERENCES Device(DeviceID)
)

Insert into Record values ('10/20/2019 23:28', 20, 26, 42, 'null', 1.61, Sorex Arizonae, Saint Lawrence Island shrew, 1, 1)
Insert into Record values ('10/21/2019 22:28', 20, 26, 42, 'null', 1, Sorex Arizonae, Saint Lawrence Island shrew, 1, 1)
Insert into Record values ('10/20/2019 20:29', 20, 26, 42, 'null', 1.25, Sorex Arizonae, Arizona shrew, 1, 1)
Insert into Record values ('10/20/2019 23:29', 20, 26, 42, 'null', 1, Sorex alakanus, Glacier Bay water shrew, 1, 1)
Insert into Record values ('10/20/2019 23:28', 20, 26, 42, 'null', 3, Sorex sonomae, Fog shrew, 1, 1)
