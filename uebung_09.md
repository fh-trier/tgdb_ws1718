# Tutorium - Grundlagen Datenbanken - Blatt 9

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

### Aufgabe 1
Wo liegen die Vor- und Nachteile eines Trigger in Vergleich zu einer Prozedur?

#### Lösung
Deine Lösung

### Aufgabe 2
Wo drin unterscheidet sich der `Row Level Trigger` von einem `Statement Trigger`?

#### Lösung
Deine Lösung

### Aufgabe 3
Schaue dir den folgenden PL/SQL-Code an. Was macht er?

```sql
CREATE SEQUENCE seq_account_id
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999999
CYCLE
CACHE 20;

CREATE OR REPLACE TRIGGER BIU_ACCOUNT
BEFORE INSERT OR UPDATE OF account_id ON account
FOR EACH ROW
DECLARE

BEGIN
  IF UPDATING('account_id') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Die Account-ID darf nicht verändert oder frei gewählt werden!');
  END IF;

  IF INSERTING THEN
    :NEW.account_id := seq_account_id.NEXTVAL;
  END IF;
END;
/
```

#### Lösung
Deine Lösung

### Aufgabe 4
Verbessere den Trigger aus Aufgabe 2 so, dass
+ wenn versucht wird einen Datensätz mit `NULL` Werten zu füllen, die alten Wert für alle Spalten die als `NOT NULL` gekennzeichnet sind behalten bleiben.
+ es nicht möglich ist, das `C_DATE` und `U_DATE` in der Zukunkt liegen
+ `U_DATE` >= `C_DATE` sein muss
+ der erste Buchstabe des Vor- und Nachnamens klein geschrieben ist
+ die Account-ID aus einer `SEQUENCE` entnommen wird

Nutze die Lösung der Aufgabe 2, Aufgabenblatt 8 um die Aufgabe zu lösen. Dort solltest du einige Hilfestellungen finden.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 5
Angenommen der Steuersatz in Deutschland sinkt von 19% auf 17%.
+ Aktualisiere den Steuersatz von Deutschland und
+ alle Quittungen die nach dem `01.10.2017` gespeichert wurden.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 6
Liste alle Hersteller auf, die LKW's produzieren und verknüpfe diese ggfl. mit den Eigentümern.

#### Lösung
```sql
Deine Lösung
```


























