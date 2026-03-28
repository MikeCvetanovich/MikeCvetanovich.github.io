SELECT TOP 10 *
  FROM [HRLFM].[insp].[Floor]
        Order by [FloorID] desc

SELECT TOP 10 *
  FROM [HRLFM].[insp].[FloorForm_View]
  Order by [FloorID] DESC

SELECT TOP 10 *
  FROM [HRLFM].[insp].[Furniture]
Order by [FurnitureID] DESC
 
SELECT TOP 10 *
  FROM [HRLFM].[insp].[FurnitureForm_View]
    Order by [FurnViewID] DESC

SELECT TOP 10 *
  FROM [HRLFM].[insp].[Kitchen]
  Order by [KitchenID] 

SELECT TOP 10 *
  FROM [HRLFM].[insp].[KitchenForm_View]
  Order by [KitchenView] DESC
	
SELECT TOP 10 *
FROM [HRLFM].[insp].[Bathroom]
Order by [BathID] DESC

SELECT TOP 10 *
 FROM [HRLFM].[insp].[BathShower]
 Order by [ShowerID] DESC

SELECT TOP 10 *
FROM [HRLFM].[insp].[BathTub]
Order by [TubID] DESC

SELECT TOP 10 *
  FROM [HRLFM].[insp].[FullBathroom_View]
  Order by [BathID] DESC
