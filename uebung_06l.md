# Tutorium - Grundlagen Datenbanken - Blatt 6

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `01_tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

## Data-Dictionary-Views
![Data-Dictionary-Views](./img/constraint_schema.png)

## Aufgaben

### Aufgabe 1
Wie heißt der Primary Key Contraint der Tabelle `VEHICLE` und für welche Spalten wurde er angelegt?

#### Lösung
```sql
Deine Lösung
`Der Primary Key Constraint von Vehicle ist die VEHICLE_ID er wurde für 1 spalte angelegt`
select * from user_cons_columns
  2  Where constraint_name=
  3 (select constraint_name from user_constraints Where table_name='VEHICLE' and CONSTRAINT_TYPE='P');`

### Aufgabe 2
Für welche Spalte**n** der Tabelle `ACC_VEHIC` wurde ein Foreign Key angelegt und auf welche Spalte/n in welcher Tabelle wird er referenziert?

#### Lösung
```sql
Deine Lösung
`Es wurden 3 Spalten für die Foreign Key's angelegt ACCOUNT_ID,VEHICLE_ID und DEFAULT_GAS_STATION. Es wird referenziert auf den Tabellen receipt,gas_station und vehicle``

### Aufgabe 3
Erstelle einen Check Constraint für die Tabelle `ACCOUNT`, dass der Wert der Spalte `U_DATE` nicht älter sein kann als `C_DATE`.

#### Lösung
```sql
Deine Lösung
`ALTER TABLE account
  2  ADD CONSTRAINT datum
  3  CHECK(U_DATE>C_DATE);
### Aufgabe 4
Erstelle einen Check Constraint der überprüft, ob der erste Buchstabe der Spalte `GAS_NAME` der Tabelle `GAS` groß geschrieben ist.

#### Lösung
```sql
Deine Lösung
`ALTER TABLE gas
  2  ADD CONSTRAINT gas_name_g CHECK (UPPER(gas_name));`
ALTER TABLE gas
  2  ADD CONSTRAINT gas_name_g
  3  CHECK(gas_name='_' AND UPPER(gas_name);`
``

### Aufgabe 5
Erstelle einen Check Contraint der überprüft, ob der Wert der Spalte `IDENTICATOR` der Tabelle `ACC_VEHIC` eins von diesen möglichen Fahrzeugkennzeichenmustern entspricht. Nutze Reguläre Ausdrücke.

+ B:AB:5000
+ TR:MP:1
+ Y:123456
+ THW:98765
+ MZG:XZ:96

#### Lösung
```sql
Deine Lösung
`ALTER TABLE acc_vehic
  2  ADD CONSTRAINT kennzeichen
  3  CHECK(Where REGEXP_LIKE(IDENTIFICATOR,'B:AB:5000,TR:MP:1,Y:123456,THW:98765,MZG:XZ:96'));``

### Aufgabe 6 - Wiederholung
Liste für alle Personen den Verbrauch an Kraftstoff auf (Missachte hier die unterschiedlichen Kraftstoffe). Dabei ist interessant, wie viel Liter die einzelne Person getankt hat und wie viel Euro sie für Kraftstoffe ausgegeben hat.

#### Lösung
```sql
Deine Lösung
`select a.surname,a.forename,r.liter,r.duty_amount,r.price_l
  2  from receipt r
  3  INNER JOIN account a ON (r.account_ID=a.account_ID);``

### Aufgabe 7 - Wiederholung
Liste die Tankstellen absteigend sortiert nach der Kundenanzahl über alle Jahre.

#### Lösung
```sql
Deine Lösung
`select p.provider_name,gs.gas_station_ID,av.C_DATE
  2  from provider p
  3  INNER JOIN gas_station gs ON p.provider_ID=gs.provider_id
  4  INNER JOIN acc_vehic av ON gs.gas_station_ID=av.default_gas_station
  5  ORDER BY av.C_DATE DESC;``

### Aufgabe 8 - Wiederholung
Erweitere das Datenbankmodell um ein Fahrtenbuch, sowie es Unternehmen für ihren Fuhrpark führen. Dabei ist relevant, welche Person an welchem Tag ab wie viel Uhr ein Fahrzeug für die Reise belegt, wie viele Kilometer zurück gelegt wurden und wann die Person das Fahrzeug wieder abgibt.

Berücksichtige bitte jegliche Constraints!

#### Lösung
```sql
Deine Lösung
```






