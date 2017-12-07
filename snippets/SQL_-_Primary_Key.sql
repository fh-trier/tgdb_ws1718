/*
  @author:  Markus Pesch
  @date:    29.11.2015
  @email: peschm@fh-trier.de
*/

/* Allgemeine Syntax mit einer Spalte*/
ALTER TABLE <HAUPTTABELLE>
ADD CONSTRAINT <BEZEICHNUNG> PRIMARY KEY (<SPALTE>);

/* ORDER mit mehreren Spalten */
ALTER TABLE <HAUPTTABELLE>
ADD CONSTRAINT <BEZEICHNUNG> PRIMARY KEY (<SPALTE> , <SPALTE2>);

/* Beispiel */
ALTER TABLE Verkauf
ADD CONSTRAINT PK_VNR PRIMARY KEY (VNR);

/* Löschen von Primary Key */
ALTER TABLE <HAUPTTABLLE>
DROP CONSTRAINT <CONSTRAINT_NAME ODER BEZEICHNNUNG>;
