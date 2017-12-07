/*
  @author:  Markus Pesch
  @date:    13.11.2015
  @email:   peschm@fh-trier.de
*/

/* Plus 2 Jahre, 4 Monate, 8 Tage */
SYSDATE + INTERVAL '2' YEAR + INTERVAL '4' MONTH + INTERVAL '8' DAY

/* Beispiel */
/* Personen älter 18 Jahre */
SELECT Vorname, Nachname, Geburtstag
FROM Person
WHERE Geburtstag < SYSDATE - INTERVAL '18' YEAR
