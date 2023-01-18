/* Database creation */
DROP DATABASE IF EXISTS "vet-clinic";

CREATE DATABASE "vet-clinic";

/* Sequence for automatic ID*/
DROP SEQUENCE IF EXISTS animal_id;

CREATE SEQUENCE animal_id START
WITH
    1;

/* animals table creation */
DROP TABLE IF EXISTS animals;

CREATE TABLE
    animals (
        ID integer NOT NULL,
        name varchar(100) NOT NULL,
        date_of_birth date NOT NULL,
        escape_attempts integer NOT NULL,
        neutered boolean NOT NULL,
        weight_kg decimal NOT NULL,
        PRIMARY KEY (ID)
    );

ALTER TABLE animals ADD species VARCHAR(100) NOT NULL DEFAULT 'unspecified';

/* owners table creation */
DROP TABLE IF EXISTS owners;

CREATE TABLE
    owners (
        ID SERIAL PRIMARY KEY,
        full_name varchar(100) NOT NULL,
        age integer
    );

/* species table creation */
DROP TABLE IF EXISTS species;

CREATE TABLE
    species (ID SERIAL PRIMARY KEY, name varchar(100) NOT NULL);

/* Modify animals table */
ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals ADD species_id integer;

ALTER TABLE animals ADD owner_id integer;

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

/* vets table creation */
DROP TABLE IF EXISTS vets;

CREATE TABLE
    vets (
        ID SERIAL PRIMARY KEY,
        name varchar(100) NOT NULL,
        age integer NOT NULL,
        date_of_graduation DATE NOT NULL
    );

/* vets and species many2many handle table */
DROP TABLE IF EXISTS specialization;

CREATE TABLE
    specialization (
        species_id INTEGER,
        vets_id INTEGER,
        CONSTRAINT PK_Specialization PRIMARY KEY (species_id, vets_id)
    );

ALTER TABLE specialization ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE specialization ADD FOREIGN KEY (vets_id) REFERENCES vets (id);

/* animals and vets many2many handle table */
DROP TABLE IF EXISTS visits;

CREATE TABLE
    visits (
        id SERIAL PRIMARY KEY,
        animals_id INTEGER,
        vets_id INTEGER,
        date_of_visit DATE NOT NULL
    );

ALTER TABLE visits ADD FOREIGN KEY (animals_id) REFERENCES animals (id);

ALTER TABLE visits ADD FOREIGN KEY (vets_id) REFERENCES vets (id);