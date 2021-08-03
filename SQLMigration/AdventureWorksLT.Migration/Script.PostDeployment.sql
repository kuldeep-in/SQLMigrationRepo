/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


IF OBJECT_ID('internal.DBVersion') IS NULL
CREATE TABLE [internal].[DBVersion]
(
	Id						INT NOT NULL,
	ChangeSetVersion		NVARCHAR(20) NOT NULL,
	ChangeSetDescription	NVARCHAR(1000),
	ChangeSetDate			DATETIME NOT NULL,
	ExecutedOn				DATETIME NULL
)
GO

IF NOT EXISTS (SELECT 1 FROM [internal].[DBVersion] WHERE [Id] = 1)
BEGIN
    INSERT INTO [internal].[DBVersion] ( [Id], [ChangeSetVersion], [ChangeSetDescription], [ChangeSetDate], ExecutedOn) VALUES ( 1, N'v1.0', N'Default Application version starts with 1.0' , '05/05/2020', '05/05/2020')
END
GO

IF NOT EXISTS (SELECT 1 FROM [internal].[DBVersion] WHERE [Id] = 2)
BEGIN
    :r .\Scripts\v11\v11SchemaScript.sql
    INSERT INTO [internal].[DBVersion] ( [Id], [ChangeSetVersion], [ChangeSetDescription], [ChangeSetDate], ExecutedOn) VALUES ( 2, N'v1.1', N'New Office Address Column Added' , '12/02/2021', '12/02/2021')
END
GO


