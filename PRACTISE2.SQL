
SQL> select *
  2  from emp
  3  where JOB='ANALYST'AND DEPTNO=10;

no rows selected

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

SQL> SELECT*
  2  FROM EMP
  3  WHERE JOB='PRESIDENT' AND SAL>4000;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7839 KING       PRESIDENT            17-NOV-81       5000                    10

SQL> SELECT ENAME,DEPTNO,JOB
  2  FROM EMP
  3  WHERE JOB='CLERK'AND DEPTNO=10 OR DEPTNO=20;

ENAME          DEPTNO JOB
---------- ---------- ---------
SMITH              20 CLERK
JONES              20 MANAGER
SCOTT              20 ANALYST
ADAMS              20 CLERK
FORD               20 ANALYST
MILLER             10 CLERK

6 rows selected.

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB='CLERK'OR JOB='MANAGER'AND DEPTNO=10;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO=10,20,30,40;
WHERE DEPTNO=10,20,30,40
               *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO=10 AND DEPTNO=20 AND DEPTNO=30 AND DEPTNO=40;

no rows selected

SQL> SELECT * FROM EMP
  2  ;

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
  3  WHERE DEPTNO=10 AND DEPTNO=20 AND DEPTNO=30 AND DEPTNO=40;

no rows selected

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO=10 AND DEPTNO=20;

no rows selected

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO=10;

ENAME
----------
CLARK
KING
MILLER

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO=10 AND DEPTNO=20;

no rows selected

SQL> 