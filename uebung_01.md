# Tutorium - Grundlagen Datenbanken - Blatt 1

## Aufgaben

### Aufgabe 1
Lesen Sie sich den Wikipedia-Artikel [Normalisierung](https://de.wikipedia.org/wiki/Normalisierung_(Datenbank)) von Datenbanken mit Beispielen bis zur dritten Normalform (3NF) durch. Versuchen Sie die Tabelle aus der Excel-Datei [Normalisierung](./xls/normalisierung.xlsx) anhand der Normalisierungsstufen zu splitten um Annomalien zu vermeiden.

### Lösung Aufgabe 1
## Normalisierung

####1 NF:
Eine Relation ist in der 1 NF, wenn alle Attributwerte atomar (elementar, nicht weiter differenzierbar) sind. Jede weitere NF setzt vorangegangene NF´s voraus. => Sortierbar & Filterbar
####2 NF:
Zuordnungstabellen: Eine Relation ist in der 2 NF, wenn alle Nichtschlüsselattributwerte (NSA) vom gesamten Primärschlüssel abhängig sind.
####3 NF:
Eine Relation ist in der 3 NF, wenn alle NSA voneinander unabhängig sind. (Geburtsdatum & Alter ist ein Verstoß)
####=> 
1NF: Alle Attributwerte müssen atomar sein 
2NF: Alle NSA hängen vom gesamten Primärschlüssel ab
3NF: Alle NSA sind voneinander unabhängig.


### Aufgabe 2
Erstellen Sie mittels [Dia](http://dia-installer.de/index.html.de)  order mit Oracle's [Data Modeler](http://www.oracle.com/technetwork/developer-tools/datamodeler/overview/index.html) ein Datenbankmodell das die Attribute (Felder) ihrer in Aufgabe 1 erstellten Tabellen abbildet. Berücksichtigen Sie, dass Attribute unterschiedliche [Datentypen](http://www.datenbank-sql.de/oracle-datentypen.htm) oder Restriktionen  (`NOT NULL`, `NULL`, `UNIQUE`, `PRIMARYKEY`, `FOREIGNKEY`) besitzen können.




