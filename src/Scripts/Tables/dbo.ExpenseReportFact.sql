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
ALTER TABLE [dbo].[ExpenseReportFact] ADD CONSTRAINT [PK__ExpenseR__3214EC070DAB9FC6] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
