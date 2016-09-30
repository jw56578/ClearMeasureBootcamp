CREATE TABLE [dbo].[usd_AppliedDatabaseScript]
(
[ScriptFile] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateApplied] [datetime] NOT NULL,
[Version] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[usd_AppliedDatabaseScript] ADD CONSTRAINT [PK_usd_AppliedDatabaseScript] PRIMARY KEY CLUSTERED  ([ScriptFile]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_usd_DateApplied] ON [dbo].[usd_AppliedDatabaseScript] ([DateApplied]) ON [PRIMARY]
GO
