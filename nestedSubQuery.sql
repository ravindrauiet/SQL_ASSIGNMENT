ASSIGNMENT ON NESTED SUB QUERY :

// FIND MAX AND MIN VALUES .

61.) WAQTD 2ND MINIMUM SALARY

SQL> SELECT MIN(SAL) FROM EMP WHERE SAL IN (SELECT MIN(SAL) FROM EMP );

  MIN(SAL)
----------
       800

62.) WAQTD 5TH MAXIMUM SALARY

SQL> SELECT MAX(SAL) FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE
  2  SAL < ( SELECT MAX(SAL) FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE
  3  SAL < (SELECT MAX(SAL) FROM EMP))));

  MAX(SAL)
----------
      1300

63.) WAQTD NAME OF THE EMPLOYEE EARNING 3RD MAXIMUM SALARY

SQL> SELECT ENAME FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM 
EMP WHERE SAL< (SELECT MAX(SAL) FROM EMP)));

ENAME
----------
JONES

64.)  WAQTD EMPNO OF THE EMPLOYEE EARNING 2D MAXIMUM SALARY

SELECT ENAME , EMPNO ,SAL FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP)));
 

ENAME           EMPNO        SAL
---------- ---------- ----------
SCOTT            7788       3000
FORD             7902       3000

65.) WAQTD DEPARTMENT NAME OF AN EMPLOYEE GETTING 4TH MAX SAL

SQL> SELECT DNAME FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL IN (SELECT MAX(SAL) FR
OM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE SAL < (SELE
CT MAX(SAL) FROM EMP ) ) ) ) );

DNAME
--------------
SALES

66.) WAQTD DETAILS OF THE EMPLOYEE WHO WAS HIRED 2nd

SQL> SELECT * FROM EMP WHERE HIREDATE IN (SELECT MIN(HIREDATE) FROM EMP WHERE HIREDATE > (SELECT MIN
(HIREDATE) FROM EMP ) );

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30


67.) WAQTD NAME OF THE EMPLOYEE HIRED BEFORE THE LAST EMPLOYEE

SQL> SELECT * FROM EMP WHERE HIREDATE IN (SELECT MAX(HIREDATE) FROM EMP WHERE HIREDATE < (SELECT MAX
(HIREDATE) FROM EMP ) );

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20



68.)  WAQTD LOC OF THE EMPLOYEE WHO WAS HIRED FIRST

SQL> SELECT LOC FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE  HIREDATE IN 
  2  (SELECT MIN(HIREDATE) FROM EMP));

LOC
-------------
DALLAS

69.) WAQTD DETAILS OF THE EMPLOYEE EARNING 7TH MINIMUM SALARY

70.) WAQTD DNAME OF EMPLOYEE GETTING 2ND MAXIMUM SALARY

SQL> SELECT DNAME FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL IN (SELECT MAX(SAL) 
  2  FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP)));

DNAME
--------------
RESEARCH
