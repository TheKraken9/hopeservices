

CREATE DATABASE hs_services;
\c hs_services;


-- tools

-- image
CREATE TABLE picture
(
    id serial PRIMARY KEY,
    url_1 VARCHAR(255) NOT NULL,
    url_2 VARCHAR(255),
    url_3 VARCHAR(255),
    url_4 VARCHAR(255),
    url_5 VARCHAR(255),
    url_6 VARCHAR(255),
    url_7 VARCHAR(255),
    url_8 VARCHAR(255),
    url_9 VARCHAR(255)
);



-- site vitrine

-- a propos de nous
CREATE TABLE hope_service
(
    names VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    lot VARCHAR(50) NOT NULL,
    NIF VARCHAR(50) NOT NULL,
    statistic VARCHAR(50)NOT NULL,
    RCS VARCHAR (50)NOT NULL,
    id_picture int REFERENCES picture(id) NOT NULL
);

-- contact
CREATE TABLE contact
(
    id serial PRIMARY KEY,
    titre VARCHAR(50),
    descriptions VARCHAR(255)
);

CREATE TABLE about
(
    historical VARCHAR(255) NOT NULL,
    objective VARCHAR(255) NOT NULL,
    valu VARCHAR(255) NOT NULL,
    quality VARCHAR(255) NOT NULL,
    vision VARCHAR(255) NOT NULL,
);


-- activity
CREATE TABLE types
(
    id serial PRIMARY KEY,
    titre VARCHAR(50) NOT NULL,
    descriptions VARCHAR(255)
);

CREATE TABLE activity
(
    id serial PRIMARY KEY,
    date_activity date NOT NULL,
    id_type int REFERENCES types(id) NOT NULL,
    id_picture int REFERENCES type(id) NOT NULL,
    descriptions VARCHAR(255)
);


-- e-com

-- gestion of users

-- province de madagascar
CREATE TABLE province
(
    id INT(11) PRIMARY KEY NOT NULL,
    names VARCHAR (255) NOT NULL
);

-- Region de Madagascar
CREATE TABLE region
(
    id INT (11) PRIMARY KEY NOT NULL,
    id_province INT(11) REFERENCES province(id) NOT NULL,
    names VARCHAR(255) NOT NULL

);

CREATE TABLE district
(
    id INT (11) PRIMARY KEY NOT NULL,
    id_region INT(11) REFERENCES region(id) NOT NULL,
    names VARCHAR(255) NOT NULL

);
CREATE TABLE commune
(
    id INT(11) PRIMARY KEY NOT NULL,
    id_district INT(11) REFERENCES disid_district(id) NOT NULL,
    names VARCHAR(255) NOT NULL

);

CREATE TABLE fokotany
(
    id INT(11) PRIMARY KEY NOT NULL,
    id_commune INT(11) REFERENCES disid_commune(id) NOT NULL,
    names VARCHAR(255) NOT NULL

);

CREATE TABLE users
(
    id serial PRIMARY KEY,
    names VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) ,
    birthday date NOT NULL,
    lot VARCHAR (255) NOT NULL,
    id_fokotany INT REFERENCES fokotany (id),
    email VARCHAR(50) NOT NULL,
    passwords VARCHAR(50) NOT NULL,
    phone1 VARCHAR(50) NOT NULL ,
    phone2 VARCHAR(50),
    date_inscription date NOT NULL DEFAULT NOW()
);

CREATE TABLE society
(
    id serial PRIMARY KEY,
    names VARCHAR(50) NOT NULL,
    NIF VARCHAR(50)NOT NULL,
    STAT VARCHAR(50)NOT NULL,
    lot VARCHAR (255)NOT NULL,
    id_fokotany INT REFERENCES fokotany(id),
    email VARCHAR(50) NOT NULL,
    passwords VARCHAR(50) NOT NULL,
    phone1 VARCHAR(50) NOT NULL ,
    phone2 VARCHAR(50),
    date_inscription date DEFAULT NOW()
);


-- produit
CREATE TABLE category
(
    id serial PRIMARY KEY,
    titre VARCHAR(50) NOT NULL,
    descriptions VARCHAR(255)
);

CREATE TABLE sous_category
(
    id serial PRIMARY KEY,
    titre VARCHAR(50),
    id_category int REFERENCES category(id) NOT NULL,
    descriptions VARCHAR(255)
);

CREATE TABLE products
(
    id serial PRIMARY KEY,
    names VARCHAR(50) NOT NULL,
    id_sous_category int REFERENCES sous_category(id) NOT NULL,
    id_picture int REFERENCES picture(id) NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    reference VARCHAR(50) UNIQUE NOT NULL,
    descriptions VARCHAR(255) NOT NULL
);


CREATE TABLE stock
(
    id SERIAL PRIMARY KEY,
    id_product INT REFERENCES products(id) NOT NULL,
    quantity DOUBLE PRECISION NOT NULL,
    add_date TIMESTAMP NOT NULL,
);

CREATE TABLE historical_stock
(
    id SERIAL PRIMARY KEY,
    id_stock INT REFERENCES stock (id) NOT NULL,
    descriptions VARCHAR(255) NOT NULL,
    old_date TIMESTAMP NOT NULL,
    new_date TIMESTAMPNOT NULL,
    old_quantity DOUBLE PRECISION NOT NULL,
    new_quantity DOUBLE PRECISION NOT NULL,
    date_modifie TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE panier_society
(
    id serial PRIMARY KEY,
    id_society INT REFERENCES society(id),

);


CREATE TABLE panier_users
(
    id serial PRIMARY KEY,
    id_user INT REFERENCES users (id),

);



