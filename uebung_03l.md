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
Deine Lösung
select gs.street,p.provider_name,c.country_name,c.duty_amount,a.plz,a.city
  2  from gas_station gs
  3  Inner JOIN provider p ON gs.provider_ID=p.provider_ID
  4  Inner JOIN country c ON gs.country_ID=c.country_ID
  5  Inner JOIN address a ON gs.address_ID=a.address_ID;

### Aufgabe 2
Suche alle Tankstellen raus, deren Straßenname an zweiter Stelle ein `U` haben (case-insensetive). Verändere dazu die Abfrage aus Aufgabe 1. Optional für Enthusiasten, suche mittels Regulärem Ausdruck.

#### Lösung
```sql
Deine Lösung
Select provider_name
    from Provider
    Where provider_name LIKE '_U%';

### Aufgabe 3
Suche alle Tankstellen raus, die sich in Trier befinden.

#### Lösung
```sql
Deine Lösung
select p.provider_name,a.city,gs.gas_station_id
    from Gas_station gs
    INNer JOIN provider p ON gs.provider_ID=p.provider_ID
    Inner JOIN address a ON gs.address_ID=a.address_ID
    Where a.city='Trier';

#### Aufgabe 4
Füge eine fiktive Tankstelle hinzu. Sie darf auf keine bestehenden Informationen basieren. Nutze möglichst wenige SQL-Befehle. Rufe fehlende Informationen möglichst direkt ab.

#### Lösung
```sql
Deine Lösung
Insert into gas_station
    Values((select max(gas_station_ID)+1 from gas_station),
    (select max(provider_ID)+1 from gas_station),
    (select max(country_ID)+1 from gas_station),
    (select max(address_ID)+1 from gas_station),
   (select dbms_random.string(street,171) from gas_station));

### Aufgabe 5
Erstelle eine INNER JOIN (optional `WHERE`) Abfrage um die Beziehung zwischen den Tabellen `ACCOUNT`, `VEHICLE`, `VEHICLE_TYPE`, `GAS` und `PRODUCER` aufzulösen und zeige die Spalten `FORNAME`, `SURNAME`, `VEHICLE_TYPE_NAME`, `VERSION`, `BUILD_YEAR`, `PRODUCER_NAME` und `GAS_NAME` an. Richte SQL-Plus so ein, dass möglicht jeder Datensatz nur eine Zeile belegt.

* COLUMN <SPALTENNAME> FORMAT a<Zeichenlänge>
* COLUMN <SPALTENNAME> FORMAT <Zahlenlänge, pro Länge eine 9>
* Beispiel für eine Spalte des Datentyps `VARCHAR2`: `COLUMN SURNAME FORMAT a16`
* Beispiel für eine Spalte des Datentyps `NUMERIC`: `COLUMN SOLD_KILOMETER 9999`

#### Lösung
```sql
column forename format a8
column surname format a8
column vehicle_type_name format a10
column version format a8
column build_year format a10
column producer_name format a10
column gas_name format a10

Deine Lösung
select a.forename,a.surname,vt.vehicle_type_name,v.version,v.build_year,p.producer_name,g.gas_name
    from vehicle v
    INNER JOIN vehicle_type vt ON v.vehicle_type_id=vt.vehicle_type_id
     Inner JOIN producer p ON v.producer_id=p.producer_id
    Inner JOIN gas g ON v.Default_Gas_ID=g.Gas_ID
    INNER JOIN acc_vehic av ON v.vehicle_ID=av.vehicle_ID
    INNER JOIN account a ON av.account_ID=a.account_ID;

### Aufgabe 6
Welche Fahrzeuge wurden noch keinem Benutzer zugewiesen? Gebe über das Fahrzeug Informationen über den Typ, den Hersteller, das Modell, Baujahr und den Kraftstoff aus.

#### Lösung
```sql
Deine Lösung
`select a.account_ID,v.version
    from account a
    Inner JOIN acc_vehic av ON a.account_id=av.account_id
    Inner JOIN vehicle v ON av.vehicle_id=v.vehicle_id;`
select v.version vv,vt.vehicle_type_name vtv,p.producer_name,v.build_year vb,g.gas_name gg
    from vehicle v
    INner JOIN vehicle_type vt ON v.vehicle_type_id=vt.vehicle_type_id
    Inner JOIN producer p ON v.producer_id=p.producer_id
    Inner JOIN gas g ON v.default_gas_id=g.gas_ID
    Where v.version='mbi';`

### Aufgabe 7
Verknüpfe eines der Autos aus Aufgabe 6 mit deinem Benutzernamen. Verwende dazu möglichst wenige SQL-Statements.

#### Lösung
```
Deine Lösung
```

### Aufgabe 8
An welcher Tankstelle wurde noch nie getankt? Gebe zu den Tankstellen die Informationen über den Standort der Tankstellen aus.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 9
Liste alle Benutzer (Vorname und Nachname) mit Fahrzeug (Hersteller, Modell, Alias) auf, die noch nie einen Beleg hinzugefügt haben.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 10
Liste alle Benutzer auf, die mit einem Fahrzeug schonmal im Außland tanken waren.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 11
Wie viele Benutzer haben einen LKW registriert?

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 12
Wie viele Benutzer haben einen PKW und einen LKW registriert?

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 13
Führe den Patch `02_patch.sql`, der sich im Verzeichnis `sql` befindet, in deiner Datenbank aus. Wie lautet der Befehlt zum import?

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 14
Aktualisiere den Steuersatz aller Belege auf den Steuersatz des Landes, indem die Kunden getankt haben.

#### Lösung
```sql
Deine Lösung
```


