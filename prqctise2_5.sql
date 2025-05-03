SQL> SET LINES 100 PAGES 100;
SQL> SELECT *
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
  3  WHERE SAL>(SELECT SAL
  4  FROM EMP
  5  WHERE ENAME ='ADAMS');

ENAME
----------
ALLEN
WARD
JONES
BLAKE
CLARK
SCOTT
KING
TURNER
FORD
MILLER

10 rows selected.

SQL> SELECT ENAME 
  2  FROM EMP
  3  WHERE SAL<(SELECT SAL
  4  FROM EMP
  5  WHERE ENAME ='KING');

ENAME
----------
SMITH
ALLEN
WARD
JONES
BLAKE
CLARK
SCOTT
TURNER
ADAMS
JAMES
FORD
MILLER

12 rows selected.

SQL> SELECT ENAME,DEPTNO
  2  FROM EMP
  3  WHERE DEPTNO=(SELECT DEPTNO
  4  FROM EMP
  5  WHERE ENAME='JONES');

ENAME          DEPTNO
---------- ----------
SMITH              20
JONES              20
SCOTT              20
ADAMS              20
FORD               20

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

SQL> 

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

SQL> SELECT ENAME,JOB
  2  FROM EMP 
  3  WHERE JOB=(SELECT JOB 
  4  FROM EMP
  5  WHERE ENAME ='JAMES');

ENAME      JOB
---------- ---------
SMITH      CLERK
ADAMS      CLERK
JAMES      CLERK
MILLER     CLERK

SQL> SELECT EMPNO,ENAME,SAL*12
  2  FROM EMP
  3  WHERE SAL*12>(SELECT SAL*12
  4  FROM EMP
  5  WHERE ENAME ='WARD');

     EMPNO ENAME          SAL*12
---------- ---------- ----------
      7499 ALLEN           19200
      7566 JONES           35700
      7698 BLAKE           34200
      7782 CLARK           29400
      7788 SCOTT           36000
      7839 KING            60000
      7844 TURNER          18000
      7902 FORD            36000
      7934 MILLER          15600

9 rows selected.

SQL> SELECT ENAME,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE>(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME ='SCOTT');

ENAME      HIREDATE
---------- ---------
ADAMS      23-MAY-87

SQL> SELECT ENAME HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE>(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME=
  6  'PRESIDENT');

no rows selected

SQL> 