# Tutorium - Grundlagen Datenbanken - Blatt 8

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

### Aufgabe 1
Erstelle eine Prozedur, die das anlegen von Benutzern durch übergabe von Parametern ermöglicht.

#### Lösung
```sql
CREATE OR REPLACE PROCEDURE I_ACCOUNT(in_surname IN VARCHAR2, in_forename IN VARCHAR2, in_email IN VARCHAR2)
AS

BEGIN
  INSERT INTO account
  VALUES (
    (SELECT MAX(account_id) + 1 FROM account),
    in_surname,
    in_forename,
    in_email,
    SYSDATE,
    SYSDATE
  );
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Folgender unerwarteter Fehler ist aufgetreten: ');
    RAISE;
END;
/
```

Ausführen der Prozedur
```sql
exec I_ACCOUNT('Markus', 'Pesch', 'test@web.de');
```

### Aufgabe 2
Erstelle eine Prozedur, die das erstellen von Quittungen ermöglicht. Fange entsprechende übergebene Parameter auf `NULL` ab. Ergänze eventuell Parameter die `NULL` sind mit Informationen die sich durch Abfragen erklären lassen. Berücksichtige die Fehlerbehandlung!

#### Lösung
```sql
-- Prozedure: I_RECEIPT
-- Mit dieser Prozedur können neue Quittungen (receipts) in die Tabelle RECEIPT gespeichert werden.
-- Dazu sind mehrere Parameter notwendig.

CREATE OR REPLACE PROCEDURE I_RECEIPT(
    in_email IN VARCHAR2,           -- Übergabeparameter EMail, kann NULL und nicht valide sein
    in_accv_id IN NUMBER,           -- Übergabeparameter Acc_Vehic_ID, kann NULL und nicht valide sein
    in_duty_amount IN NUMBER,       -- Übergabeparameter Duty_Amount, kann NULL und nicht valide sein
    in_gas_id IN NUMBER,            -- Übergabeparameter Gas_ID, kann NULL und nicht valide sein
    in_gas_station_id IN NUMBER,    -- Übergabeparameter Gas_Station_ID, kann NULL und nicht valide sein
    in_price_l IN NUMBER,           -- Übergabeparameter Price_L, kann NULL und nicht valide sein
    in_kilometer IN NUMBER,         -- Übergabeparameter Kilometer, kann NULL und nicht valide sein
    in_liter IN NUMBER,             -- Übergabeparameter Liter, kann NULL und nicht valide sein
    in_receipt_date IN DATE)        -- Übergabeparameter Receipt_Date, kann NULL und nicht valide sein
AS
    -- Übergabeparameter die Valide sind und zwischengespeichert werden
    v_account_id account.account_id%TYPE;             -- Account-ID, ist valide, lässt sich durch abfragen der E-Mail ermitteln.
    v_accv_id acc_vehic.acc_vehic_id%TYPE;            -- Acc_Vehic_ID, ist valide
    v_gas_id gas.gas_id%TYPE;                         -- Gas_ID ist valide
    v_gas_station_id gas_station.gas_station_id%TYPE; -- Gas_Station_ID ist valide
    v_duty_amount country.duty_amount%TYPE;           -- Duty_Amount ist valide
    v_receipt_date receipt.receipt_date%TYPE;         -- Receipt_Date ist valide
BEGIN
    -- Überprüfung Benutzer
    -- Prüfen ob die übergebene E-Mail Adresse als Übergabeparameter gültig ist.
    -- Prüfung erfolgt durch einen Regulären Ausdruck
    IF ( TRUE <> REGEXP_LIKE (in_email, '[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,7}')) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Die E-Mail entspricht nicht den Konditionen.');

    -- Übersteht die E-Mail Adresse den Regulären Ausdruck,
    -- wird im System nach der dazugehörigen Account-ID gesucht.
    -- Findet das System den Benutzer mit der E-Mail Adresse, wird die Account-ID zurückgegeben
    -- und in der Variable v_account_id gespeichert. Siehe die deklarationen von Variablen in Block "AS".
    -- Dieser Schritt ist Möglich, da die E-Mail Adresse nur einmal im System verwendet werden kann.
    -- Dies haben wir sichergestellt durch den UNIQUE-Constraint.
    ELSE
        BEGIN
            SELECT account_id INTO v_account_id
            FROM account
            WHERE email = in_email;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001, 'Es konnte kein Benutzer mit der E-Mail Adresse ' || in_email || ' gefunden werden!');
        END;
    END IF;

    -- Überprüfung Fahrzeug
    -- Hier wird ähnlich wie bei Account-ID überprüft,
    -- ob es den Fahrzeughalter mit dem übergabeparameter Acc_Vehic_ID im System gibt.
    -- Ist ein Datensatz mit gültigem Übergabeparameter vorhanden, wird dieser in der Variable
    -- v_acc_id gespeichert.
    BEGIN
        SELECT acc_vehic_id INTO v_accv_id
        FROM acc_vehic
        WHERE acc_vehic_id = in_accv_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Es konnte kein Fahrzeug mit der ACC_VEHIC_ID ' || in_accv_id || ' gefunden werden!');
    END;

    -- Tankstellen ID
    -- Gleiches Prinzip wie bei Account_ID und Acc_Vehic_ID
    BEGIN
        SELECT gas_station_id INTO v_gas_station_id
        FROM gas_station
        WHERE gas_station_id = in_gas_station_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Es konnte keine Tankstelle mit der GAS_STATION_ID ' || in_gas_station_id || ' gefunden werden!');
    END;

    -- Price/l
    -- Prüfen ob der Preis pro Liter NULL ist
    IF (in_price_l IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Der Parameter in_price_l ist ungültig.');

    -- Prüfen, ob der Preis pro Liter kleiner 0 ist.
    ELSE IF (in_price_l < 0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Der Parameter in_price_l ist kleiner 0.');
    END IF;

    -- Liter
    -- Prüfen, ob die getankte Liter anzahl NULL ist
    IF (in_liter IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Der Parameter in_liter ist ungültig.');

    -- Prüfen, ob die getankte Liter kleiner 0 ist.
    ELSE IF (in_price_l < 0) THEN
       RAISE_APPLICATION_ERROR(-20001, 'Es kann keine negative Anzahl an getanken Liter gespeichert werden.');
    END IF;

    -- Kilometer
    -- Prüfen, ob die Kilometeranzahl NULL ist
    IF (in_kilometer IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Der Parameter in_kilometer ist ungültig.');

    -- Prüfen, ob die Kilometeranzahl kleiner 0 ist.
    ELSE IF (in_kilometer < 0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Die Kilometeranzahl kann nicht kleiner 0 sein');
    END IF;

    -- Receipt date
    IF (in_receipt_date IS NULL) THEN
        v_receipt_date := SYSDATE;
    ELSE
        v_receipt_date := in_receipt_date;
    END IF;

    -- Gas
    -- Ist der Übergabeparameter NULL, wird versucht die Gas_ID über die Tabelle Vehicle zu ermitteln.
    IF (in_gas_id IS NULL OR in_gas_id = '') THEN
        BEGIN
            SELECT v.default_gas_id INTO v_gas_id
            FROM vehicle v
                INNER JOIN acc_vehic accv ON (accv.vehicle_id = v.vehicle_id)
            WHERE accv.acc_vehic_id = v_accv_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001, 'Es konnte für das Fahrzeug kein Kraftstoff aus Bestandsdaten ermittelt werden!');
        END;
    ELSE
        v_gas_id := in_gas_id;
    END IF;

    -- Duty
    -- Ist der Übergabeparameter NULL, wird versucht den Steuersatz (Duty_Amount) über den Tabelle Country zu ermitteln.
    IF (in_duty_amount IS NULL OR in_duty_amount = '') THEN
        BEGIN
            SELECT c.duty_amount  INTO v_duty_amount
            FROM gas_station gs
                INNER JOIN country c ON (c.country_id = gs.country_id)
            WHERE gs.gas_station_id = v_gas_station_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001, 'Es konnte kein Steuersatz für das Land indem die Tankstelle steht ermittelt werden!');
        END;
    ELSE
        v_duty_amount := in_duty_amount;
    END IF;

    -- Speichern des Datensatzes mit validen Informationen
    BEGIN
        INSERT INTO RECEIPT
        VALUES(
            (SELECT MAX(receipt_id) + 1 FROM receipt),
            v_account_id,
            v_accv_id,
            v_duty_amount,
            v_gas_id,
            v_gas_station_id,
            in_price_l,
            in_kilometer,
            in_liter,
            v_receipt_date,
            SYSDATE,
            SYSDATE
        );
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Es konnte kein Datensatz eingefügt werden! - UNBEKANNTER GRUND');
    END;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Folgender unerwarteter Fehler ist aufgetreten: ');
    RAISE;
END;
/
```

Ausführen der Prozedur
```sql
EXEC I_RECEIPT('peschm@fh-trier.de', 1, NULL, NULL, '1', '1,12', '478', '44,78', NULL);
```


