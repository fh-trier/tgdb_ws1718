/*
  @author:  Markus Pesch
  @date:    13.11.2015
  @email:   peschm@fh-trier.de
*/

/* Allgemeine Syntax */
ALTER TABLE <HAUPTTABELLE>
ADD CONSTRAINT 	<BEZEICHNUNG>
CHECK (<BEDINGUNG>);

/* Beispiel */
ALTER TABLE KDN_Artikel
ADD CONSTRAINT c_med_rez
CHECK (
  (Medikament = 0 OR Medikament = 1) AND
  (Rezeptpflichtig = 0 OR Rezeptpflichtig = 1)
);

/* Alternative */
ALTER TABLE KDN_Artikel
ADD CONSTRAINT c_med_rez2
CHECK (
  Medikament IN (0,1) AND
  Rezeptpflichtig IN (0,1)
);

