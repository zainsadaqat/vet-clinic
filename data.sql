/* Populate database with sample data. */

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8.00);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11.00);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (5, 'Charmander', '2020-02-08', 0, FALSE,-11);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (6, 'Plantmon', '2022-11-15', 2, TRUE, -5.7);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (8, 'Angemon', '2005-06-12', 1, TRUE, -45);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (10, 'Blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Sam Smith', 34);
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Jennifer Orwell', 19);
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Bob', 45);
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Melody Pond', 77);
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Dean Winchester', 14);
INSERT INTO OWNERS(FULL_NAME, AGE) VALUES('Jodie Whittaker', 38);

INSERT INTO SPECIES(NAME) VALUES('Pokemon');
INSERT INTO SPECIES(NAME) VALUES('Digimon');

BEGIN;
UPDATE ANIMALS SET SPECIE_ID=1 WHERE NAME LIKE '%mon';
COMMIT;

BEGIN;
UPDATE ANIMALS SET SPECIE_ID=2 WHERE NAME NOT LIKE '%mon';
COMMIT;

BEGIN;
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Sam Smith') WHERE NAME='Agumon';
COMMIT;

BEGIN;
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Jennifer Orwell') WHERE NAME IN ('Gabumon', 'Pikachu');
COMMIT;

BEGIN;
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Bob') WHERE NAME IN ('Plantmon', 'Devimon');
COMMIT;

BEGIN;
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Melody Pond') WHERE NAME IN ('Charmander', 'Squirtle', 'Blossom');
COMMIT;

BEGIN;
UPDATE ANIMALS SET OWNER_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Dean Winchester') WHERE NAME IN ('Angemon', 'Boarmon');
COMMIT;

INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION) VALUES('Vet William Tatcher', 45, '2000-03-23');
INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION) VALUES('Vet Maisy Smith', 26, '2019-01-17');
INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION) VALUES('Vet Stephanie Mendez', 64, '1981-05-04');
INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION) VALUES('Vet Jack Harkness', 38, '2008-06-08');

INSERT INTO SPECIALIZATIONS(SPECIE_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME='Pokemon'), (SELECT ID FROM VETS WHERE NAME='Vet William Tatcher'));
INSERT INTO SPECIALIZATIONS(SPECIE_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME='Pokemon'), (SELECT ID FROM VETS WHERE NAME='Vet Stephanie Mendez'));
INSERT INTO SPECIALIZATIONS(SPECIE_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME='Digimon'), (SELECT ID FROM VETS WHERE NAME='Vet Stephanie Mendez'));
INSERT INTO SPECIALIZATIONS(SPECIE_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME='Digimon'), (SELECT ID FROM VETS WHERE NAME='Vet Jack Harkness'));


INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES
        ((SELECT id FROM animals WHERE name = 'Agumon'),
        (SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
        '2020-05-24'),

        ((SELECT id FROM animals WHERE name = 'Agumon'),
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
        '2020-07-22'),

        ((SELECT id FROM animals WHERE name = 'Gabumon'),
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
        '2021-02-02'),

        ((SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-01-05'),

        ((SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-03-08'),

        ((SELECT id FROM animals WHERE name = 'Pikachu'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-05-14'),


        ((SELECT id FROM animals WHERE name = 'Devimon'),
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
        '2021-05-04'),

        ((SELECT id FROM animals WHERE name = 'Charmander'),
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
        '2021-02-24'),

        ((SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2019-12-21'),

        ((SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
        '2020-08-10'),

        ((SELECT id FROM animals WHERE name = 'Plantmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2021-04-07'),

        ((SELECT id FROM animals WHERE name = 'Squirtle'),
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
        '2019-09-29'),

        ((SELECT id FROM animals WHERE name = 'Angemon'),
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
        '2020-10-03'),

        ((SELECT id FROM animals WHERE name = 'Angemon'),
        (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
        '2020-11-04'),

        ((SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2019-01-24'),

        ((SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2019-05-15'),

        ((SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-02-27'),

        ((SELECT id FROM animals WHERE name = 'Boarmon'),
        (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
        '2020-08-03'),
        ((SELECT id FROM animals WHERE name = 'Blossom'),
        (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
        '2020-05-24'),

        ((SELECT id FROM animals WHERE name = 'Blossom'),
        (SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
        '2021-01-11');



