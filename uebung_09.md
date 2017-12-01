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
Schaue dir den folgenden PL/SQL-Code an. Was macht er?

```sql
CREATE SEQUENCE seq_account_id
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999999
CYCLE
CACHE 20;

CREATE OR REPLACE TRIGGER IB_ACCOUNT
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

### Aufgabe 3
Verbessere den Trigger aus Aufgabe 2 so, dass
+ wenn versucht wird einen Datensätz mit `NULL` Werten zu füllen, die alten Wert für alle Spalten die als `NOT NULL` gekennzeichnet sind behalten bleiben.
+ das Passwort in MD5 gehasht wird. Beispielcode `select standard_hash('foo', 'MD5') from dual;`- [Referenz](https://stackoverflow.com/questions/22533037/how-to-call-oracle-md5-hash-function)
+ es nicht möglich ist, das `C_DATE` und `U_DATE` in der Zukunkt liegen
+ U_DATE >= C_DATE sein muss
+ der erste Buchstabe des Vor- und Nachnamens klein geschrieben ist
+ die Account-ID aus einer `SEQUENCE` entnommen wird

Nutze die Lösung der Aufgabe 2, Aufgabenblatt 8 um die Aufgabe zu lösen. Dort solltest du einige Hilfestellungen finden.

#### Lösung
```sql
Deine Lösung
```


























