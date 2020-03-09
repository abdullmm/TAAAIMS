TRUNCATE TABLE [dbo].[Users]

EXEC dbo.[Insert_User]
@Username = 'Admin',
@Password = '12345',
@Email = 'admin@gmail.com',
@Role = 'Administrator'

EXEC dbo.[Insert_User]
@Username = 'User',
@Password = '12345',
@Email = 'user@gmail.com',
@Role = 'User'

EXEC dbo.[Insert_User]
@Username = 'Owner',
@Password = '12345',
@Email = 'owner@gmail.com',
@Role = 'Owner'

TRUNCATE TABLE [dbo].[Users]

EXEC dbo.[Insert_User]
@Username = 'Admin',
@Password = '12345',
@Email = 'admin@gmail.com',
@Role = '1',
@Image = '~/Files/personavatar.png'

EXEC dbo.[Insert_User]
@Username = 'User',
@Password = '12345',
@Email = 'user@gmail.com',
@Role = '2',
@Image = '~/Files/personavatar.png'

EXEC dbo.[Insert_User]
@Username = 'Owner',
@Password = '12345',
@Email = 'owner@gmail.com',
@Role = '3',
@Image = '~/Files/personavatar.png'


