DROP TABLE album;
DROP TABLE artist;

CREATE TABLE artist(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE album(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist VARCHAR(255),
  artist_id INT REFERENCES artist(id)
);
