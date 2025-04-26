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
  3  WHERE DEPTNO=10 AND 20 AND 30 AND 40;
WHERE DEPTNO=10 AND 20 AND 30 AND 40
                       *
ERROR at line 3:
ORA-00920: invalid relational operator


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO=10 AND DEPTNO=20 AND DEPTNO=30 AND DEPTNO=40;

no rows selected

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO IN (10,20,30,40);

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

SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN (10,20,30,40);

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
  3  WHERE EMPNO IN (7902,7839);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

SQL> SELECT *
  2  FROM EMP
  3  WHERE EMPNO NOT IN ('MANAGER','SALESMAN','CLERK');
WHERE EMPNO NOT IN ('MANAGER','SALESMAN','CLERK')
                    *
ERROR at line 3:
ORA-01722: invalid number


SQL> SELECT*
  2  FROM EMP
  3  WHERE EMPNO NOTIN ('MANAGER',SALESMAN','CLERK');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> SELECT*
  2  FROM EMP
  3  WHERE JOB NOT IN ('MANAGER',SALESMAN','CLERK');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

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

SQL> SELECT*
  2  FROM EMP
  3  WHERE HIREDATE BETWEEN ('01-JAN-81', '01-JAN-87');
WHERE HIREDATE BETWEEN ('01-JAN-81', '01-JAN-87')
                                   *
ERROR at line 3:
ORA-00907: missing right parenthesis


SQL> SELECT *
  2  FROM EMP
  3  WHERE HIREDATE BETWEEN TO_DATE('01-JAN-81', 'DD-MON-YY') AND TO_DATE('01-JAN-87', 'DD-MON-YY');


no rows selected

SQL> SELECT *
  2  FROM EMP
  3  WHERE HIREDATE BETWEEN '1981-01-01' AND '1987-01-01';
WHERE HIREDATE BETWEEN '1981-01-01' AND '1987-01-01'
                       *
ERROR at line 3:
ORA-01861: literal does not match format string


SQL> 