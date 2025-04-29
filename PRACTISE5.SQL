
SQL*Plus: Release 10.2.0.1.0 - Production on Tue Apr 29 14:51:47 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> select*
  2  from EMP
  3  ;

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

      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30

      7782 CLARK      MANAGER         7839 09-JUN-81       2450
        10


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000
        20

      7839 KING       PRESIDENT            17-NOV-81       5000
        10

      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7876 ADAMS      CLERK           7788 23-MAY-87       1100
        20

      7900 JAMES      CLERK           7698 03-DEC-81        950
        30

      7902 FORD       ANALYST         7566 03-DEC-81       3000
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7934 MILLER     CLERK           7782 23-JAN-82       1300
        10


13 rows selected.

SQL> SET LINES 100 PAGES100;
SQL> SELECT*
  2  FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

13 rows selected.

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE COMM IS NULL;

ENAME
----------
SMITH
JONES
BLAKE
CLARK
SCOTT
KING
ADAMS
JAMES
FORD
MILLER

10 rows selected.

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE MGR IS NULL;

ENAME
----------
KING

SQL> SLECT ENAME 
SP2-0734: unknown command beginning "SLECT ENAM..." - rest of line ignored.
SQL> FROM EMP
SP2-0042: unknown command "FROM EMP" - rest of line ignored.
SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO IN '30';

ENAME
----------
ALLEN
WARD
BLAKE
TURNER
JAMES

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO IN '30' AND SAL>1500;

ENAME
----------
ALLEN
BLAKE

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ENAME LIKE'S%','R%';
WHERE ENAME LIKE'S%','R%'
                    *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ENAME LIKE'S%' OR'R%';
WHERE ENAME LIKE'S%' OR'R%'
                          *
ERROR at line 3:
ORA-00920: invalid relational operator


SQL> SELECT ENAME FROM EMP
  2  WHERE ENAME LIKE'S%'OR LIKE'R5';
WHERE ENAME LIKE'S%'OR LIKE'R5'
                       *
ERROR at line 2:
ORA-00936: missing expression


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ENAME LIKE 'S%';

ENAME
----------
SMITH
SCOTT

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ENAEM IN(LIKE'S%','R%');
WHERE ENAEM IN(LIKE'S%','R%')
               *
ERROR at line 3:
ORA-00936: missing expression


SQL> 