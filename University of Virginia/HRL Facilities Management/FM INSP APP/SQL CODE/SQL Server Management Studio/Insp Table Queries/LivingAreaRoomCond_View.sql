/****** LivingAreaRoomCond_View ******/
SELECT [InspID]
      ,[StarRezLivAreaID]
      ,[CompID]
      ,[FullName]
      ,[LivingAreaRoomCondView]
      ,[content_id]
      ,[Unit]
      ,[LivAreaTypeID]
      ,[LivAreaDecription]
      ,[RmCondRating]
      ,[RmCondNotes]
      ,[Active]
  FROM [HRLFM].[insp].[LivingAreaRoomCond_View]

--Where [CompID] = 'kwr3n'
  Order by InspID desc, Active desc, [LivAreaTypeID]asc, [LivingAreaRoomCondView] desc