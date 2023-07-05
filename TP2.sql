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
