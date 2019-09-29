  DROP TABLE bucket_lists;
  DROP TABLE sights;
  DROP TABLE cities;
  DROP TABLE countries;
  DROP TABLE continents;


  CREATE TABLE continents (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255)
    );

  CREATE TABLE countries (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    continent_id INT4 REFERENCES continents(id) ON DELETE CASCADE
    );

  CREATE TABLE cities (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    country_id INT4 REFERENCES countries(id) ON DELETE CASCADE
  );

  CREATE TABLE sights (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    city_id INT4 REFERENCES cities(id) ON DELETE CASCADE
  );

  CREATE TABLE bucket_lists (
    id SERIAL4 PRIMARY KEY,
    sight_id INT4 REFERENCES sights(id) ON DELETE CASCADE,
    visited BOOLEAN
    );
