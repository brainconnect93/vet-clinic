/* Database schema to keep the structure of entire database. */
CREATE DATABASE clinic;
-- patients table
CREATE TABLE patients (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL,
  date_of_birth DATE,
  PRIMARY KEY(id)
);