--test run
USE [HRLFM]
GO
/*
SELECT *
FROM [HRLFM].[insp].[SupportAnimal]
Order by Active DESC, [DateCreated] DESC

SELECT *
  FROM [HRLFM].[insp].[BidetApproval]
  Order by Active DESC, [DateCreated] DESC

SELECT *
  FROM [HRLFM].[insp].[RenovationStatus]
  Order by Active DESC, [DateCreated] DESC

*/

SELECT *
  FROM [HRLFM].[insp].[Inspection]
  Order by InspID DESC

SELECT *
FROM [HRLFM].[insp].[Office365User]
  Order by [InspID] DESC

SELECT *
  FROM [HRLFM].[insp].[StarRezLivingArea]
  Order by [StarRezLivAreaID] DESC

SELECT *
  FROM [HRLFM].[insp].[FixtureSelectedRatings]
    Order by [StarRezLivAreaID] DESC

SELECT [LivingAreaRoomCondID]
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
  FROM [HRLFM].[insp].[LivingAreaRoomCond_View]f
    Order by [StarRezLivAreaID] DESC


SELECT *
  FROM [HRLFM].[insp].[Floor]
        Order by [StarRezLivAreaID] desc


SELECT*
  FROM [HRLFM].[insp].[FloorForm_View]
  Order by [StarRezLivAreaID] DESC

SELECT *
  FROM [HRLFM].[insp].[Furniture]
Order by [StarRezLivAreaID] DESC
 
SELECT *
  FROM [HRLFM].[insp].[FurnitureForm_View]
    Order by [StarRezLivAreaID] DESC

SELECT *
  FROM [HRLFM].[insp].[Kitchen]
  Order by [StarRezLivAreaID] 

SELECT *
  FROM [HRLFM].[insp].[KitchenForm_View]
  Order by [StarRezLivAreaID] DESC
	
SELECT *
  FROM [HRLFM].[insp].[Bathroom]
     Order by [StarRezLivAreaID] DESC

SELECT *
 FROM [HRLFM].[insp].[BathShower]
 Order by [StarRezLivAreaID] DESC



SELECT  *
FROM [HRLFM].[insp].[BathTub]
Order by [StarRezLivAreaID] DESC

SELECT *
  FROM [HRLFM].[insp].[FullBathroom_View]
  Order by [StarRezLivAreaID] DESC

SELECT *
  FROM [HRLFM].[insp].[InspPhoto]
  Order by [StarRezLivAreaID] DESC

  SELECT *
  FROM [HRLFM].[insp].[InspectionReview]
      Order by [StarRezLivAreaID] DESC