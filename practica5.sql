/*
4. Visualice el salario mayor, el menor, la suma y el salario medio de todos los empleados. Etiquete
las columnas Maximum, Minimum, Sum y Average, respectivamente. Redondee los
resultados hacia el número entero más próximo. Coloque la sentencia SQL en un archivo de
texto llamado lab5_4.sql.*/

SELECT MAX(salary), MIN(SALARY), SUM(SALARY), ROUND(AVG(SALARY),0) FROM EMPLOYEES;

/*
5. Modifique la consulta de lab5_4.sql para visualizar el salario mínimo, el máximo, la suma y
el salario medio para cada tipo de cargo. Vuelva a guardar lab5_4.sql como lab5_5.sql.
Ejecute la sentencia de lab5_5.sql.*/

SELECT JOB_ID, MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID ORDER BY JOB_ID;

/*
6. Escriba una consulta para visualizar el número de personas con el mismo cargo.*/

SELECT JOB_ID, COUNT(*) 
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY JOB_ID;

/*
7. Determine el número de directores sin enumerarlos. Etiquete la columna como Number of
Managers. Indicación: Utilice la columna MANAGER_ID para determinar el número de
directores.*/

SELECT SUM(COUNT(DISTINCT MANAGER_ID)) "Number of Managers" 
FROM EMPLOYEES e
GROUP BY MANAGER_ID;

/*
8.Escriba una consulta para visualizar la diferencia entre el salario mayor y el menor. Etiquete la
columna DIFFERENCE.
*/

SELECT (MAX(SALARY) - MIN(SALARY)) "DIFFERENCE" FROM EMPLOYEES;

/*
9. Visualice el número de director y el salario del empleado de menor sueldo para dicho director.
Excluya a todas las personas con director desconocido. Excluya los grupos donde el salario
mínimo sea $6.000 o inferior. Ordene el resultado en orden descendente de salario.*/

SELECT MANAGER_ID, MIN(SALARY) 
FROM EMPLOYEES 
GROUP BY MANAGER_ID
HAVING MIN(SALARY) > 6000 AND NOT (MANAGER_ID IS NULL)
ORDER BY MIN(SALARY) DESC;

/*
10. Escriba una consulta para visualizar el nombre, la ubicación, el número de empleados y el
salario medio de todos los empleados de cada departamento. Etiquete las columnas como
Name, Location, Number of People y Salary, respectivamente. Redondee el salario
medio en dos posiciones decimales.*/

SELECT DEPARTMENT_NAME "NAME", d.location_id "Location", COUNT(*) "Number of People", AVG(SALARY) "Salary (average)"
FROM EMPLOYEES e, DEPARTMENTS d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME,d.location_id;

/*
11. Cree una consulta que muestre el número total de empleados y, de ese total, el número de
empleados contratados en 1995, 1996, 1997 y 1998. Cree las cabeceras de columna adecuadas*/

SELECT SUM(DECODE(TO_CHAR(HIRE_DATE,'YYYY'),
          '2003',1,
          '2004',1,
          '2005',1,
          '2006',1,0)) as "Total",
      SUM(DECODE(TO_CHAR(HIRE_DATE,'YYYY'),'2003',1,0)) as "2003",
      SUM(DECODE(TO_CHAR(HIRE_DATE,'YYYY'),'2004',1,0)) as "2004",
      SUM(DECODE(TO_CHAR(HIRE_DATE,'YYYY'),'2005',1,0)) as "2005",
      SUM(DECODE(TO_CHAR(HIRE_DATE,'YYYY'),'2006',1,0)) as "2006"
FROM EMPLOYEES;

/*
12. Cree una consulta matriz para visualizar el cargo, el salario para dicho cargo basado en el
número de departamento y el salario total para dicho cargo, para los departamentos 20, 50, 80
y 90, asignando a cada columna la cabecera apropiada*/

SELECT JOB_ID "Job",
  SUM (DECODE(e.department_id,20,salary,0)) AS "Departamento 20",
  SUM (DECODE(e.department_id,50,salary,0)) AS "Departamento 50",
  SUM (DECODE(e.department_id,80,salary,0)) AS "Departamento 80",
  SUM (DECODE(e.DEPARTMENT_ID,90,salary,0)) AS "Departamento 90",
  SUM(salary) AS "Salario Total"
FROM EMPLOYEES e
GROUP BY JOB_ID 
order by JOB_ID ASC;
