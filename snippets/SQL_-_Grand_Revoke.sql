/*
  @author:  Markus Pesch
  @date:    23.11.2015
  @email:   peschm@fh-trier.de
*/

/* Allgemeine Syntax - Rechte vergeben */
GRANT [ALL, INSERT, SELECT, DELETE, UPDATE[(sp1,sp2,..)]..]
ON <Tabelle oder View>
TO <user1> [, <user2> ..]
[WITH GRANT OPTION];

/* Recht Benutzer einräumen und der Benutzer darf dieses Recht weiter geben (GRANT OPTION) */
GRANT ALL
ON Artikel
TO Scott
WITH GRANT OPTION;

/* Allgemeine Syntax - Rechte entziehen */
REVOKE [ALL, INSERT ... ]
ON <Tabelle oder view>
FROM <user1,...>;

/* Scott das Recht entziehen */
REVOKE ALL
ON Artikel
FROM SCOTT;





/* Beispiel 1 */
GRANT SELECT, UPDATE(MwSt)
ON KDN_Verkauf
TO Scott;

/* Löschen von Beispiel 1 */
REVOKE ALL
ON KDN_Verkauf
FROM Scott;
