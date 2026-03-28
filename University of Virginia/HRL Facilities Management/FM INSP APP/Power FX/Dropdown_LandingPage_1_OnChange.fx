Set(VarLivingAreaSelection, Dropdown_LandingPage_1.Selected.LivAreaTypeID);
Set(gvCurrentRoomDesc, Dropdown_LandingPage_1.Selected.LivAreaDecription);
Set(gvCurrentRoomID, Dropdown_LandingPage_1.Selected.LivAreaTypeID);

If(VarLivingAreaSelection=1, Navigate(LandingPage_Reports_Inventory),
VarLivingAreaSelection=2,Navigate(InventoryItemsPage,ScreenTransition.None,{LoadingSpinner:true}),
VarLivingAreaSelection=3,Navigate(InventoryItemsPage,ScreenTransition.None,{LoadingSpinner:true}),
VarLivingAreaSelection=4,Navigate(InventoryItemsPage,ScreenTransition.None,{LoadingSpinner:true}),
VarLivingAreaSelection=5,Navigate(InventoryItemsPage,ScreenTransition.None,{LoadingSpinner:true}),
VarLivingAreaSelection=6,Navigate(InventoryItemsPage,ScreenTransition.None,{LoadingSpinner:true}),
VarLivingAreaSelection=7,Navigate(InventoryItemsPage,ScreenTransition.None,{LoadingSpinner:true}),
VarLivingAreaSelection=8,Navigate(InventoryItemsPage,ScreenTransition.None,{LoadingSpinner:true}),
VarLivingAreaSelection=9,Navigate(InventoryItemsPage,ScreenTransition.None,{LoadingSpinner:true})

);

Set(LivRmDisplayMode, DisplayMode);
Set(FurnDisplayMode, DisplayMode);
Set(KitDisplayMode, DisplayMode);
Set(BathDisplayMode, DisplayMode);


If(VarLivingAreaSelection=2||5||6||7||8||9,
    Set(KitDisplayMode, Disabled)&&Set(BathDisplayMode, Disabled)
);
If(VarLivingAreaSelection=3,
    Set(KitDisplayMode, DisplayMode.Edit) && Set(FurnDisplayMode, Disabled) && Set(BathDisplayMode, Disabled)
,
If(VarLivingAreaSelection=4,
    Set(BathDisplayMode, DisplayMode.Edit) && Set(FurnDisplayMode, Disabled) && Set(KitDisplayMode, Disabled) 
));

ClearCollect(ccFloor,
        LastN(
            Filter('[insp].[Floor]', 
            content_id=gvContent_id
            &&Active),
            1)
    );


If(VarLivingAreaSelection=3,
    ClearCollect(ccKitchen,
        LastN(
            Filter('[insp].[Kitchen]', 
            content_id=gvContent_id
            &&Active),
            1)
    )
);

If(VarLivingAreaSelection=3,
ClearCollect(ccKitchenView,
    Defaults('[insp].[KitchenForm_View]'),
        LastN(
            Filter('[insp].[KitchenForm_View]',
            content_id=gvContent_id
            &&Active),
        1)
    )
);

If(VarLivingAreaSelection=4,
    ClearCollect(ccBathroom,
        LastN(
            Filter('[insp].[Bathroom]', 
            content_id=gvContent_id
            &&Active),
            1)
    )
);
If(VarLivingAreaSelection=4,
    ClearCollect(ccBathroomView,
        LastN(
            Filter('[insp].[FullBathroom_View]', 
            content_id=gvContent_id
            &&Active),
            1)
    )
);

If(VarLivingAreaSelection=2||5||6||7||8,
    ClearCollect(ccFurniture,
        LastN(
            Filter('[insp].[Furniture]', 
            content_id=gvContent_id
            &&Active),
            20)
    )
);


Reset(Dropdown_LandingPage_1);

