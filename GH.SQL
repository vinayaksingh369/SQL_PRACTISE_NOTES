
SQL*Plus: Release 10.2.0.1.0 - Production on Thu May 15 16:49:07 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> set lines 100 pages 100;
SQL> desc sud;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- --------------------------
 ID                                                    NOT NULL NUMBER
 STNAME                                                         VARCHAR2(10)
 ROLLNO                                                         VARCHAR2(5)
 MOBNO                                                          VARCHAR2(10)
 MOTHERNAME                                                     VARCHAR2(20)

SQL> select*
  2  from sud;

no rows selected

SQL> select*
  2  from tab
  3  ;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
DEPT                           TABLE
EMP                            TABLE
BONUS                          TABLE
SALGRADE                       TABLE
SUD                            TABLE

SQL> INSERT INTO SUD VALUES (101,'RATORE',79,4645656669,DIKSIT);
INSERT INTO SUD VALUES (101,'RATORE',79,4645656669,DIKSIT)
                                                   *
ERROR at line 1:
ORA-00984: column not allowed here


SQL> ED
Wrote file afiedt.buf

  1* INSERT INTO SUD VALUES (101,'RATORE',79,4645656669,'DIKSIT')
SQL> /

1 row created.

SQL> SELECT*
  2  FROM SUD
  3  ;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       101 RATORE     79    4645656669 DIKSIT

SQL> ED
Wrote file afiedt.buf

  1  SELECT*
  2* FROM SUD
  3  /

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       101 RATORE     79    4645656669 DIKSIT

SQL> INSERT INTO SUD VALUES (101,'RATORE',79,4645656669,'DIKSIT');

1 row created.

SQL> ED
Wrote file afiedt.buf

  1* INSERT INTO SUD VALUES (102,'MR.RATORE',69,4345656669,'MADHURI')
SQL> /

1 row created.

SQL> ED
Wrote file afiedt.buf

  1* INSERT INTO SUD VALUES (103,'MR.MURLI',20,4345656669,'MITHALI')
SQL> /

1 row created.

SQL> SELECT *
  2  FROM SUD;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       101 RATORE     79    4645656669 DIKSIT
       101 RATORE     79    4645656669 DIKSIT
       102 MR.RATORE  69    4345656669 MADHURI
       103 MR.MURLI   20    4345656669 MITHALI

SQL> INSERT INTO SUD VALUES (101,'RATORE',79,4645656669,'DIKSIT');

1 row created.

SQL> ED
Wrote file afiedt.buf

  1* INSERT INTO SUD VALUES (105,'MOHAN',80,4645655669,'RUPALI')
SQL> /

1 row created.

SQL> SELECT*
  2  FROM SUD;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       101 RATORE     79    4645656669 DIKSIT
       101 RATORE     79    4645656669 DIKSIT
       102 MR.RATORE  69    4345656669 MADHURI
       103 MR.MURLI   20    4345656669 MITHALI
       101 RATORE     79    4645656669 DIKSIT
       105 MOHAN      80    4645655669 RUPALI

6 rows selected.

SQL> ED
Wrote file afiedt.buf

  1  SELECT*
  2* FROM SUD
SQL> 
SQL> 
SQL> INSERT INTO SUD VALUES('&ID','&STNAME','&ROLLN','&MOBNO','&MOTHERNAME');
Enter value for id: 1
Enter value for stname: RAKESH
Enter value for rolln: 23
Enter value for mobno: 8080980874
Enter value for mothername: MRSMALTI
old   1: INSERT INTO SUD VALUES('&ID','&STNAME','&ROLLN','&MOBNO','&MOTHERNAME')
new   1: INSERT INTO SUD VALUES('1','RAKESH','23','8080980874','MRSMALTI')

1 row created.

SQL> /
Enter value for id: 2
Enter value for stname: MOHAN
Enter value for rolln: 45
Enter value for mobno: 87979797897
Enter value for mothername: HIMANSHI
old   1: INSERT INTO SUD VALUES('&ID','&STNAME','&ROLLN','&MOBNO','&MOTHERNAME')
new   1: INSERT INTO SUD VALUES('2','MOHAN','45','87979797897','HIMANSHI')
INSERT INTO SUD VALUES('2','MOHAN','45','87979797897','HIMANSHI')
                                        *
ERROR at line 1:
ORA-12899: value too large for column "SCOTT"."SUD"."MOBNO" (actual: 11, maximum: 10)


SQL> /
Enter value for id: 2
Enter value for stname: RAKESJ
Enter value for rolln: 34
Enter value for mobno: 9898989898
Enter value for mothername: YOP
old   1: INSERT INTO SUD VALUES('&ID','&STNAME','&ROLLN','&MOBNO','&MOTHERNAME')
new   1: INSERT INTO SUD VALUES('2','RAKESJ','34','9898989898','YOP')

1 row created.

SQL> SELECT*
  2  FROM SUD;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       101 RATORE     79    4645656669 DIKSIT
       101 RATORE     79    4645656669 DIKSIT
       102 MR.RATORE  69    4345656669 MADHURI
       103 MR.MURLI   20    4345656669 MITHALI
       101 RATORE     79    4645656669 DIKSIT
       105 MOHAN      80    4645655669 RUPALI
         1 RAKESH     23    8080980874 MRSMALTI
         2 RAKESJ     34    9898989898 YOP

8 rows selected.

SQL> UPDATE STUD
  2  
SQL> 
SQL> 
SQL> UPDATE SUD
  2  SET ROLLNO=78
  3  WHERE ID=69;

0 rows updated.

SQL> ED
Wrote file afiedt.buf

  1  UPDATE SUD
  2  SET ROLLNO=101
  3* WHERE ID=69
SQL> /

0 rows updated.

SQL> ED
Wrote file afiedt.buf

  1  UPDATE SUD
  2  SET ROLLNO=101
  3* WHERE ID=102
SQL> /

1 row updated.

SQL> SELECT *
  2  FROM SUD;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       101 RATORE     79    4645656669 DIKSIT
       101 RATORE     79    4645656669 DIKSIT
       102 MR.RATORE  101   4345656669 MADHURI
       103 MR.MURLI   20    4345656669 MITHALI
       101 RATORE     79    4645656669 DIKSIT
       105 MOHAN      80    4645655669 RUPALI
         1 RAKESH     23    8080980874 MRSMALTI
         2 RAKESJ     34    9898989898 YOP

8 rows selected.

SQL> DELETE
  2  FROM SUD
  3  WHERE ID=101;

3 rows deleted.

SQL> SELECT *
  2  FROM SUD;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       102 MR.RATORE  101   4345656669 MADHURI
       103 MR.MURLI   20    4345656669 MITHALI
       105 MOHAN      80    4645655669 RUPALI
         1 RAKESH     23    8080980874 MRSMALTI
         2 RAKESJ     34    9898989898 YOP

SQL> 






SQL*Plus: Release 10.2.0.1.0 - Production on Thu May 15 17:26:19 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> select*
  2  from SUD;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       102 MR.RATORE  101   4345656669 MADHURI
       103 MR.MURLI   20    4345656669 MITHALI
       105 MOHAN      80    4645655669 RUPALI
         1 RAKESH     23    8080980874 MRSMALTI
         2 RAKESJ     34    9898989898 YOP

SQL> INSERT INTO SUD VALUES('&ID','&STNAME','&ROLLN','&MOBNO','&MOTHERNAME');
Enter value for id: 102
Enter value for stname: SITAL
Enter value for rolln: 65
Enter value for mobno: 9878989898
Enter value for mothername: MALTI
old   1: INSERT INTO SUD VALUES('&ID','&STNAME','&ROLLN','&MOBNO','&MOTHERNAME')
new   1: INSERT INTO SUD VALUES('102','SITAL','65','9878989898','MALTI')

1 row created.

SQL> /
Enter value for id: 103
Enter value for stname: RETYU
Enter value for rolln: 45
Enter value for mobno: 6767676767
Enter value for mothername: RITA
old   1: INSERT INTO SUD VALUES('&ID','&STNAME','&ROLLN','&MOBNO','&MOTHERNAME')
new   1: INSERT INTO SUD VALUES('103','RETYU','45','6767676767','RITA')

1 row created.

SQL> SELECT*
  2  FROM SUD;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       102 SITAL      65    9878989898 MALTI
       103 RETYU      45    6767676767 RITA
       102 MR.RATORE  101   4345656669 MADHURI
       103 MR.MURLI   20    4345656669 MITHALI
       105 MOHAN      80    4645655669 RUPALI
         1 RAKESH     23    8080980874 MRSMALTI
         2 RAKESJ     34    9898989898 YOP

7 rows selected.

SQL> COMMIT;

Commit complete.

SQL> ROLLBACK;

Rollback complete.

SQL> SELECT*
  2  FROM SUD;

        ID STNAME     ROLLN MOBNO      MOTHERNAME
---------- ---------- ----- ---------- --------------------
       102 SITAL      65    9878989898 MALTI
       103 RETYU      45    6767676767 RITA
       102 MR.RATORE  101   4345656669 MADHURI
       103 MR.MURLI   20    4345656669 MITHALI
       105 MOHAN      80    4645655669 RUPALI
         1 RAKESH     23    8080980874 MRSMALTI
         2 RAKESJ     34    9898989898 YOP

7 rows selected.

SQL>  