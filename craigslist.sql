-- Ioana A Mititean
-- 22.4: SQL Data Modeling Exercise

DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist


CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    region_id INT REFERENCES region ON DELETE SET NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT,
    user_id INT REFERENCES users ON DELETE CASCADE,
    region_id INT REFERENCES region ON DELETE CASCADE
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE posts_categories
(
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES post ON DELETE CASCADE,
    category_id INT REFERENCES category ON DELETE CASCADE
);
