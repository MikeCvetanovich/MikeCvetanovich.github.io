--- Trace Inspection IDs by specific report ID

SELECT * FROM [HRLFM].[insp].[StarRezLivingArea]
WHERE [StarRezLivAreaID] = 148
---  first query [StarRezLivingArea].[StarRezLivAreaID] table to get InspID

--- Below, declare both ID's. 
--- Then run full ID trace on all tables below

DECLARE @StarRezID NVARCHAR(50);
SET @StarRezID =  148

DECLARE @InspID NVARCHAR(50);
SET @InspID = 159

--- all tables related to a full inspection

SELECT * FROM [HRLFM].[insp].[Inspection]
WHERE [InspID] = @InspID

SELECT * FROM [HRLFM].[insp].[Office365User]
WHERE [InspID] = @InspID

SELECT * FROM [HRLFM].[insp].[FixtureSelectedRatings]
WHERE [StarRezLivAreaID] = @StarRezID

SELECT * FROM [HRLFM].[insp].[LivingAreaRoomCond]
WHERE [StarRezLivAreaID] = @StarRezID

SELECT * FROM [HRLFM].[insp].[InspPhoto]
WHERE [StarRezLivAreaID] = @StarRezID

SELECT * FROM [HRLFM].[insp].[InspectionReview]
WHERE [StarRezLivAreaID] = @StarRezID



