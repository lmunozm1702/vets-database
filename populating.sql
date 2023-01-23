-- Add an email column to your owners table
ALTER TABLE owners
ADD COLUMN email VARCHAR(120);

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
    animals_id = 4
    -- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into
    owners (full_name, email)
select
    'Owner ' || generate_series(1, 2500000),
    'owner_' || generate_series(1, 2500000) || '@mail.com';