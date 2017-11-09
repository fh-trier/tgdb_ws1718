# Tutorium - Grundlagen Datenbanken - Blatt 5

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `01_tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

## Aufgaben

### Aufgabe 1
Erstelle mit Dia oder einem anderen Werkzeug eine Abbilung der Mengen, die durch `INNER JOIN`, `RIGHT JOIN`, `LEFT JOIN` und `OUTER JOIN` gemeint sind.

#### Lösung
Der INNER-JOIN

![INNER JOIN](./img/inner-join.gif)

Der LEFT-JOIN

![LEFT JOIN](./img/left-join.gif)

Der RIGHT-JOIN

![RIGHT JOIN](./img/right-join.gif)

Der OUTER-JOIN

![OUTER JOIN](./img/outer-join.gif)

### Aufgabe 2
Welche Personen haben kein Fahrzeug? Löse dies einmal mit `LEFT JOIN` und `RIGHT JOIN`.

#### Lösung
```sql
-- LEFT JOIN
SELECT a.forename "Vorname", a.surname "Nachname", accv.vehicle_id "Fahrzeug-ID"
FROM account a
  LEFT JOIN acc_vehic accv ON (a.account_id = accv.account_id)
WHERE accv.vehicle_id IS NULL;

-- RIGHT JOIN
SELECT a.forename "Vorname", a.surname "Nachname"
FROM account a
WHERE a.account_id NOT IN (
SELECT accv.account_id
FROM acc_vehic accv
  RIGHT JOIN vehicle v ON (accv.vehicle_id = v.vehicle_id)
WHERE accv.account_id IS NOT NULL
);

-- Alternative
SELECT a.surname "Vorname", a.forename "Nachname"
FROM acc_vehic acc
  RIGHT JOIN account a ON (acc.account_id = a.account_id)
WHERE acc.vehicle_id IS NULL;
```


