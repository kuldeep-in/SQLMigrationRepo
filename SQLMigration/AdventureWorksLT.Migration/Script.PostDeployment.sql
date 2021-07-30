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


IF OBJECT_ID('internal.Databaseversion') IS NULL
CREATE TABLE [internal].[DatabaseVersion]
(
	Id BIGINT IDENTITY(1,1),
	CurrentBuild NVARCHAR(256),
	LastChangeSetNumber BIGINT,
	Revison NVARCHAR(256),
	CreatedOn DATETIME,
	CreatedBy NVARCHAR(256)
)
GO

--Start-- Version 1.1
DECLARE @currentDBVersion BIGINT = NULL;
SELECT TOP 1 @currentDBVersion = Id FROM [internal].[DatabaseVersion] WHERE [DatabaseVersion].[CurrentBuild]='1.1' ORDER BY Id DESC

IF @currentDBVersion = 46 GOTO Script54
ELSE
RETURN

Script54:
:r .\Scripts\Migration\V1-1-0118\DataChangeScript.sql
SET IDENTITY_INSERT [internal].[DatabaseVersion] ON 
INSERT INTO [internal].[DatabaseVersion] ( [Id], [CurrentBuild] , [LastChangeSetNumber], [Revison] , [CreatedOn] , [CreatedBy]) VALUES ( 55, N'1.1' , NULL, N'0118' , '01/18/2018' , N'system')
SET IDENTITY_INSERT [internal].[DatabaseVersion] OFF
--End-- Version 1.1
GO 



IF NOT EXISTS (SELECT 1 FROM [dbo].[CCMSynapseVersion] WHERE [CCMSynapseVersionId] = 1)
BEGIN
    INSERT INTO [dbo].[CCMSynapseVersion] ( CCMSynapseVersionId, [ChangeSetVersion], [ChangeSetDescription], [ChangeSetDate], ExecutedOn) VALUES ( 1, N'v1.0', N'Default Application version starts with 1.0' , '05/05/2020', '05/05/2020')
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[CCMSynapseVersion] WHERE [CCMSynapseVersionId] = 2)
BEGIN
    :r .\scripts\v11\schemaScript.sql
    INSERT INTO [dbo].[CCMSynapseVersion] ( CCMSynapseVersionId, [ChangeSetVersion], [ChangeSetDescription], [ChangeSetDate], ExecutedOn) VALUES ( 2, N'v1.1', N'New Address Column Added' , '12/02/2021', '12/02/2021')
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[CCMSynapseVersion] WHERE [CCMSynapseVersionId] = 3)
BEGIN
    :r .\scripts\v12\schemaScript.sql
    INSERT INTO [dbo].[CCMSynapseVersion] ( CCMSynapseVersionId, [ChangeSetVersion], [ChangeSetDescription], [ChangeSetDate], ExecutedOn) VALUES ( 3, N'v1.2', N'drop poc tables' , '2021-02-16', '2021-02-16')
END
GO

