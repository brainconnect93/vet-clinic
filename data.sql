/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

-- inserting data to the animals table 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);


/* QUERY MULTIPLE TABLES PROJECT */
-- Inserting data into the owners table

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Inserting data into the species table

INSERT INTO species (name) VALUES ('Pokemon'),
('Digimon');

-- Modify inserted animals so it includes the species_id value
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';

UPDATE animals SET species_id=1 WHERE species_id IS NULL;

-- Modify inserted animals to include owner information (owner_id):
 
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';


/* PROJECT DAY 4 - ADD "JOIN TABLE" FOR VISITS */
-- Inserting datas to vets:

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2016-01-17'),
('Stephanie Mendez', 64, '1981-05-17'),
('Jack Harkness', 38, '2008-06-08');

-- Inserting datas to specialties

-- William Tatcher is specialized in Pokemon
INSERT INTO specializations (species_id, vets_id) VALUES (1, 1);

-- Stephanie Mendez is specialized in Digimon and Pokemon
INSERT INTO specializations (species_id, vets_id) VALUES (2, 3);
INSERT INTO specializations (species_id, vets_id) VALUES (1, 3);

-- Jack Harkness is specialized in Digimon.
INSERT INTO specializations (species_id, vets_id) VALUES (2, 4);

-- Inserting datas for visits
-- Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2020-05-24'
);

-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2020-07-22'
);

-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Gabumon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2021-02-02'
);

-- Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-01-05'
);

-- Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-03-08'
);

-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-05-14'
);

-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Devimon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2021-05-04'
);

-- Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Charmander'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2021-02-24'
);

-- Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-12-21'
);

-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2020-08-10'
);

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-04-07'
);

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Squirtle'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2019-09-29'
);

-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Angemon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2020-10-03'
);

-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Angemon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2020-11-04'
);

-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-01-24'
);

-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-05-15'
);

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-02-27'
);

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-03-08'
);

-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2020-05-24'
);

-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2021-01-11'
);



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animals_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

