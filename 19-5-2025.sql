
Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> connect 
Enter user-name: hr
Enter password: *****
Connected.
SQL> shoq
SP2-0042: unknown command "shoq" - rest of line ignored.
SQL> show
SQL> desc;
Usage: DESCRIBE [schema.]object[@db_link]
SQL> show user
USER is "HR"
SQL> select*
  2  from tab;

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
  3* TO SCOTT
SQL> /

Grant succeeded.

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

JOB_ID     JOB_TITLE                           MIN_SALARY MAX_SALARY
---------- ----------------------------------- ---------- ----------
ST_MAN     Stock Manager                             5500       8500
ST_CLERK   Stock Clerk                               2000       5000
SH_CLERK   Shipping Clerk                            2500       5500
IT_PROG    Programmer                                4000      10000
MK_MAN     Marketing Manager                         9000      15000
MK_REP     Marketing Representative                  4000       9000
HR_REP     Human Resources Representative            4000       9000
PR_REP     Public Relations Representative           4500      10500

19 rows selected.

SQL> SELECT USER
  2  FROM JOBS;
FROM JOBS
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2* FROM JOBS
SQL> /
FROM JOBS
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ED
Wrote file afiedt.buf

  1  SELECT *
  2* FROM HR.JOBS
SQL> /

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

JOB_ID     JOB_TITLE                           MIN_SALARY MAX_SALARY
---------- ----------------------------------- ---------- ----------
ST_MAN     Stock Manager                             5500       8500
ST_CLERK   Stock Clerk                               2000       5000
SH_CLERK   Shipping Clerk                            2500       5500
IT_PROG    Programmer                                4000      10000
MK_MAN     Marketing Manager                         9000      15000
MK_REP     Marketing Representative                  4000       9000
HR_REP     Human Resources Representative            4000       9000
PR_REP     Public Relations Representative           4500      10500

19 rows selected.

SQL> CONNECT
Enter user-name: HR
Enter password: *****
Connected.
SQL> SELECT*
  2  FROM HR;
FROM HR
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> SELECT*
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

JOB_ID     JOB_TITLE                           MIN_SALARY MAX_SALARY
---------- ----------------------------------- ---------- ----------
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


SQL> ED
Wrote file afiedt.buf

  1  REVOKE SELECT
  2  ON JOBS
  3* FROM SCOTT
SQL> /

Revoke succeeded.

SQL> CONNECT
Enter user-name: SCOTT
Enter password: *****
Connected.
SQL> SELECT *
  2  FROM HR.JOBS;
FROM HR.JOBS
        *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> DESC
Usage: DESCRIBE [schema.]object[@db_link]
SQL> DESC EMP;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(4)
 ENAME                                              VARCHAR2(10)
 JOB                                                VARCHAR2(9)
 MGR                                                NUMBER(4)
 HIREDATE                                           DATE
 SAL                                                NUMBER(7,2)
 COMM                                               NUMBER(7,2)
 DEPTNO                                             NUMBER(2)

SQL> SELECT* FROM TAB;

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
SQL> CONNECT
Enter user-name: SCOTT/TIGER
Connected.
SQL> SELECT LENGTH('VINAYAK')
  2  FROM DUAL;

LENGTH('VINAYAK')
-----------------
                7

SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,LENGHT(ENAME)
  2* FROM EMP
SQL> /
SELECT ENAME,LENGHT(ENAME)
             *
ERROR at line 1:
ORA-00904: "LENGHT": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,LENGTH(ENAME)
  2* FROM EMP
SQL> /

ENAME      LENGTH(ENAME)
---------- -------------
SMITH                  5
ALLEN                  5
WARD                   4
JONES                  5
MARTIN                 6
BLAKE                  5
CLARK                  5
SCOTT                  5
KING                   4
TURNER                 6
ADAMS                  5

ENAME      LENGTH(ENAME)
---------- -------------
JAMES                  5
FORD                   4
MILLER                 6

14 rows selected.

SQL> SELECT CONCAT('HII',ENAME)
  2  FROMEMP;
FROMEMP
      *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected


SQL> ED
Wrote file afiedt.buf

  1  SELECT CONCAT('HII  ',ENAME)
  2* FROM EMP
SQL> /

CONCAT('HII',EN
---------------
HII  SMITH
HII  ALLEN
HII  WARD
HII  JONES
HII  MARTIN
HII  BLAKE
HII  CLARK
HII  SCOTT
HII  KING
HII  TURNER
HII  ADAMS

CONCAT('HII',EN
---------------
HII  JAMES
HII  FORD
HII  MILLER

14 rows selected.

SQL> SELECT INITCAP(ENAME)
  2  FROM EMP;

INITCAP(EN
----------
Smith
Allen
Ward
Jones
Martin
Blake
Clark
Scott
King
Turner
Adams

INITCAP(EN
----------
James
Ford
Miller

14 rows selected.

SQL> ED
Wrote file afiedt.buf

  1  SELECT REVERSE(ENAME)
  2* FROM EMP
SQL> /

REVERSE(EN
----------
HTIMS
NELLA
DRAW
SENOJ
NITRAM
EKALB
KRALC
TTOCS
GNIK
RENRUT
SMADA

REVERSE(EN
----------
SEMAJ
DROF
RELLIM

14 rows selected.

SQL> SELECT SUBSTR('MANGO",2)
  2  FROM DUAL;
ERROR:
ORA-01756: quoted string not properly terminated


SQL> ED
Wrote file afiedt.buf

  1  SELECT SUBSTR('MANGO',2)
  2* FROM DUAL
SQL> /

SUBS
----
ANGO

SQL> SELECT SUBSTR (ENAME,1,LENGTH((ENAME)/2)
  2  FROM EMP;
FROM EMP
*
ERROR at line 2:
ORA-00907: missing right parenthesis


SQL> ED
Wrote file afiedt.buf

  1  SELECT SUBSTR(ENAME,1,LENGTH((ENAME)/2)
  2* FROM EMP
SQL> /
FROM EMP
*
ERROR at line 2:
ORA-00907: missing right parenthesis


SQL> ED
Wrote file afiedt.buf

  1  SELECT SUBSTR('ENAME',1,LENGTH((ENAME)/2)
  2* FROM EMP
SQL> /
FROM EMP
*
ERROR at line 2:
ORA-00907: missing right parenthesis


SQL> ED
Wrote file afiedt.buf

  1  SELECT SUBSTR('ENAME',1,LENGTH(ENAME)/2)
  2* FROM EMP
SQL> /

SUBST
-----
EN
EN
EN
EN
ENA
EN
EN
EN
EN
ENA
EN

SUBST
-----
EN
EN
ENA

14 rows selected.

SQL> SELECT INSTR ('VINAYAK','I',1,2)
  2  FROM DUAL;

INSTR('VINAYAK','I',1,2)
------------------------
                       0

SQL> ED
Wrote file afiedt.buf

  1  SELECT INSTR ('VINAYAK','A',4,6)
  2* FROM DUAL
SQL> /

INSTR('VINAYAK','A',4,6)
------------------------
                       0

SQL> ED
Wrote file afiedt.buf

  1  SELECT INSTR ('VINAYAK','A',1,2)
  2* FROM DUAL
SQL> /

INSTR('VINAYAK','A',1,2)
------------------------
                       6

SQL> SELECCT ROUND(72.3)
SP2-0734: unknown command beginning "SELECCT RO..." - rest of line ignored.
SQL> FROM DUAL;
SP2-0042: unknown command "FROM DUAL" - rest of line ignored.
SQL> ED
Wrote file afiedt.buf

  1  SELECT INSTR ('VINAYAK','A',1,2)
  2* FROM DUAL
SQL> SELECT ROUND(23.3)
  2  FROM DUAL;

ROUND(23.3)
-----------
         23

SQL> SELECT TRUNC(76.9)
  2  FROM DUAL;

TRUNC(76.9)
-----------
         76

SQL> SYSDATE
SP2-0042: unknown command "SYSDATE" - rest of line ignored.
SQL> SELECT SYSATE
  2  FROM DUAL;
SELECT SYSATE
       *
ERROR at line 1:
ORA-00904: "SYSATE": invalid identifier


SQL> ED
Wrote file afiedt.buf

  1  SELECT SYSDATE
  2* FROM DUAL
SQL> /

SYSDATE
---------
19-MAY-25

SQL> SELECT CURRENT_DATE;
SELECT CURRENT_DATE
                  *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> SELECT MONTHS_BETWEEN('19-MAY-25','19-DEC-78')
  2  from dual;

MONTHS_BETWEEN('19-MAY-25','19-DEC-78')
---------------------------------------
                                    557

SQL> SELECT LAST_DAY('31-DEC_1981'
  2  FROM DUAL;
FROM DUAL
*
ERROR at line 2:
ORA-00907: missing right parenthesis


SQL> ED
Wrote file afiedt.buf

  1  SELECT LAST_DAY('31-DEC_1981')
  2* FROM DUAL
SQL> /

LAST_DAY(
---------
31-DEC-81

SQL> SELECT SAL+NULL(COMM,0)
  2  FROM EMP;
SELECT SAL+NULL(COMM,0)
               *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> ED
Wrote file afiedt.buf

  1  SELECT SAL+NUL(COMM,0)
  2* FROM EMP
SQL> /
SELECT SAL+NUL(COMM,0)
           *
ERROR at line 1:
ORA-00904: "NUL": invalid identifier


SQL>   