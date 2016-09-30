/*
This migration script replaces uncommitted changes made to these objects:
AuditEntry
Employee
ExpenseReportFact
ExpenseReport
Expense
usd_AppliedDatabaseScript
MostRecentExpenseReportFactView

Use this script to make necessary schema and data changes for these objects only. Schema changes to any other objects won't be deployed.

Schema changes and migration scripts are deployed in the order they're committed.
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating [dbo].[ExpenseReportFact]'
GO
CREATE TABLE [dbo].[ExpenseReportFact]
(
[Id] [uniqueidentifier] NOT NULL,
[Number] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [datetime] NULL,
[Total] [money] NULL,
[Status] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Submitter] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Approver] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK__ExpenseR__3214EC070DAB9FC6] on [dbo].[ExpenseReportFact]'
GO
ALTER TABLE [dbo].[ExpenseReportFact] ADD CONSTRAINT [PK__ExpenseR__3214EC070DAB9FC6] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[MostRecentExpenseReportFactView]'
GO
create view
[dbo].[MostRecentExpenseReportFactView]
as
SELECT eft.*
  FROM ExpenseReportFact eft
	join (select number,MAX(timestamp) as timestamp from ExpenseReportFact group by number) lastFact
		on eft.Number = lastFact.Number
			and eft.TimeStamp = lastFact.timestamp
GO
PRINT N'Creating [dbo].[Employee]'
GO
CREATE TABLE [dbo].[Employee]
(
[Id] [uniqueidentifier] NOT NULL,
[UserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdminAssistantId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK__Employee__3214EC074854D6ED] on [dbo].[Employee]'
GO
ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [PK__Employee__3214EC074854D6ED] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[ExpenseReport]'
GO
CREATE TABLE [dbo].[ExpenseReport]
(
[Id] [uniqueidentifier] NOT NULL,
[Number] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Title] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [nchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SubmitterId] [uniqueidentifier] NOT NULL,
[ApproverId] [uniqueidentifier] NULL,
[MilesDriven] [int] NULL,
[Created] [datetime] NULL,
[FirstSubmitted] [datetime] NULL,
[LastSubmittedDate] [datetime] NULL,
[LastWithdrawn] [datetime] NULL,
[LastCancelled] [datetime] NULL,
[LastApproved] [datetime] NULL,
[LastDeclined] [datetime] NULL,
[Total] [money] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK__ExpenseReport_Id] on [dbo].[ExpenseReport]'
GO
ALTER TABLE [dbo].[ExpenseReport] ADD CONSTRAINT [PK__ExpenseReport_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[AuditEntry]'
GO
CREATE TABLE [dbo].[AuditEntry]
(
[ExpenseReportId] [uniqueidentifier] NOT NULL,
[Sequence] [int] NOT NULL,
[EmployeeId] [uniqueidentifier] NULL,
[Date] [datetime] NULL,
[EndStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BeginStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_AuditEntry] on [dbo].[AuditEntry]'
GO
ALTER TABLE [dbo].[AuditEntry] ADD CONSTRAINT [PK_AuditEntry] PRIMARY KEY CLUSTERED  ([ExpenseReportId], [Sequence]) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[Expense]'
GO
CREATE TABLE [dbo].[Expense]
(
[ExpenseReportId] [uniqueidentifier] NOT NULL,
[Sequence] [int] NOT NULL,
[Description] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Amount] [money] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_Expense] on [dbo].[Expense]'
GO
ALTER TABLE [dbo].[Expense] ADD CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED  ([ExpenseReportId], [Sequence]) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[usd_AppliedDatabaseScript]'
GO
CREATE TABLE [dbo].[usd_AppliedDatabaseScript]
(
[ScriptFile] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateApplied] [datetime] NOT NULL,
[Version] [int] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_usd_AppliedDatabaseScript] on [dbo].[usd_AppliedDatabaseScript]'
GO
ALTER TABLE [dbo].[usd_AppliedDatabaseScript] ADD CONSTRAINT [PK_usd_AppliedDatabaseScript] PRIMARY KEY CLUSTERED  ([ScriptFile]) ON [PRIMARY]
GO
PRINT N'Creating index [IX_usd_DateApplied] on [dbo].[usd_AppliedDatabaseScript]'
GO
CREATE NONCLUSTERED INDEX [IX_usd_DateApplied] ON [dbo].[usd_AppliedDatabaseScript] ([DateApplied]) ON [PRIMARY]
GO
PRINT N'Adding foreign keys to [dbo].[ExpenseReport]'
GO
ALTER TABLE [dbo].[ExpenseReport] ADD CONSTRAINT [FK_ExpenseReport_EmployeeForSubmitter] FOREIGN KEY ([SubmitterId]) REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ExpenseReport] ADD CONSTRAINT [FKExpenseReport_EmployeeForApprover] FOREIGN KEY ([ApproverId]) REFERENCES [dbo].[Employee] ([Id])
GO

