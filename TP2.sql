create table Immeubles (No_immeuble number primary key, Adresse varchar(255), Nb_Etages number, 
Nb_Logements number, Annee_En_Cours number, Assurance number, Concierge number, Cumul_Loyer number,
Entretien number, Evaluation number, Prix_Achat number, Hypotheque number, Taux_Hypotheque number,
  Vl_Nom_Ville varchar2, Con_Nom_Concierge VARCHAR2, foreign key(Vl_Nom_Ville) refrences ****(****) , 
  FOREIGN KEY (Con_Nom_Concierge) REFERENCES ***(***));