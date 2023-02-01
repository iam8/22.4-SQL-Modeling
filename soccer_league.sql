-- Ioana A Mititean
-- 22.4: SQL Data Modeling Exercise

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE player
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INT REFERENCES team ON DELETE SET NULL
);


CREATE TABLE team
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INT,
    league_id INT REFERENCES league ON DELETE SET NULL
);


CREATE TABLE league
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE
);


CREATE TABLE match
(
    id SERIAL PRIMARY KEY,
    team1 INT REFERENCES team ON DELETE CASCADE,
    team2 INT REFERENCES team ON DELETE CASCADE,
    date DATE
);


CREATE TABLE goal
(
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES match ON DELETE CASCADE,
    player_id INT REFERENCES player ON DELETE CASCADE
);


CREATE TABLE referee
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    match_id INT REFERENCES match ON DELETE SET NULL
);
