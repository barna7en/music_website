INSERT INTO genres (genre_name) VALUES ('Rock'), ('Pop'), ('Hip-Hop');

INSERT INTO artists (artist_name) VALUES ('AC/DC'), ('Beyoncé'), ('Eminem'), ('Queen');

-- AC/DC выступает в жанре Rock
INSERT INTO artist_genres (artist_id, genre_id) VALUES ((SELECT artist_id FROM artists WHERE artist_name='AC/DC'), (SELECT genre_id FROM genres WHERE genre_name='Rock'));

-- Beyoncé выступает в жанре Pop
INSERT INTO artist_genres (artist_id, genre_id) VALUES ((SELECT artist_id FROM artists WHERE artist_name='Beyoncé'), (SELECT genre_id FROM genres WHERE genre_name='Pop'));

-- Eminem выступает в жанре Hip-Hop
INSERT INTO artist_genres (artist_id, genre_id) VALUES ((SELECT artist_id FROM artists WHERE artist_name='Eminem'), (SELECT genre_id FROM genres WHERE genre_name='Hip-Hop'));

-- Queen выступает в жанре Rock
INSERT INTO artist_genres (artist_id, genre_id) VALUES ((SELECT artist_id FROM artists WHERE artist_name='Queen'), (SELECT genre_id FROM genres WHERE genre_name='Rock'));


INSERT INTO albums (album_title, release_year) VALUES 
('Back in Black', 1980), 
('Lemonade', 2016), 
('The Marshall Mathers LP', 2000);

-- Back in Black выпущен группой AC/DC
INSERT INTO album_artists (album_id, artist_id) VALUES ((SELECT album_id FROM albums WHERE album_title='Back in Black'), (SELECT artist_id FROM artists WHERE artist_name='AC/DC'));

-- Lemonade выпущен Beyoncé
INSERT INTO album_artists (album_id, artist_id) VALUES ((SELECT album_id FROM albums WHERE album_title='Lemonade'), (SELECT artist_id FROM artists WHERE artist_name='Beyoncé'));

-- The Marshall Mathers LP выпущен Eminem'ом
INSERT INTO album_artists (album_id, artist_id) VALUES ((SELECT album_id FROM albums WHERE album_title='The Marshall Mathers LP'), (SELECT artist_id FROM artists WHERE artist_name='Eminem'));

INSERT INTO tracks (track_title, duration, album_id) VALUES 
('Highway to Hell', '00:04:22', (SELECT album_id FROM albums WHERE album_title='Back in Black')),
('Formation', '00:03:50', (SELECT album_id FROM albums WHERE album_title='Lemonade')),
('Lose Yourself', '00:05:24', (SELECT album_id FROM albums WHERE album_title='The Marshall Mathers LP')),
('Tornado of Souls', '00:05:12', (SELECT album_id FROM albums WHERE album_title='Back in Black')), 
('Love on Top', '00:04:10', (SELECT album_id FROM albums WHERE album_title='Lemonade')),
('Stan', '00:06:02', (SELECT album_id FROM albums WHERE album_title='The Marshall Mathers LP'));

INSERT INTO compilations (compilation_title, release_year) VALUES 
('Best Hits 2000s', 2010), 
('Classic Rock Anthology', 2015), 
('Top Pop Songs', 2020), 
('Rap Classics', 2018);

-- Highway to Hell включен в Classic Rock Anthology
INSERT INTO track_compilations (track_id, compilation_id) VALUES ((SELECT track_id FROM tracks WHERE track_title='Highway to Hell'), (SELECT compilation_id FROM compilations WHERE compilation_title='Classic Rock Anthology'));

-- Formation включена в Top Pop Songs
INSERT INTO track_compilations (track_id, compilation_id) VALUES ((SELECT track_id FROM tracks WHERE track_title='Formation'), (SELECT compilation_id FROM compilations WHERE compilation_title='Top Pop Songs'));

-- Lose Yourself включен в Rap Classics
INSERT INTO track_compilations (track_id, compilation_id) VALUES ((SELECT track_id FROM tracks WHERE track_title='Lose Yourself'), (SELECT compilation_id FROM compilations WHERE compilation_title='Rap Classics'));

-- Love on Top включена в Best Hits 2000s
INSERT INTO track_compilations (track_id, compilation_id) VALUES ((SELECT track_id FROM tracks WHERE track_title='Love on Top'), (SELECT compilation_id FROM compilations WHERE compilation_title='Best Hits 2000s'));

-- Stan включен в Rap Classics
INSERT INTO track_compilations (track_id, compilation_id) VALUES ((SELECT track_id FROM tracks WHERE track_title='Stan'), (SELECT compilation_id FROM compilations WHERE compilation_title='Rap Classics'));

-- Tornado of Souls включен в Classic Rock Anthology
INSERT INTO track_compilations (track_id, compilation_id) VALUES ((SELECT track_id FROM tracks WHERE track_title='Tornado of Souls'), (SELECT compilation_id FROM compilations WHERE compilation_title='Classic Rock Anthology'));

