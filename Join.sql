---------------------  JOINS  -------------------------


Joins are used to reterive the data from multiple tables simultaneously


We have Five Types of Join

1. CROSS JOIN
2. INNER JOIN
3. NATURAL JOIN
4. OUTER JOIN
  -> LEFT OUTER JOIN
  -> RIGHT OUTER JOIN
  -> FULL OUTER JOIN
5. SELF JOIN


-------------------------  CROSS JOIN  ------------------------

The CROSS JOIN keyword returns all records from both tables (table1 and table2).

SYNTAX :- ANSI

SELECT column_name
FROM table1 CROSS JOIN table2;

SYNTAX :- ORACLE

SELECT column_name
FROM table1,table2;

Example :-

SELECT * 
FROM emp,dept;

---------------------------- INNER JOIN -------------------------------

INNER Join is used to obtain the Matching Record 

SYNTAX :- ANSI

SELECT column_name
FROM table1 INNER JOIN table2;

SYNTAX :- ORACLE

SELECT column_name
FROM table1,table2;
Where table1.column_name IN table.column_names;

Example :-

SELECT * 
FROM emp,dept;
Where emp.deptno IN dept.deptno;


------------------------- NATURAL JOIN -----------------------------


If two tables have common column then natural join will give the output of inner join.

If two tables do not have common column then it will give the output catersian join.

SYNTAX :- ANSI 

SELECT column_name
FROM  table1  NATURAL JOIN table2;


SYNTAX :- ORACLE

no SYNTAX in oracle SQL

Example :- 

SELECT *
FROM emp NATURAL JOIN dept;


continue................................................................