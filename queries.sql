/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS WHERE NAME LIKE '%mon'

SELECT NAME FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-01-01';

SELECT NAME FROM ANIMALS WHERE NEUTERED=TRUE AND ESCAPE_ATTEMPTS < 3;

SELECT DATE_OF_BIRTH FROM ANIMALS WHERE NAME IN ('Agumon', 'Pikachu');

SELECT NAME, ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT_KG > 10.5;

SELECT * FROM ANIMALS WHERE NEUTERED=TRUE;

SELECT * FROM ANIMALS WHERE NAME NOT IN ('Gabumon');

SELECT * FROM ANIMALS WHERE WEIGHT_KG BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;

UPDATE ANIMALS SET SPECIES = 'unspecified';

ROLLBACK TRANSACTION;

BEGIN;

UPDATE ANIMALS SET SPECIES='DIGIMON' WHERE NAME LIKE '%mon';

UPDATE ANIMALS SET SPECIES='POKEMON' WHERE NAME NOT LIKE '%mon';

COMMIT;

BEGIN;

DELETE FROM ANIMALS;

ROLLBACK;

BEGIN;

DELETE FROM ANIMALS WHERE DATE_OF_BIRTH>'2022-01-01';

SAVEPOINT SP1;

UPDATE ANIMALS SET WEIGHT_KG = WEIGHT_KG * -1;

ROLLBACK;

BEGIN;

UPDATE ANIMALS SET WEIGHT_KG = WEIGHT_KG * -1 WHERE WEIGHT_KG < 0;

COMMIT;

How many animals are there? 
SELECT COUNT(*) FROM ANIMALS;

How many animals have never tried to escape?
SELECT COUNT(*) FROM ANIMALS WHERE ESCAPE_ATTEMPTS = 0;

What is the average weight of animals?
SELECT AVG(WEIGHT_KG) FROM ANIMALS;

Who escapes the most, neutered or not neutered animals?
SELECT MIN(NEUTERED) FROM ANIMALS;
SELECT MAX(NEUTERED) FROM ANIMALS;
SELECT MAX(ESCAPE_ATTEMPTS) FROM ANIMALS;

What is the minimum and maximum weight of each type of animal?
SELECT MIN(WEIGHT_KG) FROM ANIMALS GROUP_BY NAME;
SELECT MAX(WEIGHT_KG) FROM ANIMALS GROUP_BY NAME;

What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(ESCAPE_ATTEMPTS) FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '1990-01-01' AND '2000-01-01'; 

SELECT NAME FROM ANIMALS INNER JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID WHERE OWNERS.FULL_NAME = 'Vet Melody Pond';

select animals.name from animals inner join species on animals.specie_id = species.id where species.name='Pokemon';

SELECT OWNERS.FULL_NAME, ANIMALS.NAME FROM OWNERS LEFT JOIN ANIMALS ON ANIMALS.OWNER_ID = OWNERS.ID;

SELECT species.name ,COUNT(specie_id) FROM animals JOIN species ON species.id = animals.specie_id GROUP BY species.name;

SELECT NAME FROM ANIMALS INNER JOIN OWNERS ON OWNERS.ID = ANIMALS.OWNER_ID WHERE OWNERS.FULL_NAME = 'Vet Jennifer Orwell' AND ANIMALS.SPECIE_ID = 2;

SELECT NAME FROM ANIMALS  JOIN OWNERS ON OWNERS.ID = ANIMALS.OWNER_ID WHERE OWNERS.FULL_NAME = 'Vet Dean Winchester' AND escape_attempts = 0;             

SELECT OWNERS.FULL_NAME, COUNT(ANIMALS.OWNER_ID) FROM OWNERS INNER JOIN ANIMALS ON OWNERS.ID = ANIMALS.OWNER_ID GROUP BY OWNERS.FULL_NAME ORDER BY (COUNT) DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.visit_date from animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
where vets.name = 'Vet William Tatcher'
ORDER BY visit_date DESC
LIMIT 1;
-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name) from animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
where vets.name = 'Vet Stephanie Mendez';
-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name,species.name  FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON species.id = specializations.species_id;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name,visits.visit_date  FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Vet Stephanie Mendez'
AND (visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30');
-- What animal has the most visits to vets?
SELECT animals.name , COUNT(animals.name) from animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
GROUP BY animals.name
ORDER BY count DESC
LIMIT 1;
-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.visit_date from animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
where vets.name = 'Vet Maisy Smith'
ORDER BY visits.visit_date
LIMIT 1;
-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name,vets.name, visits.visit_date from animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY visits.visit_date DESC
LIMIT 1;
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT(animal_id)  FROM specializations
RIGHT JOIN vets ON vets.id = specializations.vet_id
RIGHT JOIN visits ON visits.vet_id = vets.id
WHERE vets.id NOT IN (SELECT vet_id FROM specializations)
GROUP BY vets.name
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name,  COUNT(species.name) FROM vets
JOIN visits ON visits.vet_id=vets.id
JOIN animals ON visits.animal_id=animals.id
JOIN species ON animals.species_id=species.id
WHERE vets.name='Vet Maisy Smith'
GROUP BY species.name
ORDER BY COUNT DESC
LIMIT 1;
