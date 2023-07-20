
CREATE DATABASE hs_services;
\c hs_services;

-- site vitrine
-- a propos de nous
CREATE TABLE hope
(
    historical VARCHAR(255),
    objective VARCHAR(255),
    values VARCHAR
    (255),
        quality VARCHAR
    (255),
        vision VARCHAR
    (255)
    );

    -- image
    CREATE TABLE picture
    (
        id serial PRIMARY KEY,
        url_1 VARCHAR(255),
        url_2 VARCHAR(255),
        url_3 VARCHAR(255),
        url_4 VARCHAR(255),
        url_5 VARCHAR(255),
        url_6 VARCHAR(255),
        url_7 VARCHAR(255),
        url_8 VARCHAR(255),
        url_9 VARCHAR(255)
    );

    -- activity
    CREATE TABLE type
    (
        id serial PRIMARY KEY,
        titre VARCHAR(50),
        description VARCHAR(255)
    );

    CREATE TABLE activity
    (
        id serial PRIMARY KEY,
        date_activity date,
        id_type int REFERENCES type(id) NOT NULL,
        id_picture int REFERENCES type(id) NOT NULL,
        description VARCHAR(255)
    );

    -- contact
    CREATE TABLE contact
    (
        id serial PRIMARY KEY,
        titre VARCHAR(50),
        description VARCHAR(255)
    );
