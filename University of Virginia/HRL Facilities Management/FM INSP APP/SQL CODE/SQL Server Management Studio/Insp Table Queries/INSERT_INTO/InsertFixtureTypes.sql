USE [HRLFM]
GO

INSERT INTO [insp].[FixtureType]
           ([FixtureTypeDesc]
           ,[InLivingRoom]
           ,[InKitchen]
           ,[InBathroom]
           ,[InHallway]
           ,[InBedroom_1]
           ,[InBedroom_2]
           ,[InBedroom_3]
		   ,[InBasement])
     VALUES
             ('Walls',1,1,1,1,1,1,1,1),
		    ('Floors',1,1,1,1,1,1,1,1),

		    ('Doors',1,1,1,1,1,1,1,1),
		   ('Closet',0,1,0,1,1,1,1,0),
		   ('Lights',1,1,1,1,1,1,1,1),
		  ('Windows',1,1,1,0,1,1,1,0),
		   ('Blinds',1,1,1,0,1,1,1,0),

	 ('Kitchen Sink',0,1,0,0,0,0,0,0),
	     ('Cabinets',0,1,0,0,0,0,0,0),
	   ('Countertop',0,1,0,0,0,0,0,0),
	   ('Dishwasher',0,1,0,0,0,0,0,0),
	   		('Stove',0,1,0,0,0,0,0,0),
	 ('Smart Burner',0,1,0,0,0,0,0,0),
	  ('Exhaust Fan',0,1,1,0,0,0,0,0),
	    ('Microwave',0,1,0,0,0,0,0,0),
	 ('Refrigerator',0,1,0,0,0,0,0,0),
   ('Smoke Detector',1,1,0,1,1,1,1,0),
     ('CO2 Detector',0,1,0,1,0,0,0,0),
	       ('Washer',0,1,0,0,0,0,0,1),
		    ('Dryer',0,1,0,0,0,0,0,1),

 ('Bath Sink/Vanity',0,0,1,0,0,0,0,0),
 ('Bath Accessories',0,0,1,0,0,0,0,0),
	   ('Shower/Tub',0,0,1,0,0,0,0,0),
		   ('Toilet',0,0,1,0,0,0,0,0),
('Mirror/MedCabinet',0,0,1,0,0,0,0,0),

		 ('AC Unit',1,1,0,0,0,0,0,0),
		  ('Heater',1,1,0,0,1,1,1,0),

	   ('Furniture',1,0,0,0,1,1,1,0),

		 ('Furnace',0,0,0,0,0,0,0,1),
('Hot Water Heater',0,0,0,0,0,0,0,1)






		   

	





