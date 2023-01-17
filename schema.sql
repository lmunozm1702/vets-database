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