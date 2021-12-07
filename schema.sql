/* Database schema to keep the structure of entire database. */
CREATEDB VET_CLINIC;

CREATE TABLE ANIMALS (
    ID INTEGER,
    NAME VARCHAR(100),
    DATE_OF_BIRTH DATE,
    ESCAPE_ATTEMPTS INTEGER,
    NEUTERED BOOLEAN,
    WEIGHT_KG FLOAT
);
