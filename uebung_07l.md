# Tutorium - Grundlagen Datenbanken - Blatt 7

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

### Aufgabe 1

Analyse den untenstehenden anonymen PL/SQL-Codeblock. Was macht er?
Passe den Codeblock so an, dass nicht nur die ID des Benutzers ausgegeben wird, sondern auch der Vor- und Nachname, als auch die Anzahl seiner Fahrzeuge.

```sql
DECLARE
  v_account_id account.account_id%TYPE;

BEGIN
  SELECT MAX(a.account_id) INTO v_account_id
  FROM account a
  WHERE a.surname LIKE 'P%';

  DBMS_OUTPUT.PUT_LINE('Der neuste Benutzer mit dem Anfangsbuchstaben P im Nachnamen hat die ID ' || v_account_id);

EXCEPTION
  WHEN NO_DATA_FOUND
    THEN RAISE_APPLICATION_ERROR(-20001, 'Es wurde kein Benutzer gefunden');
  WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE ('Folgender unerwarteter Fehler ist aufgetreten: ');
  RAISE;
END;
/
```

#### Lösung
```sql
Deine Lösung
`DECLARE: deklariert eine variable
mit %type ändert der Typ der Spalte
BEGIN: startet der Verlauf/ausführungsteil
hier kommt das select wo die maximale ID
hier wird das ergebnis in das andere reingeschrieben
und es wird nachgeschaut ob der nachname mit P beginnt

DBMS_OUTPUT.PUT_LINE ist für die Ausgabe da alles was '' steht und(||) die ID

EXCEPTION: Ist die fehlermeldung oder die Ausnahmeverarbeitung

WHEN für die Exceptionbehandlung
NO_DATA_FOUND nicht gefundene Datenmenge
THEN Dann
RAISE_APPLICATION_ERROR wirf die fehlermeldung aus ORA-01403:""
OTHERS für alle restlichen Exceptionbehandlungen
RAISE wird eine Exception weitergeleitet
END beendet die programmierung von DBMS

DECLARE
  v_account_id account.account_id%TYPE;
  
BEGIN
  SELECT MAX(a.account_id) INTO v_account_id,account_surname,account_forename, v.vehicle_TYPE_ID
  FROM account a
  INNER JOIN acc_vehic av ON av.account_ID=a.account_ID
  INNER JOIN vehicle v ON v.vehicle_ID=av.vehicle_ID
  WHERE a.surname LIKE 'P%';

  DBMS_OUTPUT.PUT_LINE('Der neuste Benutzer mit dem Anfangsbuchstaben P im Nachnamen hat die ID ' || v_account_id);

EXCEPTION
  WHEN NO_DATA_FOUND
    THEN RAISE_APPLICATION_ERROR(-20001, 'Es wurde kein Benutzer gefunden');
  WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE ('Folgender unerwarteter Fehler ist aufgetreten: ');
  RAISE;
END;
/
``

### Aufgabe 2
Schreibe einen anonymen PL/SQL-Codeblock, der die Tankstelle mit der kleinsten ID auflistet mit Informationen über den Anbieter und der Addresse. Implementiere ein `IF-ELSE` Konstrukt, dass wenn eine Tankstelle mehr Kundenbesuch erziehlt hat, als alle anderen im Durchschnitt, die Tankstelle als gut Besucht gekennzeichnet wird in der Ausgabe. Andernfalls wird die Tankstelle als schlecht Besucht gekennzeichnet.

#### Lösung
```sql
Deine Lösung
`DECLARE
  v_gas_station_ID 
BEGIN
  SELECT g.gas_station_id,p.provider_name,a.city
  FROM gas_station g
  INNER JOIN provider p ON g.provider_ID=p.provider_ID
  INNER JOIN address a ON g.address_ID=a.address_ID
  WHERE g.gas_station_ID='1';
IF kundenbesuch > AVG(kundenbesuch) THEN
 DBMS_OUTPUT.PUT_LINE('GUT BESUCHT');
ELSE
DBMS_OUTPUT.PUT_LINE('SCHLECHT BESUCHT');

EXCEPTION
  WHEN NO_DATA_FOUND
    THEN RAISE_APPLICATION_ERROR(-20001, 'Es wurde kein Benutzer gefunden');
  WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE ('Folgender unerwarteter Fehler ist aufgetreten: ');
  RAISE;
END;
/``

### Aufgabe 3
Analysiere den untenstehenden anonymen PL/SQL-Code. Was macht er?
Passe den Codeblock so an, dass für jede Tankstelle alle Kunden die dort einmal tanken, waren ausgegeben werden.

```sql
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Liste alle Tankstellen aus Deutschland');
  DBMS_OUTPUT.PUT_LINE('____________________________________________');
  FOR rec_gs IN (  SELECT p.provider_name, gs.street, a.plz, a.city, c.country_name, av.account_ID
                    FROM gas_station gs
                      INNER JOIN address a ON (a.address_id = gs.address_id)
                      INNER JOIN provider p ON (gs.provider_id = p.provider_id)
                      INNER JOIN country c ON (gs.country_id = c.country_id)
		      INNER JOIN acc_vehic av ON(gs.gas_station_id=av.default_gas_station)
                    WHERE c.country_name LIKE 'Deutschland'AND av.default_gas_station='1') LOOP
    DBMS_OUTPUT.PUT_LINE('++ ' || rec_gs.provider_name || ' ++ ' || rec_gs.street || ' ++ ' || rec_gs.plz || ' ++ ' || rec_gs.city || ' ++ ' || rec_gs.country_name);
  END LOOP;
END;
/
```

#### Lösung
```sql
Deine Lösung
`Es wird keine neue variable deklariert
`DBMS_OUTPUT.PUT_LINE('Liste alle Tankstellen aus Deutschland'); eine ausgabe wird erzeugt
FOR rec_gs IN alle Cursor werden durchgegangen in indem Bereich
Das ++ dient als zwischen spalte und END LOOP endet es
LOOP definiert den Bereich der ausgegeben werden soll`

### Aufgabe 4
Schreibe einen anonymen PL/SQL-Codeblock, der alle deine Fahrzeuge auflistet und die dazugehörigen Belege inkl. Betrag, der ausgegeben wurde für jeden Tankvorgang.

#### Lösung
```sql
Deine Lösung
```
