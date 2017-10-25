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
größe des Feldes

### Aufgabe 2
Was bedeuten die durchgezogenen Linien, die zwischen einigen Tabellen abgebildet sind?

#### Lösung
Relationen zwischen den Tabellen

### Aufgabe 3
Was bedeutet die gestrichelte Linie, die zwischen der Tabelle `ACC_VEHIC` und `GAS_STATION` abgebildet ist?

#### Lösung
In der Tabelle ACC_VEHIC können nur Default_Gas_Stations die in der GAS_STATION Tabelle vorhanden sind eingetragen werden.

### Aufgabe 3
Die folgende Abbildung beschreibt eine Beziehung zwischen Tabellen. Sie wird auch `n` zu `m` Beziehung genannt. Beschreibe kurz die Bedeutung dieser Beziehung.
Nehme dir diesen [Artikel](https://glossar.hs-augsburg.de/Beziehungstypen) zu Hilfe.

![n-to-m-relationship](./img/n-to-m-relationship.png)

Es können mehrere passende Datensätze der Tabellen Person und Hobby einander zugeordnet werden. Da so keine eindeutige Zurodnung erfolgen kann,
wirt die Tabelle Person_Hobby als Verbindungstabelle definiert. In dieser sind die Fremdschlüssel der anderen Tabellen als Primärschlüssel zugeordnet.

### Aufgabe 4
Was bedeutet der Buchstabe `P` und `F` neben den Attributen von Tabellen?

#### Lösung
P = Primary key(Primärschlüssel)    F = Foreign key(Fremdschlüssel) 

### Aufgabe 5
Importiere die SQL-Dump-Datei in dein eigenes Schema. Wie lautet dazu der Befehl um dem import zu starten?

#### Lösung
```sql
START 'C:/Users/<username>/tutorium.sql'
```

### Aufgabe 6
Gebe alle Datensätze der Tabelle `ACCOUNT` aus.

#### Lösung
```sql
SELECT * 
FROM ACCOUNT;
```

### Aufgabe 7
Modifiziere Aufgabe 6 so, dass nur die Spalte `ACCOUNT_ID` ausgegeben wird.

#### Lösung
```sql
SELECT ACCOUNT_ID 
FROM ACCOUNT;
```

### Aufgabe 8
Gebe alle Spalten der Tabelle `VEHICLE` aus.

#### Lösung
```sql
DESC VEHICLE;
```

### Aufgabe 9
Kombiniere Aufgabe 7 und 8 so, dass nur Personen (`ACCOUNT`) angezeigt werden, die ein Auto (`VEHICLE`) besitzen.

#### Lösung
```sql
SELECT DISTINCT ac.surname "Nachname"
FROM ACCOUNT ac
INNER JOIN ACC_VEHIC ve 
ON ac.ACCOUNT_ID = ve.ACCOUNT_ID;

oder

SELECT a.surname, "Nachname"
FROM account a
WHERE a.account_id IN(
  SELECT accv.account_id
  FROM acc_vehic accv);
```

### Aufgabe 10
Modifizierde die Aufgabe 9 so, dass nur die Person mit der `ACCOUNT_ID` = `7` angezeigt wird.

#### Lösung
```sql
SELECT DISTINCT ac.surname 
FROM ACCOUNT ac
INNER JOIN ACC_VEHIC ve 
ON ac.ACCOUNT_ID = 7;
```

### Aufgabe 11
Erstelle für dich einen neuen Benutzer.
> Achtung, nutze für die Spalten `C_DATE` und `U_DATE` vorerst die Syntax `SYSDATE` - [Dokumentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions172.htm)

#### Lösung
```sql
INSERT INTO ACCOUNT
VALUES (
  (SELECT MAX(ACCOUNT_ID)+1 FROM ACCOUNT),
   'Wirtz',
   'Fabian',
   'wirtzf@hochschule-trier.de',
   SYSDATE,
   SYSDATE
  );
```

### Aufgabe 12
Erstelle für deinen neuen Benutzer ein neues Auto. Dieses Auto dient als Vorlage für die nächten Aufgaben.

#### Lösung
```sql
INSERT INTO VEHICLE
VALUES (
  (SELECT MAX(VEHICLE_ID)+1 FROM VEHICLE),
   2, 
   1, 
   '4',
   NULL,
   450,
   '17-AUG-17',
   9,
   SYSDATE,
   SYSDATE
  );
```

### Aufgabe 13
Verknüpfe das aus Aufgabe 12 erstellte neue Auto mit deinem neuen Benutzer aus Aufgabe 11 in der Tabelle `ACC_VEHIC` und erstelle den ersten Rechnungsbeleg.

#### Lösung
```sql
INSERT INTO ACC_VEHIC
  VALUES (
    (SELECT MAX(ACC_VEHIC_ID)+1 FROM ACC_VEHIC),
    10,
    14,
    'GTD',
    NULL,
    10532,
    105,
    7452,
    200,
    '04-SEP-12',
    '05-OCT-111',
    NULL,
    SYSDATE,
    SYSDATE
  );

INSERT INTO receipt
VALUES( (SELECT MAX(receipt_id)+1 FROM receipt)
		(SELECT account_id FROM account WHERE email = 'wirtzf@hochschule-trier'),
		(SELECT MAX(acc_vehic_id)+1 FROM acc_vehic),
		0.18,
		(SELECT gas_id FROM gas WHERE gas_name = 'Benzin 95'),
		(SELECT MAX(gas_station_id)+1 FROM gas_station),
		1.32,
		657.2,
		45.78,
		SYSDATE,
		SYSDATE,
		SYSDATE);
```

### Aufgabe 14
Ändere den Vorname `SURNAME` des Datensatzes mit der ID `7` in der Tabelle `ACCOUNT` auf `Zimmermann`.

#### Lösung
```sql
UPDATE ACCOUNT 
SET SURNAME = 'Zimmermann' 
WHERE ACCOUNT_ID = 7;
```

### Aufgabe 15
Speichere alle Änderungen deiner offenen Transaktion. Wie lautet der SQL-Befehl dazu?

#### Lösung
```sql
COMMIT;
```
