/* Data insert into animals table. */
DELETE FROM animals;

INSERT INTO
    animals (
        ID,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        nextval ('animal_id'),
        'Agumon',
        '2020/02/03',
        0,
        true,
        10.23
    );

INSERT INTO
    animals (
        ID,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        nextval ('animal_id'),
        'Gabumon',
        '2018/11/15',
        2,
        true,
        8
    );

INSERT INTO
    animals (
        ID,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        nextval ('animal_id'),
        'Pikachu',
        '2021/01/07',
        1,
        false,
        15.04
    );

INSERT INTO
    animals (
        ID,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        nextval ('animal_id'),
        'Devimon',
        '2017/05/12',
        5,
        true,
        11
    );

/* STARTS PART 2 QUERY AND UPDATE ANIMALS TABLE */
INSERT INTO
    animals (
        ID,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        nextval ('animal_id'),
        'Charmander',
        '2020/02/08',
        0,
        false,
        -11
    ),
    (
        nextval ('animal_id'),
        'Plantmon',
        '2021/11/15',
        2,
        true,
        -5.7
    ),
    (
        nextval ('animal_id'),
        'Squirtle',
        '1993/04/02',
        3,
        false,
        -12.13
    ),
    (
        nextval ('animal_id'),
        'Angemon',
        '2005/06/12',
        1,
        true,
        -45
    ),
    (
        nextval ('animal_id'),
        'Boarmon',
        '2005/06/07',
        7,
        true,
        20.4
    ),
    (
        nextval ('animal_id'),
        'Blossom',
        '1998/10/13',
        3,
        true,
        17
    ),
    (
        nextval ('animal_id'),
        'Ditto',
        '2022/05/14',
        4,
        true,
        22
    );

/* Insert data into owners table */
INSERT INTO
    owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

/* Insert data into species table */
INSERT INTO
    species (name)
VALUES
    ('Pokemon'),
    ('Digimon');

/* Modify inserted animals so it includes the species_id value */
/* SELECT * FROM animals
WHERE name LIKE '%mon'; */
UPDATE animals
SET
    species_id = 2
WHERE
    name LIKE '%mon';

/* SELECT * FROM animals
WHERE name NOT LIKE '%mon'; */
UPDATE animals
SET
    species_id = 1
WHERE
    name NOT LIKE '%mon';

/* Modify your inserted animals to include owner information */
UPDATE animals
SET
    owner_id = 1
WHERE
    name = 'Agumon';

UPDATE animals
SET
    owner_id = 2
WHERE
    name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET
    owner_id = 3
WHERE
    name IN ('Devimon', 'Plantmon');

UPDATE animals
SET
    owner_id = 4
WHERE
    name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET
    owner_id = 5
WHERE
    name IN ('Angemon', 'Boarmon');

SELECT
    *
FROM
    ANIMALS;

SELECT
    *
FROM
    owners;

SELECT
    *
FROM
    species;