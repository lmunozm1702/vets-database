/* Queries*/
/* Find all animals whose name ends in "mon". */
SELECT
    *
FROM
    animals
WHERE
    name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019. */
SELECT
    name
FROM
    animals
WHERE
    date_of_birth BETWEEN '2016/01/01' AND '2019/12/31';

/* List the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT
    name
FROM
    animals
WHERE
    neutered = true
    AND escape_attempts < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT
    date_of_birth
FROM
    animals
WHERE
    name IN ('Agumon', 'Pikachu');

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT
    name,
    escape_attempts
FROM
    animals
WHERE
    weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT
    *
FROM
    animals
WHERE
    neutered = true;

/* Find all animals not named Gabumon. */
SELECT
    *
FROM
    animals
WHERE
    name <> 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
Select
    *
FROM
    animals
WHERE
    weight_kg BETWEEN 10.4 AND 17.3;

/* UPDATE species to 'unspecified' */
/* I set the value as default on ALTER TABLE to ADD the column */
/* Because if not, i can't set NOT NULL to the column because we have */
/* previous data without the value */
BEGIN;

UPDATE animals
SET
    species = 'unspecified';

ROLLBACK;

/*UPDATE species COLUMN TRANSACTION */
BEGIN;

UPDATE animals
SET
    species = 'digimon'
WHERE
    name like '%mon';

UPDATE animals
SET
    species = 'pokemon'
WHERE
    species = 'unspecified';

COMMIT;

/* DELETE all records into a TRANSACTION then ROLLBACK */
BEGIN;

DELETE FROM animals;

ROLLBACK;

/* UPDATE with SAVEPOINT */
BEGIN;

SAVEPOINT SP0;

DELETE FROM animals
WHERE
    date_of_birth > '2022/01/01';

SAVEPOINT sp1;

UPDATE animals
SET
    weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT sp1;

UPDATE animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;