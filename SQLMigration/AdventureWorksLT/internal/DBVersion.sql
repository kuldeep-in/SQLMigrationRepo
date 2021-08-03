CREATE TABLE [internal].[DBVersion]
(
	Id						INT NOT NULL,
	ChangeSetVersion		NVARCHAR(20) NOT NULL,
	ChangeSetDescription	NVARCHAR(1000),
	ChangeSetDate			DATETIME NOT NULL,
	ExecutedOn				DATETIME NULL
)
GO