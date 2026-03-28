/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ImageID]
      ,[LivAreaDecription]
      ,[SetID]
      ,[PhotoDateTime]
      ,[PhotoNote]
      ,[InspID]
      ,[StarRezLivAreaID]
      ,[content_id]
      ,[Unit]
      ,[UnitType]
      ,[InspReasonID]
      ,[InspReasonType]
      ,[LivAreaTypeID]
      ,[Active]
      ,[ImageTaken]
      ,[InspDate]
      ,[DateCreated]
      ,[CompID]
      ,[FullName]
  FROM [HRLFM].[insp].[InspPhoto_View]

  		       WHERE 
StarRezLivAreaID  = 264
order by 1 asc