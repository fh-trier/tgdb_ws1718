/*
  @author:  Markus Pesch
  @date:    02.12.2015
  @email:   peschm@fh-trier.de
*/

/* SQL-Plus Einstellungen */
COLUMN Typ FORMAT a1
COLUMN Constraint FORMAT a15
COLUMN H-Tabelle FORMAT a15
COLUMN R-Tabelle FORMAT a15
COLUMN Spalte FORMAT a15


/*
  In WHERE Klause Tabellennamen anpassen!
  C = CHECK CONSTRAINT
  R = FOREIGEN KEY
  P = PRIMATY KEY
  U = UNIQUE KEY
*/


SELECT uc.CONSTRAINT_TYPE AS "Typ", uc.CONSTRAINT_NAME AS "Constraint", uc.TABLE_NAME AS "H-Tabelle", ucc.TABLE_NAME AS "R-Tabelle", ucc.COLUMN_NAME AS "Spalte"
FROM user_constraints uc
LEFT JOIN user_cons_columns ucc ON(ucc.CONSTRAINT_NAME = uc.R_CONSTRAINT_NAME)
WHERE uc.TABLE_NAME = 'EMP';
