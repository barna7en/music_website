SELECT COUNT(t.track_id) as num_tracks_in_albums_2019_2020
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year IN (2019, 2020);