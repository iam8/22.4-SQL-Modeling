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
    center_id INT REFERENCES medcenter ON DELETE SET NULL
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

CREATE TABLE doctor_patient
(
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctor ON DELETE CASCADE,
    patient_id INT REFERENCES patient ON DELETE CASCADE
);

CREATE TABLE patient_disease
(
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patient ON DELETE CASCADE,
    disease_id INT REFERENCES disease ON DELETE CASCADE
);


INSERT INTO medcenter
    (title, address, created)
VALUES
    ('Endocrinology Center', 'address 1', '01-01-1950'),
    ('Cardiology Center', 'address 2', '12-12-1979');


INSERT INTO doctor
    (first_name, last_name, specialization, center_id)
VALUES
    ('Alice', 'A', 'Endocrinology', 1),
    ('Bob', 'B', 'Cardiology', 2);


INSERT INTO patient
    (first_name, last_name, age)
VALUES
    ('Carlo', 'C', 78),
    ('Deedee', 'D', 47),
    ('El', 'E', 99),
    ('Frank', 'F', 32);


INSERT INTO disease
    (name, description)
VALUES
    ('Hypothyroidism', 'Excessive TSH, deficiency in thyroid hormone'),
    ('Hyperthyroidism', 'Deficiency in TSH, excessive thyroid hormone'),
    ('Myocarditis', 'Inflammation of heart muscle'),
    ('Coronary artery disease', 'Narrowed arteries due to buildup of plaque');


INSERT INTO doctor_patient
    (doctor_id, patient_id)
VALUES
    (1, 2),
    (1, 4),
    (1, 1),
    (2, 1),
    (2, 3),
    (2, 2);


INSERT INTO patient_disease
    (patient_id, disease_id)
VALUES
    (1, 3),
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 4),
    (3, 3),
    (4, 1),
    (4, 2);
