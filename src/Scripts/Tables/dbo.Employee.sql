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
ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [PK__Employee__3214EC074854D6ED] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
