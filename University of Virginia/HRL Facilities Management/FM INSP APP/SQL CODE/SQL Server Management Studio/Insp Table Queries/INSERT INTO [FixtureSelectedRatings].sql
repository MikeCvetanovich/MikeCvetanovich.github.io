USE [HRLFM]
GO

---SET IDENTITY_INSERT [insp].[FixtureSelectedRatings] ON

INSERT INTO [insp].[FixtureSelectedRatings]
           (
		   [FixtureSelectedRatingsID]
		   ,[FixtureTypeID]
           ,[FixtureTypeDesc]
           ,[FixCondTypeID]
           ,[ConditionRating]
           ,[FixtureCondNote]
           ,[DamageNotes]
           ,[LivAreaTypeID]
           ,[DateCreated]
           ,[Active]
           ,[content_id]
           ,[StarRezLivAreaID]
           ,[AllFixCondGood]
		   )
     VALUES

	(531,NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	4,	'4/29/2022 14:14',	1,	1157,	188,	1),
	(528,NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2,	'4/29/2022 14:10',	1,	1157,	188,	1),
	(529,NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3,	'4/29/2022 14:10',	1,	1157,	188,	1),

	(536,	25,	'Mirror/MedCabinet',	3,	'Clean',	NULL,	NULL,	4,	'5/2/2022 9:32',	1,	1153,	189,	0),
	(532,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2,	'5/2/2022 9:28',	1,	1153,	189,	1),
	(533,	13,	'Smart Burner',	1,	'Replac',	NULL,	NULL,	3,	'5/2/2022 9:29',	1,	1153,	189,	0),
	(534,	10,	'Countertop',	3,	'Clean',	NULL,	NULL,	3,	'5/2/2022 9:29',	1,	1153,	189,	0),

	(538,	2,	'Floors',	  3,	'Clean',	NULL,	NULL,	4,	'5/2/2022 10:33',	1,	793,	190,	0),
	(539,	23,	'Shower/Tub', 3,	'Clean',	NULL,	NULL,	4,	'5/2/2022 10:33',	1,	793,	190,	0),
	(540,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2,	'5/2/2022 10:33',	1,	793,	190,	1),
	(541,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3,  '5/2/2022 10:34',	1,	793,	190,	1)

GO