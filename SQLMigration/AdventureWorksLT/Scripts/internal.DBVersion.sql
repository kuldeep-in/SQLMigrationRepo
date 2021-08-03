IF NOT EXISTS (SELECT 1 FROM [internal].[DBVersion] WHERE Id = 1) 
INSERT INTO [internal].[DBVersion] ( Id, [ChangeSetVersion], [ChangeSetDescription], [ChangeSetDate], ExecutedOn) VALUES ( 1, N'v1.0', N'Default Application version starts with 1.0' , '05/05/2020', '05/05/2020')
																																							 
-- #MigrationChange 02
IF NOT EXISTS (SELECT 1 FROM [internal].[DBVersion] WHERE Id = 2) 
INSERT INTO [internal].[DBVersion] ( Id, [ChangeSetVersion], [ChangeSetDescription], [ChangeSetDate], ExecutedOn) VALUES ( 2, N'v1.0', N'New Office Address Column Added' , '05/05/2021', '05/05/2021')
