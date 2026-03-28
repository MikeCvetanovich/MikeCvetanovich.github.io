---Delete by...
USE [HRLFM]
GO

--SELECT * FROM [HRLFM].[insp].[StarRezLivingArea]
---WHERE [StarRezLivAreaID] = 219





DELETE FROM [HRLFM].[insp].[Inspection]
WHERE [InspID] = 239
GO
DELETE FROM [HRLFM].[insp].[StarRezLivingArea]
WHERE [StarRezLivAreaID] = 219
GO

DELETE FROM [HRLFM].[insp].[FixtureSelectedRatings]
WHERE [StarRezLivAreaID] = 219

DELETE FROM [HRLFM].[insp].[LivingAreaRoomCond]
WHERE [StarRezLivAreaID] = 219

DELETE FROM [HRLFM].[insp].[InspPhoto]
WHERE [StarRezLivAreaID] = 219

DELETE FROM [HRLFM].[insp].[InspectionReview]
WHERE [StarRezLivAreaID] = 219