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

-- treatments table 
CREATE TABLE treatments (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(250) NOT NULL,
  name VARCHAR(250) NOT NULL,
  PRIMARY KEY(id)
);

-- invoice_items table 
CREATE TABLE invoice_items (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  unit_price FLOAT(2) NOT NULL,
  quantity INT NOT NULL,
  total_price FLOAT(2) NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
  FOREIGN KEY (treatment_id) REFERENCES treatment(id) ON DELETE CASCADE
);

-- many to many relationship between medical histories and treatements
-- prescribed treatment table
CREATE TABLE prescribed_treatment (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  medical_history_id INT NOT NULL,
  treatment_id INT NOT NULL,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
  FOREIGN KEY (treatment_id) REFERENCES treatment(id) ON DELETE CASCADE
);
