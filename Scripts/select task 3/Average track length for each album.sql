SELECT a.album_title, AVG(t.duration) as avg_track_duration
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
GROUP BY a.album_title;