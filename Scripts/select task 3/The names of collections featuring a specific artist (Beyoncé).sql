WITH selected_artist_id AS (
    SELECT artist_id 
    FROM artists 
    WHERE artist_name = 'Beyoncé'
)
SELECT DISTINCT comp.compilation_title
FROM compilations comp
JOIN track_compilations tc ON comp.compilation_id = tc.compilation_id
JOIN tracks t ON tc.track_id = t.track_id
JOIN album_artists aa ON t.album_id = aa.album_id
WHERE aa.artist_id IN (SELECT artist_id FROM selected_artist_id);