/*
  @author:  Markus Pesch
  @date:    02.12.2015
  @email:   peschm@fh-trier.de
*/

/* Allgemeine Syntax */
CREATE OR REPLACE VIEW <VIEW_NAME> AS
  <SQL_STATEMENT>

  CREATE OR REPLACE VIEW ARTIKEL AS
  SELECT *
  FROM DWH.Artikel

/* Beispiel */
CREATE OR REPLACE VIEW empdept AS
  SELECT e.empno, e.ename, d.dname, d.loc
  FROM emp e
  INNER JOIN dept d ON (e.deptno = d.deptno)
  WHERE d.deptno in (10,20);


