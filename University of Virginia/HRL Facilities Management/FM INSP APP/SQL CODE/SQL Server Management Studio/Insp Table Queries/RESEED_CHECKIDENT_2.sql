USE [HRLFM]  --Database DELETE ALL TABLE RECORDS AND RESEED'S CHECKIDENT  
GO
	DELETE FROM [insp].[RenovationStatus]

	DELETE FROM [insp].[SupportAnimal]
	DELETE FROM [insp].[BidetApproval]

	DELETE FROM [insp].[Office365User]
	DELETE FROM [insp].[Inspection]
	DELETE FROM [insp].[StarRezLivingArea]

	DELETE FROM [insp].[FixtureSelectedRatings]
	DELETE FROM [insp].[LivingAreaRoomCond]
    DELETE FROM [insp].[InspectionReview]
	
	DELETE FROM [insp].[Furniture]
	
	DELETE FROM [HRLFM].[insp].[Floor]
	
	DELETE FROM [HRLFM].[insp].[Bathroom]
	DELETE FROM [HRLFM].[insp].[BathShower]
	DELETE FROM [HRLFM].[insp].[BathTub]
	   
	DELETE FROM [insp].[Kitchen]
	
	DELETE FROM [HRLFM].[insp].[InspPhoto]

	---DELETE FROM [insp].[FixtureType]
	---DBCC CHECKIDENT ('[insp].[FixtureType]', RESEED, 0);

  DBCC CHECKIDENT ('[insp].[RenovationStatus]', RESEED, 0);

  DBCC CHECKIDENT ('[insp].[SupportAnimal]', RESEED, 0);
  DBCC CHECKIDENT ('[insp].[BidetApproval]', RESEED, 0);

  DBCC CHECKIDENT ('[insp].[Office365User]', RESEED, 0); 
  DBCC CHECKIDENT ('[insp].[Inspection]', RESEED, 0);
  DBCC CHECKIDENT ('[insp].[StarRezLivingArea]', RESEED, 0); 

  DBCC CHECKIDENT ('[insp].[FixtureSelectedRatings]', RESEED, 0);
  DBCC CHECKIDENT ('[insp].[LivingAreaRoomCond]', RESEED, 0);
  DBCC CHECKIDENT ('[insp].[InspectionReview]', RESEED, 0);

  DBCC CHECKIDENT ('[insp].[Furniture]', RESEED, 0);
 
  DBCC CHECKIDENT ('[HRLFM].[insp].[Floor]', RESEED, 0);
    
  DBCC CHECKIDENT ('[HRLFM].[insp].[Bathroom]', RESEED, 0);
  DBCC CHECKIDENT ('[HRLFM].[insp].[BathShower]', RESEED, 0);
  DBCC CHECKIDENT ('[HRLFM].[insp].[BathTub]', RESEED, 0);
  
   DBCC CHECKIDENT ('[insp].[Kitchen]', RESEED, 0);

  DBCC CHECKIDENT ('[HRLFM].[insp].[InspPhoto]', RESEED, 0);