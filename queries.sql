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

/* QUERIES */
/* How many animals are there? */
SELECT
    COUNT(*)
FROM
    animals;

/* How many animals have never tried to escape? */
SELECT
    COUNT(*)
FROM
    animals
WHERE
    escape_attempts = 0;

/* What is the average weight of animals? */
SELECT
    AVG(weight_kg)
from
    animals;

/* Who escapes the most, neutered or not neutered animals? */
SELECT
    name,
    escape_attempts
FROM
    animals
WHERE
    escape_attempts = (
        SELECT
            MAX(escape_attempts)
        FROM
            animals
    );

/* What is the minimum and maximum weight of each type of animal? */
SELECT
    species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM
    animals
GROUP BY
    species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT
    species,
    AVG(escape_attempts)
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990/01/01' AND '2000/12/31'
GROUP BY
    species;

/** Write queries (using JOIN) to answer the following questions: **/
/* What animals belong to Melody Pond? */
SELECT
    animals.name
FROM
    animals
    INNER JOIN owners ON (animals.owner_id = owners.id)
WHERE
    owners.full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon). */
SELECT
    animals.name
from
    animals
    INNER JOIN species ON (animals.species_id = species.id)
WHERE
    species.name = 'Pokemon';

/* List all owners and their animals, remember to include those that don't own any animal. */
SELECT
    owners.full_name,
    animals.name
FROM
    owners
    LEFT JOIN animals ON (owners.id = animals.owner_id);

/* How many animals are there per species? */
SELECT
    species.name,
    COUNT(*)
FROM
    species
    INNER JOIN animals ON (animals.species_id = species.id)
GROUP BY
    species.name;

/* List all Digimon owned by Jennifer Orwell. */
SELECT
    animals.name,
    species.name,
    owners.full_name
FROM
    animals
    INNER JOIN species ON (animals.species_id = species.id)
    INNER JOIN owners ON (animals.owner_id = owners.id)
WHERE
    owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT
    animals.name,
    animals.escape_attempts,
    owners.full_name
FROM
    animals
    INNER JOIN owners ON (animals.owner_id = owners.id)
WHERE
    owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

/* Who owns the most animals? */
SELECT
    owners.full_name,
    COUNT(*)
FROM
    animals
    INNER JOIN owners ON (animals.owner_id = owners.id)
GROUP BY
    owners.full_name
ORDER BY
    COUNT(*) DESC
LIMIT
    1;