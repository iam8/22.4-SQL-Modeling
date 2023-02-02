-- Ioana A Mititean
-- 22.4: SQL Data Modeling Exercise

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space


CREATE TABLE orbited_body
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE galaxy
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE planet
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  orbital_period_in_years FLOAT NOT NULL CHECK (orbital_period_in_years > 0),
  orbits_around_id INT REFERENCES orbited_body ON DELETE CASCADE,
  galaxy_id INT REFERENCES galaxy ON DELETE CASCADE
);

CREATE TABLE moon
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    planet_id INT REFERENCES planet ON DELETE CASCADE
);

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');
