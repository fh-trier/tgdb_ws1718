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
> Deine schritliche Antwort.

### Aufgabe 2
Was bedeuten die durchgezogenen Linien die zwischen einigen Tabellen abgebildet sind?.

#### Lösung
> Deine schriftliche Antwort.

### Aufgabe 3
Was bedeutet die gestrichelte Linie die zwischen der Tabelle `ACC_VEHIC` und `GAS_STATION` abgebildet ist?

#### Lösung
> Deine schriftliche Antwort.

### Aufgabe 3
Die folgende Abbildung beschreibt eine Beziehung zwischen Tabellen. Sie wird auch `n` zu `m` Beziehung genannt. Beschreibe kurz die Bedeutung dieser Beziehung.

![n-to-m-relationship](./img/n-to-m-relationship.png)

> Deine schriftliche Antwort.

### Aufgabe 4
Was bedeutet der Buchstabe `P` und `F` neben den Attributen von Tabellen?

#### Lösung
> Deine schriftliche Lösung.

### Aufgabe 5
Importiere die SQL-Dump-Datei in dein eigenes Schema. Wie lautet dazu der Befehl um dem import zu starten?

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 6
Lasse dir alle vorhanden Fahrzeugklassen aus der Tabelle `VEHICLE_TYPE` ausgeben. Suche nun nach allen Benutzern (`SURNAME`, `FORNAME`), die ein Auto besitzen.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 7
Kombiniere aus Aufgabe 6 beide Abfrage zu einer Abfrage.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 8
Modifizierde die Aufgabe 7 so, dass nur der Benutzer mit der `ACCOUNT_ID` = `7` angezeigt wird.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 9
Erstelle für dich einen neuen Benutzer.
> Achtung, nutze für die Spalten `C_DATE` und `U_DATE` vorerst die Syntax `SYSDATE` - [Dokumentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions172.htm)
