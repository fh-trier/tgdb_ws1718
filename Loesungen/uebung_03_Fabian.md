# Tutorium - Grundlagen Datenbanken - Blatt 3

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
Erstelle eine `INNER JOIN` (optional `WHERE`) Abfrage um die Beziehungen zwischen den Tabellen `GAS_STATION`, `Provider`, `COUNTRY` und `ADDRESS` aufzulösen, sodass eine ähnliche Ausgabe erstellt wird wie abgebildet.

| Anbieter  | Straße            | PLZ   | Ort         | Land        | Steuer  |
| --------- | ----------------- | ----- | ----------- | ----------- | ------- |
| Shell     | Zurlaubener 1     | 54292 | Trier       | Deutschland | 0.19    |
| Esso      | Triererstraße 10  | 53937 | Hellenthal  | Deutschland | 0,19    |
| ...       | ...               | ...   | ...         | ...         | ...     |

#### Lösung
```sql
SELECT DISTINCT p.provider_name "Anbieter", gs.street "Straße", a.plz "PLZ", a.city "Ort", c.country_name "Land", c.duty_amount "Steuer"
FROM GAS_STATION gs
INNER JOIN provider p ON (gs.provider_id=p.provider_id)
INNER JOIN country c ON (gs.country_id=c.country_id)
INNER JOIN address a ON (gs.address_id=a.address_id);
```

### Aufgabe 2
Suche alle Tankstellen raus, deren Straßenname an zweiter Stelle ein `U` haben (case-insensetive). Verändere dazu die Abfrage aus Aufgabe 1. Optional für Enthusiasten, suche mittels Regulärem Ausdruck.

#### Lösung
```sql
SELECT DISTINCT p.provider_name
FROM GAS_STATION gs
INNER JOIN provider p
ON gs.provider_id=p.provider_id AND 
LOWER (gs.street) LIKE '_u%';
```

### Aufgabe 3
Suche alle Tankstellen raus, die sich in Trier befinden.

#### Lösung
```sql
SELECT DISTINCT p.provider_name
FROM GAS_STATION gs
INNER JOIN provider p
ON gs.provider_id=p.provider_id
INNER JOIN address a
ON gs.address_id=a.address_id AND
a.city='Trier';
```

#### Aufgabe 4
Füge eine fiktive Tankstelle hinzu. Sie darf auf keine bestehenden Informationen basieren. Nutze möglichst wenige SQL-Befehle. Rufe fehlende Informationen möglichst direkt ab.

#### Lösung
```sql
--COUNTRY
INSERT INTO country
VALUES(1, 'Indien',0.58);
--(SELECT MAX(country_id)+1 FROM country), 'Indien', 0.58);

--Address
INSERT INTO address
VALUES((SELECT MAX(address_id)+1 FROM address), 54555,'LALALand');

--Provider 
INSERT INTO provider
VALUES((SELECT MAX(provider_id)+1 FROM provider), 'LALAGas');

--GAS_STATION
INSERT INTO gas_station
VALUES( (SELECT MAX(gas_station_id)+1 FROM gas_station),
		(SELECT MAX(provider_id) FROM provider),
		(SELECT MAX(country_id) FROM country),
		(SELECT MAX(address_id) FROM address),
		'LALAStreet');
```

### Aufgabe 5
Erstelle eine INNER JOIN (optional `WHERE`) Abfrage um die Beziehung zwischen den Tabellen `ACCOUNT`, `VEHICLE`, `VEHICLE_TYPE`, `GAS` und `PRODUCER` aufzulösen
und zeige die Spalten `FORNAME`, `SURNAME`, `VEHICLE_TYPE_NAME`, `VERSION`, `BUILD_YEAR`, `PRODUCER_NAME` und `GAS_NAME` an. 
Richte SQL-Plus so ein, dass möglicht jeder Datensatz nur eine Zeile belegt.

* COLUMN <SPALTENNAME> FORMAT a<Zeichenlänge>
* COLUMN <SPALTENNAME> FORMAT <Zahlenlänge, pro Länge eine 9>
* Beispiel für eine Spalte des Datentyps `VARCHAR2`: `COLUMN SURNAME FORMAT a16`
* Beispiel für eine Spalte des Datentyps `NUMERIC`: `COLUMN SOLD_KILOMETER 9999`

#### Lösung
```sql
SELECT acc.forename, acc.surname, vt.vehicle_type_name, v.version, v.build_year, p.producer_name, g.gas_name
FROM vehicle v 
INNER JOIN vehicle_type vt ON (v.vehicle_type_id=vt.vehicle_type_id)
INNER JOIN producer p ON (v.producer_id=p.producer_id)
INNER JOIN gas g ON (v.default_gas_id=g.gas_id)
INNER JOIN ACC_VEHIC av ON v.VEHICLE_ID = av.VEHICLE_ID
INNER JOIN ACCOUNT acc ON acc.ACCOUNT_ID = av.ACCOUNT_ID;

--Anpassung
COLUMN forename FORMAT a10;
COLUMN surname FORMAT a10;
COLUMN vehicle_type_name FORMAT a10;
COLUMN version FORMAT a10;
COLUMN build_year FORMAT a12;
COLUMN producer_name FORMAT a10;
COLUMN gas_name FORMAT a10;
```

### Aufgabe 6
Welche Fahrzeuge wurden noch keinem Benutzer zugewiesen? 
Gebe über das Fahrzeug Informationen über den Typ, den Hersteller, das Modell, Baujahr und den Kraftstoff aus.

#### Lösung
```sql
SELECT DISTINCT vt.vehicle_type_name, p.producer_name, v.version, v.build_year, g.gas_name
FROM vehicle v 
INNER JOIN vehicle_type vt ON (v.vehicle_type_id=vt.vehicle_type_id)
INNER JOIN producer p ON (v.producer_id=p.producer_id)
INNER JOIN gas g ON (v.default_gas_id=g.gas_id)
INNER JOIN account acc ON (v.vehicle_id NOT IN (SELECT vehicle_id FROM acc_vehic)); 
```

### Aufgabe 7
Verknüpfe eines der Autos aus Aufgabe 6 mit deinem Benutzernamen. Verwende dazu möglichst wenige SQL-Statements.

#### Lösung
```
INSERT INTO acc_vehic
VALUES(
		(SELECT MAX(acc_vehic_id)+1 FROM acc_vehic),
		(SELECT account_id FROM account WHERE email='wirtzf@hochschule-trier.de'),
		13,
		NULL,
		NULL,
		9999,
		2,
		12000,
		80000,
		SYSDATE,
		SYSDATE,
		(SELECT default_gas_id FROM vehicle WHERE vehicle_id = 13),
		SYSDATE,
		SYSDATE
		);
```

### Aufgabe 8
An welcher Tankstelle wurde noch nie getankt? Gebe zu den Tankstellen die Informationen über den Standort der Tankstellen aus.

#### Lösung
```sql
SELECT DISTINCT a.plz, a.city 
FROM address a
INNER JOIN gas_station gs ON (gs.address_id=a.address_id)
AND (gs.gas_station_id NOT IN (SELECT gas_station_id FROM receipt));
```

### Aufgabe 9
Liste alle Benutzer (Vorname und Nachname) mit Fahrzeug (Hersteller, Modell, Alias) auf, die noch nie einen Beleg hinzugefügt haben.

#### Lösung
```sql
SELECT a.forename, a.surname, p.producer_name, v.version, av.alias
FROM vehicle v
INNER JOIN producer p ON (v.producer_id=p.producer_id)
INNER JOIN acc_vehic av ON (v.vehicle_id=av.vehicle_id)
INNER JOIN account a ON (a.account_id=av.account_id)
AND av.acc_vehic_id NOT IN (SELECT acc_vehic_id FROM receipt); 
--WHERE av.acc_vehic_id NOT IN (SELECT acc_vehic_id FROM receipt); 
```

### Aufgabe 10
Liste alle Benutzer auf, die mit einem Fahrzeug schonmal im Außland tanken waren.

#### Lösung
```sql
SELECT a.FORENAME, a.SURNAME
FROM ACCOUNT a
INNER JOIN ACC_VEHIC av ON av.ACCOUNT_ID = a.ACCOUNT_ID
INNER JOIN RECEIPT r ON r.ACCOUNT_ID = a.ACCOUNT_ID
INNER JOIN GAS_STATION gs ON gs.GAS_STATION_ID = r.GAS_STATION_ID
WHERE gs.COUNTRY_ID <> (SELECT COUNTRY_ID FROM COUNTRY 
						WHERE COUNTRY_NAME = 'Deutschland');
```

### Aufgabe 11
Wie viele Benutzer haben einen LKW registriert?

#### Lösung
```sql					
SELECT COUNT(DISTINCT a.ACCOUNT_ID)
FROM ACCOUNT a
INNER JOIN ACC_VEHIC av ON av.ACCOUNT_ID = a.ACCOUNT_ID
INNER JOIN VEHICLE v ON v.VEHICLE_ID = av.VEHICLE_ID
INNER JOIN VEHICLE_TYPE vt ON v.VEHICLE_TYPE_ID = vt.VEHICLE_TYPE_ID
WHERE vt.VEHICLE_TYPE_NAME = 'LKW';
```

### Aufgabe 12
Wie viele Benutzer haben einen PKW und einen LKW registriert?

#### Lösung
```sql
SELECT COUNT(DISTINCT a.ACCOUNT_ID)
FROM ACCOUNT a
WHERE a.ACCOUNT_ID IN (
    SELECT av.ACCOUNT_ID
      FROM ACC_VEHIC av
        INNER JOIN VEHICLE v ON v.VEHICLE_ID = av.VEHICLE_ID
        INNER JOIN VEHICLE_TYPE vt ON v.VEHICLE_TYPE_ID = vt.VEHICLE_TYPE_ID
      WHERE vt.VEHICLE_TYPE_NAME = 'LKW'
    )
  AND a.ACCOUNT_ID IN (
    SELECT av.ACCOUNT_ID
      FROM ACC_VEHIC av
        INNER JOIN VEHICLE v ON v.VEHICLE_ID = av.VEHICLE_ID
        INNER JOIN VEHICLE_TYPE vt ON v.VEHICLE_TYPE_ID = vt.VEHICLE_TYPE_ID
      WHERE vt.VEHICLE_TYPE_NAME = 'PKW'
    );
```

### Aufgabe 13
Führe den Patch `02_patch.sql`, der sich im Verzeichnis `sql` befindet, in deiner Datenbank aus. Wie lautet der Befehlt zum import?

#### Lösung
```sql
start "...\02_patch.sql" 
```

### Aufgabe 14
Aktualisiere den Steuersatz aller Belege auf den Steuersatz des Landes, indem die Kunden getankt haben.

#### Lösung
```sql
UPDATE RECEIPT r
  SET DUTY_AMOUNT = (
    SELECT c.DUTY_AMOUNT
      FROM COUNTRY c
	  INNER JOIN gas_station gs ON (c.country_id = gs.country_id)
	  WHERE gs.gas_station_id = r.gas_station_id 
  );
  
UPDATE RECEIPT r
  SET DUTY_AMOUNT = (
    SELECT c.DUTY_AMOUNT
      FROM COUNTRY c
      WHERE c.COUNTRY_ID = (
        SELECT gs.COUNTRY_ID
        FROM GAS_STATION gs
        WHERE gs.GAS_STATION_ID = r.GAS_STATION_ID
      )
  );
```


