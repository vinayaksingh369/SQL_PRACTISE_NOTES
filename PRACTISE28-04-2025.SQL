SQL> SYSTEM *
SP2-0042: unknown command "SYSTEM *" - rest of line ignored.
SQL> FROM EMP;
SP2-0042: unknown command "FROM EMP" - rest of line ignored.
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

SQL> SET LINES 100 PAGES 100;
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

SQL> SELECT *
  2  FROM EMP
  3  WHERE SAL>2000;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

6 rows selected.

SQL> SELECT DISTINCT JOB
  2  FROM EMP
  3  WHERE JOB REGXP'^[AEIOUaeiou]';
WHERE JOB REGXP'^[AEIOUaeiou]'
          *
ERROR at line 3:
ORA-00920: invalid relational operator


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

SQL> SELECT *FROM EMP
  2  WHERE DEPTNO IN (10,20);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

8 rows selected.

SQL> select ename 
  2  
SQL> 
SQL> SELECT ENAME ,JOB
  2  FROM EMP
  3  WHERE JOB IN 'CLERK';

ENAME      JOB
---------- ---------
SMITH      CLERK
ADAMS      CLERK
JAMES      CLERK
MILLER     CLERK

SQL> SELECT ENAME,JOB
  2  FROM EMP
  3  WHERE JOB IN ('MANAGER','CLERK');

ENAME      JOB
---------- ---------
SMITH      CLERK
JONES      MANAGER
BLAKE      MANAGER
CLARK      MANAGER
ADAMS      CLERK
JAMES      CLERK
MILLER     CLERK

7 rows selected.

SQL> SELECT ENAME,DEPTNO
  2  FROM EMP
  3  WHERE DEPTNO NOT IN(10,20);

ENAME          DEPTNO
---------- ----------
ALLEN              30
WARD               30
BLAKE              30
TURNER             30
JAMES              30

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL BETWEEN 1000 AND 2500;

ENAME             SAL
---------- ----------
ALLEN            1600
WARD             1250
CLARK            2450
TURNER           1500
ADAMS            1100
MILLER           1300

6 rows selected.

SQL> SELECT ENAME 
  2  FROM EMP
  3  ;

ENAME
----------
SMITH
ALLEN
WARD
JONES
BLAKE
CLARK
SCOTT
KING
TURNER
ADAMS
JAMES
FORD
MILLER

13 rows selected.

SQL> SELECT*
  2  FROM NAME
  3  ;
FROM NAME
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> SELECT *FROM EMP;

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

SQL> SELECT ENAME,COMM
  2  FROM EMP
  3  WHERE COMM IS NULL;

ENAME            COMM
---------- ----------
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

SQL> SELECT ENAME,COMM
  2  FROM EMP
  3  WHERE COMM IS NOT NULL;

ENAME            COMM
---------- ----------
ALLEN             300
WARD              500
TURNER              0

SQL> SELECT ENAME,MGR
  2  FROM EMP
  3  WHERE MGR IS NULL;

ENAME             MGR
---------- ----------
KING

SQL> SELECT ENAME,COMM
  2  FROM EMP
  3  WHERE MGR IS NOT NULL;

ENAME            COMM
---------- ----------
SMITH
ALLEN             300
WARD              500
JONES
BLAKE
CLARK
SCOTT
TURNER              0
ADAMS
JAMES
FORD
MILLER

12 rows selected.

SQL> SELECT ENAME,MGR
  2  FROMEMP
  3  WHERE MGR IS NOT LIKE;
WHERE MGR IS NOT LIKE
*
ERROR at line 3:
ORA-00923: FROM keyword not found where expected


SQL> SELECT *
  2  FROM EMP
  3  
SQL> SELECT *