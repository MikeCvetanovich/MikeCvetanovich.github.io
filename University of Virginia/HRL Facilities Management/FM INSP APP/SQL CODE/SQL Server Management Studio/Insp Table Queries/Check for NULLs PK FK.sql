USE HRLFM
GO

select * from PK_table
left join FK_table on FK_ID = PK_ID
where PK_ID IS or IS NOT NULL

where insp.Inspection.InspID is null 



select [insp].[StarRezLivingArea].StarRezLivAreaID,[insp].[InspectionReview].ReviewID from [insp].[InspectionReview] 
RIGHT OUTER join [insp].[StarRezLivingArea] ON [insp].[StarRezLivingArea].StarRezLivAreaID = [insp].[InspectionReview].ReviewID

where [insp].[InspectionReview].ReviewID IS NULL