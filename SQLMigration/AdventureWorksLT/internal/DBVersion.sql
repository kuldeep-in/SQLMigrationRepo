CREATE TABLE [internal].[DBVersion]
(
	Id BIGINT IDENTITY(1,1),
	ChangeSetVersion		NVARCHAR(20) NOT NULL,
	ChangeSetDescription	NVARCHAR(1000),
	ChangeSetDate			DATETIME NOT NULL,
	ExecutedOn				DATETIME NULL
)
GO