USE HRLFM
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [insp].[StarRezBldg](
	[Area] [nvarchar](255) NULL,
	[Building] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[UnitType] [nvarchar](255) NULL,
	[content_Id] [numeric](20, 0) NULL
) ON [PRIMARY]
GO
