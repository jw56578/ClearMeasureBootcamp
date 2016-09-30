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
ALTER TABLE [dbo].[AuditEntry] ADD CONSTRAINT [PK_AuditEntry] PRIMARY KEY CLUSTERED  ([ExpenseReportId], [Sequence]) ON [PRIMARY]
GO
