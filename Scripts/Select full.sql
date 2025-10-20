
--select duration
SELECT track_title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

--select duration 3,5min
SELECT track_title
FROM tracks
WHERE duration >= '00:03:30';

--select ones word
SELECT artist_name
FROM artists
WHERE artist_name SIMILAR TO '[a-zA-Z]+'; -- проверяем, что имя содержит одно слово без пробелов

--select word in name
SELECT track_title
FROM tracks
WHERE LOWER(track_title) LIKE '%мой%' OR LOWER(track_title) LIKE '%my%';

--select years
SELECT compilation_title
FROM compilations
WHERE release_year BETWEEN 2018 AND 2020;

--All artists who have not released albums in 2020
SELECT DISTINCT art.artist_name
FROM artists art
WHERE art.artist_id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM album_artists aa
    JOIN albums alb ON aa.album_id = alb.album_id
    WHERE alb.release_year = 2020
);

--Average track length for each album
SELECT a.album_title, AVG(t.duration) as avg_track_duration
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
GROUP BY a.album_title;

--Number of tracks included in 2019-2020 albums
SELECT COUNT(t.track_id) as num_tracks_in_albums_2019_2020
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year IN (2019, 2020);

--The names of collections featuring a specific artist (Beyoncé)
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

--The number of performers in each genre
SELECT g.genre_name, COUNT(DISTINCT ag.artist_id) as number_of_artists
FROM genres g
LEFT JOIN artist_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_name;