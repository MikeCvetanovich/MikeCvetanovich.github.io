
USE [HRLFM]  --Database hold 18 tables total, 6 tables are lookup tables
GO

	DELETE FROM [insp].[OfficeAppTble]
	DELETE FROM [insp].[Inspection]
	
	DELETE FROM [insp].[StarRezLivingArea]

	DELETE FROM [insp].[Furniture]
	DELETE FROM [insp].[LivingAreaFurniture]
	
	DELETE FROM [insp].[Floor]
	DELETE FROM [insp].[LivingAreaFloor]
	
	DELETE FROM [insp].[LivingAreaTub]
	DELETE FROM [insp].[Tub]
	
	DELETE FROM [insp].[LivingAreaPhoto]
	DELETE FROM [insp].[InspPhoto]
	
	DELETE FROM [insp].[LivingAreaFixture]
	DELETE FROM [insp].[FixtureSelectedRatings]

	DELETE FROM [insp].[FixtureConditionNote]
	   
	DELETE FROM [insp].[LivingAreaRoomCond]

	DELETE FROM [insp].[DamageNote]



  DBCC CHECKIDENT ('[insp].[OfficeAppTble]', RESEED, 0); 
  DBCC CHECKIDENT ('[insp].[Inspection]', RESEED, 0);
  
  DBCC CHECKIDENT ('[insp].[StarRezLivingArea]', RESEED, 0);    

  DBCC CHECKIDENT ('[insp].[Furniture]', RESEED, 0);
  DBCC CHECKIDENT ('[insp].[LivingAreaFurniture]', RESEED, 0);

  DBCC CHECKIDENT ('[insp].[Floor]', RESEED, 0);
  DBCC CHECKIDENT ('[insp].[LivingAreaFloor]', RESEED, 0);

  DBCC CHECKIDENT ('[insp].[Tub]', RESEED, 0);
  DBCC CHECKIDENT ('[insp].[LivingAreaTub]', RESEED, 0);

  DBCC CHECKIDENT ('[insp].[InspPhoto]', RESEED, 0);
  DBCC CHECKIDENT ('[insp].[LivingAreaPhoto]', RESEED, 0);

  DBCC CHECKIDENT ('[insp].[LivingAreaFixture]', RESEED, 0);  
  DBCC CHECKIDENT ('[insp].[FixtureSelectedRatings]', RESEED, 0);
  
  DBCC CHECKIDENT ('[insp].[LivingAreaRoomCond]', RESEED, 0);
  
  DBCC CHECKIDENT ('[insp].[FixtureConditionNote]', RESEED, 0);
  
  DBCC CHECKIDENT ('[insp].[DamageNote]', RESEED, 0);

  
  /* DO NOT RESEED! Lookup Tables with pre-defined table data

  --DBCC CHECKIDENT ('[insp].[FixtureType]', RESEED, 0);		--List of Fixtures in each room
  --DBCC CHECKIDENT ('[insp].[FixtureCondType]', RESEED, 0);	--List of Condition Ratings
  --DBCC CHECKIDENT ('[insp].[InspReasonType]', RESEED, 0);		--List of Inspection Reason Types
  --DBCC CHECKIDENT ('[insp].[LivingAreaType]', RESEED, 0);		--List of Living Areas i.e., Room names
  --DBCC CHECKIDENT ('[insp].[RoomCondType]', RESEED, 0);		--List of Overall Room Conditions: Good, Fair, Poor
  --DBCC CHECKIDENT ('[insp].[StarRezLookUp]', RESEED, 0);		--List of apartments coming from StarRez database.
  
  */


  