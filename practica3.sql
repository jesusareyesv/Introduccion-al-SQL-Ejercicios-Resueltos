/*Escriba una consulta para mostrar la fecha actual. Etiquete la columna como Date.*/
select SYSDATE from DUAL;

/*2. Para cada empleado, visualice su número, apellido, salario y salario incrementado en el 15 % y
expresado como número entero. Etiquete la columna como New Salary. Ponga la sentencia
SQL en un archivo de texto llamado lab3_2.sql.*/
select employee_id, last_name,salary, trunc(salary*1.15,0) "New Salary" from employees order by employee_id desc;

/*
4. Modifique la consulta lab3_2.sql para agregar una columna que reste el salario antiguo
del nuevo. Etiquete la columna como Increase. Guarde el contenido del archivo como
lab3_4.sql. Ejecute la consulta revisada.*/
select employee_id, last_name,salary, trunc(salary*1.15,0) "New Salary", (trunc(salary*1.15,0) - salary) "Increase" from employees order by employee_id desc;

/*
5. Escriba una consulta que muestre los apellidos de los empleados con la primera letra en
mayúsculas y todas las demás en minúsculas, así como la longitud de los nombres, para todos
los empleados cuyos nombres comienzan por J, A o M. Asigne a cada columna la etiqueta
correspondiente. Ordene los resultados según los apellidos de los empleados.*/

select INITCAP(last_name) "Last name", LENGTH(first_name) "Last name length" 
from employees 
where last_name like 'A%'
      or last_name like 'J%'
      or last_name like 'M%' order by last_name asc;
      
/*
6. Para cada empleado, muestre su apellido y calcule el número de meses entre el día de hoy y la
fecha de contratación. Etiquete la columna como MONTHS_WORKED. Ordene los resultados
según el número de meses trabajados. Redondee el número de meses hacia arriba hasta el
número entero más próximo.*/

SELECT LAST_NAME, ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE),0) "MONTHS_WORKED"
  from employees order by MONTHS_BETWEEN( HIRE_DATE, SYSDATE);
  

/*
7. Escriba una consulta que produzca lo siguiente para cada empleado:
<employee last name> earns <salary> monthly but wants <3 times
salary>. Etiquete la columna como Dream Salaries.*/

SELECT CONCAT(last_name,CONCAT(' earns ',CONCAT(salary,CONCAT(' montly but wants ', 3*salary))))  "Dream Salaries" from employees;

/* o también*/

SELECT (last_name || ' earns ' || salary || ' montly but wants ' || 3 * salary) "Deam Salaries 2" FROM EMPLOYEES;

/*
8. Cree una consulta para mostrar el apellido y el salario de todos los empleados. Formatee el
salario para que tenga 15 caracteres, rellenando a la izquierda con $. Etiquete la columna como
SALARY.*/

SELECT LAST_NAME, LPAD(SALARY,15,'$') "SALARY" FROM EMPLOYEES;

/*
9. Muestre el apellido de cada empleado, así como la fecha de contratación y la fecha de revisión
de salario, que es el primer lunes después de cada seis meses de servicio. Etiquete la columna
REVIEW. Formatee las fechas para que aparezca en un formato similar a “Monday, the ThirtyFirst of July, 2000”.*/

SELECT LAST_NAME,HIRE_DATE, TO_CHAR(NEXT_DAY(ADD_MONTHS(HIRE_DATE,6),'VIERNES'), 'DAY ", the" fmDdspth "of" MONTH"," YYYY') "REVIEW_DATE" from employees;

/*
10. Muestre el apellido, la fecha de contratación y el día de la semana en el que comenzó el
empleado. Etiquete la columna DAY. Ordene los resultados por día de la semana, comenzan
por el lunes.*/

SELECT LAST_NAME, HIRE_DATE, TO_CHAR(HIRE_DATE,'DAY') "Day" 
from employees
order by 
  (CASE TO_NUMBER(TO_CHAR(HIRE_DATE,'D')) WHEN 1 then 8 else TO_NUMBER(TO_CHAR(HIRE_DATE,'D')) END )
  asc;
  
/*
11. Cree una consulta que muestre el apellido y las comisiones de los empleados. Si un empleado
no gana comisión, ponga “No Commission”. Etiquete la columna COMM.*/

SELECT LAST_NAME, NVL2(COMMISSION_PCT,TO_CHAR(COMMISSION_PCT), 'No commission') "COMM" from employees;

/*
12. Cree una consulta que muestre el apellido de los empleados y que indique las cantidades de sus
salarios anuales con asteriscos. Cada asterisco significa mil dólares. Ordene los datos por
salario en orden descendente. Etiquete la columna EMPLOYEES_AND_THEIR_SALARIES*/

SELECT (LAST_NAME || ' ' ||  LPAD(' ', SALARY / 1000 + 1, '*')), SALARY/1000 "EMPLOYEES_AND_THEIR_SALARIES" from EMPLOYEES;

/*
13. Utilizando la función DECODE, escriba una consulta que muestre el grado de todos los empleados
basándose en el valor de la columna JOB_ID, según los datos siguientes:
  
  Cargo       Grado
  AD_PRES     A
  ST_MAN      B
  IT_PROG     C
  SA_REP      D
  ST_CLERK    E
  Ninguno de los anterio 0
*/

SELECT FIRST_NAME, LAST_NAME, JOB_ID, 
  DECODE (JOB_ID,
          'AD_PRES','A',
          'ST_MAN', 'B',
          'IT_PROG','C',
          'SA_REP','D',
          'ST_CLERK','E',
          '0') "GRADO" 
from EMPLOYEES;

/*
14. Vuelva a escribir la sentencia de la pregunta anterior utilizando la sintaxis CASE.*/

SELECT first_name, last_name, job_id,
    CASE JOB_ID
      WHEN 'AD_PRES' THEN 'A'
      WHEN 'ST_MAN' THEN 'B'
      WHEN 'IT_PROG' THEN 'C'
      WHEN 'SA_REP' THEN 'D'
      WHEN 'ST_CLERK' THEN 'E'
      ELSE '0'
      END "GRADO"
FROM EMPLOYEES;
