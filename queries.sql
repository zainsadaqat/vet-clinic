/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS WHERE NAME LIKE '%mon%'

SELECT NAME FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-01-01';

SELECT NAME FROM ANIMALS WHERE NEUTERED=TRUE AND ESCAPE_ATTEMPTS < 3;

SELECT DATE_OF_BIRTH FROM ANIMALS WHERE NAME IN ('Agumon', 'Pikachu');

SELECT NAME, ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT_KG > 10.5;

SELECT * FROM ANIMALS WHERE NEUTERED=TRUE;

SELECT * FROM ANIMALS WHERE NAME NOT IN ('Gabumon');

SELECT * FROM ANIMALS WHERE WEIGHT_KG BETWEEN 10.4 AND 17.3;