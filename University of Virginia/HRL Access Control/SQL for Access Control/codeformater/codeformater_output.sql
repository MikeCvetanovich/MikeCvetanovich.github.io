SELECT /*delimited*/
    TO_CHAR(t1.sess_status_date, 'MON-DD-YYYY HH24:MI:SS') AS "DATETIME",
    t1.location,
    t1.longdes,
    my_bool_to_str(t1.isoffline) AS "ISOFFLINE",
    parent_offline(t2.sess_status) AS "IS PARENT OFFLINE?",
    t3.currentpointvalue AS "VOLTAGE"
FROM
    doorstates_vr   t1
    INNER JOIN doors_vr        t2 ON t1.location = t2.location
    INNER JOIN alarmstates     t3 ON t3.location = t1.location
WHERE
    t1.location BETWEEN 20000 AND 50500
    AND t3.devicepoint = 413
    AND t1.isoffline = 1
    AND TO_CHAR(t1.sess_status_date, 'MON-DD-YYYY HH24:MI:SS') <= 'SYSDATE-1'
    AND t1.alarmseq_generation = 6
    AND t2.status = 'ACT'
    AND t2.longdes NOT LIKE '%*%'
    AND t2.term_type_sid = ANY (
        2110,
        2111,
        2113,
        2114
    )
    AND t2.sess_status = ANY (
        5,
        0
    )
ORDER BY
    5 ASC,
    3 DESC;