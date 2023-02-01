-- Ioana A Mititean
-- 22.4: SQL Data Modeling Exercise

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE user
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    region_id INT REFERENCES region ON DELETE SET NULL
);

CREATE TABLE post
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT,
    user_id INT REFERENCES user ON DELETE CASCADE
    region_id INT REFERENCES region ON DELETE CASCADE
);

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE post_category
(
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES post ON DELETE CASCADE,
    category_id INT REFERENCES category ON DELETE CASCADE
);
