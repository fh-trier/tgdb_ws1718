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
Hinter NUMBER schreibt man in runden Klammern die Genauigkeit P sowie optional ein Komma und die Anzahl an Nachkommastellen S.

### Aufgabe 2
Was bedeuten die durchgezogenen Linien, die zwischen einigen Tabellen abgebildet sind?

#### Lösung
Die durchgezeogenen Linen haben die bedeutung das sie ein starke Beziehung(wenn due abhägigkeit extenziell abhängig ist) haben.

### Aufgabe 3
Was bedeutet die gestrichelte Linie, die zwischen der Tabelle `ACC_VEHIC` und `GAS_STATION` abgebildet ist?

#### Lösung
Bei einer gestrichelten Linie spricht man von einer schwachen Beziehung beispielsweise wenn der Primärschlüssel der bezogenen Entität nicht Teil des Primärschlüssels der abhängigen Entität ist.

### Aufgabe 4
Die folgende Abbildung beschreibt eine Beziehung zwischen Tabellen. Sie wird auch `n` zu `m` Beziehung genannt. Beschreibe kurz die Bedeutung dieser Beziehung.
Nehme dir diesen [Artikel](https://glossar.hs-augsburg.de/Beziehungstypen) zu Hilfe.

![n-to-m-relationship](./img/n-to-m-relationship.png)

m:n Beziehung in relationalen Datenbanken
Bei „viele zu viele“-Beziehung in relationalen Datenbanken können jedem Datensatz in Tabelle A mehrere passende Datensätze in Tabelle B zugeordnet sein und umgekehrt. 

### Aufgabe 5
Was bedeutet der Buchstabe `P` und `F` neben den Attributen von Tabellen?

#### Lösung
Primary key(Primärschlüssel) eindeutiger Identifikator
foreign key(Fremdschlüssel) Schlüssel aus einer anderen Tabelle, um eine Beziehung herstellen zu können.

### Aufgabe 6
Importiere die SQL-Dump-Datei in dein eigenes Schema. Wie lautet dazu der Befehl um dem import zu starten?

#### Lösung
```sql
Deine Lösung
`start C:\<user>\..\01_tutorium.sqlselec``

### Aufgabe 7
Gebe alle Datensätze der Tabelle `ACCOUNT` aus.

#### Lösung
```sql
Deine Lösung
`select *`from account;`

### Aufgabe 8
Modifiziere Aufgabe 7 so, dass nur die Spalte `ACCOUNT_ID` ausgegeben wird.

#### Lösung
```sql
Deine Lösung
select account_id from account;

### Aufgabe 9
Gebe alle Spalten der Tabelle `VEHICLE` aus.

#### Lösung
```sql
Deine Lösung
select * from vehicle;

### Aufgabe 10
Kombiniere Aufgabe 7 und 9 so, dass nur Personen (`ACCOUNT`) angezeigt werden, die ein Auto (`VEHICLE`) besitzen.

#### Lösung
```sql
Deine Lösung
select *
   from vehicle v
   Inner JOIN acc_vehic av
   ON v.vehicle_id=av.vehicle_id;

### Aufgabe 11
Modifizierde die Aufgabe 10 so, dass nur die Person mit der `ACCOUNT_ID` = `7` angezeigt wird.

#### Lösung
```sql
Deine Lösung
select *
    from vehicle v
    Inner JOIN acc_vehic av
    ON v.vehicle_id=av.vehicle_id
    Where av.ACCOUNT_ID=7;

### Aufgabe 12
Erstelle für dich einen neuen Benutzer.
> Achtung, nutze für die Spalten `C_DATE` und `U_DATE` vorerst die Syntax `SYSDATE` - [Dokumentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions172.htm)

#### Lösung
```sql
Deine Lösung
 Insert into account(account_id,surname,forename,email,C_DATE,U_Date)
   Values('10','su','mar','lol@hotmail.com',Sysdate,Sysdate);

### Aufgabe 13
Erstelle für deinen neuen Benutzer ein neues Auto. Dieses Auto dient als Vorlage für die nächten Aufgaben.

#### Lösung
```sql
Deine Lösung
Insert Into acc_vehic(acc_vehic_ID,account_ID,Vehicle_ID,C_DATE,U_DATE)
   Values ('22',10,'7',Sysdate,Sysdate);

### Aufgabe 14
Verknüpfe das aus Aufgabe 13 erstellte neue Auto mit deinem neuen Benutzer aus Aufgabe 12 in der Tabelle `ACC_VEHIC` und erstelle den ersten Rechnungsbeleg.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 15
Ändere den Vorname `SURNAME` des Datensatzes mit der ID `7` in der Tabelle `ACCOUNT` auf `Zimmermann`.

#### Lösung
```sql
Deine Lösung
Update account
    Set surname='Zimmermann'
    Where account_ID=7;

### Aufgabe 16
Speichere alle Änderungen deiner offenen Transaktion. Wie lautet der SQL-Befehl dazu?

#### Lösung
```sql
Deine Lösung
commit;
