/*
  @author:  Markus Pesch
  @date:    13.11.2015
  @email:   peschm@fh-trier.de
*/

/* String -> Datum */
to_date('01.01.2016', dd.mm.yyyy)

/* Beispiel */
SELECT *
FROM receipts r
WHERE r.C_DATE > TO_DATE('01.01.2016', 'dd.mm.yyyy');

/* Datum -> String */
to_char(<spaltenname>, dd.mm.yyyy)

SELECT *
FROM receipts r
WHERE TO_CHAR(r.C_DATE, 'dd.mm.yyyy') > '01.01.2016';


