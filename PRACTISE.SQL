SQL> SELECT* FROM EMP;

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

SQL> SELECT EMP.* SAL*12AS ANNUAL
  2  FROM EMP
  3  WHERE DEPTNO=30 AND JOB='SALESMAN';
SELECT EMP.* SAL*12AS ANNUAL
             *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> SELECT EMP.*SAL*12 AS ANNUAL
  2  FROMEMP;
SELECT EMP.*SAL*12 AS ANNUAL
            *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> SELECT EMP.* SAL*12
  2  FROM EMP
  3  WHERE DEPTNO=30 AND JOB='MANAGER';
SELECT EMP.* SAL*12
             *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> SELECT EMP.* SAL*12
  2  FROM EMP;
SELECT EMP.* SAL*12
             *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> SELECT SAL*12
  2  FROM EMP;

    SAL*12
----------
      9600
     19200
     15000
     35700
     34200
     29400
     36000
     60000
     18000
     13200
     11400
     36000
     15600

13 rows selected.

SQL> SELECT EMP.* SAL*12
  2  FROM EMP;
SELECT EMP.* SAL*12
             *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> SELECT EMP.*,SAL*12
  2  FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     SAL*12
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20       9600
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30      19200
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30      15000
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20      35700
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30      34200
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10      29400
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20      36000
      7839 KING       PRESIDENT            17-NOV-81       5000                    10      60000
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30      18000
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20      13200
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30      11400
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20      36000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10      15600

13 rows selected.

SQL> SELECT EMP.*, SAL*12 AS ANNUAL
  2  FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     ANNUAL
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20       9600
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30      19200
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30      15000
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20      35700
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30      34200
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10      29400
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20      36000
      7839 KING       PRESIDENT            17-NOV-81       5000                    10      60000
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30      18000
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20      13200
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30      11400
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20      36000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10      15600

13 rows selected.

SQL> SELECT EMP.*, SAL*12 AS ANNUAL
  2  FROM EMP
  3  WHERE DEPTNO=30 AND JOB='MANAGER' AND SAL*12>14000;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     ANNUAL
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30      34200
- - - - - - - - - -- - -  - - - -- - - - - - - - - -- - - - - - - - - - - - - - - - -  -- - - - - 
SQL> SELECT*
  2  FROM EMP
  3  WHERE DEPTNO=30OR JOB='ANALYST';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEP
---------- ---------- --------- ---------- --------- ---------- ---------- -------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300        
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500        
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                   
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                   
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0        
      7900 JAMES      CLERK           7698 03-DEC-81        950                   
      7902 FORD       ANALYST         7566 03-DEC-81       3000                   

7 rows selected.

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE SAL<1100 AND JOB='CLERK';

ENAME
----------
SMITH
JAMES

SQL> SELECT ENAME,SAL,DEPTNO,SAL*12 AS ANNUALSAL
  2  FROM EMP
  3  WHERE DEPTNO=20 SAL>1100;
WHERE DEPTNO=20 SAL>1100
                *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> SELECT ENAME, SAL,DEPTNO, SAL*12 AS ANNUALSAL
  2  FROM EMP
  3  WHERE DEPTNO=20 AND SAL>1100;

ENAME             SAL     DEPTNO  ANNUALSAL
---------- ---------- ---------- ----------
JONES            2975         20      35700
SCOTT            3000         20      36000
FORD             3000         20      36000

SQL> SELECT EMPNO, ENAME
  2  FROM EMP
  3  WHERE DEPTNO=20 AND JOB='MANAGER';

     EMPNO ENAME
---------- ----------
      7566 JONES

SQL> 