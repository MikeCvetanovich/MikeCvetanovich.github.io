--- /// ON START APP SCHEMA DEF



ClearCollect(
    ccFurniture,
    ShowColumns(
        Table(Defaults('[insp].[Furniture]')),
        "FurnitureID",
        "FurnDescriptionID",
        "FurnManufID",
        "FurnStyleID",
        "FurnColorID",
        "FurnCountID",
        "FurnTableTypeID",
        "FurnDiningChairCountID",
        "FurnMattressDate",
        "FurnInstallDate",
        "FurnNote",
        "Active",
        "LivAreaTypeID",
        "content_id",
        "DateCreated",
        "StarRezLivAreaID"
    )
);

ClearCollect(
    ccFurnitureView,
    ShowColumns(
        Table(Defaults('[insp].[FurnitureForm_View]')),
        "FurnViewID",
        "FurnDescription",
        "FurnManufDesc",
        "FurnStyle",
        "FurnColor",
        "FurnCount",
        "FurnTableType",
        "ChairCount",
        "FurnMattressDate",
        "FurnInstallDate",
        "FurnNote",
        "Active",
        "content_id",
        "DateCreated",
        "StarRezLivAreaID"
    )
);

/////////////

ClearCollect(
    ccInspPhotoView,
    ShowColumns(
    Table(Defaults('insp.InspPhoto_View')),
        "CompID",
        "InspID",
        "content_id",
        "Active",
        "FullName",
        "ImageTaken",
        "InspDate",
        "ImageID",
        "InspReasonID",
        "InspReasonType",
        "LivAreaTypeID",
        "LivAreaDecription",
        "PhotoDateTime",
        "PhotoNote",
        "SetID",
        "StarRezLivAreaID",
        "Unit"
    )
);

ClearCollect(ccLivingAreaRoomCond,
    Defaults('[insp].[LivingAreaRoomCond]'),
        {}
);

ClearCollect(ccFloor,
    Defaults('[insp].[Floor]'),
        {}
);
Clear(ccFloor);

ClearCollect(ccFloorView,
    Defaults('[insp].[FloorForm_View]'),
        {}
);
Clear(ccFloorView);

///////////

ClearCollect(
    ccKitchen,
    Defaults('[insp].[Kitchen]'),
    {}

);
Clear(ccKitchen);

ClearCollect(ccKitchenView, 
    Defaults('[insp].[KitchenForm_View]'),
        {}
);
Clear(ccKitchenView);

///////////

ClearCollect(ccBathroom,
    Defaults('[insp].[Bathroom]'),
    {}
);
Clear(ccBathroom);

ClearCollect(ccBathShower,
    Defaults('[insp].[BathShower]'),
    {}
);
Clear(ccBathShower);

ClearCollect(ccBathTub,
    Defaults('[insp].[BathTub]'),
    {}
);
Clear(ccBathTub);

ClearCollect(ccBathroomView,
    Defaults('[insp].[FullBathroom_View]'),
    {}
);
Clear(ccBathroomView);





/// ALL BATHROOM ITEM TABLES -- DEFINE SCHEMA

ClearCollect(ccBathRmAccessories,
    Defaults('[insp].[BathRmAccessories]'),
    {}
);
Clear(ccBathRmAccessories);

ClearCollect(ccBathRmCommodeFlushType,
    Defaults('[insp].[BathRmCommodeFlushType]'),
    {}
);
Clear(ccBathRmCommodeFlushType);

ClearCollect(ccBathRmCommodeMountType,
    Defaults('[insp].[BathRmCommodeMountType]'),
    {}
);
Clear(ccBathRmCommodeMountType);

ClearCollect(ccBathRmExhaustFan,
    Defaults('[insp].[BathRmExhaustFan]'),
    {}
);
Clear(ccBathRmExhaustFan);

ClearCollect(ccBathRmMirror,
    Defaults('[insp].[BathRmMirror]'),
    {}
);
Clear(ccBathRmMirror);

ClearCollect(ccBathRmSink,
    Defaults('[insp].[BathRmSink]'),
    {}
);
Clear(ccBathRmSink);

ClearCollect(ccBathRmSinkColor,
    Defaults('[insp].[BathRmSinkColor]'),
    {}
);
Clear(ccBathRmSinkColor);

ClearCollect(ccBathRmVanity,
    Defaults('[insp].[BathRmVanity]'),
    {}
);
Clear(ccBathRmVanity);

ClearCollect(ccBathRmVanityColor,
    Defaults('[insp].[BathRmVanityColor]'),
    {}
);
Clear(ccBathRmVanityColor);

/// SHOWER ITEMS

ClearCollect(ccBathShowerFlrMaterial,
    Defaults('[insp].[BathShowerFlrMaterial]'),
    {}
);
Clear(ccBathShowerFlrMaterial);


ClearCollect(ccBathShowerOpening,
    Defaults('[insp].[BathShowerOpening]'),
    {}
);
Clear(ccBathShowerOpening);

ClearCollect(ccBathShowerWallMaterial,
    Defaults('[insp].[BathShowerWallMaterial]'),
    {}
);
Clear(ccBathShowerWallMaterial);

/// TUB ITEMS

ClearCollect(ccBathTubFlrMaterial,
    Defaults('[insp].[BathTubFlrMaterial]'),
    {}
);
Clear(ccBathTubFlrMaterial);

ClearCollect(ccBathTubOpening,
    Defaults('[insp].[BathTubOpening]'),
    {}
);
Clear(ccBathTubOpening);

ClearCollect(ccBathTubWallMaterial,
    Defaults('[insp].[BathTubWallMaterial]'),
    {}
);
Clear(ccBathTubWallMaterial);


ClearCollect(
    ccLivingAreaRoomCondView,
    ShowColumns(
       Table(Defaults('[insp].[LivingAreaRoomCond_View]')),
        "InspID",
        "StarRezLivAreaID",
        "CompID",
        "FullName",
        "LivingAreaRoomCondView",
        "content_id",
        "Unit",
        "LivAreaTypeID",
        "LivAreaDecription",
        "RmCondRating",
        "RmCondNotes"
));
Clear(ccLivingAreaRoomCondView);


ClearCollect(ccInspectionReview,
    Defaults('insp.InspectionReview'),
    {}
);
Clear(ccInspectionReview);


