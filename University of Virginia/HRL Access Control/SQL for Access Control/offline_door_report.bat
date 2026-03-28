set encoding windows-1252
set sqlformat csv
spool on
spool 'C:\temp\offlinedoors.csv'
SELECT TO_CHAR(t1.SESS_STATUS_DATE,'MON-DD-YYYY HH24:MI:SS') AS "DATETIME",t1.LOCATION,t1.LONGDES,MY_BOOL_TO_STR(t1.ISOFFLINE)AS"ISOFFLINE",PARENT_OFFLINE(t2.sess_status) as "IS PARENT OFFLINE?",
t3.CURRENTPOINTVALUE as "VOLTAGE"
FROM
doorstates_vr t1
INNER JOIN doors_vr t2 ON 
t1.location = t2.location
INNER JOIN ALARMSTATES T3 ON
t3.location = t1.location
WHERE t1.location between 20000 and 50500
and t3.devicepoint = 413
and t1.ISOFFLINE = 1
AND TO_CHAR(t1.SESS_STATUS_DATE, 'MON-DD-YYYY HH24:MI:SS') <= 'SYSDATE-1'  
and t1.ALARMSEQ_GENERATION = 6
and t2.STATUS = 'ACT'
and t2.longdes not like '%*%'
and t2.term_type_sid = any(2110,2111,2113,2114)
and t2.SESS_STATUS = ANY(5,0)
ORDER BY 5 ASC, 3 DESC;
spool off;
