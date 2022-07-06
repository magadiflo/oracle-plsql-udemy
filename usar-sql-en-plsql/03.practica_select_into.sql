--03.Práctica con SELECT INTO
SET SERVEROUTPUT ON;

/*Práctica 01*/
DECLARE
    salario_maximo employees.salary%TYPE;
BEGIN
    SELECT MAX(salary)
        INTO salario_maximo
    FROM employees
    WHERE department_id = 100;
    
    dbms_output.put_line(salario_maximo);
END;

/*Práctica 02*/
DECLARE
    tipo_trabajo jobs.job_title%TYPE;
BEGIN
    SELECT j.job_title 
        INTO tipo_trabajo
    FROM employees e 
        INNER JOIN jobs j ON(e.job_id = j.job_id)
    WHERE e.employee_id = 100;
    dbms_output.put_line('El empleado con id 100 es: ' || tipo_trabajo);
END;

/*Práctica 03*/
DECLARE
    dep_id departments.department_id%TYPE := 1;
    
    id_departamento departments.department_id%TYPE;
    nombre_departamento departments.department_name%TYPE;
    total_empleados INTEGER;
BEGIN
    SELECT d.department_id, d.department_name, COUNT(e.employee_id)
        INTO id_departamento, nombre_departamento, total_empleados
    FROM employees e    
        INNER JOIN departments d ON(e.department_id = d.department_id)
    GROUP BY d.department_id, d.department_name
    HAVING d.department_id = dep_id;
    
    dbms_output.put_line(nombre_departamento || ': ' || total_empleados);

END;

    
