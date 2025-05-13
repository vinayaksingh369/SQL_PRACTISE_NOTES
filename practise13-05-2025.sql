
SQL*Plus: Release 10.2.0.1.0 - Production on Tue May 13 16:47:43 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> SELECT E1.ENAME,E2.ENAME
  2  FROM EMP E1,EMP E2
  3  WHERE E1.ENAME=E2.MGR AND E1.JOB='CLERK';
WHERE E1.ENAME=E2.MGR AND E1.JOB='CLERK'
      *
ERROR at line 3:
ORA-01722: invalid number


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME,E2.ENAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.ENAME=E2.MGR AND E1.JOB='CLERK'
SQL> /
WHERE E1.ENAME=E2.MGR AND E1.JOB='CLERK'
      *
ERROR at line 3:
ORA-01722: invalid number


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME,E2.ENAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.ENAME AND E1.JOB='CLERK'
SQL> /
WHERE E1.MGR=E2.ENAME AND E1.JOB='CLERK'
             *
ERROR at line 3:
ORA-01722: invalid number


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME,E2.ENAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR = E2.ENAME AND E1.JOB='CLERK'
SQL> /
WHERE E1.MGR = E2.ENAME AND E1.JOB='CLERK'
               *
ERROR at line 3:
ORA-01722: invalid number


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME,E2.ENAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR = E2.EMPNO AND E1.JOB='CLERK'
SQL> /

ENAME      ENAME
---------- ----------
SMITH      FORD
ADAMS      SCOTT
JAMES      BLAKE
MILLER     CLARK

SQL> SELECT E1.ENAME, E2 ENAME
  2  FROM EMP E1,EMP E2
  3  WHERE E1.MGR=E2.EMPNO AND E1.DEPTNO =(10,20);
WHERE E1.MGR=E2.EMPNO AND E1.DEPTNO =(10,20)
                                    *
ERROR at line 3:
ORA-01797: this operator must be followed by ANY or ALL


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2 ENAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.DEPTNO IN (10,20)
SQL> /
SELECT E1.ENAME, E2 ENAME
                 *
ERROR at line 1:
ORA-00904: "E2": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.DEPTNO IN (10,20)
  4  /

ENAME      ENAME
---------- ----------
SMITH      FORD
JONES      KING
CLARK      KING
SCOTT      JONES
ADAMS      SCOTT
FORD       JONES
MILLER     CLARK

7 rows selected.

SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.SAL>2300
SQL> /

ENAME      ENAME
---------- ----------
JONES      KING
BLAKE      KING
CLARK      KING
SCOTT      JONES
FORD       JONES

SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME,E1.SAL,E2.EANME,E2.SAL
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.SAL>2300
SQL> /
SELECT E1.ENAME,E1.SAL,E2.EANME,E2.SAL
                       *
ERROR at line 1:
ORA-00904: "E2"."EANME": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E1.SAL, E2.ENAME, E2.SAL
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.SAL>2300
SQL> /

ENAME             SAL ENAME             SAL
---------- ---------- ---------- ----------
JONES            2975 KING             5000
BLAKE            2850 KING             5000
CLARK            2450 KING             5000
SCOTT            3000 JONES            2975
FORD             3000 JONES            2975

SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME,E1.HIREDATE,E2.HIREDATE
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E2.HIREDATE < ('01-JAN-1982');
SQL> /
WHERE E1.MGR=E2.EMPNO AND E2.HIREDATE < ('01-JAN-1982');
                                                       *
ERROR at line 3:
ORA-00911: invalid character


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME,E2.HIREDATE
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E2.HIREDATE < ('01-JAN-1982');
SQL> /
WHERE E1.MGR=E2.EMPNO AND E2.HIREDATE < ('01-JAN-1982');
                                                       *
ERROR at line 3:
ORA-00911: invalid character


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME,E2.HIREDATE
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.HIREDATE < ('01-JAN-1982');
SQL> /
WHERE E1.MGR=E2.EMPNO AND E1.HIREDATE < ('01-JAN-1982');
                                                       *
ERROR at line 3:
ORA-00911: invalid character


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME,E2.HIREDATE
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.HIREDATE <('01-JAN-1982')
SQL> /

ENAME      ENAME      HIREDATE
---------- ---------- ---------
SMITH      FORD       03-DEC-81
ALLEN      BLAKE      01-MAY-81
WARD       BLAKE      01-MAY-81
JONES      KING       17-NOV-81
MARTIN     BLAKE      01-MAY-81
BLAKE      KING       17-NOV-81
CLARK      KING       17-NOV-81
TURNER     BLAKE      01-MAY-81
JAMES      BLAKE      01-MAY-81
FORD       JONES      02-APR-81

10 rows selected.

SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME,E2.HIREDATE,E1HIREDATE
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E2.HIREDATE<E1HIREDATE
SQL> /
WHERE E1.MGR=E2.EMPNO AND E2.HIREDATE<E1HIREDATE
                                      *
ERROR at line 3:
ORA-00904: "E1HIREDATE": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME,E2.HIREDATE,E1HIREDATE
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E2.HIREDATE<E1.HIREDATE
SQL> /
SELECT E1.ENAME, E2.ENAME,E2.HIREDATE,E1HIREDATE
                                      *
ERROR at line 1:
ORA-00904: "E1HIREDATE": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME,E2.HIREDATE,E1.HIREDATE
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E2.HIREDATE<E1.HIREDATE
SQL> /

ENAME      ENAME      HIREDATE  HIREDATE
---------- ---------- --------- ---------
MARTIN     BLAKE      01-MAY-81 28-SEP-81
SCOTT      JONES      02-APR-81 19-APR-87
TURNER     BLAKE      01-MAY-81 08-SEP-81
ADAMS      SCOTT      19-APR-87 23-MAY-87
JAMES      BLAKE      01-MAY-81 03-DEC-81
FORD       JONES      02-APR-81 03-DEC-81
MILLER     CLARK      09-JUN-81 23-JAN-82

7 rows selected.

SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME,NAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.JOB=E2.JOB
SQL> /
SELECT E1.ENAME, E2.ENAME,NAME
                          *
ERROR at line 1:
ORA-00904: "NAME": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME MNAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.JOB=E2.JOB
SQL> /

no rows selected

SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME MNAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E2.ENAME='MANAGER'
SQL> /

no rows selected

SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME MNAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.ENAME='MANAGER'
SQL> /

no rows selected

SQL> ED
Wrote file afiedt.buf

  1  SELECT E1.ENAME, E2.ENAME MNAME
  2  FROM EMP E1,EMP E2
  3* WHERE E1.MGR=E2.EMPNO AND E1.ENAME='MANAGER'
SQL> /

no rows selected
hi some issue is going
