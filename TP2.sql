create table Taux_Metiers(Code_Metier varchar(2) primary key, Description_Metier varchar(20), Taux_Horaire numeric(5,2)) --Taux Metiers

create table Concierges (Nom_Concierge varchar(25) primary key, Adresse varchar(30), Salaire_Mensuel numeric(6,2));

create table Actionnaires(No_Actionnaire numeric(5) primary key, Adresse varchar(30), Nom_Actionnaire varchar(30), 
    Telephone varchar(10), Nb_Parts numeric(7,3), Profit_a_Distrubuer numeric(8,2), Valeur_Part numeric(7,3));

create table Chauffages (Chau_Code varchar(1) primary key, Chau_Description varchar(12));

create table Occupations (Occ_Code varchar(1) primary key,Occ_Description varchar(10)); 

create table Villes (Nom_Ville VARCHAR2(12) primary key, Taux_Taxes numeric(4,2));

CREATE TABLE Logements (
    No_Logement numeric(4) primary key,
    Loyer numeric(6,2),
    Nb_Chambres numeric(2),
    Nb_Salle_Bains numeric(2),
    A_Louer varchar2(1),
    Foyer varchar2(1),
    Meuble varchar2(1), 
    Salle_A_Diner varchar2(1),
    Chauffage varchar2(1),
    Occ_Code varchar2(1),
    No_Immeuble numeric(4),
    foreign key (Chauffage) references Chauffages(Chau_Code),
    foreign key (Occ_Code) references Occupations(Occ_Code)
);



Create table Immeubles (
    No_Immeuble numeric(4) primary key,
    Adresse varchar2(30),
    Nb_Etages numeric(2),
    Nb_Logements numeric(2),
    Annee_En_Cours numeric(4),
    Assurance numeric(6,2),
    Conciergerie numeric(6,2),
    Cumul_Loyer numeric(8),
    Entretien numeric(8,2),
    Evaluation numeric(7),
    Prix_Achat numeric(7),
    Hypotheque numeric(7),
    Taux_Hypotheque numeric(9,2),
    Vil_Nom_Ville varchar2(12),
    Con_Nom_Concierge varchar2(25),
    foreign key (Vil_Nom_Ville) references Villes(Nom_Ville),
    foreign key (Con_Nom_Concierge) references Concierges(Nom_Concierge))
;

alter table Logements add constraint fk_Logement_Imm foreign key (No_Immeuble) references Immeubles (No_Immeuble);

alter table Logements add constraint UniqueConst unique(No_Immeuble);

Create table Locataires(
    Loc_Nom varchar(30) primary key, 
    Loc_Telephone varchar2(10),
    Date_Entree Date, 
    Date_Fin_Bail Date,
    Occupant varchar2(1),
    Log_No_Immeuble numeric(4),
    Log_No_Logement numeric(4),
    foreign key (Log_No_Immeuble) references Logements(No_Immeuble),
    foreign key (Log_No_Logement) references Logements(No_Logement)
);

Create table Entretiens (
    No_Entretien numeric(4), 
    Ent_Date Date,
    Nb_Heures numeric(3,1),
    Imm_No_Immeuble numeric(4),
    Log_No_Logement numeric(4),
    Emp_Emp_Nom varchar2(25),
    foreign key (Imm_No_Immeuble) references Logements(No_Immeuble),
    foreign key (Log_No_Logement) references Logements(No_Logement)
);

Create table Employes (
    Emp_Nom varchar2(25) primary key,
    Emp_Adr VARCHAR2(30),
    Taux_Code_Metier varchar(2),
    Foreign key (Taux_Code_Metier) references Taux_Metiers(Code_Metier)
);

Alter table Entretiens add constraint fk_Emp foreign key (Emp_Emp_Nom) references Employes(Emp_Nom);

Create Table Archives (
    No_Immeuble numeric(4),
    Annee numeric(4) primary key, 
    Evaluation numeric(9),
    Taxes numeric(8,2),
    Frais_Hypotheque numeric(8,2),
    Conciergerie numeric(8,2),
    Assurances numeric(6,2),
    Entretien numeric(8,2),
    Revenu_Loyer numeric(8),
    Foreign key (No_Immeuble) references Immeubles(No_Immeuble)
);

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('John Smith', '5141234567', '2022-09-12', '2023-09-11', '0');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Emma Johnson', '5149876543', '2023-06-03', '2023-06-20', '1');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Michael Williams', '5145557890', '2022-11-20', '2023-11-19', '0');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Sophia Davis', '5141112222', '2022-06-15', '2022-06-29', '1');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Alexander Wilson', '5148889999', '2022-10-10', '2023-10-09', '0');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Olivia Martin', '5143334444', '2022-08-05', '2023-08-05', '1');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Daniel Thompson', '5146667777', '2022-12-25', '2023-12-24', '0');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Ava Wilson', '5142223333', '2022-05-10', '2022-05-20', '1');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Matthew Taylor', '5147778888', '2022-11-01', '2023-11-01', '0');

INSERT INTO Locataires (Loc_Nom, Loc_Telephone, Date_Entree, Date_Fin_Bail, Occupant)
VALUES ('Isabella Moore', '5144445555', '2023-06-01', '2023-06-24', '1');


INSERT INTO Chauffages (Chau_Code, Chau_Description)
VALUES
    ('E', 'electricité');

INSERT INTO Chauffages (Chau_Code, Chau_Description)
VALUES
    ('G', 'gaz');

INSERT INTO Chauffages (Chau_Code, Chau_Description)
VALUES
    ('H', 'huile');

INSERT INTO Chauffages (Chau_Code, Chau_Description)
VALUES
    ('B', 'bois');

insert into Occupations 
values
    ('L','Libre');

insert into Occupations 
values
    ('C','Concierge');
    
insert into Occupations 
values
    ('R','Régulier');    

insert into villes (nom_ville,taux_taxes) 
    VALUES('Longueuil',0.29);

insert into villes (nom_ville,taux_taxes) 
    VALUES('St Bruno',0.32);

insert into villes (nom_ville,taux_taxes)
    VALUES('Boucherville',0.35);

insert into employes (emp_nom,emp_adr)
    values('Zakariae','4551 Rue Saint Denis');
    
insert into employes (emp_nom,emp_adr)
    values('Omar','8291 Rue Ontario');
    
insert into employes (emp_nom,emp_adr)
    values('Meryeme','2312 Rue Sherbrook');
    
insert into employes (emp_nom,emp_adr)
    values('Sami','4839 Rue President Kennedy');
    
insert into employes (emp_nom,emp_adr)
    values('Kenza','3823 Rue Berri');
    
insert into employes (emp_nom,emp_adr)
    values('Malika','2938 Rue Mont-Royale');
    
insert into employes (emp_nom,emp_adr)
    values('Elize','982 Rue Laval');
    
insert into employes (emp_nom,emp_adr)
    values('Nour','1238 Rue Outremont');
    
insert into employes (emp_nom,emp_adr)
    values('Houcine','7823 Rue Vancouver');
    
insert into employes (emp_nom,emp_adr)
    values('Elliot','2329 Rue Chicago');
    
insert into Logements (No__Immeuble, No_Logement,Loyer,Nb_Chambres,
    Nb_Salle_Bains,A_Louer,Chauffage,Foyer,Meuble,Salle_A_Diner,Occ_Code)
    values();

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('El', 'Electricien', 500.45);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('Pl', 'Plombier', 400.50);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('Me', 'Mécanicien', 450.25);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('Ca', 'Carreleur', 350.75);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('Ma', 'Maçon', 380.90);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('Pe', 'Peintre', 420.60);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('M', 'Menuisier', 480.35);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('So', 'Soudeur', 430.70);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('P', 'Plâtrier', 370.55);

INSERT INTO Taux_Metiers (Code_Metier, Description_Metier, Taux_Horaire)
VALUES ('C', 'Charpentier', 420.75);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Anas', '3241 Rue Fleurry', 2500);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Sara', '12 Rue Main', 2400);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Ahmed', '45 Rue Montagne', 2300);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Lina', '789 Avenue Rivière', 2600);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Khalid', '56 Rue Parc', 2700);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Leila', '123 Rue Soleil', 2400);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Youssef', '987 Avenue Étoile', 2500);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Fatima', '34 Rue Ouest', 2300);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Mohammed', '567 Rue Nord', 2600);

INSERT INTO Concierges (Nom_Concierge, Adresse, Salaire_Mensuel)
VALUES ('Amina', '789 Avenue Sud', 2700);



INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (2, '5678 rue Montreal', 10, 30, 2023, 2600, 150, 12000, 2800, 8, 320000, 3800, 35000, 'Boucherville', 'Sara');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (3, '123 rue Quebec', 5, 10, 2023, 2300, 50, 8000, 1500, 5, 150000, 2500, 25000, 'Longueuil', 'Mohammed');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (4, '789 avenue Toronto', 12, 40, 2023, 2800, 200, 15000, 3200, 12, 380000, 4500, 40000, 'St Bruno', 'Lina');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (5, '456 rue Vancouver', 6, 15, 2023, 2500, 100, 9000, 2000, 6, 180000, 3200, 30000, 'Boucherville', 'Khalid');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (6, '9012 avenue Ottawa', 9, 25, 2023, 2700, 150, 11000, 2600, 10, 280000, 3600, 32000, 'Longueuil', 'Leila');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (7, '345 avenue Halifax', 4, 8, 2023, 2300, 50, 7500, 1400, 4, 140000, 2400, 22000, 'St Bruno', 'Youssef');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (8, '678 rue Calgary', 7, 18, 2023, 2600, 120, 10000, 2400, 8, 200000, 3000, 28000, 'Boucherville', 'Fatima');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (9, '234 avenue Edmonton', 6, 16, 2023, 2900, 180, 13000, 2800, 10, 260000, 3400, 32000, 'Longueuil', 'Mohammed');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (10, '567 avenue Winnipeg', 5, 12, 2023, 2800, 150, 12000, 2500, 9, 220000, 3200, 30000, 'Boucherville', 'Amina');

INSERT INTO Immeubles (No_Immeuble, Adresse, Nb_Etages, Nb_Logements, Annee_En_Cours, Assurance, Conciergerie, Cumul_Loyer, Entretien, Evaluation, Prix_Achat, Hypotheque, Taux_Hypotheque, Vil_Nom_Ville, con_nom_concierge)
VALUES (1297, '7832 rue Mohammedia', 10, 30, 2019, 2600, 150, 12000, 2800, 8, 320000, 3800, 35000, 'St Bruno', 'Sara');

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (1, 2021, 9, 0.23, 3573.34, 2573, 573, 1523.64, 800);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (2, 2022, 8, 0.2, 3000.00, 2000, 500, 1500.00, 1000);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (3, 2023, 7, 0.18, 2500.50, 1500, 400, 1300.50, 1200);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (4, 2024, 9, 0.22, 3500.75, 2500, 600, 1600.75, 900);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (5, 2025, 8, 0.2, 3000.00, 2000, 500, 1500.00, 1000);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (6, 2026, 7, 0.18, 2500.50, 1500, 400, 1300.50, 1200);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (7, 2027, 9, 0.22, 3500.75, 2500, 600, 1600.75, 900);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (8, 2028, 8, 0.2, 3000.00, 2000, 500, 1500.00, 1000);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (9, 2029, 7, 0.18, 2500.50, 1500, 400, 1300.50, 1200);

INSERT INTO Archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
VALUES (10, 2030, 9, 0.22, 3500.75, 2500, 600, 1600.75, 900);

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (1, 1, 2600, 5, 1, 'O', 'G', 'O', 'O', 'O', 'L');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (2, 2, 2800, 4, 2, 'O', 'E', 'O', 'N', 'O', 'L');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (3, 3, 3000, 3, 2, 'N', 'E', 'O', 'S', 'O', 'C');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (4, 4, 2500, 2, 1, 'O', 'E', 'O', 'O', 'O', 'L');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (5, 5, 2700, 4, 1, 'O', 'G', 'O', 'O', 'O', 'L');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (6, 6, 2900, 3, 2, 'O', 'B', 'O', 'N', 'O', 'R');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (7, 7, 2300, 2, 1, 'O', 'E', 'O', 'O', 'O', 'L');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (8, 8, 2500, 4, 1, 'O', 'G', 'O', 'O', 'O', 'L');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (9, 9, 2700, 3, 2, 'N', 'B', 'N', 'O', 'O', 'C');

INSERT INTO Logements (No_Immeuble, No_Logement, Loyer, Nb_Chambres, Nb_Salle_Bains, A_Louer, Chauffage, Foyer, Meuble, Salle_A_Diner, Occ_Code)
VALUES (10, 10, 2200, 2, 1, 'O', 'H', 'N', 'O', 'O', 'L');

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (1, '4783 Rue Saint Eustache', 'Immobilier .co', '4386273900', 5, 0.20, 5000);

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (2, '123 Rue du Soleil', 'ABC Investment', '5141234567', 10, 0.15, 7500);

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (3, '789 Avenue des Champs', 'XYZ Holdings', '4509876543', 8, 0.25, 4000);

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (4, '456 Rue de la Paix', 'Investment Corp', '5144567890', 12, 0.18, 6000);

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (5, '987 Avenue du Lac', 'Real Estate Investments', '4501234567', 7, 0.22, 5500);

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (6, '321 Rue des Fleurs', 'Property Management Ltd', '5149876543', 9, 0.17, 4800);

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (7, '654 Avenue du Parc', 'Investment Group Inc', '4504567890', 6, 0.23, 5200);

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (8, '159 Rue de la Montagne', 'Capital Holdings', '5141234567', 11, 0.16, 6800);

INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (9, '753 Avenue des Roses', 'Property Investors Ltd', '4509876543', 8, 0.20, 5100);


INSERT INTO Actionnaires (No_Actionnaire, Adresse, Nom_Actionnaire, Telephone, Nb_Parts, Profit_A_Distrubuer, Valeur_Part)
VALUES (10, '246 Rue du Commerce', 'Real Estate Capital', '5144567890', 10, 0.19, 5900);

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (1, '2015-05-04', 30.2, 1, 2, 'Zakariae');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (2, '2016-07-12', 15.5, 3, 4, 'Omar');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (3, '2017-09-22', 20.8, 5, 6, 'Kenza');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (4, '2018-11-03', 12.3, 7, 8, 'Malika');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (5, '2019-01-15', 18.6, 9, 10, 'Elliot');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (6, '2020-03-27', 25.9, 6, 6, 'Houcine');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (7, '2021-05-08', 14.7, 4, 4, 'Elize');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (8, '2022-07-20', 22.4, 5, 6, 'Sami');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (9, '2023-09-01', 17.2, 7, 8, 'Nour');

INSERT INTO Entretiens (No_Entretien, Ent_Date, Nb_Heures, Imm_No_Immeuble, Log_No_Logement, Emp_Emp_Nom)
VALUES (10, '2024-11-13', 11.9, 9, 2, 'Meryeme');

CREATE VIEW VAptLibre AS
    SELECT L.No_Immeuble, L.No_Logement, L.Loyer
    FROM Logements L
    JOIN Immeubles I ON L.No_Immeuble = I.No_Immeuble
    WHERE L.Nb_Chambres = 3
    AND L.Loyer < 1750.00
    AND I.Nb_Logements >= 25;


update Locataires 
set Log_No_Immeuble = 7,
Log_No_Logement = 4
where Loc_Nom = 'Emma Johnson';

update Locataires 
set Log_No_Immeuble = 3,
Log_No_Logement = 6
where Loc_Nom = 'Matthew Taylor';

update Locataires 
set Log_No_Immeuble = 3,
Log_No_Logement = 9
where Loc_Nom = 'Ava Wilson';

update Locataires 
set Log_No_Immeuble = 8,
Log_No_Logement = 5
where Loc_Nom = 'Daniel Thompson';

update Locataires 
set Log_No_Immeuble = 3,
Log_No_Logement = 4
where Loc_Nom = 'Olivia Martin';

update Locataires 
set Log_No_Immeuble = 3,
Log_No_Logement = 3
where Loc_Nom = 'Alexander Wilson';

update Locataires 
set Log_No_Immeuble = 1,
Log_No_Logement = 2
where Loc_Nom = 'Sophia Davis';

update Locataires 
set Log_No_Immeuble = 2,
Log_No_Logement = 2
where Loc_Nom = 'Isabella Moore';

update Locataires 
set Log_No_Immeuble = 1,
Log_No_Logement = 1
where Loc_Nom = 'John Smith';

update Locataires 
set Log_No_Immeuble = 2,
Log_No_Logement = 1
where Loc_Nom = 'Michael Williams';


create view Vreparation as 
SELECT T.Description_Metier
FROM TAUX_metiers T
JOIN Employes E ON E.Taux_Code_Metier = T.Code_Metier
JOIN Entretiens En ON En.Emp_Emp_Nom = E.Emp_Nom
JOIN Logements L ON L.No_Immeuble = En.Imm_No_Immeuble
JOIN Locataires Lo ON L.No_Logement = Lo.Log_No_Logement
JOIN Immeubles Im USING (No_Immeuble)
JOIN Villes V ON V.Nom_Ville = Im.Vil_Nom_Ville
WHERE (V.Nom_Ville = 'St Bruno' OR V.Nom_Ville = 'Boucherville')
AND Lo.Date_Entree BETWEEN '2023-06-01' AND '2023-06-25' 
AND Lo.Date_Fin_Bail BETWEEN '2023-06-01' AND '2023-06-25'
AND L.Foyer = 'O' AND L.Salle_A_Diner = 'N'
;

create view VPetitApt as
select distinct * from Immeubles I
join Logements L using (No_Immeuble)
where L.Nb_Chambres <= 2;

create view VConcierges as 
select C.Nom_Concierge from Concierges C
join Immeubles I
on I.Con_Nom_Concierge = C.Nom_Concierge
join Villes V
on V.Nom_Ville = I.Vil_Nom_Ville
join Logements L
using(No_Immeuble)
where V.Nom_Ville = 'Longueuil'
and L.meuble = 'S' and L.foyer = 'O'
ORDER BY C.Nom_Concierge DESC;

--Q7
CREATE OR REPLACE FUNCTION f_loyer(p_no_immeuble IN NUMBER)
  RETURN NUMBER
IS
  v_revenu_total NUMBER := 0;
BEGIN
  SELECT SUM(Loyer)
  INTO v_revenu_total
  FROM Logements L
  join Locataires Lo
  on L.No_Logement = Lo.Log_No_Logement
  WHERE L.No_Immeuble = p_no_immeuble
    AND EXTRACT(MONTH FROM Lo.Date_Entree) = '06';

  RETURN v_revenu_total;
END;
/

CREATE OR REPLACE VIEW v_loyer AS
SELECT No_Immeuble, f_loyer(No_Immeuble) AS Revenu_Total
FROM Immeubles;

--Q8
CREATE OR REPLACE PROCEDURE sp_archive(p_id IN NUMBER)
IS
BEGIN
    INSERT INTO archives (No_Immeuble, Annee, Evaluation, Taxes, Frais_Hypotheque, Conciergerie, Assurances, Entretien, Revenu_Loyer)
    SELECT No_Immeuble, Annee_En_Cours, Evaluation, Taux_Hypotheque, Hypotheque, Conciergerie, Assurance, Entretien, Cumul_Loyer
    FROM Immeubles
    WHERE No_Immeuble = p_id;
    
    COMMIT;
END;
/

begin 
    sp_archive(1297);
end;
/

--Q9
CREATE OR REPLACE PROCEDURE sp_augmentation(p_type_chauffage IN VARCHAR2, p_pourcentage IN NUMBER)
IS
BEGIN
  UPDATE Logements
  SET Loyer = Loyer * (1 + p_pourcentage/100)
  WHERE Chauffage = p_type_chauffage;

  COMMIT;
END;
/

BEGIN
  sp_augmentation('G', 7);
END;
/

--Q10
DELETE FROM Locataires
WHERE Date_Fin_Bail < '2022-07-01';
