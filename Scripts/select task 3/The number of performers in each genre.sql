SELECT g.genre_name, COUNT(DISTINCT ag.artist_id) as number_of_artists
FROM genres g
LEFT JOIN artist_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_name;