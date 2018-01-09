# Tutorium - Grundlagen Datenbanken - Blatt 13

## Vorbereitung
Der [SQL-Dump](./sql/04_schema_altklausur.sql) des Datenbankmodells befindet sich im Verzeichnis `sql`.

## Datenbankmodell
Gegeben sei folgender Situation:
+ Ein Kunde kann eine oder mehrere Bestellungen aufgeben
+ In einer Bestellung wird wenigstens ein eventuell mehrere Artikel (in einer gewissen Menge) bestellt.
+ Eine Lieferung kann sich auch auf mehrere Bestellpositionen des gleichen Kunden beziehen.
+ Eine Bestellposition muss nicht gleich von Anfang an mit einer Lieferung verknüpft werden (also der Artikel nicht gleich ausgeliefert werden)!

Folgendes relationale Schema soll diesen Realitätsausschnitt abbilden:

![Databasemodell](./img/schema_alt_klausur.png)

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




















