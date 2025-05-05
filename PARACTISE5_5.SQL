
SQL*Plus: Release 10.2.0.1.0 - Production on Mon May 5 17:12:13 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> SELECT *
  2  FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7369 SMITH      CLERK           7902 17-DEC-80        800
        20

      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300
        30

      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7566 JONES      MANAGER         7839 02-APR-81       2975
        20

      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400
        30

      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450
        10

      7788 SCOTT      ANALYST         7566 19-APR-87       3000
        20

      7839 KING       PRESIDENT            17-NOV-81       5000
        10


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0
        30

      7876 ADAMS      CLERK           7788 23-MAY-87       1100
        20

      7900 JAMES      CLERK           7698 03-DEC-81        950
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7902 FORD       ANALYST         7566 03-DEC-81       3000
        20

      7934 MILLER     CLERK           7782 23-JAN-82       1300
        10


14 rows selected.

SQL> SET LINES 100 PAGES 100;
SQL> SELECT*
  2  FROM DEPT;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> SELECT DNAME
  2  FROM DEPT 
  3  WHERE DEPTNO=(SELECT DEPTNO
  4              FROM EMP
  5  WHERE EANME='SMITH');
WHERE EANME='SMITH')
      *
ERROR at line 5:
ORA-00904: "EANME": invalid identifier


SQL> SELECT DNAME 
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME='SMITH');

DNAME
--------------
RESEARCH

SQL> SELECT DNAME,LOC
  2  FROM EMP
  3  WHERE DEPTNO =(SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME ='KING');
SELECT DNAME,LOC
             *
ERROR at line 1:
ORA-00904: "LOC": invalid identifier


SQL> SELECT DNAME,LOC
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME ='KING');

DNAME          LOC
-------------- -------------
ACCOUNTING     NEW YORK

SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE EMPNO=7902);

LOC
-------------
DALLAS

SQL> SELECT DNAME ,LOC,DEPTNO
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME LIKE'$R');

no rows selected

SQL>  SELECT DNAME ,LOC,DEPTNO
  2   FROM DEPT
  3   WHERE DEPTNO=(SELECT DEPTNO
  4   FROM EMP
  5  WHERE ENAME LIKE'%R');
 WHERE DEPTNO=(SELECT DEPTNO
               *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row


SQL> SELECT DNAME ,LOC,DEPTNO
  2  FROM DEPT
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME LIKE '%R');
WHERE DEPTNO=(SELECT DEPTNO
              *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row


SQL> SELECT DNAME. LOC,DEPTNO
  2  FROM DEPT
  3  WHERE DEPTNO IN (SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME LIKE '%R');
SELECT DNAME. LOC,DEPTNO
       *
ERROR at line 1:
ORA-00904: "DNAME"."LOC": invalid identifier


SQL> SELECT *
  2  FROM DEPT;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> SELECT *
  2  FROM DEPT
  3  WHERE DEPTNO IN (SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME LIKE'%R');

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        30 SALES          CHICAGO

SQL> SELECT DNAME 
  2  FROM DEPT
  3  WHERE DEPTN0 IN (SELECT DEPTNO
  4  FROM EMP
  5  WHERE JOB='PRESIDENT');
WHERE DEPTN0 IN (SELECT DEPTNO
      *
ERROR at line 3:
ORA-00904: "DEPTN0": invalid identifier


SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN (SELECT DEPTNO
  4  FROM EMP
  5  WHERE JOB='PRESIDENT');

DNAME
--------------
ACCOUNTING

SQL> SELECT ENAME 
  2  FROM EMP
  3  WHERE DEPTNO IN (SELECT DEPTNO
  4  FROM DEPT
  5  WHERE DNAME ='ACCOUNTING');

ENAME
----------
CLARK
KING
MILLER

SQL> SELECT EMP.*,SAL*12
  2  FROM EMP
  3  WHERE DEPTNO IN (SELECT DEPTNO
  4  FROM DEPT 
  5  WHERE LOC='NEW YORK');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     SAL*12
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10      29400
      7839 KING       PRESIDENT            17-NOV-81       5000                    10      60000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10      15600

SQL> SELECT EMP.*,SAL*12 AS ANNUAL
  2  FROM EMP
  3  WHERE DEPTNO IN (SELECT DEPTNO
  4  FROM DEPT 
  5  WHERE LOC='NEW YORK');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     ANNUAL
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10      29400
      7839 KING       PRESIDENT            17-NOV-81       5000                    10      60000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10      15600

SQL> SELECT *
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

SQL> SELECT ENAME 
  2  FROM EMP
  3  WHERE DEPTNO IN (SELECT DEPTNO
  4  FROM DEPT
  5  WHERE DNAME ='ACCOUNTING');

ENAME
----------
CLARK
KING
MILLER

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE SAL>'SCOTT' AND DEPTNO IN (SELECT DEPTNO
  4  FROM DEPT
  5  WHERE DNAME ='ACCOUNTING');
WHERE SAL>'SCOTT' AND DEPTNO IN (SELECT DEPTNO
          *
ERROR at line 3:
ORA-01722: invalid number


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE SAL>'SCOTT' AND DEPTNO =(SELECT DEPTNO
  4  FROM DEPT
  5  WHERE DNAME ='ACCOUNTING');
WHERE SAL>'SCOTT' AND DEPTNO =(SELECT DEPTNO
          *
ERROR at line 3:
ORA-01722: invalid number


SQL> SELECT ENAME 
  2  FROM EMP
  3  WHERE SAL>'SCOTT'DEPTNO IN (SELECT DEPTNO
  4  FROM DEPT
  5  WHERE DNAME ='ACCOUNTING');
WHERE SAL>'SCOTT'DEPTNO IN (SELECT DEPTNO
                 *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> SELECT ENAME 
  2  FROM EMP
  3  WHERE SAL>'SCOTT' AND DEPTNO IN SELECT DEPTNO
  4  FROM DEPT
  5  WHERE DNAME ='ACCOUNTING');
WHERE SAL>'SCOTT' AND DEPTNO IN SELECT DEPTNO
                                *
ERROR at line 3:
ORA-00936: missing expression
