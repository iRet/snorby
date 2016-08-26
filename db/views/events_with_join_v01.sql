SELECT event.*, iphdr.ip_src,
                iphdr.ip_dst,
                signature.sig_priority,
                signature.sig_name
FROM event
LEFT JOIN iphdr ON event.sid = iphdr.sid AND event.cid = iphdr.cid
INNER JOIN signature ON event.signature = signature.sig_id