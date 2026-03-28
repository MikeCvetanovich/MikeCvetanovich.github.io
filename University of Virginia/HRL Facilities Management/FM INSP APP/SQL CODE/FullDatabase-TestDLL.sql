USE HRLFM;
GO

IF OBJECT_ID('[insp].[LivingArea]') IS NOT NULL
DROP TABLE [insp].[LivingArea];
GO

IF OBJECT_ID('[insp].[RoomCond]') IS NOT NULL
DROP TABLE [insp].[RoomCond];
GO

IF OBJECT_ID('[insp].[InspPhoto]') IS NOT NULL
DROP TABLE [insp].[InspPhoto];
GO

IF OBJECT_ID('[insp].[InspPhotoNotes]') IS NOT NULL
DROP TABLE [insp].[InspPhotoNotes];
GO


CREATE TABLE [insp].[OfficeAppTble] (
    [CompID] int IDENTITY(1,1) NOT NULL ,
    [FullName] varchar(50)  NOT NULL ,
    [Dept] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_OfficeAppTble] PRIMARY KEY CLUSTERED (
        [CompID] ASC
    )
)

CREATE TABLE [insp].[RecordTable] (
    [RecordID] int  NOT NULL ,
    [InspID] int ,
    [StartTime] timestamp  ,
    [content_id] int  ,
    [CompID] nchar(10)   ,
    [InspReasonID] int   ,
    [InspResultID] int   ,
    [LivAreaID] int ,
    CONSTRAINT [PK_RecordTable] PRIMARY KEY CLUSTERED (
        [RecordID] ASC
    )
)

CREATE TABLE [insp].[StrzBldg] (
    [content_id] numeric(20,0) IDENTITY(1,1) NOT NULL ,
    [Area] varchar(50)  NOT NULL ,
    [Building] varchar(50)  NOT NULL ,
    [Unit] int  NOT NULL ,
    [UnitType] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_StrzBldg] PRIMARY KEY CLUSTERED (
        [content_id] ASC
    )
)

CREATE TABLE [insp].[Inspection] (
    [InspID] int IDENTITY(1,1) NOT NULL ,
    [CompID] int  NOT NULL ,
    [ContentID] int  NOT NULL ,
    [InspReasonID] int  NOT NULL ,
    [InspCreationDate] datetime  NOT NULL CONSTRAINT [DF_Inspection_InspCreationDate] DEFAULT (getutcdate()),
    [OverallResults] varchar(50)  NOT NULL ,
    [InspReasonType] varchar(50)  NOT NULL ,
    [RecordID] int  NOT NULL ,
    [ImageID] int  NOT NULL ,
    [InspNotes] varchar(255)  NOT NULL ,
    [InspDateModified] datetime  NOT NULL ,
    CONSTRAINT [PK_Inspection] PRIMARY KEY CLUSTERED (
        [InspID] ASC
    )
)

CREATE TABLE [insp].[LivingArea] (
    [LivAreaID] int IDENTITY(1,1) NOT NULL ,
    [InspID] int  NOT NULL ,
    [RoomCondID] int  NOT NULL ,
    [LivAreaDecription] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_LivingArea] PRIMARY KEY CLUSTERED (
        [LivAreaID] ASC
    )
)

CREATE TABLE [insp].[RoomCond] (
    [RoomCondID] int IDENTITY(1,1) NOT NULL ,
    [LivAreaID] int  NOT NULL ,
    [FixtureType] int  NOT NULL ,
    [FurnID] int  NOT NULL ,
    [FloorID] int  NOT NULL ,
    [TubTypeID] int  NOT NULL ,
    [DamageID] int  NOT NULL ,
    [RmCondRating] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_RoomCond] PRIMARY KEY CLUSTERED (
        [RoomCondID] ASC
    )
)

CREATE TABLE [insp].[DamageList] (
    [DamageID] int IDENTITY(1,1) NOT NULL ,
    [RoomCondID] int  NOT NULL ,
    [InspPhoto] int  NOT NULL ,
    [DamageNotes] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_DamageList] PRIMARY KEY CLUSTERED (
        [DamageID] ASC
    )
)

CREATE TABLE [insp].[InspReasonType] (
    [InspReasonID] int IDENTITY(1,1) NOT NULL ,
    [InspID] int  NOT NULL ,
    [InspReasonType] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_InspReasonType] PRIMARY KEY CLUSTERED (
        [InspReasonID] ASC
    )
)

-- Reason Types are Yearly, pre or post moveout, etc
CREATE TABLE [insp].[InspPhoto] (
    [ImageID] int IDENTITY(1,1) NOT NULL ,
    [InspID] int  NOT NULL ,
    [PhotoAsText] varchar(MAX)  NULL ,
    [PhotosNoteID] int  NULL ,
    CONSTRAINT [PK_InspPhoto] PRIMARY KEY CLUSTERED (
        [ImageID] ASC
    )
)

CREATE TABLE [insp].[InspPhotoNotes] (
    [PhotosNoteID] int IDENTITY(1,1) NOT NULL ,
    [PhNoteDate] datetime  NULL ,
    [PhNote] varchar(255)  NULL ,
    CONSTRAINT [PK_InspPhotoNotes] PRIMARY KEY CLUSTERED (
        [PhotosNoteID] ASC
    )
)

CREATE TABLE [insp].[AptFixtureType] (
    [FixtureType] int IDENTITY(1,1) NOT NULL ,
    [LivAreaID] int  NOT NULL ,
    [FixtureTypeDesc] varchar(50)  NULL ,
    CONSTRAINT [PK_AptFixtureType] PRIMARY KEY CLUSTERED (
        [FixtureType] ASC
    )
)

CREATE TABLE [insp].[FurntureTypes] (
    [FurnID] int IDENTITY(1,1) NOT NULL ,
    [LivAreaID] int  NOT NULL ,
    [FurnMarnuf] varchar(50)  NULL ,
    [FurnColor] varchar(50)  NULL ,
    [FurnMaterial] varchar(50)  NULL ,
    [FurnTableType] varchar(50)  NULL ,
    [FurnChairCnt] int  NULL ,
    [FurnPurcDate] datetime  NULL ,
    CONSTRAINT [PK_FurntureTypes] PRIMARY KEY CLUSTERED (
        [FurnID] ASC
    )
)

CREATE TABLE [insp].[FloorTypes] (
    [FloorID] int IDENTITY(1,1) NOT NULL ,
    [LivAreaID] int  NOT NULL ,
    [FlrManuf] varchar(50)  NULL ,
    [FlrMaterial] varchar(50)  NULL ,
    [FlrColor] varchar(50)  NULL ,
    [FlrPurchDate] datetime  NULL ,
    CONSTRAINT [PK_FloorTypes] PRIMARY KEY CLUSTERED (
        [FloorID] ASC
    )
)

CREATE TABLE [insp].[TubTypes] (
    [TubTypeID] int IDENTITY(1,1) NOT NULL ,
    [LivAreaID] int  NOT NULL ,
    [TubManuf] varchar(50)  NULL ,
    [TubMaterial] varchar(50)  NULL ,
    CONSTRAINT [PK_TubTypes] PRIMARY KEY CLUSTERED (
        [TubTypeID] ASC
    )
)

CREATE TABLE [insp].[FixtureCond] (
    [FixCondID] int IDENTITY(1,1) NOT NULL ,
    [ConditionRating] varchar(50)  NULL ,
    CONSTRAINT [PK_FixtureCond] PRIMARY KEY CLUSTERED (
        [FixCondID] ASC
    )
)

ALTER TABLE [insp].[OfficeAppTble] WITH CHECK ADD CONSTRAINT [FK_OfficeAppTble_OfficeAppTble.CompID] FOREIGN KEY([OfficeAppTble.CompID])
REFERENCES [insp].[Inspection] ([CompID])

ALTER TABLE [insp].[OfficeAppTble] CHECK CONSTRAINT [FK_OfficeAppTble_OfficeAppTble.CompID]

ALTER TABLE [insp].[recordstable] WITH CHECK ADD CONSTRAINT [FK_recordstable_RecordID] FOREIGN KEY([RecordID])
REFERENCES [insp].[Inspection] ([RecordID])

ALTER TABLE [insp].[recordstable] CHECK CONSTRAINT [FK_recordstable_RecordID]

ALTER TABLE [insp].[StrzBldg] WITH CHECK ADD CONSTRAINT [FK_StrzBldg_content_id] FOREIGN KEY([content_id])
REFERENCES [insp].[Inspection] ([ContentID])

ALTER TABLE [insp].[StrzBldg] CHECK CONSTRAINT [FK_StrzBldg_content_id]

ALTER TABLE [insp].[LivingArea] WITH CHECK ADD CONSTRAINT [FK_LivingArea_InspID] FOREIGN KEY([InspID])
REFERENCES [insp].[Inspection] ([InspID])

ALTER TABLE [insp].[LivingArea] CHECK CONSTRAINT [FK_LivingArea_InspID]

ALTER TABLE [insp].[RoomCond] WITH CHECK ADD CONSTRAINT [FK_RoomCond_LivAreaID] FOREIGN KEY([LivAreaID])
REFERENCES [insp].[LivingArea] ([LivAreaID])

ALTER TABLE [insp].[RoomCond] CHECK CONSTRAINT [FK_RoomCond_LivAreaID]

ALTER TABLE [insp].[RoomCond] WITH CHECK ADD CONSTRAINT [FK_RoomCond_FixtureType] FOREIGN KEY([FixtureType])
REFERENCES [insp].[AptFixtureType] ([FixtureType])

ALTER TABLE [insp].[RoomCond] CHECK CONSTRAINT [FK_RoomCond_FixtureType]

ALTER TABLE [insp].[RoomCond] WITH CHECK ADD CONSTRAINT [FK_RoomCond_FurnID] FOREIGN KEY([FurnID])
REFERENCES [insp].[FurntureTypes] ([FurnID])

ALTER TABLE [insp].[RoomCond] CHECK CONSTRAINT [FK_RoomCond_FurnID]

ALTER TABLE [insp].[RoomCond] WITH CHECK ADD CONSTRAINT [FK_RoomCond_FloorID] FOREIGN KEY([FloorID])
REFERENCES [insp].[FloorTypes] ([FloorID])

ALTER TABLE [insp].[RoomCond] CHECK CONSTRAINT [FK_RoomCond_FloorID]

ALTER TABLE [insp].[RoomCond] WITH CHECK ADD CONSTRAINT [FK_RoomCond_TubTypeID] FOREIGN KEY([TubTypeID])
REFERENCES [insp].[TubTypes] ([TubTypeID])

ALTER TABLE [insp].[RoomCond] CHECK CONSTRAINT [FK_RoomCond_TubTypeID]

ALTER TABLE [insp].[RoomCond] WITH CHECK ADD CONSTRAINT [FK_RoomCond_DamageID] FOREIGN KEY([DamageID])
REFERENCES [insp].[DamageList] ([DamageID])

ALTER TABLE [insp].[RoomCond] CHECK CONSTRAINT [FK_RoomCond_DamageID]

ALTER TABLE [insp].[InspReasonType] WITH CHECK ADD CONSTRAINT [FK_InspReasonType_InspReasonID] FOREIGN KEY([InspReasonID])
REFERENCES [insp].[Inspection] ([InspReasonID])

ALTER TABLE [insp].[InspReasonType] CHECK CONSTRAINT [FK_InspReasonType_InspReasonID]

ALTER TABLE [insp].[InspPhoto] WITH CHECK ADD CONSTRAINT [FK_InspPhoto_ImageID] FOREIGN KEY([ImageID])
REFERENCES [insp].[Inspection] ([ImageID])

ALTER TABLE [insp].[InspPhoto] CHECK CONSTRAINT [FK_InspPhoto_ImageID]

ALTER TABLE [insp].[InspPhoto] WITH CHECK ADD CONSTRAINT [FK_InspPhoto_PhotosNoteID] FOREIGN KEY([PhotosNoteID])
REFERENCES [insp].[InspPhotoNotes] ([PhotosNoteID])

ALTER TABLE [insp].[InspPhoto] CHECK CONSTRAINT [FK_InspPhoto_PhotosNoteID]

ALTER TABLE [insp].[AptFixtureType] WITH CHECK ADD CONSTRAINT [FK_AptFixtureType_FixtureType] FOREIGN KEY([FixtureType])
REFERENCES [insp].[FixtureCond] ([FixCondID])

ALTER TABLE [insp].[AptFixtureType] CHECK CONSTRAINT [FK_AptFixtureType_FixtureType]
