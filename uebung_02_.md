# Tutorium - Grundlagen Datenbanken - Blatt 2

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `uebung02.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

## Aufgaben

### Aufgabe 1
Schaue dir das Datenbankmodell an. Wofür steht hinter dem Datentyp `NUMBER` die Zahlen in den runden Klammern?

#### Lösung
> speichert bei einigen Datenbanken Fließkommazahlen mit Angabe der maximalen Stellenanzahl und Nachkommastellenzahl

### Aufgabe 2
Was bedeuten die durchgezogenen Linien die zwischen einigen Tabellen abgebildet sind?.

#### Lösung
> Das sie miteinander verbunden sind.

### Aufgabe 3
Was bedeutet die gestrichelte Linie die zwischen der Tabelle `ACC_VEHIC` und `GAS_STATION` abgebildet ist?

#### Lösung
> Eine Beziehung heißt nicht identifizierend, wenn die Primärschlüsselattribute der Master-Entity-Menge nur als 
 Fremdschlüsselattribute, aber nicht als Primärschlüssel bei der Detail-Entity-Menge auftreten. 
Eine nicht identifizierende Beziehung wird durch eine gestrichelte Linie gekennzeichnet.

### Aufgabe 3
Die folgende Abbildung beschreibt eine Beziehung zwischen Tabellen. Sie wird auch `n` zu `m` Beziehung genannt. Beschreibe kurz die Bedeutung dieser Beziehung.

![n-to-m-relationship](./img/n-to-m-relationship.png)

> Bei „viele zu viele“-Beziehung in relationalen Datenbanken können jedem Datensatz in Tabelle A mehrere passende Datensätze
 in Tabelle B zugeordnet sein und umgekehrt. 

### Aufgabe 4
Was bedeutet der Buchstabe `P` und `F` neben den Attributen von Tabellen?

#### Lösung
> F fremdschlüssel(primary key)	-eindeutiger Identifikator
P primärschlüssel(foreign key)	-Schlüssel aus einer anderen Tabelle, um eine Beziehung herstellen zu können

### Aufgabe 5
Importiere die SQL-Dump-Datei in dein eigenes Schema. Wie lautet dazu der Befehl um dem import zu starten?

#### Lösung
`start``sql
Deine Lösung
`imp system/system-password@SID file=directory-you-selected\FILE.dmp log=log-dir\oracle_load.log fromuser=infodba touser=infodba commit=Y``

### Aufgabe 6
Lasse dir alle vorhanden Fahrzeugklassen aus der Tabelle `VEHICLE_TYPE` ausgeben. Suche nun nach allen Benutzern (`SURNAME`, `FORNAME`), die ein Auto besitzen.

#### Lösung
```sql
Deine Lösung
`Select * from Vehicle_Type;`Select surname, forname from account Where id=true;`

### Aufgabe 7
Kombiniere aus Aufgabe 6 beide Abfrage zu einer Abfrage.

#### Lösung
```sql
Deine Lösung
`Select * from Vehicle_Type Union Select surname, forname from account Where id=true;``

### Aufgabe 8
Modifizierde die Aufgabe 7 so, dass nur der Benutzer mit der `ACCOUNT_ID` = `7` angezeigt wird.

#### Lösung
```sql
Deine Lösung
`Select * from Vehicle_Type Union Select surname, forname from account Where id=‘7‘;``

### Aufgabe 9
Erstelle für dich einen neuen Benutzer.
> Achtung, nutze für die Spalten `C_DATE` und `U_DATE` vorerst die Syntax `SYSDATE` - [Dokumentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions172.htm)

#### Lösung
```sql
Deine Lösung
`Insert into account(ID, Sysdate) Values(231, „22.01.13“);``

### Aufgabe 10
Erstelle für deinen neuen Benutzer ein neues Auto. Dieses Auto dient als Vorlage für die nächten Aufgabem.

#### Lösung
```sql
Deine Lösung
`Update acc_vehic
Set vehicle_ID=true
Where acccount_id=231;
``

### Aufgabe 11
Verknüpfe das aus Aufgabe 10 erstellte neue Auto mit deinem neuen Benutzer aus Aufgabe 9 in der Tabelle `ACC_VEHIC` und erstelle den ersten Rechnungsbeleg.

#### Lösung
```sql
Deine Lösung
`Commit
Select  * from recipt;
``

