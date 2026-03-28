
/****** Script for [RenovationStatus] ******/



SELECT [RenovationID]
      ,IIF([HasBeenRenovated]=1,'True','False') AS [HasBeenRenovated]
	  
	  ,CASE 
		WHEN [Renovated_Partial_Full] = 1 
		THEN 'FULL'
		ELSE IIF([Renovated_Partial_Full]=0, 'Partial', NULL)
		END AS [Renovated_Partial_Full]
			   
      ,CASE 
		WHEN [LastRenovationDate] = '1900-01-01'
		THEN NULL
		ELSE [LastRenovationDate]
		END AS [LastRenovationDate]

	  ,IIF([PlannedRenovation]=1,'True','False') AS [PlannedRenovation]
      
	  ,CASE 
		WHEN [Planned_Partial_Full] = 1 
		THEN 'FULL'
		ELSE IIF([Planned_Partial_Full]=0, 'Partial', NULL)
		END AS [Planned_Partial_Full]

	  ,CASE 
		WHEN [PlannedRenovationDate] = '1900-01-01'
		THEN NULL
		ELSE [PlannedRenovationDate]
		END AS [PlannedRenovationDate]

	  ,[RenovationNote]
      ,[Active]
      ,[DateCreated]
      ,[content_id]
  FROM [HRLFM].[insp].[RenovationStatus]

/*

  SELECT [RenovationID]
	  
      ,IIF([HasBeenRenovated]=1,'TRUE','FALSE') AS [HasBeenRenovated]
      
      ,IIF([Renovation_Partial_Full]=1,'Full','Partial') AS [Renovation_Partial_Full]
	  
      ,[LastRenovationDate]
      ,[PlannedRenovationDate]
      ,[RenovationNote]
      ,[Active]
      ,[DateCreated]
      ,[content_id]
  FROM [HRLFM].[insp].[RenovationStatus]

  */
