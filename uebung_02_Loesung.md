# Tutorium - Grundlagen Datenbanken - Blatt 2

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

## Aufgaben

### Aufgabe 1
Schaue dir das Datenbankmodell an. Wofür steht hinter dem Datentyp `NUMBER` die Zahlen in den runden Klammern?
Nehme dir die Oracle [Dokumentation](https://docs.oracle.com/cd/B28359_01/server.111/b28318/datatype.htm#CNCPT012) zu Hilfe.

#### Lösung
nico

### Aufgabe 2
Was bedeuten die durchgezogenen Linien, die zwischen einigen Tabellen abgebildet sind?

#### Lösung
Sie bildet eine Beziehung zwischen zwei Tabellen ab. Sie müssen ausgefüllt werden, obligatorisch.
### Aufgabe 3
Was bedeutet die gestrichelte Linie, die zwischen der Tabelle `ACC_VEHIC` und `GAS_STATION` abgebildet ist?

#### Lösung
Sie beschreibt eine Beziehung zwischen zwei Tabellen, die optional ausgefüllt werden können.
### Aufgabe 4
Die folgende Abbildung beschreibt eine Beziehung zwischen Tabellen. Sie wird auch `n` zu `m` Beziehung genannt. Beschreibe kurz die Bedeutung dieser Beziehung.
Nehme dir diesen [Artikel](https://glossar.hs-augsburg.de/Beziehungstypen) zu Hilfe.

![n-to-m-relationship](./img/n-to-m-relationship.png)

Zur Realisierung einer n zu m-Beziehung wird eine zusätzliche Tabelle erstellt in der die Primärschlüssel beider Tabellen als Fremdschlüssel enthalten sind. Die zusätzliches Tabelle ist somit eine 1:n-Beziehung. Eine n zu m - Beziehung beschreibt, dass n Datensätze mit m Datensätze verknüpft werden können. In diesem Beiespiel haben n Personen m Hobby in der Tabelle Person_Hobby gespeichter werden.

### Aufgabe 5
Was bedeutet der Buchstabe `P` und `F` neben den Attributen von Tabellen?

#### Lösung
P = Primärschlüssel  
F = Fremdschlüssel


### Aufgabe 6
Importiere die SQL-Dump-Datei in dein eigenes Schema. Wie lautet dazu der Befehl um dem import zu starten?

#### Lösung
@C:\Users\User\workspace\github.com\RoseTyler\tgdb_ws1718\sql\tutorium.sql
Oder durch start + Dateipfad

### Aufgabe 7
Gebe alle Datensätze der Tabelle `ACCOUNT` aus.

#### Lösung
COLUMN EMAIL FORMAT a16
SELECT * 
FROM ACCOUNT;

### Aufgabe 8
Modifiziere Aufgabe 7 so, dass nur die Spalte `ACCOUNT_ID` ausgegeben wird.

#### Lösung
SELECT ACCOUNT_ID 
FROM ACCOUNT;

### Aufgabe 9
Gebe alle Spalten der Tabelle `VEHICLE` aus.

#### Lösung
SELECT * 
FROM VEHICLE;
DESC VEHICLE;

### Aufgabe 10
Kombiniere Aufgabe 8 und 9 so, dass nur Personen (`ACCOUNT`) angezeigt werden, die ein Auto (`VEHICLE`) besitzen.

#### Lösung
SELECT DISTINCT ac.surname 
FROM ACCOUNT ac
INNER JOIN ACC_VEHIC ve 
ON ac.ACCOUNT_ID = ve.ACCOUNT_ID;

### Aufgabe 11
Modifizierde die Aufgabe 10 so, dass nur die Person mit der `ACCOUNT_ID` = `7` angezeigt wird.

#### Lösung
SELECT DISTINCT ac.surname 
FROM ACCOUNT ac
INNER JOIN ACC_VEHIC ve 
ON ac.ACCOUNT_ID = 7;
 


### Aufgabe 12
Erstelle für dich einen neuen Benutzer.
> Achtung, nutze für die Spalten `C_DATE` und `U_DATE` vorerst die Syntax `SYSDATE` - [Dokumentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions172.htm)

#### Lösung
INSERT INTO ACCOUNT
VALUES (
  (SELECT MAX(ACCOUNT_ID)+1 FROM ACCOUNT),
   'Tyler','Rose','tylerr@hochschule-trier.de',
   SYSDATE,SYSDATE);


### Aufgabe 13
Erstelle für deinen neuen Benutzer ein neues Auto. Dieses Auto dient als Vorlage für die nächten Aufgaben.

#### Lösung
INSERT INTO VEHICLE
VALUES (
  (SELECT MAX(VEHICLE_ID)+1 FROM VEHICLE),
   1, 2, '3', NULL, 300,'15-SEP-17', 4, SYSDATE, SYSDATE);



### Aufgabe 14
Verknüpfe das aus Aufgabe 13 erstellte neue Auto mit deinem neuen Benutzer aus Aufgabe 11 in der Tabelle `ACC_VEHIC` und erstelle den ersten Rechnungsbeleg.

#### Lösung
INSERT INTO ACC_VEHIC
  VALUES ((SELECT MAX(ACC_VEHIC_ID)+1 FROM ACC_VEHIC), 10, 14, 'Twingo', 'Renault', NULL, NULL, 10000, 20, NULL, '15-SEP-17',  NULL, SYSDATE, SYSDATE);


### Aufgabe 15
Ändere den Vorname `SURNAME` des Datensatzes mit der ID `7` in der Tabelle `ACCOUNT` auf `Zimmermann`.

#### Lösung
UPDATE ACCOUNT 
SET SURNAME = 'Zimmermann' 
WHERE ACCOUNT_ID = 7;

### Aufgabe 16
Speichere alle Änderungen deiner offenen Transaktion. Wie lautet der SQL-Befehl dazu?

#### Lösung
COMMIT;
