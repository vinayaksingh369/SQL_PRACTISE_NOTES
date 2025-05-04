
SQL> SELECT*FROM EMP;

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

SQL> SELECT ENAME,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE<(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME ='PRESIDANT';
WHERE HIREDATE<(SELECT HIREDATE
                *
ERROR at line 3:
ORA-00921: unexpected end of SQL command


SQL> SELECT ENAME ,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE<(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME ='PRESIDENT');

no rows selected

SQL> SELECT ENAME ,HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE>(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME ='PRESIDENT');

no rows selected

SQL> SELECT ENAME, PRESIDENT
  2  FROM EMP
  3  WHERE HIREDATE=(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME ='PRESIDENT');
SELECT ENAME, PRESIDENT
              *
ERROR at line 1:
ORA-00904: "PRESIDENT": invalid identifier


SQL> SELECT ENAME, HIREDATE
  2  FROM EMP
  3  WHERE HIREDATE=(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME ='PRESIDENT');

no rows selected

SQL> SELECT ENAME, SAL
  2  FROM EMP
  3  WHERE SAL<(SELECT SAL
  4  FROM EMP
  5  WHERE EMPNO=7839);

ENAME             SAL
---------- ----------
SMITH             800
ALLEN            1600
WARD             1250
JONES            2975
BLAKE            2850
CLARK            2450
SCOTT            3000
TURNER           1500
ADAMS            1100
JAMES             950
FORD             3000
MILLER           1300

12 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE HIREDATE>(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME ='MILLER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20

SQL> SELECT ENAME,EMPNO
  2  FROM EMP
  3  WHERE HIREDATE>(SELECT HIREDATE
  4  FROM EMP
  5  WHERE ENAME='ALLEN');

ENAME           EMPNO
---------- ----------
WARD             7521
JONES            7566
BLAKE            7698
CLARK            7782
SCOTT            7788
KING             7839
TURNER           7844
ADAMS            7876
JAMES            7900
FORD             7902
MILLER           7934

11 rows selected.

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL>(SELECT SAL
  4  FROM EMP
  5  WHERE ENAME='MILLER')AND SAL<(SELECT SAL
  6  FROM EMP
  7  WHERE ENAME='ALLEN');

ENAME             SAL
---------- ----------
TURNER           1500

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO=20 AND JOB=(SELECT JOB
  4  FROM EMP
  5  WHERE ENAME ='SMITH');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
