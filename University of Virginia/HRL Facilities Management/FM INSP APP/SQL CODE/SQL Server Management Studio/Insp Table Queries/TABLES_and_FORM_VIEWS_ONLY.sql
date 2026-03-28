
Select *
FROM [HRLFM].[insp].[Floor]
Order by StarRezLivAreaID, content_id desc, FlrThroughoutFlag desc,  Active asc, LivAreaTypeID asc
Select *
FROM [HRLFM].[insp].[FloorForm_View]
Order by StarRezLivAreaID , content_id desc, FlrThroughoutFlag desc,  Active asc, LivAreaTypeID asc



Select *
FROM [HRLFM].[insp].[Furniture]
Order by content_id ASC, Active asc, LivAreaTypeID asc
Select *
FROM [HRLFM].[insp].[FurnitureForm_View]
Order by content_id ASC, Active asc, LivAreaTypeID asc


Select *
FROM [HRLFM].[insp].[Kitchen]
Where Active = 1
Order by DateCreated ASC
Select *
FROM [HRLFM].[insp].[KitchenForm_View]
Order by DateCreated ASC


Select *
FROM [HRLFM].[insp].[Bathroom]
Where Active = 1
Select *
FROM [HRLFM].[insp].[BathTub]
Where Active = 1
Select *
FROM [HRLFM].[insp].[BathShower]
Where Active = 1
Select *
FROM [HRLFM].[insp].[FullBathroom_View]



Select *
FROM [HRLFM].[insp].[InspectionReview]
ORDER BY StarRezLivAreaID DESC