SELECT artist_name
FROM artists
WHERE artist_name SIMILAR TO '[a-zA-Z]+'; -- проверяем, что имя содержит одно слово без пробелов