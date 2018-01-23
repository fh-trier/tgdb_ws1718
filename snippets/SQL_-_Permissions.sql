/*
  @author:  Markus Pesch
  @date:    04.12.2015
  @email:   peschm@fh-trier.de
*/

-- ###########################################################
-- ################### NICHT GETESTET ########################
-- ###########################################################

-- Warum haben Sie das _____-Recht auf die Tabelle X im Schema Y?
COLUMN BESITZER FORMAT a15
COLUMN EMPFAENGER FORMAT a15
COLUMN SCHEMA FORMAT a15
COLUMN TABELLE FORMAT a15
COLUMN RECHT FORMAT a15

SELECT grantor AS "BESITZER",
       grantee AS "EMPFAENGER",
       table_schema AS "SCHEMA",
       table_name AS "TABELLE",
       privilege AS "RECHT"
FROM all_tab_privs
WHERE table_schema = 'SCOTT'
AND table_name = 'BONUS';

-- In welchen Rollen befinden Sie sich?
COLUMN "USER IST IN" FORMAT a15
COLUMN "GRUPPE" FORMAT a15

SELECT username AS "USER IST IN",
       granted_role AS "GRUPPE"
FROM user_role_privs;


-- Welche Rollen sind deinen Rollen zugewiesen?
COLUMN "ROLLE IST" FORMAT a15
COLUMN "MITGLIED VON" FORMAT a15

SELECT role AS "ROLLE IST",
       granted_role AS "MITGLIED VON"
FROM role_role_privs;

-- Warum dürfen Sie Synonyme anlegen?
-- Prüfen, ob das Recht mir direkt zugewiesen wurde.
SELECT username, privilege AS "RECHT"
FROM user_sys_privs
WHERE REGEXP_LIKE(privileges, 'synonym', 'i');

-- Prüfen, ob das Recht einer meiner direkten Rollen zugewiesen wurde.
SELECT role, privilege AS "RECHT"
FROM role_sys_privs
WHERE REGEXP_LIKE(privileges, 'synonym', 'i')
AND role IN (
  SELECT granted_role
  FROM user_role_privs
);

-- Prüfen, ob das Recht einer meiner indirekten Rollen zugewiesen wurde.
SELECT role, privilege AS "RECHT"
FROM role_sys_privs
WHERE REGEXP_LIKE(privileges, 'synonym', 'i')
AND role IN (
  SELECT granted_role
  FROM role_role_privs
);


