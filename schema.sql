/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg FLOAT NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(250);

/* QUERY MULTIPLE TABLES PROJECT */

-- create a new table for owners 
CREATE TABLE owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

-- create a new table for species
CREATE TABLE species (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
);

-- Modify animals table:
    -- Remove column species
ALTER TABLE animals DROP COLUMN species;

    -- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id);

    -- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owner_id) REFERENCES owners(id);


-- Create a new table named vets

CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL;
    PRIMARY KEY(id)
);