CREATE TABLE genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(255) NOT NULL UNIQUE);

CREATE TABLE artists (
	artist_id SERIAL PRIMARY KEY,
	artist_name VARCHAR(255) NOT NULL UNIQUE);

CREATE TABLE artist_genres (
	artist_id INT REFERENCES artists(artist_id),
	genre_id INT REFERENCES genres(genre_id),
	PRIMARY KEY (artist_id, genre_id));

CREATE TABLE albums (
	album_id SERIAL PRIMARY KEY,
	album_title VARCHAR(255) NOT NULL,
	release_year SMALLINT CHECK(release_year > 1920 AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE)),
	CONSTRAINT unique_album UNIQUE(album_title));

CREATE TABLE album_artists (    album_id INT REFERENCES albums(album_id),
	artist_id INT REFERENCES artists(artist_id),
	PRIMARY KEY (album_id, artist_id));

CREATE TABLE tracks (    track_id SERIAL PRIMARY KEY,    track_title VARCHAR(255) NOT NULL,
	duration INTERVAL CHECK(duration >= '0 seconds'),
	album_id INT REFERENCES albums(album_id));

CREATE TABLE compilations (
	compilation_id SERIAL PRIMARY KEY,
	compilation_title VARCHAR(255) NOT NULL,
	release_year SMALLINT CHECK(release_year > 1920 AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE)));

CREATE TABLE track_compilations (
	track_id INT REFERENCES tracks(track_id),
	compilation_id INT REFERENCES compilations(compilation_id),
	PRIMARY KEY (track_id, compilation_id));