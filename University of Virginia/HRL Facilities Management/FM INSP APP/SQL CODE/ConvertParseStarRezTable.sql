USE [HRLFM_INSP]
GO

SELECT 

[Area] AS StRzComplex,
[Building] AS StRzBldgNum,
REPLACE(SUBSTRING([Unit], CHARINDEX('-', [Unit]), LEN([Unit])), '-', '') AS StRz_UnitNum,
LEFT ( [UnitType], 9 ) as StRzBedRm,
CASE
	WHEN [UnitType] NOT LIKE '%unf%'THEN 'Furnished'
	ELSE null
	END 'StRzFurn',
CASE
	WHEN [UnitType] LIKE '%unf%' THEN 'UnFurnished'
	ELSE NULL
	END 'StRzUnFurn',
CASE
	WHEN [UnitType] LIKE '%(shared)%' Then 'Shared'
	ELSE null
	END 'STRZShared'

      ,[content_Id] AS StRz_Content_ID

  FROM [dbo].[StarRezBldg]
GO


