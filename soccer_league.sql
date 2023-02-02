-- Ioana A Mititean
-- 22.4: SQL Data Modeling Exercise

DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league


CREATE TABLE team
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE player
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INT REFERENCES team ON DELETE SET NULL
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE referee
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE match
(
    id SERIAL PRIMARY KEY,
    location TEXT NOT NULL,
    date DATE NOT NULL,
    home_team_id INT REFERENCES team ON DELETE CASCADE,
    away_team_id INT REFERENCES team ON DELETE CASCADE,
    season_id INT REFERENCES season ON DELETE CASCADE,
    referee_id INT REFERENCES referee ON DELETE SET NULL
);

CREATE TABLE goal
(
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES match ON DELETE CASCADE,
    player_id INT REFERENCES player ON DELETE CASCADE
);
