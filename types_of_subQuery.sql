Types of SQL SubQuery

1. Single Row SubQuery. (= , != , < , > , <= , >= )
2. Multi Row SubQuery. (IN , NOT IN , ALL , ANY)


ASSIGNMENT ON TYPES OF SUB QUERY.



51.)  WAQTD NAME OF THE EMPLOYEES EARNING SALARY MORE THAN THE SALESMAN

SQL> SELECT ENAME FROM EMP 
  2  WHERE SAL >ALL (SELECT SAL FROM EMP WHERE JOB IN 'SALESMAN');

ENAME
----------
JONES
BLAKE
CLARK
SCOTT
KING
FORD

SQL> SELECT ENAME FROM EMP 
  2  WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE  JOB IN 'SALESMAN');

ENAME
----------
JONES
BLAKE
CLARK
SCOTT
KING
FORD

52.)  WAQTD DETAILS OF THE EMPLOYEES HIRED AFTER ALL THE CLERKS

SQL> SELECT * FROM EMP
  2  WHERE HIREDATE >ALL (SELECT HIREDATE FROM EMP WHERE JOB IN 'CLERK');

no rows selected

53.) WAQTD NAME AND SALARY FOR ALL THE EMPLOYEES IF THEY ARE EARNING LESS THAN ATLEST A MANAGER

SQL> SELECT ENAME , SAL FROM EMP 
  2  WHERE SAL <ANY 
  3  (SELECT SAL FROM EMP WHERE JOB IN 'MANAGER');

  ENAME             SAL
---------- ----------
SMITH             800
JAMES             950
ADAMS            1100
WARD             1250
MARTIN           1250
MILLER           1300
TURNER           1500
ALLEN            1600
CLARK            2450
BLAKE            2850
JONES            2975


54.) WAQTD NAME AND HIREDATE OF EMPLOYEES HIRED BEFORE ALL THE MANAGERS

SQL> 1  SELECT ENAME , HIREDATE FROM EMP
  2  WHERE HIREDATE <ALL
  3* (SELECT HIREDATE FROM EMP WHERE JOB IN 'MANAGER')


ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80
ALLEN      20-FEB-81
WARD       22-FEB-81

55.)  WAQTD NAMES OF THE EMPLOYEES HIRED AFTER ALL THE MANAGERS AND EARNING SALARY MORE THAN ALL THE CLERKS

SQL> 1  SELECT ENAME , HIREDATE , SAL FROM EMP
  2  WHERE HIREDATE <ALL
  3  (SELECT HIREDATE FROM EMP WHERE JOB IN 'MANAGER') AND
  4* SAL >ALL (SELECT SAL FROM EMP WHERE JOB IN 'CLERK')


ENAME      HIREDATE         SAL
---------- --------- ----------
ALLEN      20-FEB-81       1600

56.) WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK AND HIRED BEFORE ATLEST A SALESMAN

SQL> 1  SELECT * FROM EMP
  2  WHERE HIREDATE <ANY
  3* (SELECT HIREDATE FROM EMP WHERE JOB IN 'SALESMAN') AND JOB IN 'CLERK'


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20

57.) WAQTD DETAILS OF EMPLOYEES WORKING IN ACCOUNTING OR SALES DEPT

SQL> 1  SELECT * FROM EMP
  2* WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME IN ('ACCOUNTING','SALES'))


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10


58.)  WAQTD DEPARTMENT NAMES OF THE EMPOYEES WITH NAME SMITH, KING AND MILLER

SQL>  SELECT DNAME FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME IN ('SMITH' , 'KING' , 'MILLER' ))
  2  ;

DNAME
--------------
ACCOUNTING
RESEARCH

59.) WAQTD DETAILS OF EMPLOYEES WORKING NEWYORK OR CHICAGO

SQL> SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEWYORK' , 'CHICAGO')
);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

60.) WAQTD EMP NAMES IF EMPLOYEES ARE HIRED AFTER ALL THE EMPLOYEES OF DEPT 10

SQL> SELECT ENAME FROM EMP
  2  WHERE HIREDATE > (SELECT MAX(HIREDATE) FROM EMP WHERE DEPTNO IN 10);

ENAME
----------
SCOTT
ADAMS