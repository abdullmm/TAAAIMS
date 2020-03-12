TRUNCATE TABLE [dbo].[Users]

EXEC dbo.[Insert_User]
@Username = 'Admin',
@Password = '12345',
@Email = 'admin@gmail.com',
@Role = 'Admin',
@Image = '~/Files/personavatar.png'

EXEC dbo.[Insert_User]
@Username = 'User',
@Password = '12345',
@Email = 'user@gmail.com',
@Role = 'User',
@Image = '~/Files/personavatar.png'

EXEC dbo.[Insert_User]
@Username = 'Owner',
@Password = '12345',
@Email = 'owner@gmail.com',
@Role = 'Owner',
@Image = '~/Files/personavatar.png'

Insert [dbo].[TeamOwner] (UserId) values (3);

Insert [dbo].[TeamMember] (UserId) values (2);






