SELECT iphdr.ip_src AS ip_src,
       iphdr.ip_dst AS ip_dst,
       event.signature AS signature,
       MAX(event.id) AS event_id,
       COUNT(0) AS number_of_events
FROM (event LEFT JOIN iphdr ON (((event.sid = iphdr.sid)
                            AND (event.cid = iphdr.cid))))
WHERE ISNULL(event.classification_id)
GROUP BY iphdr.ip_src, iphdr.ip_dst, event.signature