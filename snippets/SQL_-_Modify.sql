/*
  @author:  Markus Pesch
  @date:    23.11.2015
  @email:   peschm@fh-trier.de
*/


/* Allgemeine Syntax */
alter table <TABELLE>
modify(
   column1_name  column1_datatype [OPTION],
   column2_name  column2_datatype [OPTION],
   column3_name  column3_datatype [OPTION],
   column4_name  column4_datatype [OPTION]
);

/* Beispiel */
ALTER TABLE customer
MODIFY  (
  cust_name VARCHAR2(100) NOT NULL,
  cust_hair_color VARCHAR2(20)
);
