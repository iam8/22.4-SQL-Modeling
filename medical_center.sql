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

CREATE TABLE doctor_patient
(
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctor,
    patient_id INT REFERENCES patient
);

CREATE TABLE patient_disease
(
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patient,
    disease_id INT REFERENCES disease
);
