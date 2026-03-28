/// Filter Floor records for this location
ClearCollect(ccFloor,
    Defaults('[insp].[Floor]'),
        LastN(
            Filter('[insp].[Floor]', 
            content_id=gvContent_id
            &&Active),
            2)
    );

// Filter Floor View records for this location
ClearCollect(ccFloorView,
    Defaults('[insp].[FloorForm_View]'),
        LastN(
            Filter('[insp].[FloorForm_View]', 
            content_id=gvContent_id
            &&Active),
            2)
    );

        
// Filter  Furniture records for this location
ClearCollect(ccFurniture,
    Defaults('[insp].[Furniture]'),
        LastN(
            Filter('[insp].[Furniture]', 
            content_id=gvContent_id
            &&Active),
            2)
);

/// Furniture View records for this location
ClearCollect(ccFurnitureView,
    Defaults('[insp].[FurnitureForm_View]'),
        LastN(
            Filter('[insp].[FurnitureForm_View]', 
            content_id=gvContent_id
            &&Active),
            2)
);

//  Filter Kitchen 
ClearCollect(ccKitchen,
    Defaults('[insp].[Kitchen]'),
        LastN(
            Filter('[insp].[Kitchen]',
            content_id=gvContent_id
            &&Active),
        2)
);

//  Filter Kitchen View
ClearCollect(ccKitchenView,
    Defaults('[insp].[KitchenForm_View]'),
        LastN(
            Filter('[insp].[KitchenForm_View]',
            content_id=gvContent_id
            &&Active),
        2)
);

// Filter Bathroom 
ClearCollect(ccBathroom,
    Defaults('[insp].[Bathroom]'),
        LastN(
            Filter('[insp].[Bathroom]',
            content_id=gvContent_id
            &&Active),
        2)
);

// Filter Bathroom View 
ClearCollect(ccBathroomView,
    Defaults('[insp].[FullBathroom_View]'),
        LastN(
            Filter('[insp].[FullBathroom_View]',
            content_id=gvContent_id
            &&Active),
        2)
);



ClearCollect(ccInspectionReview,
    Defaults('insp.InspectionReview'),
    LastN(
        Filter('insp.InspectionReview',
        content_id=gvContent_id
        &&Active),
    5)
);




