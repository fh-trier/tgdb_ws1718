# Tutorium - Grundlagen Datenbanken - Blatt 2

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
Schaue dir das Datenbankmodell an. Wofür steht hinter dem Datentyp `NUMBER` die Zahlen in den runden Klammern?
Nehme dir die Oracle [Dokumentation](https://docs.oracle.com/cd/B28359_01/server.111/b28318/datatype.htm#CNCPT012) zu Hilfe.

#### Lösung
Der Datentyp `NUMBER` repräsentiert eine (Gleitkomma-)Zahl. In Klammern kann optional die Anzahl der Stellen vor und hinter dem Dezimalkomma angegeben werden.
Beispiele:
- `NUMBER` &rarr; eine Zahl mit bis zu 38 Stellen im Bereich von -10<sup>125</sup> bis +10<sup>125</sup>
- `NUMBER(5)` &rarr; eine Zahl mit bis zu fünf Stellen vor dem Komma und ohne Nachkommastellen, z.B. `27538`
- `NUMBER(3,5)` &rarr; eine Zahl mit bis zu drei Stellen vor dem Komma und fünf Nachkommastellen, z.B. `123,92553`

### Aufgabe 2
Was bedeuten die durchgezogenen Linien, die zwischen einigen Tabellen abgebildet sind?

#### Lösung
Die durchgezogenen Linien stehen für die Verbindungen zwischen Primär- und Fremdschlüsseln, wobei die Fremdschlüssel mit der Bedingung `NOT NULL` angelegt wurden. Die Verbindungen von den Fremdschlüsseln zu den Primärschlüsseln sind daher immer vorhanden.

### Aufgabe 3
Was bedeutet die gestrichelte Linie, die zwischen der Tabelle `ACC_VEHIC` und `GAS_STATION` abgebildet ist?

#### Lösung
Die Spalte `DEFAULT_GAS_STATION` hat nicht die Einschränkung `NOT NULL`. Dadurch kann die Spalte auch ungefüllt (`NULL`) sein. Die Verbindung von `ADD_VEHIC` zu `GAS_STATION` ist daher optional.

### Aufgabe 3
Die folgende Abbildung beschreibt eine Beziehung zwischen Tabellen. Sie wird auch `n` zu `m` Beziehung genannt. Beschreibe kurz die Bedeutung dieser Beziehung.
Nehme dir diesen [Artikel](https://glossar.hs-augsburg.de/Beziehungstypen) zu Hilfe.

![n-to-m-relationship](./img/n-to-m-relationship.png)

In dem gezeigten Beispiel gibt es Personen. Jede der Personen kann unterschiedlich viele Hobbys haben. Es handelt sich um eine `n:m` Beziehung, d.h. beliebig viele Personen `n` können beliebig viele Hobbys `m` haben. Eine eindeutige Zuordnung von Person und Hobby ist hier nicht mehr gegeben, weil ein Hobby mehreren Personen zugeordnet und eine Person mehreren Hobbys zugeordnet sein kann. In relationalen Datenbanken wird das Problem über Zwischentabellen gelöst. In diesem Fall ist `PERSON_HOBBY` die Zwischentabelle. Die beiden Fremdschlüssel `PERSON_ID` und `HOBBY_ID` sind über `1:n` Beziehungen jeweils zu den Primärschlüsseln verknüpft, wodurch eine eindeutige Zuordnung wieder möglich ist.

### Aufgabe 4
Was bedeutet der Buchstabe `P` und `F` neben den Attributen von Tabellen?

#### Lösung
- `P` &rarr; Primary Key, d.h. Primärschlüssel
- `F` &rarr; Foreign Key, d.h. Fremdschlüssel

### Aufgabe 5
Importiere die SQL-Dump-Datei in dein eigenes Schema. Wie lautet dazu der Befehl um dem import zu starten?

#### Lösung
```sql
start tutorium.sql;
```

### Aufgabe 6
Gebe alle Datensätze der Tabelle `ACCOUNT` aus.

#### Lösung
```sql
SELECT * FROM ACCOUNT;
```

### Aufgabe 7
Modifiziere Aufgabe 6 so, dass nur die Spalte `ACCOUNT_ID` ausgegeben wird.

#### Lösung
```sql
SELECT ACCOUNT_ID FROM ACCOUNT;
```

### Aufgabe 8
Gebe alle Spalten der Tabelle `VEHICLE` aus.

#### Lösung
```sql
SELECT * FROM VEHICLE;
```

### Aufgabe 9
Kombiniere Aufgabe 7 und 8 so, dass nur Personen (`ACCOUNT`) angezeigt werden, die ein Auto (`VEHICLE`) besitzen.

#### Lösung
```sql
SELECT DISTINCT a.*
  FROM ACCOUNT a, ACC_VEHIC av
  WHERE a.ACCOUNT_ID = av.ACCOUNT_ID;
```

### Aufgabe 10
Modifizierde die Aufgabe 9 so, dass nur die Person mit der `ACCOUNT_ID` = `7` angezeigt wird.

#### Lösung
```sql
SELECT DISTINCT a.*
  FROM ACCOUNT a, ACC_VEHIC av
  WHERE a.ACCOUNT_ID = av.ACCOUNT_ID;
    AND a.ACCOUNT_ID = 7;
```

### Aufgabe 11
Erstelle für dich einen neuen Benutzer.
> Achtung, nutze für die Spalten `C_DATE` und `U_DATE` vorerst die Syntax `SYSDATE` - [Dokumentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions172.htm)

#### Lösung
```sql
INSERT INTO ACCOUNT
  VALUES (
    (SELECT MAX(ACCOUNT_ID)+1 FROM ACCOUNT),
    'Nico',
    'Schmitz',
    'schmin@hochschule-trier.de',
    SYSDATE,
    SYSDATE
  );
```

### Aufgabe 12
Erstelle für deinen neuen Benutzer ein neues Auto. Dieses Auto dient als Vorlage für die nächten Aufgaben.

#### Lösung
```sql
INSERT INTO VEHICLE
  VALUES (
    (SELECT MAX(VEHICLE_ID)+1 FROM VEHICLE),
    5, -- Quad
    2, -- BMW
    'GG',
    NULL,
    150,
    '25-AUG-15',
    0,
    SYSDATE,
    SYSDATE
  );
```

### Aufgabe 13
Verknüpfe das aus Aufgabe 12 erstellte neue Auto mit deinem neuen Benutzer aus Aufgabe 11 in der Tabelle `ACC_VEHIC` und erstelle den ersten Rechnungsbeleg.

#### Lösung
```sql
INSERT INTO ACC_VEHIC
  VALUES (
    (SELECT MAX(ACC_VEHIC_ID)+1 FROM ACC_VEHIC),
    10,
    14,
    'GT:A:666',
    NULL,
    10532,
    105,
    7452,
    200,
    '10-SEP-15',
    '5-OCT-16',
    NULL,
    SYSDATE,
    SYSDATE
  );

SELECT * FROM acc_vehic WHERE ACC_VEHIC_ID = 7;
```

### Aufgabe 14
Ändere den Vorname `SURNAME` des Datensatzes mit der ID `7` in der Tabelle `ACCOUNT` auf `Zimmermann`.

#### Lösung
```sql
UPDATE ACCOUNT SET SURNAME = 'Zimmermann' WHERE ACCOUNT_ID = 7;
```

### Aufgabe 15
Speichere alle Änderungen deiner offenen Transaktion. Wie lautet der SQL-Befehl dazu?

#### Lösung
```sql
COMMIT;
```
