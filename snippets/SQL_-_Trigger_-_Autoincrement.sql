/*
	@author:	Markus Pesch
	@date:		29.11.2015
	@email:		peschm@fh-trier.de	
*/

/* Sequenz erstellen */
CREATE SEQUENCE matrikelnummer
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999999
CYCLE
CACHE 20;


/* Trigger erstellen mit AutoIncrement */
CREATE OR REPLACE TRIGGER Matrikelnr_I
BEFORE INSERT OR UPDATE OF matrikelnr ON Studentische_Person
FOR EACH ROW	
DECLARE

BEGIN
	IF UPDATING('titelnr') THEN
		RAISE_APPLICATION_ERROR(-20001, 'Matrikelnummer darf nicht verändert werden!');
	END IF;
	
	IF INSERTING THEN
		:NEW.Matrikelnr := matrikelnummer.NEXTVAL;
	END IF;
END;
/

/* PROCEDURE */
set serveroutput on;
CREATE OR REPLACE FUNCTION get_klausurnote(klausurnr_in IN NUMBER)
RETURN NUMBER
AS
v_note NUMBER(3,1);
BEGIN
	SELECT 	Note INTO v_note
	FROM	Anmeldung
	WHERE	Klausurnr = klausurnr_in;

	IF v_note IS NULL THEN
		RETURN NULL
	ELSE
		RETURN v_note;
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		raise_application_error(-20001,'Klausur nicht vorhanden!');
	WHEN OTHERS THEN
		raise_application_error(-20001,sqlerrm);
END;
/
