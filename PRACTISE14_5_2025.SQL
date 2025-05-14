
SQL*Plus: Release 10.2.0.1.0 - Production on Wed May 14 16:51:30 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> CREATE TABLE SNAME
  2  (
  3   ID NUMBER,
  4   STNAME CGAR(15),
  5   ROLLNO VARCHAR(5),
  6   MOBNO NUMBER INT(10(),
  7   FNAME CHAR(20),
  8  );
 STNAME CGAR(15),
            *
ERROR at line 4:
ORA-00907: missing right parenthesis


SQL> ED
Wrote file afiedt.buf

  1  CREATE TABLE SNAME
  2  (
  3   ID NUMBER,
  4   STNAME CHAR(15),
  5   ROLLNO VARCHAR(5),
  6   MOBNO NUMBER INT(10(),
  7   FNAME CHAR(20),
  8* )
SQL> /
 MOBNO NUMBER INT(10(),
              *
ERROR at line 6:
ORA-00907: missing right parenthesis


SQL> ED
Wrote file afiedt.buf

  1  CREATE TABLE SNAME
  2  (
  3   ID NUMBER,
  4   STNAME CHAR(15),
  5   ROLLNO VARCHAR(5),
  6   MOBNO NUMBER int(10(),
  7   FNAME CHAR(20),
  8* )
SQL> /
 MOBNO NUMBER int(10(),
              *
ERROR at line 6:
ORA-00907: missing right parenthesis


SQL> ed
Wrote file afiedt.buf

  1  CREATE TABLE SNAME
  2  (
  3   ID NUMBER,
  4   STNAME CHAR(15),
  5   ROLLNO VARCHAR(5),
  6   MOBNO NUMBER int(10),
  7   FNAME CHAR(20),
  8* )
SQL> /
 MOBNO NUMBER int(10),
              *
ERROR at line 6:
ORA-00907: missing right parenthesis


SQL> ed
Wrote file afiedt.buf

  1  CREATE TABLE SNAME
  2  (
  3   ID NUMBER,
  4   STNAME CHAR(15),
  5   ROLLNO VARCHAR(5),
  6   MOBNO VARCHAR(10),
  7   FNAME CHAR(20),
  8* )
SQL> /
)
*
ERROR at line 8:
ORA-00904: : invalid identifier


SQL>  CREATE TABLE SNAME
  2   (
  3    ID NUMBER,
  4    STNAME CHAR(15),
  5    ROLLNO VARCHAR(5),
  6    MOBNO VARCHAR(10),
  7    FNAME CHAR(20),
  8   );
 )
 *
ERROR at line 8:
ORA-00904: : invalid identifier


SQL> ED
Wrote file afiedt.buf

  1   CREATE TABLE SNAME
  2   (
  3    ID NUMBER,
  4    STNAME CHAR(15),
  5    ROLLNO VARCHAR(5),
  6    MOBNO VARCHAR(10),
  7    FNAME CHAR(20)
  8*  )
SQL> /

Table created.

SQL> SELECT *
  2  FROM SNAME;

no rows selected

SQL> RENAME SNAME TO SUD,
  2  
SQL> SELECT *
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
DEPT                           TABLE
EMP                            TABLE
BONUS                          TABLE
SALGRADE                       TABLE
SNAME                          TABLE

SQL> RENAME SNAME TO SUD;

Table renamed.

SQL> SELECT*
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
DEPT                           TABLE
EMP                            TABLE
BONUS                          TABLE
SALGRADE                       TABLE
SUD                            TABLE

SQL> DESC SUD;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER
 STNAME                                             CHAR(15)
 ROLLNO                                             VARCHAR2(5)
 MOBNO                                              VARCHAR2(10)
 FNAME                                              CHAR(20)

SQL> ALTER TABLE SUD
  2  ADD MNAME VARCHAR(20);

Table altered.

SQL> SELECT*
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
DEPT                           TABLE
EMP                            TABLE
BONUS                          TABLE
SALGRADE                       TABLE
SUD                            TABLE

SQL> DESC SUD ;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER
 STNAME                                             CHAR(15)
 ROLLNO                                             VARCHAR2(5)
 MOBNO                                              VARCHAR2(10)
 FNAME                                              CHAR(20)
 MNAME                                              VARCHAR2(20)

SQL> ALTER TABLE SUD
  2  DROP COLUMN FNAME;

Table altered.

SQL> DESC SUD;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER
 STNAME                                             CHAR(15)
 ROLLNO                                             VARCHAR2(5)
 MOBNO                                              VARCHAR2(10)
 MNAME                                              VARCHAR2(20)

SQL> ALTER TABLE SUD
  2  RENAME COLUMN MNAME TO MOTHERNAME;

Table altered.

SQL> DESC SUD;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER
 STNAME                                             CHAR(15)
 ROLLNO                                             VARCHAR2(5)
 MOBNO                                              VARCHAR2(10)
 MOTHERNAME                                         VARCHAR2(20)

SQL> ALTER TABLE SUD
  2  MODIFY COLUMN STNAME VARCHAR(10);
MODIFY COLUMN STNAME VARCHAR(10)
                     *
ERROR at line 2:
ORA-00905: missing keyword


SQL> ED
Wrote file afiedt.buf

  1  ALTER TABLE SUD
  2* MODIFY COLUMNSTNAME VARCHAR(10)
SQL> /
MODIFY COLUMNSTNAME VARCHAR(10)
       *
ERROR at line 2:
ORA-00904: "COLUMNSTNAME": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  ALTER TABLE SUD
  2* MODIFY STNAME VARCHAR(10)
SQL> /

Table altered.

SQL> DESC SUD;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER
 STNAME                                             VARCHAR2(10)
 ROLLNO                                             VARCHAR2(5)
 MOBNO                                              VARCHAR2(10)
 MOTHERNAME                                         VARCHAR2(20)

SQL> ALTER TABLE SUD
  2  MODIFY ID NUMBER NULL;
MODIFY ID NUMBER NULL
       *
ERROR at line 2:
ORA-01451: column to be modified to NULL cannot be modified to NULL


SQL> ED
Wrote file afiedt.buf

  1  ALTER TABLE SUD
  2* MODIFY ID NUMBER NOT NULL
SQL> /

Table altered.

SQL> DESC SUD;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                        NOT NULL NUMBER
 STNAME                                             VARCHAR2(10)
 ROLLNO                                             VARCHAR2(5)
 MOBNO                                              VARCHAR2(10)
 MOTHERNAME                                         VARCHAR2(20)

SQL> DROP TABLE SUD;

Table dropped.

SQL> SELECT *
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
DEPT                           TABLE
EMP                            TABLE
BONUS                          TABLE
SALGRADE                       TABLE
BIN$/V/wHdYNR2SmXEjDQpwSzQ==$0 TABLE

SQL> FLASHBACK TABLE SUD
  2  TO BEFORE DROP;

Flashback complete.

SQL> DESC SUD;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                        NOT NULL NUMBER
 STNAME                                             VARCHAR2(10)
 ROLLNO                                             VARCHAR2(5)
 MOBNO                                              VARCHAR2(10)
 MOTHERNAME                                         VARCHAR2(20)

SQL> 