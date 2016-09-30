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
[LastSubmitted] [datetime] NULL,
[LastWithdrawn] [datetime] NULL,
[LastCancelled] [datetime] NULL,
[LastApproved] [datetime] NULL,
[LastDeclined] [datetime] NULL,
[Total] [money] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExpenseReport] ADD CONSTRAINT [PK__ExpenseReport_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExpenseReport] ADD CONSTRAINT [FK_ExpenseReport_EmployeeForSubmitter] FOREIGN KEY ([SubmitterId]) REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ExpenseReport] ADD CONSTRAINT [FKExpenseReport_EmployeeForApprover] FOREIGN KEY ([ApproverId]) REFERENCES [dbo].[Employee] ([Id])
GO
