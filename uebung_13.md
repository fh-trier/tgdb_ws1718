# Tutorium - Grundlagen Datenbanken - Blatt 13

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `schema_uebung_13.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
Gegeben sei folgender Situation:
+ Ein Kunde kann eine oder mehrere Bestellungen aufgeben
+ In einer Bestellung wird wenigstens ein eventuell mehrere Artikel (in einer gewissen Menge) bestellt.
+ Eine Lieferung kann sich auch auf mehrere Bestellpositionen des gleichen Kunden beziehen.
+ Eine Bestellposition muss nicht gleich von Anfang an mit einer Lieferung verknüpft werden (also der Artikel nicht gleich ausgeliefert werden).

Folgendes relationale Schema soll diesen Realitätsausschnitt abbilden:

![Databasemodell](./img/schema_uebung_13.png)

## Aufgaben
Führe das in Abschnitt Vorbereitung genannte Skript aus. Die untenstehenden Aufgaben beziehen sich auf das oben dargestellte relationale Schema.

### Aufgabe 1
Gebe mit einem regulären Ausdruck alle Artikel aus, die mit einem Großbuchstaben beginnen und mindestens 4 Zeichen lang sind.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 2
Gebe mit einem regulären Ausdruck alle Artikelnummern aus, die aus 3 Ziffern bestehen, mit 1 beginnen und anschließend keine 4 folgt.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 3
Gebe alle Kunden mit der Anzahl ihrer Bestellungen aus. Hier sollen auch Kunden zurückgegeben werden, die bisher keine Bestellungen getätigt haben.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 4
Ergänzen Sie das Skript um das `CREATE TABLE` statement für die Tabelle `BESTELLPOSITION` mit den notwendigen `NOT NULL` Constraints.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 5
Stellen Sie sicher, dass eine Bestellnr immer größer null ist.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 6
Ergänzen Sie das Skript um eine Definition eines geeigneten `PRIMARY KEY` für die Tabelle `Bestellposition` und der drei `FOREIGN KEY`s zu `LIEFERUNG`, `BESTELLUNG` und `ARTIKEL` mit den o.g. Namen.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 7
Starten Sie das so veränderte Skript.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 8
Stellen Sie sicher, dass jede Person, die neu in den Bestand aufgenommen wird eine pnr aus einer Sequence erhält und dass eine `PNR` später nicht mehr durch einen `UPDATE` verändert werden darf. Die Sequence soll `PERSON_SEQ` heißen und bei `1000` beginnen.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 9
Erfassen Sie eine Bestellung, mit Bestellnr 100, dem Datum von heute und ordnen Sie es dem Kunden Hugo McKinnock zu.

Dieser Kunde bestellt den Artikel SAP for beginners mit der Artikelnummer `123` und dem Verkaufspreis 25 Euro zwei mal. Zusätzlich bestellt der Kunde den Artikel JAVA for dummies mit der Artikelnummer `234` ein mal.

Löse die Aufgabe möglichst mit dynamischem SQL - subqueries.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 10
Räumen Sie dem DB-Benutzer `SCOTT` das Recht ein, `UPDATE` (nicht auf `ARTIKELNR`) und `SELECT` auf der Tabelle `ARTIKEL` durchführen zu können.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 11
Löschen Sie alle Personen, deren letzte Bestellung vom heutigen Tag aus gesehen mehr als ein Jahr zurückliegt.

Vorsicht: Der Kunde könnte mehrere Bestellungen aufgegeben haben oder auch gar keine.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 12
Geben Sie die Personen aus absteigend sortiert nach Namen und innerhalb des gleichen Namens aufsteigend nach Geburtsdatum.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 13
Erhöhen Sie den Preis jeden Artikels um 5%.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 14
Für welche der Bestellungen ist noch keine Lieferung erfolgt?

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 15
Geben Sie die Personen aus, die mindestens 18 Jahre alt sind.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 16
Geben Sie alle Personen aus, deren Namen zwischen fünf und zehn Zeichen lang sind und einen Bindestrich (-) enthalten.

#### Lösung
```sql
Deine Lösung
```
