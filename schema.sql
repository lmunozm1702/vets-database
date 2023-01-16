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