CREATE DATABASE clinicsystemDB;

CREATE TABLE Specialization (
specialization_id INT AUTO_INCREMENT PRIMARY KEY, 
title VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Doctors (
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
email VARCHAR(50) UNIQUE,
phone_number VARCHAR(13)
);

-- M-M
CREATE TABLE Doctor_Specialization (
doctor_id INT,
specialization_id INT,
PRIMARY KEY (doctor_id, specialization_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id),
FOREIGN KEY (specialization_id) REFERENCES Specialization (specialization_id)
);

CREATE TABLE Patients (
patient_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
date_of_birth DATE,
phone_number VARCHAR(13) NOT NULL UNIQUE,
email VARCHAR(50) UNIQUE
);

-- 1-M
CREATE TABLE Appointments (
appointment_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT NOT NULL,
doctor_id INT NOT NULL, 
appointment_date DATETIME NOT NULL,
reason TEXT,
FOREIGN KEY (patient_id) REFERENCES Patients (patient_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id)
);

-- 1-M
CREATE TABLE Prescriptions (
prescription_id INT AUTO_INCREMENT PRIMARY KEY,
appointment_id INT NOT NULL,
date_issued DATE NOT NULL, 
notes TEXT,
FOREIGN KEY (appointment_id) REFERENCES Appointments (appointment_id)
);


CREATE TABLE Medication (
medication_id INT AUTO_INCREMENT PRIMARY KEY,
label VARCHAR(50) NOT NULL UNIQUE,
about TEXT
);

-- M-M
CREATE TABLE Prescription_Medications (
prescription_id INT, 
medication_id INT,
dosage VARCHAR (10),
frequency VARCHAR(10),
PRIMARY KEY (prescription_id, medication_id),
FOREIGN KEY (prescription_id) REFERENCES Prescriptions (prescription_id),
FOREIGN KEY (medication_id) REFERENCES Medication (medication_id)
);
