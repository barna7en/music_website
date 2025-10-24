
INSERT INTO artists (artist_name) VALUES ('David Bowie'); -- Новое имя исполнителя
INSERT INTO artist_genres (artist_id, genre_id) VALUES 
((SELECT artist_id FROM artists WHERE artist_name = 'David Bowie'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
((SELECT artist_id FROM artists WHERE artist_name = 'David Bowie'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop'));


INSERT INTO albums (album_title, release_year) VALUES ('Heroes', 1977);
INSERT INTO album_artists (album_id, artist_id) VALUES 
((SELECT album_id FROM albums WHERE album_title = 'Heroes'), (SELECT artist_id FROM artists WHERE artist_name = 'David Bowie'));

INSERT INTO tracks (track_title, duration, album_id) VALUES 
('Starman', '00:04:30', (SELECT album_id FROM albums WHERE album_title = 'Heroes')),
('Life on Mars?', '00:04:10', (SELECT album_id FROM albums WHERE album_title = 'Heroes'));

INSERT INTO tracks (track_title, duration, album_id) VALUES 
('Space Oddity', '00:02:30', (SELECT album_id FROM albums WHERE album_title = 'Heroes'));

INSERT INTO tracks (track_title, duration, album_id) VALUES 
('Ashes to Ashes', '00:03:45', (SELECT album_id FROM albums WHERE album_title = 'Heroes'));
