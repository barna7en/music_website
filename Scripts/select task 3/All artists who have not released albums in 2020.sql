SELECT DISTINCT art.artist_name
FROM artists art
WHERE art.artist_id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM album_artists aa
    JOIN albums alb ON aa.album_id = alb.album_id
    WHERE alb.release_year = 2020
);