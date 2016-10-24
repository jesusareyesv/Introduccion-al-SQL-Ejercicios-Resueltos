/*
1. Escriba una consulta para visualizar el apellido del empleado, el número y el nombre de
departamento para todos los empleados.
*/

SELECT LAST_NAME, e.DEPARTMENT_ID, DEPARTMENT_NAME from EMPLOYEES e, DEPARTMENTS d where e.DEPARTMENT_ID = d.DEPARTMENT_ID;

/* o */

SELECT LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME from EMPLOYEES e JOIN DEPARTMENTS d USING (DEPARTMENT_ID);

/*
2. Cree un listado único de todos los cargos que haya en el departamento 80. Incluya la
ubicación del departamento en el resultado.
*/

SELECT DISTINCT JOB_ID, LOCATION_ID FROM EMPLOYEES e JOIN DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID and e.DEPARTMENT_ID=80;

/*
3. Escriba una consulta para mostrar el apellido del empleado, el nombre de departamento, el
identificador de ubicación y la ciudad de todos los empleados que perciben comisión.
*/

SELECT LAST_NAME, DEPARTMENT_NAME, d.LOCATION_ID, CITY, e.COMMISSION_PCT 
from EMPLOYEES e 
JOIN DEPARTMENTS d USING ( DEPARTMENT_ID )
JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID WHERE NOT (e.COMMISSION_PCT IS NULL) ORDER BY e.COMMISSION_PCT desc;

/*
4. Visualice el apellido del empleado y el nombre de departamento para todos los empleados que
tengan una a (minúsculas) en el apellido. Coloque la sentencia SQL en un archivo de texto
llamado lab4_4.sql.*/

SELECT LAST_NAME, DEPARTMENT_NAME FROM EMPLOYEES e JOIN DEPARTMENTS d USING (DEPARTMENT_ID) WHERE LAST_NAME LIKE '%a%';

/*
5. Escriba una consulta para visualizar el apellido, el cargo, el número y el nombre de
departamento para todos los empleados que trabajan en Toronto.
*/

SELECT LAST_NAME, JOB_TITLE, e.DEPARTMENT_ID, DEPARTMENT_NAME 
FROM EMPLOYEES e 
JOIN JOBS j USING (JOB_ID) 
JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN LOCATIONS l USING (LOCATION_ID)
WHERE CITY = 'Toronto';

/*
6. Visualice el apellido y el número del empleado junto con el apellido y el número de su director.
Etiquete las columnas como Employee, Emp#, Manager y Mgr#, respectivamente.
Coloque la sentencia SQL en un archivo de texto llamado lab4_6.sql
*/

SELECT e.LAST_NAME "Employee", e.EMPLOYEE_ID "Emp#", dir.LAST_NAME "Manager", dir.EMPLOYEE_ID "Mgr#"
FROM EMPLOYEES e
JOIN EMPLOYEES dir ON e.MANAGER_ID = dir.EMPLOYEE_ID;

/*
7 .Modifique lab4_6.sql para visualizar a todos los empleados incluyendo a King, que no
tiene director. Ordene los resultados por número de empleado.
Coloque la sentencia SQL en un archivo de texto llamado lab4_7.sql. Ejecute la consulta
en lab4_7.sql.
*/

SELECT e.FIRST_NAME, e.LAST_NAME "Employee", e.EMPLOYEE_ID "Emp#", dir.LAST_NAME "Manager", dir.EMPLOYEE_ID "Mgr#"
FROM EMPLOYEES e
LEFT OUTER JOIN EMPLOYEES dir ON (e.MANAGER_ID = dir.EMPLOYEE_ID) ORDER BY e.LAST_NAME;

/*
8. Cree una consulta que muestre apellidos de empleado, números de departamento y todos los
empleados que trabajan en el mismo departamento que un empleado dado. Asigne a cada
columna la etiqueta adecuada.
*/

SELECT e.LAST_NAME, e.DEPARTMENT_ID, p.LAST_NAME FROM EMPLOYEES e 
JOIN EMPLOYEES p ON e.DEPARTMENT_ID = p.DEPARTMENT_ID;

/*
9. Visualice la estructura de la tabla JOB_GRADES. Cree una consulta en la que pueda visualizar
el nombre, el cargo, el nombre de departamento, el salario y el grado de todos los empleados.
*/

SELECT FIRST_NAME || LAST_NAME "Name", j.JOB_TITLE, d.DEPARTMENT_ID, e.SALARY
FROM EMPLOYEES e
JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN JOBS j ON e.JOB_ID = j.JOB_ID;

/*
10. Cree una consulta para visualizar el apellido y la fecha de contratación de cualquier empleado
contratado después del empleado Davies */

SELECT e.LAST_NAME, e.HIRE_DATE
FROM EMPLOYEES e
JOIN EMPLOYEES da ON e.HIRE_DATE > da.HIRE_DATE
AND da.LAST_NAME='Davies' ORDER BY e.HIRE_DATE;

/*
11. Visualice los nombres y las fechas de contratación de todos los empleados contratados antes
que sus directores, junto con los nombres y las fechas de contratación de estos últimos. Etiquete
las columnas como Employee, Emp Hired, Manager y Mgr Hired, respectivamente.*/

SELECT e.LAST_NAME, e.HIRE_DATE, dir.LAST_NAME, dir.HIRE_DATE
FROM EMPLOYEES e
JOIN EMPLOYEES dir ON e.MANAGER_ID = dir.EMPLOYEE_ID;

