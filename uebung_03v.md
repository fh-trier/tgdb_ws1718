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
???
select provider_name
  2  from GAS_STATION gs
  3  Inner Join provider p
  4  ON gs.provider_id=p.provider_id
  5  Where gs.street LIKE '_u%';

### Aufgabe 3
Suche alle Tankstellen raus, die sich in Trier befinden.

#### Lösung
```sql
Deine Lösung
select DISTINCT p.provider_name,a.city,gs.gas_station_id
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
select DISTINCT vt.vehicle_type_name,v.version,v.build_year,p.producer_name,g.gas_name
    from vehicle v
    INNER JOIN vehicle_type vt ON v.vehicle_type_id=vt.vehicle_type_id
     Inner JOIN producer p ON v.producer_id=p.producer_id
    Inner JOIN gas g ON v.Default_Gas_ID=g.Gas_ID
    INNER JOIN acc_vehic av ON(v.vehicle_id NOT IN (SELECT vehicle_id from acc_vehic));

### Aufgabe 6
Welche Fahrzeuge wurden noch keinem Benutzer zugewiesen? Gebe über das Fahrzeug Informationen über den Typ, den Hersteller, das Modell, Baujahr und den Kraftstoff aus.

#### Lösung
```sql
Deine Lösung
select DISTINCT v.version vv,vt.vehicle_type_name vtv,p.producer_name,v.build_year vb,g.gas_name gg
    from vehicle v
    INner JOIN vehicle_type vt ON v.vehicle_type_id=vt.vehicle_type_id
    Inner JOIN producer p ON v.producer_id=p.producer_id
    Inner JOIN gas g ON v.default_gas_id=g.gas_ID
    Inner JOIN account acc ON (v.vehicle_id NOT IN(Select vehicle_id FROM acc_vehic));`

### Aufgabe 7
Verknüpfe eines der Autos aus Aufgabe 6 mit deinem Benutzernamen. Verwende dazu möglichst wenige SQL-Statements.

#### Lösung
```
Deine Lösung
`Keine Ahnung die Antwort geht aber auch nicht von der Lôsung``

### Aufgabe 8
An welcher Tankstelle wurde noch nie getankt? Gebe zu den Tankstellen die Informationen über den Standort der Tankstellen aus.

#### Lösung
```sql
Deine Lösung
`select a.plz,a.city
from address a
Inner JOIN gas_station gs ON gs.address_id=a.address_id
AND (gs.gas_station_id NOT IN (SELECT gas_station_id FROM receipt));``

### Aufgabe 9
Liste alle Benutzer (Vorname und Nachname) mit Fahrzeug (Hersteller, Modell, Alias) auf, die noch nie einen Beleg hinzugefügt haben.

#### Lösung
```sql
Deine Lösung
`select a.surname as,a.forename af,p.producer_name pp,vt.vehicle_type_name vtv,av.alias ava
  2  from account a
  3  Inner JOIN acc_vehic av ON a.account_id=av.account_id
  4  Inner JOIN vehicle v ON av.vehicle_id=v.vehicle_id
  5  Inner JOIN vehicle_type vt ON v.vehicle_type_id=vt.vehicle_type_id
  6  Inner JOIN producer p ON v.producer_ID=p.producer_ID
  7  Where av.acc_vehic_id NOT IN(SELECT acc_vehic_id from receipt);``

### Aufgabe 10
Liste alle Benutzer auf, die mit einem Fahrzeug schonmal im Außland tanken waren.

#### Lösung
```sql
Deine Lösung
`select a.surname, a.forename
  2  from account a
  3  INner JOIN acc_vehic av ON a.account_id=av.account_id
  4  Inner Join gas_station gs ON av.default_gas_station=gs.gas_station_ID
  5  Inner Join Country c ON gs.country_ID=c.country_ID
  6  Where c.country_name NOT LIKe '%deut%';``

### Aufgabe 11
Wie viele Benutzer haben einen LKW registriert?

#### Lösung
```sql
Deine Lösung
`select COUNT(a.ACCOUNT_ID)
  2  from account a
  3  Inner Join acc_vehic av ON a.account_id=av.account_id
  4  INner JOIN vehicle v ON av.vehicle_id=v.vehicle_id
  5  Inner Join vehicle_type vt ON v.vehicle_type_id=vt.vehicle_type_ID
  6  Where vt.vehicle_Type_Name LIKe 'LKW';``

### Aufgabe 12
Wie viele Benutzer haben einen PKW und einen LKW registriert?

#### Lösung
```sql
Deine Lösung
`select COUNT(a.ACCOUNT_ID)
  2  from account a
	Where a.account_ID IN(
  3  select a.account_id from acc_vehic av
  4  INner JOIN vehicle v ON av.vehicle_id=v.vehicle_id
  5  Inner Join vehicle_type vt ON v.vehicle_type_id=vt.vehicle_type_ID
  6  Where vt.vehicle_Type_Name='LKW')
 AND a.account_ID IN(
Select av.account_ID from acc_vehic av
  3  Inner Join acc_vehic av ON a.account_id=av.account_id
  4  INner JOIN vehicle v ON av.vehicle_id=v.vehicle_id
Where vt.vehicle_type_name='PKW');``

### Aufgabe 13
Führe den Patch `02_patch.sql`, der sich im Verzeichnis `sql` befindet, in deiner Datenbank aus. Wie lautet der Befehlt zum import?

#### Lösung
```sql
Deine Lösung
`start "...\02_patch.sql"`

### Aufgabe 14
Aktualisiere den Steuersatz aller Belege auf den Steuersatz des Landes, indem die Kunden getankt haben.

#### Lösung
```sql
Deine Lösung
` UPDATE RECEIPT r
  2  SET DUTY_AMOUNT = (
  3  SELECT c.DUTY_AMOUNT
  4  FROM COUNTRY c
  5  INNER JOIN gas_station gs ON (c.country_id = gs.country_id)
  6  WHERE gs.gas_station_id = r.gas_station_id
  7  );``


