USE[master]
GO
CREATE LOGIN [lichtblick] WITH PASSWORD = N'password', DEFAULT_DATABASE = [tempdb], CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO
USE[tempdb]
GO
CREATE USER [lichtblick] FOR LOGIN [lichtblick]
GO
USE[tempdb]
GO
ALTER ROLE[db_datareader] ADD MEMBER [lichtblick]
GO
USE [master]
GO
GRANT CONNECT SQL TO [lichtblick]
GO
