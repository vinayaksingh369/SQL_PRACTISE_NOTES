
SQL*Plus: Release 10.2.0.1.0 - Production on Wed May 7 16:35:22 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> SET LINES 100 PAGES 100;
SQL> SELECT*
  2  FROM EMP
  3  WHERE JOB IN ('ACCOUNTING',SALESDEPT');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> SELECT * FROM EMP;

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

SQL>  SELECT*
  2   FROM EMP
  3   WHERE JOB IN ('ACCOUNTING',SALESDEPT');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> ED
Wrote file afiedt.buf

  1   SELECT*
  2   FROM EMP
  3*  WHERE JOB IN ('ACCOUNTING',SALESMAN')
SQL> SELECT*
  2  FROM EMP
  3  WHERE JOB IN ('ACCOUNTING',SALESMAN');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> SELECT MIN(SAL)
  2  FROM EMP
  3  WHERE SAL<(SELECT MIN(SAL)
  4             FROM EMP);

  MIN(SAL)
----------


SQL> ED
Wrote file afiedt.buf

  1  SELECT MIN(SAL)
  2  FROM EMP
  3  WHERE SAL>(SELECT MIN(SAL)
  4*            FROM EMP)
SQL> /

  MIN(SAL)
----------
       950

SQL> SELECT MAX(SAL)
  2  FROM EMP
  3  WHERE SAL>(SELECT MAX(SAL)
  4             FROM EMP
  5             WHERE SAL>(SELECT MAX(SAL)
  6                        FROM EMP
  7                        WHERE SAL>(SELECT MAX(SAL)
  8                                   FROM EMP
  9                                   WHERE SAL>(SELECT MAX(SAL)
 10                                              FROM EMP))));

  MAX(SAL)
----------


SQL> ED
Wrote file afiedt.buf

  1  SELECT MAX(SAL)
  2  FROM EMP
  3  WHERE SAL>(SELECT MAX(SAL)
  4             FROM EMP
  5             WHERE SAL>(SELECT MAX(SAL)
  6                        FROM EMP
  7                        WHERE SAL>(SELECT MAX(SAL)
  8                                   FROM EMP
  9                                   WHERE SAL>(SELECT MAX(SAL)
 10*                                             FROM EMP))))
SQL> /

  MAX(SAL)
----------


SQL> ED
Wrote file afiedt.buf

  1  SELECT MAX(SAL)
  2  FROM EMP
  3  WHERE SAL>(SELECT MAX(SAL)
  4             FROM EMP
  5             WHERE SAL>(SELECT MAX(SAL)
  6                        FROM EMP
  7                        WHERE SAL>(SELECT MAX(SAL)
  8                                   FROM EMP
  9                                   WHERE SAL>(SELECT MAX(SAL)
 10*                                             FROM EMP))));
SQL> /
                                            FROM EMP))));
                                                        *
ERROR at line 10:
ORA-00911: invalid character


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE MGR=(SELECT EMPNO
  4               FROM EMP
  5               WHERE ='KING');
             WHERE ='KING')
                   *
ERROR at line 5:
ORA-00936: missing expression


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME
  2  FROM EMP
  3  WHERE MGR=(SELECT EMPNO
  4               FROM EMP
  5*              WHERE ENAME='KING')
SQL> /

ENAME
----------
JONES
BLAKE
CLARK

SQL> SELECT ENAME 
  2  FROM EMP
  3  WHERE EMPNO=(SELECT MGR
  4               FROM EMP
  5               WHERE ENAME ='SMITH');

ENAME
----------
FORD

SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME
  2  FROM EMP
  3  WHERE EMPNO=(SELECT MGR
  4               FROM EMP
  5*              WHERE ENAME ='ADAMS')
SQL> /

ENAME
----------
SCOTT

SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME
  2  FROM DEPT
  3  WHERE EMPNO=(SELECT MGR
  4               FROM EMP
  5*              WHERE ENAME ='JONES')
SQL> /
WHERE EMPNO=(SELECT MGR
      *
ERROR at line 3:
ORA-00904: "EMPNO": invalid identifier


SQL> SELECT DNAME
  2  FROM DEPT
  3  ;

DNAME
--------------
ACCOUNTING
RESEARCH
SALES
OPERATIONS

SQL> SELECT *
  2  FROM DEPT;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT ENAME
  4                FROM EMP
  5                WHERE EMPNO=(SELECT MGR
  6                             FROM EMP
  7                             WHERE ='JONES'));
                           WHERE ='JONES'))
                                 *
ERROR at line 7:
ORA-00936: missing expression


SQL> ED
Wrote file afiedt.buf

  1  SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT ENAME
  4                FROM EMP
  5                WHERE EMPNO=(SELECT MGR
  6                             FROM EMP
  7*                            WHERE ENAME='JONES'))
SQL> /
WHERE DEPTNO=(SELECT ENAME
                     *
ERROR at line 3:
ORA-01722: invalid number


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE EMPNO=(SELECT ENAME
  4  FROM EMP
  5  WHERE EMPNO=(SELECT MGR
  6               FROM EMP
  7               WHERE ENAME ='ADAMS')
  8  
SQL> ;
  1  SELECT ENAME
  2  FROM EMP
  3  WHERE EMPNO=(SELECT ENAME
  4  FROM EMP
  5  WHERE EMPNO=(SELECT MGR
  6               FROM EMP
  7*              WHERE ENAME ='ADAMS')
SQL> 
SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME
  2  FROM EMP
  3  WHERE EMPNO=(SELECT MGR
  4  FROM EMP
  5  WHERE EMPNO=(SELECT MGR
  6               FROM EMP
  7*              WHERE ENAME ='ADAMS')
SQL> /
WHERE EMPNO=(SELECT MGR
             *
ERROR at line 3:
ORA-00921: unexpected end of SQL command


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME
  2  FROM EMP
  3  WHERE EMPNO=(SELECT MGR
  4  FROM EMP
  5  WHERE EMPNO=(SELECT MGR
  6               FROM EMP
  7*              WHERE ENAME ='ADAMS'))
SQL> /

ENAME
----------
JONES

SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT ENAME
  4                FROM EMP
  5                WHERE EMPNO=(SELECT MGR
  6                             FROM EMP
  7                             WHERE ='JONES'));
                           WHERE ='JONES'))
                                 *
ERROR at line 7:
ORA-00936: missing expression


SQL> 