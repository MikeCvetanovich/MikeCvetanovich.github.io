--- Inspection Tables
USE [HRLFM]
GO

SELECT TOP 10 *
  FROM [HRLFM].[insp].[Inspection]
  Order by InspID DESC

SELECT TOP 10 *
FROM [HRLFM].[insp].[Office365User]
  Order by [InspID] DESC

SELECT TOP 10 *
  FROM [HRLFM].[insp].[StarRezLivingArea]
  Order by [StarRezLivAreaID] DESC

SELECT TOP 10 *
  FROM [HRLFM].[insp].[FixtureSelectedRatings]
    Order by [StarRezLivAreaID] DESC

SELECT TOP 10 
		[LivingAreaRoomCondID]
      ,[RmCondNotes]
      ,[RoomCondID]
      ,[LivAreaTypeID]
      ,[DateCreated]
      ,[Active]
      ,[content_id]
      ,[StarRezLivAreaID]
  FROM [HRLFM].[insp].[LivingAreaRoomCond]
  Order by [StarRezLivAreaID] DESC

SELECT *
  FROM [HRLFM].[insp].[LivingAreaRoomCond_View]
    Order by [StarRezLivAreaID] DESC

SELECT *
  FROM [HRLFM].[insp].[InspPhoto]
  Order by [StarRezLivAreaID] DESC

  SELECT *
  FROM [HRLFM].[insp].[InspectionReview]
      Order by [StarRezLivAreaID] DESC