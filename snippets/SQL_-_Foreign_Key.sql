/*
  @author:  Markus Pesch
  @date:    23.11.2015
  @email:   peschm@fh-trier.de
*/

/* Allgemeine Syntax */
ALTER TABLE <tabellenname>
ADD CONSTRAINT <constraintname>
  FOREIGN KEY(spl [,sp2..])
  REFERENCES <name referenzierte tabelle>
  [ON DELETE CASCADE|ON DELETE SET NULL]
  [INITIALLY DEFERRED| INITIALLY IMMEDIATE] [DEFERRABLE];


-- DEFERRABLE Constraints, Verzögert die Constraintüberprüfung bis zur Eingabe eines COMMITs.
-- Um das Standard-Verhalten eines DEFERABLE Constraints festzulegen,
-- kann er mit der Klausel INITIALLY IMMEDIATE (sofortige Prüfung) oder
-- INITIALLY DEFERRED (verzögerte Prüfung) definiert werden.

/* Beziehung mit einem Fremdschlüssel */
ALTER TABLE KDN_Beinhaltet
ADD CONSTRAINT "FK_VERKAUF_BEINHALTET"
  FOREIGN KEY (VNr)
  REFERENCES KDN_VERKAUF(VNr);

/* Beziehung mit zwei Fremdschlüsseln */
ALTER TABLE KLAUS_BEZIEH_ANGEBO
ADD CONSTRAINT "FK_KLAUS_BEZIEH_ANGEBO_ANGEBOT"
  FOREIGN KEY (Studiengangnr, Fachnr)
  REFERENCES ANGEBOT (Studiengangnr, fachnr);

/* DEFERRABLE INITIALLY DEFERRED */
ALTER TABLE klaus_bezieh_angebo
ADD CONSTRAINT "FK_KLAUS_BEZIEH_ANGEBO_KLAUSUNR"
  FOREIGN KEY (KLAUSURNR)
  REFERENCES KLAUSUR (KLAUSURNR)
  DEFERRABLE INITIALLY DEFERRED;

/* DEFERRABLE INITIALLY ENABLED */
ALTER TABLE klaus_bezieh_angebo
ADD CONSTRAINT "FK_KLAUS_BEZIEH_ANGEBO_KLAUSUNR"
  FOREIGN KEY (KLAUSURNR)
  REFERENCES KLAUSUR (KLAUSURNR)
  DEFERRABLE INITIALLY ENABLED;



