select InspID, StarRezLivAreaID from insp.StarRezLivingArea

WHERE StarRezLivAreaID NOT IN
(SELECT  StarRezLivAreaID from insp.InspectionReview ) 

SELECT  * from [insp].[Inspection]
WHERE InspID IN (
335,
349,
391,
397,
426,
434,
437,
451
)

AND

StarRezLivAreaID IN (
302,
315,
355,
360,
387,
393,
396,
410
)