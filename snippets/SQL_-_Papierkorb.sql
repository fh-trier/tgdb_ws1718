/*
  @author:  Markus Pesch
  @date:    29.11.2015
  @email:   peschm@fh-trier.de
*/

/* Gelöschte Tabellen sind bin BIN$ gekennzeichnet */
SELECT TNAME
FROM tab;

/* Papierkorb löschen */
PURGE RECYCLEBIN;

/* Papierkorb Inhalt anzeigen */
SELECT *
FROM RECYLEBIN;

/* Papierkorb beschreibung */
desc recyclebin;

/* Tabelle löschen trotz Constraint */
DROP TABLE <TABELLENNAME> CASCADE CONSTRAINTS;

/* Tabelle endgültig löschen */
DROP TABLE <TABELLENNAME> PURGE;

/* Alle Tabellen löschen */
-- Generiert SQL-Statements
SELECT 'DROP TABLE ' ||table_name|| ' CASCADE CONSTRAINTS;'
FROM USER_TABLES;

/* Wiederherstellen einer Tabelle */
FLASHBACK TABLE HUGO TO BEFORE DROP;
