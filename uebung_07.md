# Tutorium - Grundlagen Datenbanken - Blatt 2

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
Passe den Codeblock so an, dass nicht nur die ID des Benutzers ausgegeben wird, sondern auch der Vor- und Nachname, als auch alle Fahrzeuge die der Benutzer sesitzt.

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
```

### Aufgabe 2
Schreibe einen anonymen PL/SQL-Codeblock, der die Tankstelle mit der kleinsten ID auflistet mit Informationen über den Anbieter und der Addresse. Implementiere ein `IF-ELSE` Konstrukt, dass wenn eine Tankstelle mehr Kundenbesuch erziehlt hat, als alle anderen im Durchschnitt, die Tankstelle als gut Besucht gekennzeichnet wird in der Ausgabe. Andernfalls wird die Tankstelle als schlecht Besucht gekennzeichnet.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 3
Analysiere den untenstehenden anonymen PL/SQL-Code. Was macht er?
Passe den Codeblock so an, dass für jede Tankstelle alle Kunden die dort einmal tanken, waren ausgegeben werden.

```sql
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Liste alle Tankstellen aus Deutschland');
  DBMS_OUTPUT.PUT_LINE('____________________________________________');
  FOR rec_gs IN (  SELECT p.provider_name, gs.street, a.plz, a.city, c.country_name
                    FROM gas_station gs
                      INNER JOIN address a ON (a.address_id = gs.address_id)
                      INNER JOIN provider p ON (gs.provider_id = p.provider_id)
                      INNER JOIN country c ON (gs.country_id = c.country_id)
                    WHERE c.country_name LIKE 'Deutschland') LOOP
    DBMS_OUTPUT.PUT_LINE('++ ' || rec_gs.provider_name || ' ++ ' || rec_gs.street || ' ++ ' || rec_gs.plz || ' ++ ' || rec_gs.city || ' ++ ' || rec_gs.country_name);
  END LOOP;
END;
/
```

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 4
Schreibe einen anonymen PL/SQL-Codeblock, der alle deine Fahrzeuge auflistet und die dazugehörigen Belege inkl. Betrag, der ausgegeben wurde für jeden Tankvorgang.

#### Lösung
```sql
Deine Lösung
```
