
SQL*Plus: Release 10.2.0.1.0 - Production on Fri May 16 17:14:49 2025

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> SHOW USER;
USER is "SCOTT"
SQL> CONNECT
Enter user-name: HR
Enter password: *****
Connected.
SQL> SHOW USER
USER is "HR"
SQL> SELECT*
  2  FROM EMP;
FROM EMP
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> SELECT*
  2  FROM SCOTT.EMP;
FROM SCOTT.EMP
           *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> CONNECT 
Enter user-name: scott
Enter password: *****
Connected.
SQL> 
SQL> 
SQL> 
SQL> 
SQL> GRANT SELECT 
  2  ON EMP
  3  TO HR;

Grant succeeded.

SQL> CONNECT
Enter user-name: HR
Enter password: *****
Connected.
SQL> SHOW USER;
USER is "HR"
SQL> SELECT *
  2  FROM EMP;
FROM EMP
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> SELECT*
  2  FROM HR.EMP;
FROM HR.EMP
        *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> CONNECT
Enter user-name: SCOTT
Enter password: *****
Connected.
SQL> SHOW USER;
USER is "SCOTT"
SQL> 
SQL> REVOKE DELETE
  2  ON EMP
  3  FROM HR;
REVOKE DELETE
*
ERROR at line 1:
ORA-01927: cannot REVOKE privileges you did not grant


SQL> REVOKE SELECT ON EMP
  2  FROM HR;

Revoke succeeded.

SQL> SELECT*
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
SQL> CONNECT
Enter user-name: HR
Enter password: *****
Connected.
SQL> GRANT SELECT
  2  ON DEPT
  3  TO HR;
ON DEPT
   *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ED
Wrote file afiedt.buf

  1  GRANT SELECT
  2  ON DEPT
  3* TO HR
SQL> SELECT *
  2  
SQL> 
SQL> DESC
Usage: DESCRIBE [schema.]object[@db_link]
SQL> DESC HR;
ERROR:
ORA-04043: object HR does not exist


SQL> SELECT *FROM TAB;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
REGIONS                        TABLE
COUNTRIES                      TABLE
LOCATIONS                      TABLE
DEPARTMENTS                    TABLE
JOBS                           TABLE
EMPLOYEES                      TABLE
JOB_HISTORY                    TABLE
EMP_DETAILS_VIEW               VIEW

8 rows selected.

SQL> SHOW USER;
USER is "HR"
SQL> GRANT SELECT
  2  ON JOBS
  3  TO EMP;
TO EMP
   *
ERROR at line 3:
ORA-01917: user or role 'EMP' does not exist


SQL> ED
Wrote file afiedt.buf

  1  GRANT SELECT
  2  ON JOBS
  3* TO HR
SQL> /
TO HR
   *
ERROR at line 3:
ORA-01749: you may not GRANT/REVOKE privileges to/from yourself


SQL> GRANT SELECT
  2  ON JOBS
  3  TO HR;
TO HR
   *
ERROR at line 3:
ORA-01749: you may not GRANT/REVOKE privileges to/from yourself


SQL> GRANT SELECT
  2  ON JOBS
  3  TO EMP;
TO EMP
   *
ERROR at line 3:
ORA-01917: user or role 'EMP' does not exist


SQL> GRANT SELECT
  2  ON JOBS
  3  TO SCOTT
  4  ;

Grant succeeded.

SQL> CONNECT
Enter user-name: SCOOT
Enter password: *****
ERROR:
ORA-01017: invalid username/password; logon denied


Warning: You are no longer connected to ORACLE.
SQL> CONNECT
Enter user-name: SCOTT
Enter password: *****
Connected.
SQL> SHOW USER;
USER is "SCOTT"
SQL> SELECT *
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
DEPT                           TABLE
EMP                            TABLE
BONUS                          TABLE
SALGRADE                       TABLE
SUD                            TABLE

SQL> SELECT
  2  
SQL> 
SQL> SELECT*
  2  FROM JOBS
  3  ;
FROM JOBS
     *
ERROR at line 2:
ORA-00942: table or view does not exist


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

SQL> SHOW USER
USER is "SCOTT"
SQL> SELECT*
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
DEPT                           TABLE
EMP                            TABLE
BONUS                          TABLE
SALGRADE                       TABLE
SUD                            TABLE

SQL> CONNECT
Enter user-name: HR
Enter password: *****
Connected.
SQL> SELECT *
  2  FROM JOBS;

JOB_ID     JOB_TITLE                           MIN_SALARY MAX_SALARY
---------- ----------------------------------- ---------- ----------
AD_PRES    President                                20000      40000
AD_VP      Administration Vice President            15000      30000
AD_ASST    Administration Assistant                  3000       6000
FI_MGR     Finance Manager                           8200      16000
FI_ACCOUNT Accountant                                4200       9000
AC_MGR     Accounting Manager                        8200      16000
AC_ACCOUNT Public Accountant                         4200       9000
SA_MAN     Sales Manager                            10000      20000
SA_REP     Sales Representative                      6000      12000
PU_MAN     Purchasing Manager                        8000      15000
PU_CLERK   Purchasing Clerk                          2500       5500
ST_MAN     Stock Manager                             5500       8500
ST_CLERK   Stock Clerk                               2000       5000
SH_CLERK   Shipping Clerk                            2500       5500
IT_PROG    Programmer                                4000      10000
MK_MAN     Marketing Manager                         9000      15000
MK_REP     Marketing Representative                  4000       9000
HR_REP     Human Resources Representative            4000       9000
PR_REP     Public Relations Representative           4500      10500

19 rows selected.

SQL> REVOKE SELECT
  2  ON JOBS
  3  FROM HR;
FROM HR
     *
ERROR at line 3:
ORA-01749: you may not GRANT/REVOKE privileges to/from yourself


SQL> CONNECT
Enter user-name: SCOTT
Enter password: *****
Connected.
SQL> SELECT *
  2  FROM HR.JOBS;

JOB_ID     JOB_TITLE                           MIN_SALARY MAX_SALARY
---------- ----------------------------------- ---------- ----------
AD_PRES    President                                20000      40000
AD_VP      Administration Vice President            15000      30000
AD_ASST    Administration Assistant                  3000       6000
FI_MGR     Finance Manager                           8200      16000
FI_ACCOUNT Accountant                                4200       9000
AC_MGR     Accounting Manager                        8200      16000
AC_ACCOUNT Public Accountant                         4200       9000
SA_MAN     Sales Manager                            10000      20000
SA_REP     Sales Representative                      6000      12000
PU_MAN     Purchasing Manager                        8000      15000
PU_CLERK   Purchasing Clerk                          2500       5500
ST_MAN     Stock Manager                             5500       8500
ST_CLERK   Stock Clerk                               2000       5000
SH_CLERK   Shipping Clerk                            2500       5500
IT_PROG    Programmer                                4000      10000
MK_MAN     Marketing Manager                         9000      15000
MK_REP     Marketing Representative                  4000       9000
HR_REP     Human Resources Representative            4000       9000
PR_REP     Public Relations Representative           4500      10500

19 rows selected.

SQL> REVOKE SELECT
  2  ON JOBS
  3  FROM HR;
ON JOBS
   *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ED
Wrote file afiedt.buf

  1  REVOKE SELECT
  2  ON JOBS
  3* FROM SCOTT
SQL> ;
  1  REVOKE SELECT
  2  ON JOBS
  3* FROM SCOTT
SQL> /
ON JOBS
   *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ED
Wrote file afiedt.buf

  1  REVOKE SELECT
  2  ON HR.JOBS
  3* FROM SCOTT
SQL> /
FROM SCOTT
     *
ERROR at line 3:
ORA-01749: you may not GRANT/REVOKE privileges to/from yourself


SQL> ED
Wrote file afiedt.buf

  1  REVOKE SELECT
  2  ON JOBS
  3* FROM SCOTT
SQL> ED
Wrote file afiedt.buf

  1  REVOKE SELECT
  2  ON JOBS
  3* FROM HR
SQL> /
ON JOBS
   *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> CONNECT
Enter user-name: 
ERROR:
ORA-01017: invalid username/password; logon denied


Warning: You are no longer connected to ORACLE.
SQL> 
SQL> 
SQL> 
SQL> SHOW USER;
USER is ""
SQL> CONECT
SP2-0042: unknown command "CONECT" - rest of line ignored.
SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> CONECT
SP2-0042: unknown command "CONECT" - rest of line ignored.
SQL> CONNECT
Enter user-name: SCOTT
Enter password: *****
Connected.
SQL> SHOW USER
USER is "SCOTT"
SQL> SELECT*
  2  FROM HR.JOBS;

JOB_ID     JOB_TITLE                           MIN_SALARY MAX_SALARY
---------- ----------------------------------- ---------- ----------
AD_PRES    President                                20000      40000
AD_VP      Administration Vice President            15000      30000
AD_ASST    Administration Assistant                  3000       6000
FI_MGR     Finance Manager                           8200      16000
FI_ACCOUNT Accountant                                4200       9000
AC_MGR     Accounting Manager                        8200      16000
AC_ACCOUNT Public Accountant                         4200       9000
SA_MAN     Sales Manager                            10000      20000
SA_REP     Sales Representative                      6000      12000
PU_MAN     Purchasing Manager                        8000      15000
PU_CLERK   Purchasing Clerk                          2500       5500
ST_MAN     Stock Manager                             5500       8500
ST_CLERK   Stock Clerk                               2000       5000
SH_CLERK   Shipping Clerk                            2500       5500
IT_PROG    Programmer                                4000      10000
MK_MAN     Marketing Manager                         9000      15000
MK_REP     Marketing Representative                  4000       9000
HR_REP     Human Resources Representative            4000       9000
PR_REP     Public Relations Representative           4500      10500

19 rows selected.

SQL> REVOKE SELECT
  2  ON JOBS
  3  TO SCOTT;
TO SCOTT
*
ERROR at line 3:
ORA-00905: missing keyword


SQL> ED
Wrote file afiedt.buf

  1  REVOKE SELECT
  2  ON JOBS
  3* FROM SCOTT
SQL> /
ON JOBS
   *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> REVOKE SELECT
  2  ON JOBS
  3  FROM SCOTT;
ON JOBS
   *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> SHOW USER
USER is "SCOTT"
SQL> SELECT*
  2  FROM HR.JOBS;

JOB_ID     JOB_TITLE                           MIN_SALARY MAX_SALARY
---------- ----------------------------------- ---------- ----------
AD_PRES    President                                20000      40000
AD_VP      Administration Vice President            15000      30000
AD_ASST    Administration Assistant                  3000       6000
FI_MGR     Finance Manager                           8200      16000
FI_ACCOUNT Accountant                                4200       9000
AC_MGR     Accounting Manager                        8200      16000
AC_ACCOUNT Public Accountant                         4200       9000
SA_MAN     Sales Manager                            10000      20000
SA_REP     Sales Representative                      6000      12000
PU_MAN     Purchasing Manager                        8000      15000
PU_CLERK   Purchasing Clerk                          2500       5500
ST_MAN     Stock Manager                             5500       8500
ST_CLERK   Stock Clerk                               2000       5000
SH_CLERK   Shipping Clerk                            2500       5500
IT_PROG    Programmer                                4000      10000
MK_MAN     Marketing Manager                         9000      15000
MK_REP     Marketing Representative                  4000       9000
HR_REP     Human Resources Representative            4000       9000
PR_REP     Public Relations Representative           4500      10500

19 rows selected.

SQL> REVOKE SELECT
  2  ON JOBS
  3  FROM SCOTT;
ON JOBS
   *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> REVOKE SELECT
  2  ON JOBS
  3  FROM SCOTT.JOBS;
FROM SCOTT.JOBS
          *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> REVOKE SELECT
  2  ON JOBS
  3  FROM HR.JOBS;
FROM HR.JOBS
       *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> SHOW USER;
USER is "SCOTT"
SQL> CONNECT
Enter user-name: HR
Enter password: *****
Connected.
SQL> REVOKE SELECT
  2  ON JOBS
  3  FROM SCOTT;

Revoke succeeded.
