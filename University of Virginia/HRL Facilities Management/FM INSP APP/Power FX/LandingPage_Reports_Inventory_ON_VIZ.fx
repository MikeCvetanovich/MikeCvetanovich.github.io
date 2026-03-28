UpdateContext({ LoadingSpinner: true });
Set(gvCurrentRoomDesc, Blank());

If(BackFromInspReview,
    UpdateContext({ LoadingSpinner: false})
    
);

If(ReturnFromExitPage,
    UpdateContext({ LoadingSpinner: false})
    
);

If(ReturnWO_Decription,
    UpdateContext({ LoadingSpinner: false})
    
);

Set(gvSameFlooring, true );
Set(gvSameFlooring, false );
Set(WasSameFlrThroughout, true );
Set(WasSameFlrThroughout, false );

UpdateContext({SameFloorOverRide:false,PlayAudioNoteSameFloor:false,NoteSameFloor:false});

Dropdown_LandingPage_1.SelectedText.LivAreaTypeID = VarLivingAreaSelection;


//Set Completed checkmark labels default status 
Set(RoomCondCompletedLabel, false );
Set(FixtureCondCompletedLabel, false );
Set(FurnCompletedLabel, false );
Set(FlrCompletedLabel, false );
Set(KitchenCompletedLabel, false );


Set(
    gvStartTimer,
    false 
);



//Pre-filter all Forms ****************************




// *** Floor Form *** //
//Check Floor is active record
UpdateContext({PlayAudioNoteSameFloor: false });
// Checks if SameFloorThroughout(SFT) is Active / this Inspection. 

Set(SFT_ActiveThisInsp, LookUp(
    ShowColumns(ccFloor,"FlrThroughoutFlag","LivAreaTypeID","Active","content_id","StarRezLivAreaID"),
    FlrThroughoutFlag
    &&Active&&StarRezLivAreaID=gvStarRezLivAreaID&&content_id=gvContent_id&&LivAreaTypeID=gvCurrentRoomID)
);

Set(SFT_SetFalseByRoom,    //Any Active Floor record: this location & current room & SFT = false
LookUp(ccFloor,
content_id = gvContent_id
&&LivAreaTypeID=gvCurrentRoomID
&&FlrThroughoutFlag=false  
&& Active)
);

Set(SFT_ActiveFlagAnyRoom,
LookUp(ccFloor,
content_id = gvContent_id
&&FlrThroughoutFlag
&& Active)
);

Set(SFT_ActiveRoomID,
Value(SFT_ActiveFlagAnyRoom.LivAreaTypeID));


If(SFT_ActiveThisInsp.Active,   // if active, SFT selected true in current room && current Inspection 
   
    If(SFT_ActiveThisInsp.FlrThroughoutFlag&&SFT_ActiveRoomID=gvCurrentRoomID,   
        Set(gvSameFlooring, true ) // Sets all floors SFT true
    )
,

    If(SFT_SetFalseByRoom.Active&&SFT_ActiveRoomID<>gvCurrentRoomID,  //      
        Set(WasSameFlrThroughout, true)        
        )
);

If(WasSameFlrThroughout,  //  if current room record Active           
        Set(gvSameFlooring, false ),

    If(SFT_ActiveRoomID=0,
        Set(gvSameFlooring, false ),
        Set(gvSameFlooring, true )
    ) 
);



If(gvSameFlooring,
        Set(LivAreaID,
            LookUp(ccFloor,
            content_id = gvContent_id
            && Active)
        );

        If(LivAreaID.Active,
        Set(ActiveRecord_Floor, true),
        Set(ActiveRecord_Floor, false)
        );
,

        Set(LivAreaID,
            LookUp(ccFloor,
            content_id = gvContent_id
            && Active
            && LivAreaTypeID=gvCurrentRoomID
            )
        );


        If(LivAreaID.Active&&SFT_SetFalseByRoom.Active,
            Set(ActiveRecord_Floor, true),
            Set(ActiveRecord_Floor, false)
        );
);

//Set Floor Default FormMode
Set(FormMode_Floor, FormMode );
Set(FormMode_Floor, FormMode.New );

If(ActiveRecord_Floor,
Set(FormMode_Floor, FormMode.View ),
Set(FormMode_Floor, FormMode.New ));

If(ActiveRecord_Floor,
Set(FormMode_FloorViewMode, FormMode.View ),
Set(FormMode_FloorViewMode, FormMode.New )
);

// *** Furniture Form *** //
Set(
    FurnitureFormContentID,
    LookUp(
        ccFurniture,
        content_id = gvContent_id,
        ThisRecord
    )
);

Set(
    FurnitureFormActive,
    LookUp(
        ccFurniture,
        Active,
        ThisRecord
    )
);

Set(FurnLivAreaID,
    LookUp(
        ccFurniture,
        LivAreaTypeID=VarLivingAreaSelection,
        ThisRecord
    )
);

If(
FurnitureFormContentID.content_id=gvContent_id&&FurnitureFormActive.Active&&FurnLivAreaID.LivAreaTypeID=gvCurrentRoomID,
    Set(
        ActiveRecord_Furniture,
        true
    ),
    Set(
        ActiveRecord_Furniture,
        false
    )
);

//Set Furniture FormMode's
Set(FormMode_Furniture, FormMode );
Set(FormMode_FurnitureViewMode, FormMode );

If(ActiveRecord_Furniture,
Set(FormMode_Furniture, FormMode.View),
Set(FormMode_Furniture,FormMode.New));

If(ActiveRecord_Furniture,
Set(FormMode_FurnitureViewMode, FormMode.View),
Set(FormMode_FurnitureViewMode,FormMode.New));

// *** Kitchen Form *** //
Set(
    KitchenFormContentID,
    LookUp(
        ccKitchen,
        content_id=gvContent_id
        &&Active,
        ThisRecord
    )
);


If(KitchenFormContentID.Active,

    Set(
        ActiveRecord_Kitchen,
        true
    ),
    Set(
        ActiveRecord_Kitchen,
        false
    )
);

If(ActiveRecord_Kitchen,
Set(FormMode_KitchenForm, FormMode.View),
Set(FormMode_KitchenForm, FormMode.New)
);

If(ActiveRecord_Kitchen,
Set(FormMode_KitchenFormView, FormMode.View),
Set(FormMode_KitchenFormView, FormMode.New)
);



//Set Bathroom FormMode
Set(
    BathroomFormContentID,
    LookUp(
        ccBathroom,
        content_id = gvContent_id,
        ThisRecord
    )
);

Set(
    BathroomFormActive,
    LookUp(
        ccBathroom,
        Active,
        ThisRecord
    )
);

If(BathroomFormContentID.content_id=gvContent_id&&BathroomFormActive.Active,
    Set(
        ActiveRecord_Bathroom,
        true
    ),
    Set(
        ActiveRecord_Bathroom,
        false
    )
);


//Set Bathroom FormMode
Set(FormMode_BathroomFormView,FormMode);

If(ActiveRecord_Bathroom,
Set(FormMode_Bathroom, FormMode.Edit),
Set(FormMode_Bathroom, FormMode.New)
);

//Set BathroomForm View 

If(ActiveRecord_Bathroom,
Set(FormMode_BathroomFormView, FormMode.View),
Set(FormMode_BathroomFormView, FormMode.New)
);

// ** Bathroom Forms ** //
Set(StartTimer_BathroomRecord, false);




UpdateContext({ LoadingSpinner: false});




//ExecuteSQLstoredprocedureonPowerAppsbuttonclick.Run(Value(SelectLivingAreaDropdown.Selected.LivAreaTypeID))
