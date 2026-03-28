/****** Shows Total Fixture count by Action Item per Living Area   ******/
USE HRLFM
GO

SELECT Distinct 
	[HRLFM].[insp].[FixtureSelectedRatings].StarRezLivAreaID,
	[HRLFM].[insp].[FixtureSelectedRatings].[content_id],
	[HRLFM].[insp].[LivingAreaType].[LivAreaDecription],
	   [ConditionRating] AS "Action Item",
	   [FixtureTypeDesc],
	COUNT([FixtureTypeID]) OVER (PARTITION BY [content_id] 
	Order by [HRLFM].[insp].[FixtureSelectedRatings].[content_id], 
	COUNT([FixtureTypeID]) asc
	) AS "Totals by Location"

FROM [HRLFM].[insp].[FixtureSelectedRatings]
JOIN [HRLFM].[insp].[LivingAreaType] ON
[HRLFM].[insp].[FixtureSelectedRatings].LivAreaTypeID = [HRLFM].[insp].[LivingAreaType].[LivAreaTypeID]
WHERE [FixtureTypeDesc] IS NOT NULL
AND [ConditionRating] IS NOT NULL
AND [FixtureTypeID] IS NOT NULL

Group by 
[HRLFM].[insp].[FixtureSelectedRatings].[content_id], 
[HRLFM].[insp].[LivingAreaType].[LivAreaDecription],
[insp].[FixtureSelectedRatings].[ConditionRating],
[insp].[FixtureSelectedRatings].[FixtureTypeDesc],
[insp].[FixtureSelectedRatings].[FixtureTypeID],
[insp].[FixtureSelectedRatings].[StarRezLivAreaID]

