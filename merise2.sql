

CREATE DATABASE EL_MASSAR_2;
USE EL_MASSAR_2;

CREATE TABLE classe_hotel (
nombre_etoiles int  DEFAULT  NULL,
nombre_chambre int DEFAULT NULL
PRIMARY KEY (nombre_etoiles)
);

CREATE TABLE categorie (
code_categorie int  DEFAULT  NULL,
description varchar(100) DEFAULT NULL,
PRIMARY KEY (code_categorie),
);

CREATE TABLE hotel (
id_hotel int  DEFAULT  NULL,
nom varchar(45) DEFAULT NULL,
adresse varchar(45) DEFAULT NULL,
cph varchar(100) DEFAULT  NULL,
uq_adress int DEFAULT  NULL,
nombre_etoiles int DEFAULT NULL,
PRIMARY KEY (id_hotel),
CONSTRAINT nombre_etoiles FOREIGN KEY (nombre_etoiles ) REFERENCES classe_hotel (nombre_etoiles )
);


CREATE TABLE chambre (
id_chambre int  DEFAULT  NULL,
num_chambre int DEFAULT NULL,
tel varchar(100) DEFAULT NULL,
code_categorie int DEFAULT NULL,
id_hotel int DEFAULT NULL,
PRIMARY KEY (id_chambre),
CONSTRAINT code_categorie FOREIGN KEY (code_categorie) REFERENCES categorie (code_categorie),
CONSTRAINT id_hotel FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel)
);

CREATE TABLE consommation (
id_conso  int DEFAULT  NULL,
num_conso int DEFAULT NULL,
date_conso date DEFAULT NULL,
heure_conso time DEFAULT NULL,
PRIMARY KEY (id_conso)
);


CREATE TABLE client (
  id_client int  DEFAULT  NULL,
  nom varchar(45) DEFAULT NULL,
  prenom varchar(45) DEFAULT NULL,
  adresse varchar(100) DEFAULT NULL,
  ville varchar(45) DEFAULT NULL,
  code_postal varchar(45) DEFAULT NULL,
  pays varchar(45) DEFAULT NULL,
  tel varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  id_conso  int DEFAULT  NULL,
  PRIMARY KEY (id_client),
  CONSTRAINT id_conso FOREIGN KEY (id_conso) REFERENCES consommation (id_conso)
 );


 CREATE TABLE reservation (
id_reservation int  DEFAULT  NULL,
num_reservation int DEFAULT NULL,
date_debut date DEFAULT NULL,
date_fin date DEFAULT NULL,
date_pay_arrhes date DEFAULT NULL,
montat_pay int DEFAULT NULL,
id_chambre  int DEFAULT NULL,
id_client int DEFAULT NULL,
PRIMARY KEY (id_reservation),
CONSTRAINT id_chambre FOREIGN KEY (id_chambre) REFERENCES chambre (id_chambre),
CONSTRAINT id_client FOREIGN KEY (id_client) REFERENCES client (id_client)
);



CREATE TABLE prestation (
id_prest int  DEFAULT  NULL,
code_prest int DEFAULT NULL,
designation_prest varchar(45) DEFAULT NULL,
PRIMARY KEY (id_prest)
);





 
CREATE TABLE tarifier (
tarif_unitaire int DEFAULT  NULL,
code_categorie_t int DEFAULT NULL, 
id_hotel_t int DEFAULT NULL,
PRIMARY KEY (tarif_unitaire),
CONSTRAINT code_categorie_t FOREIGN KEY (code_categorie_t) REFERENCES categorie (code_categorie),
CONSTRAINT id_hotel_t FOREIGN KEY (id_hotel_t ) REFERENCES hotel (id_hotel )
);

CREATE TABLE offre (
prix_prest int DEFAULT  NULL,
id_prest_o int DEFAULT NULL, 
id_hotel_o int DEFAULT NULL,
PRIMARY KEY (prix_prest),
CONSTRAINT id_prest_o FOREIGN KEY (id_prest_o) REFERENCES prestation (id_prest),
CONSTRAINT id_hotel_o FOREIGN KEY (id_hotel_o ) REFERENCES hotel (id_hotel )
);