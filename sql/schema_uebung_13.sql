alter table BESTELLPOSITION
   drop constraint FK_BESTELLPOSITION_BESTELLUNG;

alter table BESTELLPOSITION
   drop constraint FK_BESTELLPOSITION_ARTIKEL;

alter table BESTELLPOSITION
   drop constraint FK_BESTELLPOSITION_LIEFERUNG;

alter table BESTELLUNG
   drop constraint FK_BESTELLUNG_PERSON;

alter table LIEFERUNG
   drop constraint FK_LIEFERUNG_PERSON;

alter table ARTIKEL
   drop primary key cascade;

alter table BESTELLPOSITION
   drop primary key cascade;

alter table BESTELLUNG
   drop primary key cascade;

alter table LIEFERUNG
   drop primary key cascade;

alter table PERSON
   drop primary key cascade;

drop table ARTIKEL cascade constraints;

drop table BESTELLPOSITION cascade constraints;

drop table BESTELLUNG cascade constraints;

drop table LIEFERUNG cascade constraints;

drop table PERSON cascade constraints;

/*==============================================================*/
/* Table: ARTIKEL                                               */
/*==============================================================*/
create table ARTIKEL  (
   ARTIKELNR            INTEGER                         not null,
   BEZEICHNUNG          VARCHAR2(50)                    not null,
   PREIS                NUMBER(10,2)                    not null
);

alter table ARTIKEL
   add constraint PK_ARTIKEL primary key (ARTIKELNR);


/*==============================================================*/
/* Table: BESTELLUNG                                            */
/*==============================================================*/
create table BESTELLUNG  (
   BESTELLNR            INTEGER                         not null,
   PNR                  INTEGER                         not null,
   DATUM                DATE                            not null
);

alter table BESTELLUNG
   add constraint PK_BESTELLUNG primary key (BESTELLNR);

/*==============================================================*/
/* Table: LIEFERUNG                                             */
/*==============================================================*/
create table LIEFERUNG  (
   LIEFERUNGSNR         INTEGER                         not null,
   PNR                  INTEGER,
   DATUM                DATE                            not null,
   MENGE                INTEGER                         not null
);

alter table LIEFERUNG
   add constraint PK_LIEFERUNG primary key (LIEFERUNGSNR);

/*==============================================================*/
/* Table: PERSON                                                */
/*==============================================================*/
create table PERSON  (
   PNR                  INTEGER                         not null,
   NAME                 VARCHAR2(50)                    not null,
   GEBURTSDATUM         DATE
);

alter table PERSON
   add constraint PK_PERSON primary key (PNR);

REM INSERTING into ARTIKEL
Insert into ARTIKEL (ARTIKELNR,BEZEICHNUNG,PREIS) values (123,'SAP for beginners',25);
Insert into ARTIKEL (ARTIKELNR,BEZEICHNUNG,PREIS) values (234,'JAVA for dummies',5);
Insert into ARTIKEL (ARTIKELNR,BEZEICHNUNG,PREIS) values (345,'Data Mining fuer Fortgeschrittene',41);


REM INSERTING into BESTELLUNG
Insert into BESTELLUNG (BESTELLNR,PNR,DATUM) values (1,102,to_date('27.12.2007','DD.mm.yyyy'));
Insert into BESTELLUNG (BESTELLNR,PNR,DATUM) values (2,101,to_date('23.12.2007','DD.mm.yyyy'));
Insert into BESTELLUNG (BESTELLNR,PNR,DATUM) values (3,102,to_date('22.12.2008','DD.mm.yyyy'));

REM INSERTING into PERSON
Insert into PERSON (PNR,NAME,GEBURTSDATUM) values (100,'Hugo McKinnock',to_date('08.12.1952','DD.mm.yyyy'));
Insert into PERSON (PNR,NAME,GEBURTSDATUM) values (101,'Karl-Heinz Kloesener',to_date('22.12.1957','DD.mm.yyyy'));
Insert into PERSON (PNR,NAME,GEBURTSDATUM) values (102,'Elfriede Mayer-Schlochtern',to_date('12.12.1974','DD.mm.yyyy'));

commit;


alter table BESTELLUNG
   add constraint FK_BESTELLUNG_PERSON foreign key (PNR)
      references PERSON (PNR);

alter table LIEFERUNG
   add constraint FK_LIEFERUNG_PERSON foreign key (PNR)
      references PERSON (PNR);

