USE HRLFM
GO

SELECT DISTINCT
 [HRLFM].[dbo].[HousingWorkorders].[WorkorderID]
 ,[HRLFM].[dbo].[HousingWorkorders].[WOStatus]
,[HRLFM].[dbo].[HousingWorkorders].[CustomerRequestID] AS "WorkOrderCustomerReq"  
,[HRLFM].[dbo].[HousingWorkorders].[WOProperty]
,REPLACE([dbo].[HousingWorkorders].[WOPropertyDesc], 'HOUSE', '') AS "WOPropertyDesc"
,[HRLFM].[dbo].[HousingWorkorders].[WOFullDesc]
,[HRLFM].[dbo].[HousingWorkorders].[WOContact]
,[HRLFM].[dbo].[HousingWorkorders].[WOContactPhone]
,[HRLFM].[dbo].[HousingWorkorders].[WOContactEmail]
,CONVERT(DATE, [dbo].[HousingWorkorders].[WODateCreated] ) AS "WODateCreated"
,[HRLFM].[dbo].[HousingWorkorders].[WOCategory]
,[HRLFM].[dbo].[HousingWorkorders].[EditDate]


,COUNT( [HRLFM].[dbo].[HousingPhaseStatusHist].[PhStatus]) OVER (PARTITION BY [HRLFM].[dbo].[HousingWorkorders].[WorkorderID]) AS "PhCnt/WO"
,[HRLFM].[dbo].[HousingPhaseStatusHist].[PhaseStatusHistKey] AS "PhStatHistKEY"
,[HRLFM].[dbo].[HousingPhaseStatusHist].[PhStatus] AS "PHASE STATUS"
,[HRLFM].[dbo].[HousingPhaseStatusHist].[PhStatusDate] AS "PHASE STATUS DATE"
,[HRLFM].[dbo].[HousingPhaseStatusHist].[WOPhaseID] AS "WOPhaseID"


,[HRLFM].[dbo].[HousingPhaseNotes].[PhNoteID] AS "PHASE NOTE ID"
,[HRLFM].[dbo].[HousingPhaseNotes].[PhNote]

  ,CASE WHEN [HRLFM].[dbo].[HousingWorkorders].[WOFullDesc] LIKE '%PFO%' THEN '@PFO' END AS '@PFO'
 
       
FROM

[HRLFM].[dbo].[HousingWorkorders]
JOIN 
[HRLFM].[dbo].[HousingPhases] ON
[HRLFM].[dbo].[HousingWorkorders].[WorkorderID] = [HRLFM].[dbo].[HousingPhases].[WorkorderID]

JOIN
[HRLFM].[dbo].[HousingPhaseStatusHist] ON
[HRLFM].[dbo].[HousingPhases].[WorkorderID] = [HRLFM].[dbo].[HousingPhaseStatusHist].WorkorderID

JOIN 
[HRLFM].[dbo].[HousingPhaseNotes] ON
[HRLFM].[dbo].[HousingWorkorders].[WorkorderID] = [HRLFM].[dbo].[HousingPhaseNotes].[WorkorderID]



WHERE [HRLFM].[dbo].[HousingWorkorders].[WODateCreated] between '01/01/2021' and CURRENT_TIMESTAMP

 AND (
		( [HRLFM].[dbo].[HousingWorkorders].[WOFullDesc] LIKE '%PFO%' )
	)
	 

--AND [HRLFM].[dbo].[HousingWorkorders].[CustomerRequestID] IS NOT NULL
--AND [HRLFM].[dbo].[HousingWorkorders].[WorkorderID] = '3296220'

GROUP BY
 [HRLFM].[dbo].[HousingWorkorders].[WorkorderID]
,[HRLFM].[dbo].[HousingWorkorders].[WODateCreated]
,[HRLFM].[dbo].[HousingWorkorders].[WOStatus]
,[HRLFM].[dbo].[HousingWorkorders].[CustomerRequestID] 
,[HRLFM].[dbo].[HousingWorkorders].[WOProperty]
,[HRLFM].[dbo].[HousingWorkorders].[WOPropertyDesc]
,[HRLFM].[dbo].[HousingWorkorders].[WOFullDesc]
,[HRLFM].[dbo].[HousingWorkorders].[WOContact]
,[HRLFM].[dbo].[HousingWorkorders].[WOContactPhone]
,[HRLFM].[dbo].[HousingWorkorders].[WOContactEmail]
,[HRLFM].[dbo].[HousingWorkorders].[WOCategory]
,[HRLFM].[dbo].[HousingWorkorders].[EditDate]

,[HRLFM].[dbo].[HousingPhaseStatusHist].[PhStatusDate] 
,[HRLFM].[dbo].[HousingPhaseStatusHist].[PhStatus] 
,[HRLFM].[dbo].[HousingPhaseStatusHist].[WOPhaseID]
,[HRLFM].[dbo].[HousingPhaseStatusHist].[PhaseStatusHistKey] 

,[HRLFM].[dbo].[HousingPhaseNotes].[PhNoteID] 
,[HRLFM].[dbo].[HousingPhaseNotes].[PhNote]

ORDER BY 1 DESC, 4 DESC,3 ASC
