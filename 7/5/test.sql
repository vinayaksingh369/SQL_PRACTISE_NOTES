
SQL*Plus: Release 10.2.0.1.0 - Production on Fri May 9 16:38:04 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> SET LINES 100 PAGES 100;
SQL> SELECT*
  2  FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.

SQL> SELECT *
  2  FROM DEPT
  3  ;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> SELECT SAL,SAL*12 AS ANNUAL
  2  FROM EMP
  3  WHERE SAL>ALL(SELECT SAL
  4                FROM EMP
  5                WHERE DEPTNO=(SELECT DEPTNO
  6                              FROM EMP
  7                              WHERE DNAME='SALES'));
                            WHERE DNAME='SALES'))
                                  *
ERROR at line 7:
ORA-00904: "DNAME": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT SAL,SAL*12 AS ANNUAL
  2  FROM EMP
  3  WHERE SAL>ALL(SELECT SAL
  4                FROM EMP
  5                WHERE DEPTNO=(SELECT DEPTNO
  6                              FROM DEPT
  7*                             WHERE DNAME='SALES'))
SQL> /

       SAL     ANNUAL
---------- ----------
      2975      35700
      3000      36000
      5000      60000
      3000      36000

SQL> SELECT COUNT(ENAME)
  2  FROM EMP
  3  WHERE EMPNO=(SELECT MGR
  4               FROM EMP
  5               WHERE ENAME='KING'));
             WHERE ENAME='KING'))
                                *
ERROR at line 5:
ORA-00933: SQL command not properly ended


SQL> ED
Wrote file afiedt.buf

  1  SELECT COUNT(ENAME)
  2  FROM EMP
  3  WHERE EMPNO=(SELECT MGR
  4               FROM EMP
  5*              WHERE ENAME='KING')
SQL> /

COUNT(ENAME)
------------
           0

SQL> ED
Wrote file afiedt.buf

  1  SELECT COUNT(ENAME)
  2  FROM EMP
  3  WHERE EMPNO IN(SELECT MGR
  4               FROM EMP
  5*              WHERE ENAME='KING')
SQL> /

COUNT(ENAME)
------------
           0

SQL> ED
Wrote file afiedt.buf

  1  SELECT COUNT(ENAME)
  2  FROM EMP
  3  WHERE MGR IN(SELECT EMPNO
  4               FROM EMP
  5*              WHERE ENAME='KING')
SQL> /

COUNT(ENAME)
------------
           3

SQL> ED
Wrote file afiedt.buf

  1  SELECT COUNT(ENAME)
  2  FROM EMP
  3  WHERE MGR =(SELECT EMPNO
  4               FROM EMP
  5*              WHERE ENAME='KING')
SQL> /

COUNT(ENAME)
------------
           3

SQL> SELECT *
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE SAL>ALL(SELECT MGR
  6  FROM EMP
  7  WHERE EMP
  8  
SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE SAL>ALL(SELECT MGR
  6  FROM EMP
  7* WHERE ENAME ='KING'))
SQL> /

no rows selected

SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE SAL<ALL(SELECT MGR
  6  FROM EMP
  7* WHERE ENAME ='KING'))
SQL> /

no rows selected

SQL> select*;
select*
      *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> select*
  2  from ALL;
from ALL
     *
ERROR at line 2:
ORA-00903: invalid table name


SQL> c




SQL*Plus: Release 10.2.0.1.0 - Production on Fri May 9 17:41:50 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> SELECT ENAM
  2  
SQL> 
SQL> SELECT ENAME
  2  FROM EMP,DEPT
  3  WHERE EMP.DEPTNO=DEPT.DEPTNO;

ENAME
----------
SMITH
ALLEN
WARD
JONES
MARTIN
BLAKE
CLARK
SCOTT
KING
TURNER
ADAMS

ENAME
----------
JAMES
FORD
MILLER

14 rows selected.

SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,LOC
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=DEPT.DEPTNO
SQL> /

ENAME      LOC
---------- -------------
SMITH      DALLAS
ALLEN      CHICAGO
WARD       CHICAGO
JONES      DALLAS
MARTIN     CHICAGO
BLAKE      CHICAGO
CLARK      NEW YORK
SCOTT      DALLAS
KING       NEW YORK
TURNER     CHICAGO
ADAMS      DALLAS

ENAME      LOC
---------- -------------
JAMES      CHICAGO
FORD       DALLAS
MILLER     NEW YORK

14 rows selected.

SQL> SET LINES100 PAGES 100;
SQL> SELECT DANAME,SAL
  2  FROM EMP,DEPT
  3  WHERE EMP.DEPTNO=EMP.DEPTNO AND DNAME =ACCOUNTING;
WHERE EMP.DEPTNO=EMP.DEPTNO AND DNAME =ACCOUNTING
                                       *
ERROR at line 3:
ORA-00904: "ACCOUNTING": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT DANAME,SAL
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=EMP.DEPTNO AND DNAME ='ACCOUNTING'
SQL> /\
SELECT DANAME,SAL
       *
ERROR at line 1:
ORA-00904: "DANAME": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME,SAL
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=EMP.DEPTNO AND DNAME ='ACCOUNTING'
SQL> /

DNAME                 SAL
-------------- ----------
ACCOUNTING            800
ACCOUNTING           1600
ACCOUNTING           1250
ACCOUNTING           2975
ACCOUNTING           1250
ACCOUNTING           2850
ACCOUNTING           2450
ACCOUNTING           3000
ACCOUNTING           5000
ACCOUNTING           1500
ACCOUNTING           1100
ACCOUNTING            950
ACCOUNTING           3000
ACCOUNTING           1300

14 rows selected.

SQL> SELECT DNAME ,SAL*12
  2  FROM EMP,DEPT
  3  FROM 
  4  ED
  5  
SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME ,SAL*12
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=DEPT.DEPTNO ANDSAL>2340;
SQL> /
WHERE EMP.DEPTNO=DEPT.DEPTNO ANDSAL>2340;
                             *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME ,SAL*12
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL>2340;
SQL> /
WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL>2340;
                                         *
ERROR at line 3:
ORA-00911: invalid character


SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME ,SAL*12
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL>2340;
SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME ,SAL*12
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL>2340;
SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME ,SAL*12
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=DEPT.DEPTNO OR SAL>2340;
SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME ,SAL*12
  2  FROM EMP,DEPT
  3* WHERE EMP.DEPTNO=DEPT.DEPTNO OR SAL>2340;
SQL> /
WHERE EMP.DEPTNO=DEPT.DEPTNO OR SAL>2340;
                                        *
ERROR at line 3:
ORA-00911: invalid character


SQL> SELECT DNAME,SAL
  2  FROM EMP,DEPT
  3  WHERE EMP.DEPTNO=DEPT.DEPTNO AND EMP.DEPTNO IN(10,20);

DNAME                 SAL
-------------- ----------
RESEARCH              800
RESEARCH             2975
ACCOUNTING           2450
RESEARCH             3000
ACCOUNTING           5000
RESEARCH             1100
RESEARCH             3000
ACCOUNTING           1300

8 rows selected.

SQL> 