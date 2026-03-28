--RtpTest2

USE [HRLFM]
GO

INSERT INTO [insp].[Inspection]
           ([InspDate]
           ,[InspReasonID],
		   [Active])
     VALUES
           (GETDATE(), 2,1)

GO

INSERT INTO [insp].[Office365User]
           ([CompID]
           ,[FullName]
           ,[Department]
           ,[LoginDateTime]
           ,[InspID])
     VALUES
          ('mdc8p','Mike Cvetanovich', 'HRL',GETDATE(),1)
GO

INSERT INTO [insp].[StarRezLivingArea]
           ([content_id]
           ,[InspID])
     VALUES
           (5,1)
GO

INSERT INTO [insp].[SupportAnimal]
           ([HasBeenApproved]
           ,[AnimalType]
           ,[Resident]
           ,[SupportAnimalNote]
           ,[EndDate]
           ,[Active]
           ,[DateCreated]
           ,[content_id])
     VALUES
           (1,'Dog','Resident A','Approval# 12345',GetDate(),1,Getdate()+365,5)

GO

INSERT INTO [insp].[RenovationStatus]
           ([HasBeenRenovated]
           ,[Renovated_Partial_Full]
           ,[LastRenovationDate]
           ,[PlannedRenovationDate]
           ,[RenovationNote]
           ,[Active]
           ,[DateCreated]
           ,[content_id])
     VALUES
           (1,0,Getdate()-1095,NULL,'This was a Full Renovation',1,Getdate(),5)

GO

--- INSPECTION OF EACH ROOM START BELOW THIS POINT
INSERT INTO [insp].[Floor]
           ([FlrManufID]
           ,[FlrTypeID]
           ,[FlrStyleID]
           ,[FlrTileSizeID]
           ,[FlrColorID]
           ,[FlrInstallDate]
           ,[FlrComment]
           ,[FlrThroughoutFlag]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (2,2,1,1,1,getdate()-365,'floortest',1,2,getdate(),1,5,1)
           
GO
INSERT INTO [insp].[Furniture]
           ([FurnManufID]
           ,[FurnStyleID]
           ,[FurnColorID]
           ,[FurnInstallDate]
           ,[FurnMattressDate]
           ,[FurnTableTypeID]
           ,[FurnChairCount]
           ,[FurnNote]
		   ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (2,1,1,getdate()-365,getdate()-365,1,4,'FurnitureTestNote',2,getdate(),1,5)
GO

INSERT INTO [insp].[FurnDescriptionByRoom]
           ([FurnDescriptionID]
           ,[FurnDescription]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
VALUES
           (1,'Couch',2,GetDate(),1,5,1)

INSERT INTO [insp].[FurnDescriptionByRoom]
           ([FurnDescriptionID]
           ,[FurnDescription]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
VALUES
           (2,'Arm Chair',2,GetDate(),1,5,1)

INSERT INTO [insp].[FurnDescriptionByRoom]
           ([FurnDescriptionID]
           ,[FurnDescription]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
VALUES
           (3,'Coffee Table',2,GetDate(),1,5,1)

INSERT INTO [insp].[FurnDescriptionByRoom]
           ([FurnDescriptionID]
           ,[FurnDescription]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
VALUES
           (4,'TV Stand',2,GetDate(),1,5,1)

INSERT INTO [insp].[FurnDescriptionByRoom]
           ([FurnDescriptionID]
           ,[FurnDescription]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
VALUES
           (5,'Dining Table',2,GetDate(),1,5,1)


INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (1,'Walls',3,'Needs Cleaning','Spot on wall near window - see photos',2,Getdate(),1,5,1)
          
GO
         
INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (3,'Doors',2,'Needs Repair','Lock is loose',2,Getdate(),1,5,1)
          
GO
INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
		   ,[DamageNotes]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (4,'Lights',1,'Needs Replacement','Replace Livingroom Light','LightFixture Broken',2,Getdate(),1,5,1)
          
GO

---***LivingAreaRoomCond Table BELOW links the Room above.  
---***The LivAreaTypeID will change When starting a new room after this point.
INSERT INTO [insp].[LivingAreaRoomCond]
           ([RmCondNotes]
           ,[RoomCondID]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           ('Overall Room Cond Note test',1,2,Getdate(),1,5,1)
          
GO


---    *** END OF FIRST ROOM INSPECTION ***


---    *** STARTING NEW ROOM ***  
---    *** START KITCHEN INSPECTION BELOW THIS POINT ***

INSERT INTO [insp].[Kitchen]
           ([KitCabinetID]
           ,[KitCountertopID]
           ,[KitCounterColorID]
           ,[SmartBurner]
		   ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (1,1,1,1,3,Getdate(),1,5,1)
           
GO

INSERT INTO [insp].[Floor]
           ([FlrManufID]
           ,[FlrTypeID]
           ,[FlrStyleID]
           ,[FlrTileSizeID]
           ,[FlrColorID]
           ,[FlrInstallDate]
           ,[FlrComment]
           ,[FlrThroughoutFlag]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,Getdate(),1,5,1)
           
GO

INSERT INTO [insp].[Furniture]
           ([FurnManufID]
           ,[FurnStyleID]
           ,[FurnColorID]
           ,[FurnInstallDate]
           ,[FurnMattressDate]
           ,[FurnTableTypeID]
           ,[FurnChairCount]
           ,[FurnNote]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (2,1,1,2,1,3,getdate(),getdate()-30,2,4,'FurnitureTestNote',3,Getdate(),1,5,1)
GO



INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
		   ,[LivAreaTypeID]
           ,[StarRezLivAreaID])
     VALUES
           (1,'Walls',1,'Good',NULL,3,2)
          
GO
INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
		   ,[LivAreaTypeID]
           ,[StarRezLivAreaID])
     VALUES
           (2,'Floors',2,'Fair',NULL,3,2)
          
GO
INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
		   ,[LivAreaTypeID]
           ,[StarRezLivAreaID])
     VALUES
           (3,'Doors',3,'Poor','KitchenNoteTest',3,2)
          
GO
INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
		   ,[LivAreaTypeID]
           ,[StarRezLivAreaID])
     VALUES
           (4,'Lights',4,'Needs Replacement','Replace Kitchen Light',3,2)
GO


----LivingAreaRoomCond defines the Room above...LivAreaTypeID will change for each room at this point.
INSERT INTO [insp].[LivingAreaRoomCond]
           ([RmCondNotes]
           ,[RoomCondID]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           ('Kitchen - Overall Room Cond Note test',1,3,Getdate(),1,5,1)
GO




--- *** BATHROOM ***
---BATHROOM INSP STARTS BELOW THIS POINT


INSERT INTO [insp].[BathTub]
           ([TubManufID]
           ,[TubMaterialID]
           ,[TubWallTypeID]
           ,[TubNote])
     VALUES
           (0,0,0,'')
GO

INSERT INTO [insp].[BathShower]
           ([ShowerManufID]
           ,[ShowerMaterialID]
           ,[ShowerWallTypeID]
           ,[ShowerNote])
     VALUES
           (1,2,1,'BathShower  Note')
GO


INSERT INTO [insp].[Bathroom]
           ([TubID]
           ,[ShowerID]
           ,[BidetsApproved]
           ,[BathroomNote]
           ,[StarRezLivAreaID])
     VALUES
           (1,1,1,'Bidet Approved #123345',2)
GO


INSERT INTO [insp].[Floor]
           ([FlrManufID]
           ,[FlrTypeID]
           ,[FlrStyleID]
           ,[FlrTileSizeID]
           ,[FlrColorID]
           ,[FlrInstallDate]
           ,[FlrComment]
           ,[FlrThroughoutFlag]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,Getdate(),1,5,1)
           
GO
INSERT INTO [insp].[Furniture]
           ([FurnManufID]
           ,[FurnStyleID]
           ,[FurnColorID]
           ,[FurnInstallDate]
           ,[FurnMattressDate]
           ,[FurnTableTypeID]
           ,[FurnChairCount]
           ,[FurnNote]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Furniture in Bathroom',4,Getdate(),0,5,1)
GO



          
GO
INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
		   ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (14,'Mirror',3,'Needs Cleaning','BATH Note',4,Getdate(),1,5,1)
          
GO
INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
		   ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (4,'Lights',4,'Needs Replacement','Replace Light',4,Getdate(),1,5,1)
          
GO


----LivingAreaRoomCond defines the Room above...LivAreaTypeID will change for each room at this point.
INSERT INTO [insp].[LivingAreaRoomCond]
           ([RmCondNotes]
           ,[RoomCondID]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           ('Bathroom- Overall Room Cond Note test',1,4,Getdate(),1,5,1)
GO
          
GO


---BEDROOM INSP STARTS BELOW THIS POINT

INSERT INTO [insp].[Floor]
           ([FlrManufID]
           ,[FlrTypeID]
           ,[FlrStyleID]
           ,[FlrTileSizeID]
           ,[FlrColorID]
           ,[FlrInstallDate]
           ,[FlrComment]
           ,[FlrThroughoutFlag]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,5,Getdate(),0,5,1)
           
GO
INSERT INTO [insp].[Furniture]
           ([FurnManufID]
           ,[FurnStyleID]
           ,[FurnColorID]
           ,[FurnInstallDate]
           ,[FurnMattressDate]
           ,[FurnTableTypeID]
           ,[FurnChairCount]
           ,[FurnNote]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           (NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Furniture in Bed Room1',5,Getdate(),1,5,1)
GO


INSERT INTO [insp].[FixtureSelectedRatings]
           ([FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
           ,[StarRezLivAreaID])
     VALUES
           (4,'Lights',4,'Needs Replacement','Replace Bed Room Light',2)
          
GO
----LivingAreaRoomCond defines the Room above...LivAreaTypeID will change for each room at this point.
INSERT INTO [insp].[LivingAreaRoomCond]
           ([RmCondNotes]
           ,[RoomCondID]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID])
     VALUES
           ('Good',1,'NoDamage',5,Getdate(),1,5,1)
          
GO

INSERT INTO [insp].[InspectionReview]
           ([StarRezLivAreaID]
           ,[OverallResults]
           ,[InspNote])
     VALUES
           (1,1,'Inspection has passed. Good overall')
           
GO

