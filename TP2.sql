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

    insert into villes (nom_ville,taux_taxes) VALUES('longueuil',29.20);