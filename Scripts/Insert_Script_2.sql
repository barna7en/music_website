INSERT INTO albums (album_title, release_year) VALUES 
('Renaissance', 2020); -- Новый альбом Бейонсе
('Revival', 2019);      -- Новый альбом группы Queen

INSERT INTO tracks (track_title, duration, album_id) VALUES 
('Break My Soul', '00:04:30', (SELECT album_id FROM albums WHERE album_title='Renaissance')),
('Bohemian Rhapsody Remix', '00:05:55', (SELECT album_id FROM albums WHERE album_title='Revival'));

-- Renaissance выпустила Beyoncé
INSERT INTO album_artists (album_id, artist_id) VALUES 
((SELECT album_id FROM albums WHERE album_title='Renaissance'), (SELECT artist_id FROM artists WHERE artist_name='Beyoncé'));

-- Revival выпустила группа Queen
INSERT INTO album_artists (album_id, artist_id) VALUES 
((SELECT album_id FROM albums WHERE album_title='Revival'), (SELECT artist_id FROM artists WHERE artist_name='Queen'));

INSERT INTO tracks (track_title, duration, album_id) VALUES 
('My Way', '00:03:45', (SELECT album_id FROM albums WHERE album_title='Back in Black')), -- Альбом AC/DC
('All About That Bass (My Mix)', '00:03:20', (SELECT album_id FROM albums WHERE album_title='Lemonade')), -- Альбом Beyoncé
('My Life', '00:04:15', (SELECT album_id FROM albums WHERE album_title='The Marshall Mathers LP')); -- Альбом Eminem