  SELECT
  
  Office365User.CompID, 
  Office365User.FullName, 

  FixtureRatings.FixtureTypeDesc, 
  FixtureRatings.ConditionRating, 
  FixtureRatings.FixtureCondNote, 
  FixtureRatings.DamageNotes, 

  RmCondNOTES.RmCondNotes
FROM 

               (SELECT DISTINCT InspID, CompID, FullName
           FROM   insp.Office365User AS Office365User_1) AS Office365User 
          FULL OUTER JOIN
		  ON Office365User.InspID = insp.Inspection.InspID 

FULL OUTER JOIN


		   ( SELECT DISTINCT 
             FixtureTypeDesc,
      ConditionRating,
      FixtureCondNote,
      DamageNotes,
	  content_id
       FROM insp.FixtureSelectedRatings AS FixtureSelectedRatings_1  
	   ) AS FixtureRatings
	   ON FixtureRatings.content_id = insp.StarRezLivingArea.content_id FULL OUTER JOIN
	   
	   ( SELECT DISTINCT 
	       RmCondNotes,
		   content_id
		FROM insp.LivingAreaRoomCond AS LivingAreaRoomCond_1
		) AS RmCondNOTES
		ON RmCondNOTES.content_id = insp.StarRezLivingArea.content_id
