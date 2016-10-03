CREATE TABLE [dbo].[Expense]
(
[ExpenseReportId] [uniqueidentifier] NOT NULL,
[Sequence] [int] NOT NULL,
[DescriptionDude] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Amount] [money] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Expense] ADD CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED  ([ExpenseReportId], [Sequence]) ON [PRIMARY]
GO
