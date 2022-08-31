/* Database schema to keep the structure of entire database. */
CREATE DATABASE clinic;
-- patients table
CREATE TABLE patients (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL,
  date_of_birth DATE,
  PRIMARY KEY(id)
);

-- medical history table 
CREATE TABLE medical_histories(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(250) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_patient_constraint FOREIGN KEY(patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

-- invoices table 
CREATE TABLE invoices (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  total_amount FLOAT(2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INT NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
);

-- treatment table 
CREATE TABLE treatments (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(250) NOT NULL,
  name VARCHAR(250) NOT NULL,
  PRIMARY KEY(id)
);