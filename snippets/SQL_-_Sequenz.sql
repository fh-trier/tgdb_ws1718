/*
  @author:  Markus Pesch
  @date:    29.11.2015
  @email:   peschm@fh-trier.de
*/

/* Sequenz erstellen */
CREATE SEQUENCE matrikelnummer
START WITH 400000
INCREMENT BY 1
MAXVALUE 99999999
CYCLE
CACHE 20;
