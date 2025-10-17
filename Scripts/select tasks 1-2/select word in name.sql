SELECT track_title
FROM tracks
WHERE LOWER(track_title) LIKE '%мой%' OR LOWER(track_title) LIKE '%my%';