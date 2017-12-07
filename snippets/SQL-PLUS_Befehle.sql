/*
  @author:  Markus Pesch
  @date:    29.11.2015
  @email:   peschm@fh-trier.de
*/

set null (NULL)                       -- Kennzeichnet Null-Werte als (NULL) und nicht als blank
cl scr                                -- Gibt eine leere Anzeige aus
desc emp                              -- Gibt die Spalten einer Tablle (emp) aus
set numwidth 7                        -- Setzt die
set pagesize 100                      -- Setzt die Zeileneinträge auf 100 bevor der Spaltenname wieder eingeblendet wird
COLUMN <spaltenname> FORMAT a<Länge>  -- Setzt in SQL die Ausgabe der Spalte <Spaltenname> aus eine <Länge> fest
save k:\peschm\auf1                   -- Speichert die Letzte SQL-Ausgabe unter k:\pesch\auf1
define _editor=notepad                -- Definiert in SQL-PLUS den Editor
edit                                  -- Zum Bearbeiten des letzten SQL Statements im Editor
SELECT * FROM tab;                    -- Gibt alle Tablennamen mit SPalten aus
set serveroutput                      -- Ermöglicht die Ausgabe von Servermeldungen in SQL-PLUS
show errors;                          -- Gibt einen detailierten Bericht über die letzte Fehlermeldung aus
set escape '\'                        -- Setzt ein Escape Zeichen fest

