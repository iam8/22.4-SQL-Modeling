-- Ioana A Mititean
-- 22.4: SQL Data Modeling Exercise

DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center


CREATE TABLE doctor
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    specialization TEXT
);

CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    age INT CHECK (age >= 0)
);

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE visit
(
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctor ON DELETE CASCADE,
    patient_id INT REFERENCES patient ON DELETE CASCADE,
    visit_date DATE
);

CREATE TABLE diagnosis
(
    id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES visit ON DELETE SET NULL,
    disease_id INT REFERENCES disease ON DELETE CASCADE
);
