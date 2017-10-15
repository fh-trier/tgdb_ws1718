# Tutorium - Grundlagen Datenbanken - Blatt 1

## Aufgaben

### Aufgabe 1
Lesen Sie sich den Wikipedia-Artikel [Normalisierung](https://de.wikipedia.org/wiki/Normalisierung_(Datenbank)) von Datenbanken mit Beispielen bis zur dritten Normalform (3NF) durch. Versuchen Sie die Tabelle aus der Excel-Datei [Normalisierung](./xls/normalisierung.xlsx) anhand der Normalisierungsstufen zu splitten um Annomalien zu vermeiden.

### Aufgabe 2
Erstellen Sie mittels [Dia](http://dia-installer.de/index.html.de)  order mit Oracle's [Data Modeler](http://www.oracle.com/technetwork/developer-tools/datamodeler/overview/index.html) ein Datenbankmodell das die Attribute (Felder) ihrer in Aufgabe 1 erstellten Tabellen abbildet. Berücksichtigen Sie, dass Attribute unterschiedliche [Datentypen](http://www.datenbank-sql.de/oracle-datentypen.htm) oder Restriktionen  (`NOT NULL`, `NULL`, `UNIQUE`, `PRIMARYKEY`, `FOREIGNKEY`) besitzen können.

## Exkurse:

### Normalisierungsregeln

#### 1 NF:
Eine Relation ist in der 1 NF, wenn alle Attributwerte atomar (elementar, nicht weiter differenzierbar) sind. Jede weitere NF setzt vorangegangene NF´s voraus. => Sortierbar & Filterbar
#### 2 NF:
Zuordnungstabellen: Eine Relation ist in der 2 NF, wenn alle Nichtschlüsselattributwerte (NSA) vom gesamten Primärschlüssel abhängig sind.
#### 3 NF:
Eine Relation ist in der 3 NF, wenn alle NSA voneinander unabhängig sind. (Geburtsdatum & Alter ist ein Verstoß)
#### => 
1NF: Alle Attributwerte müssen atomar sein 
2NF: Alle NSA hängen vom gesamten Primärschlüssel ab
 3NF: Alle NSA sind voneinander unabhängig.
### Abbildungsregeln
#### 1 ABR: 
Für jede Entitätsmenge muss eine Relation (Tabelle) definiert werden.
#### 2 ABR: 
Bei 1:n-Bezeichnungen muss der Primärschlüssel der 1-Relation  als Fremdschlüssel in die n-Relation übernommen werden.
#### 3 ABR: 
Jede Beziehungsmenge einer n:n-Beziehung muss als eigene Relation abgebildet werden.
Begriffserklärungen
#### Entitäten: 
Ein Individuum (Mitarbeiter), reales Objekt (Büroraum), Abstraktum (Abteilung), Ereignisse (Kurzarbeit) (eindeutig identifizierbar, Entities)
#### Primärschlüssel: 
Attribut, welches jede Entität einer Entitätenmenge eindeutig identifiziert. (Primarykey, PK)
#### Sekundärschlüssel:
Attribut, das bei mehreren Entitäten denselben Wert annehmen kann. (zusammenfassen & sortieren wie Geschlecht, Surrogatekey, SK)
#### Fremdschlüssel:
Attribut in der n-Relation, welches aus der 1-Relation übernommen wurde und dort der Primärschlüssel ist. (Foreignkey, FFK)

#### Eindeutig / nicht eindeutig:
Ein Attribut ist eindeutig, wenn es keine Wiederholung aufweisen darf. Ein Wert darf innerhalb der Tabellenspalte nur einmalig vorhanden sein. (Primärschlüssel, Sozialversicherungsnummer, Unique)
Ein Attribut ist nicht eindeutig, wenn Wiederholungen vorhanden sein können. In der Tabellenspalte kann der Wert des Öfteren vorhanden sein. (Name, Einstelldatum)
#### Null / nicht Null:
Nullvalues sind undefinierte Werte. Wohingegen in nicht Null die Werte definiert sind nach Datentypen. Dies ist wichtig bei SQL Abfragen, da man mehrere Einträge haben kann aber einige davon einen Nullwert beinhalten. Je nach Abfrageformulierung werden einem allerdings nur die Einträge angezeigt die nicht null sind.








