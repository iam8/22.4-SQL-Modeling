-- Ioana A Mititean
-- 22.4: SQL Data Modeling Exercise

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE medcenter
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    address TEXT,
    created DATE
);

CREATE TABLE doctor
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    specialization TEXT,
    center_id INT REFERENCES medcenter
);

CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    age INT
);

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);
