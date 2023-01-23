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
        nextval('animal_id'),
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
        nextval('animal_id'),
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
        nextval('animal_id'),
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
        nextval('animal_id'),
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
        nextval('animal_id'),
        'Charmander',
        '2020/02/08',
        0,
        false,
        -11
    ),
    (
        nextval('animal_id'),
        'Plantmon',
        '2021/11/15',
        2,
        true,
        -5.7
    ),
    (
        nextval('animal_id'),
        'Squirtle',
        '1993/04/02',
        3,
        false,
        -12.13
    ),
    (
        nextval('animal_id'),
        'Angemon',
        '2005/06/12',
        1,
        true,
        -45
    ),
    (
        nextval('animal_id'),
        'Boarmon',
        '2005/06/07',
        7,
        true,
        20.4
    ),
    (
        nextval('animal_id'),
        'Blossom',
        '1998/10/13',
        3,
        true,
        17
    ),
    (
        nextval('animal_id'),
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
UPDATE animals
SET
    species_id = 2
WHERE
    name LIKE '%mon';

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

/* Insert data for vets table */
INSERT INTO
    vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000/04/23'),
    ('Maisy Smith', 25, '2019/01/17'),
    ('Stephanie Mendez', 64, '1981/05/04'),
    ('Jack Harkness', 38, '2008/06/08');

/* Insert data for specialties */
INSERT INTO
    specialization (species_id, vets_id)
VALUES
    (1, 1),
    (1, 3),
    (2, 3),
    (2, 4);

/* Insert data for visits table */
INSERT INTO
    VISITS (animals_id, vets_id, date_of_visit)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Agumon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'William Tatcher'
        ),
        '2020/05/24'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Agumon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Stephanie Mendez'
        ),
        '2020/07/22'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Gabumon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Jack Harkness'
        ),
        '2021/02/02'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Pikachu'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020/01/05'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Pikachu'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020/03/08'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Pikachu'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020/05/14'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Devimon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Stephanie Mendez'
        ),
        '2021/05/04'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Charmander'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Jack Harkness'
        ),
        '2021/02/24'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Plantmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2019/12/21'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Plantmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'William Tatcher'
        ),
        '2020/08/10'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Plantmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2021/04/07'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Squirtle'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Stephanie Mendez'
        ),
        '2019/09/29'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Angemon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Jack Harkness'
        ),
        '2020/10/03'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Angemon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Jack Harkness'
        ),
        '2020/11/04'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Boarmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2019/01/24'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Boarmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2019/05/15'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Boarmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020/02/27'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Boarmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020/08/03'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Blossom'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Stephanie Mendez'
        ),
        '2020/05/24'
    ),
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Blossom'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'William Tatcher'
        ),
        '2021/01/11'
    );

-- This will add 3.594.280 (executed 7 times to get the execution time required) visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO
    visits (animals_id, vets_id, date_of_visit)
SELECT
    *
FROM
    (
        SELECT
            id
        FROM
            animals
    ) animal_ids,
    (
        SELECT
            id
        FROM
            vets
    ) vets_ids,
    generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- Validates execution time (Execution Time: 1224.975 ms)
explain
analyze
SELECT
    COUNT(*)
FROM
    visits
where
    animals_id = 4;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into
    owners (full_name, email)
select
    'Owner ' || generate_series(1, 2500000),
    'owner_' || generate_series(1, 2500000) || '@mail.com';