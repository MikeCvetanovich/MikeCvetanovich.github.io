/* Count total number of photos by distinct room */

SELECT Distinct LivAreaTypeID,
COUNT(ImageID)  OVER (
	PARTITION BY LivAreaTypeID
	order by LivAreaTypeID ) "Count per Room"
FROM [HRLFM].[insp].[InspPhoto]
Order by 1 asc