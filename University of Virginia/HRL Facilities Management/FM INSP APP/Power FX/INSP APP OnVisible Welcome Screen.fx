//OnVisible Welcome Screen

UpdateContext({LoadingSpinner: true });
Set(ActiveRecord_InspReview, false );
Clear(ccFurnitureView);
Set(Insp_History, false );

//Get AppVersion info
Set(InspAppId, GUID("08b2e19b-582b-4370-b147-83429812ea39"));
ClearCollect(myAppVersions, PowerAppsforMakers.GetAppVersions(InspAppId) );
ClearCollect(myAppVersionsv2, Ungroup(myAppVersions, value));
ClearCollect(myAppVersionsv3, Filter(myAppVersionsv2, properties.lifeCycleId="Published"));

Set(PublishedLiveAppVersion, LookUp(myAppVersionsv2, properties.lifeCycleId="Published").tags.publisherVersion);
Set(PublishedVersionDate, LookUp(myAppVersionsv2, properties.lifeCycleId="Published").properties.appVersion);
ClearCollect(myAppPublishedVersions, Filter(myAppVersionsv2, properties.appVersion<=PublishedVersionDate));

//Set Fixture Submit Disable Button 
Set(DisableSubmitButton_LR, true );
Set(DisableSubmitButton_Kitchen, true );
Set(DisableSubmitButton_Bath, true );
Set(DisableSubmitButton_Hall, true );
Set(DisableSubmitButton_BR1, true );
Set(DisableSubmitButton_BR2, true );
Set(DisableSubmitButton_BR3, true );
Set(DisableSubmitButton_Basement, true );

//Set Completed checkmark labels default status 
Set(RoomCondCompletedLabel, false );
Set(FixtureCondCompletedLabel, false );
Set(FurnCompletedLabel, false );
Set(FlrCompletedLabel, false );
Set(KitchenCompletedLabel, false );
Set(BathroomCompletedLabel, false );

//Set AllGood Check Boxes default
Set(AllGood_LR, false );
Set(AllGood_Kitchen, false );
Set(AllGood_Bath, false );
Set(AllGood_Hall, false );
Set(AllGood_BR1, false );
Set(AllGood_BR2, false );
Set(AllGood_BR3, false );
Set(AllGood_Basement, false );

//temp table storage loaded OnVisible Welcome Screen. 
//Sets Inventory Forms visible on startup
Set(InventoryFormsVisible, true );
Clear(ccSupportAnimal);
Clear(ccRenovationStatus);
Clear(ccBidetApproval);
Clear(ccInspPhoto);
Clear(ccInspPhotoView);
Clear(ccInspectionReview);

Set(ActiveRecord_RS, false);
Set(ActiveRecord_SA, false);
Set(ActiveRecord_BA, false);

Set( _firstDayOfMonth, DateAdd( Today(), 1 - Day( Today() ), TimeUnit.Days ) );  
Set( _firstDayInView, DateAdd( _firstDayOfMonth, -(Weekday(_firstDayOfMonth) - 1), TimeUnit.Days ) );
Set( _lastDayOfMonth, DateAdd( DateAdd( _firstDayOfMonth, 1, TimeUnit.Months ), -1, TimeUnit.Days ) );

//NoPhoto is used to set Flags in Photo History lookup.
ClearCollect(ccNoPhotos,
    Filter(
        'insp.NoPhotos',
        content_id=content_id)
    );
    


  Concurrent(
    ClearCollect(ccInspection, '[insp].[Inspection]'),             
    ClearCollect(ccInspectionReview, 'insp.InspectionReview'),
    ClearCollect(ccInspReasonType,'[insp].[InspReasonType]'),
    ClearCollect(ccLivingAreaType,'[insp].[LivingAreaType]'),
    ClearCollect(ccFixtureType,'[insp].[FixtureType]'),

    
    ClearCollect(ccStarRezLookUp,
            Filter('[insp].[StarRezLookUp]',content_id=content_id)),

    // *** SA & RS Reports ***
  
    ClearCollect(ccRenovationStatus,'[insp].[RenovationStatus]'),
    ClearCollect(ccSupportAnimal,'[insp].[SupportAnimal]'),
    ClearCollect(ccBidetApproval,'insp.BidetApproval'),
    

    /// ALL BATHROOM ITEM TABLES
    ClearCollect(ccBathRmAccessories, '[insp].[BathRmAccessories]'),
    ClearCollect(ccBathRmCommodeFlushType, '[insp].[BathRmCommodeFlushType]'),
    ClearCollect(ccBathRmCommodeMountType, '[insp].[BathRmCommodeMountType]'),
    ClearCollect(ccBathRmExhaustFan, '[insp].[BathRmExhaustFan]'),
    ClearCollect(ccBathRmMirror, '[insp].[BathRmMirror]'),
    ClearCollect(ccBathRmSink, '[insp].[BathRmSink]'),
    ClearCollect(ccBathRmSinkColor, '[insp].[BathRmSinkColor]'),
    ClearCollect(ccBathRmVanity, '[insp].[BathRmVanity]'),
    ClearCollect(ccBathRmVanityColor, '[insp].[BathRmVanityColor]'),
    /// SHOWER ITEMS
    ClearCollect(ccBathShowerFlrMaterial, '[insp].[BathShowerFlrMaterial]'),
    ClearCollect(ccBathShowerOpening, '[insp].[BathShowerOpening]'),
    ClearCollect(ccBathShowerWallMaterial, '[insp].[BathShowerWallMaterial]'),
    /// TUB ITEMS
    ClearCollect(ccBathTubFlrMaterial, '[insp].[BathTubFlrMaterial]'),
    ClearCollect(ccBathTubOpening, '[insp].[BathTubOpening]'),
    ClearCollect(ccBathTubWallMaterial, '[insp].[BathTubWallMaterial]'),

        /// ALL KITCHEN ITEM TABLES
    ClearCollect(ccKitCabinet, '[insp].[KitCabinet]'),
    ClearCollect(ccKitCabinetColor, '[insp].[KitCabinetColor]'),
    ClearCollect(ccKitCountertop, '[insp].[KitCountertop]'),
    ClearCollect(ccKitCountertopColor, '[insp].[KitCounterColor]'), 
    ClearCollect(ccKitStove, '[insp].[KitStove]'),
    ClearCollect(ccKitStoveColor, '[insp].[KitStoveColor]'),
    ClearCollect(ccKitRefrigerator, '[insp].[KitRefrigerator]'),
    ClearCollect(ccKitRefrigColor, '[insp].[KitRefrigColor]'),
    ClearCollect(ccKitDishWasher, '[insp].[KitDishWasher]'),
    ClearCollect(ccKitFan, '[insp].[KitExhaustFan]'),
    ClearCollect(ccKitMicrowave, '[insp].[KitMicrowave]'),
    ClearCollect(ccKitWasher, '[insp].[KitWasher]'),
    ClearCollect(ccKitDryer, '[insp].[KitDryer]')


);





//Global variables from O365 AD
Set(gvCompID,Left(User().Email,Len(User().Email)-13));
Set(gvLoginDateTime,Now());
Set(gvFullName,(User().FullName));
Set(gvDepartment,(Office365Users.MyProfileV2().department)
);

//Will load InspectionType Selector after "Apartment Inspection" is selected.
UpdateContext({InspReasonSelectVisible: false });

//Will load Label after "Apartment Inspection" is selected.
UpdateContext({InspReasonLabel: false });
Set(gvContent_id,Blank());
Set(gvStarRezCount,CountRows(ForAll(Distinct('[insp].[StarRezLookUp]',content_id), {Result: ThisRecord.Value})));


UpdateContext({LoadingSpinner: false });