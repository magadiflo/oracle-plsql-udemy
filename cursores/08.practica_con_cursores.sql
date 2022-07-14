--07. Práctica con cursores
/*
1- Hacer un programa que tenga un cursor que vaya visualizando los salarios de los empleados. 
   Si en el cursor aparece el jefe (Steven King) se debe generar un RAISE_APPLICATION_ERROR 
   indicando que el sueldo del jefe no se puede ver.
*/
SET SERVEROUTPUT ON;

DECLARE
    TYPE datos IS RECORD(
        full_name VARCHAR2(200),
        salary employees.salary%TYPE
    );
    
    fila datos;
    
   CURSOR c_empleados 
   IS SELECT  first_name || ' ' || last_name, salary
    FROM employees;
   
BEGIN 
    OPEN c_empleados;
    
    LOOP
        FETCH c_empleados INTO fila;
        EXIT WHEN c_empleados%NOTFOUND;
        
        IF (fila.full_name = 'Steven King') THEN
            RAISE_APPLICATION_ERROR(-20001, 'El sueldo del jefe no puede ser visto');
        END IF;
        
        dbms_output.put_line(fila.full_name || ': S/ ' || fila.salary);
    END LOOP;
    
    CLOSE c_empleados;    
END;
/

/*
2- Hacemos un bloque con dos cursores. (Esto se puede hacer fácilmente con una 
sola SELECT pero vamos a hacerlo de esta manera para probar parámetros en cursores)

    - el primero de empleados
    - El segundo de departamentos que tenga como parámetro el MANAGER_ID
    - Por cada fila del primero, abrimos el segundo curso pasando el ID del MANAGER
    - Debemos pintar el Nombre del departamento y el nombre del MANAGER_ID
    - Si el empleado no es MANAGER de ningún departamento debemos poner “No es jefe de nada”
*/
DECLARE
    TYPE r_empleado IS RECORD(
        dato employees%ROWTYPE
    );
    
    TYPE r_departamento IS RECORD(
        dato departments%ROWTYPE
    );
    
    fila_empl r_empleado;
    fila_dep r_departamento;
    
    CURSOR c_empleados 
    IS SELECT * 
        FROM employees;
        
    CURSOR c_departamentos(id_manager employees.employee_id%TYPE)
    IS SELECT * 
        FROM departments
        WHERE manager_id = id_manager;
 
BEGIN
    OPEN c_empleados;
    LOOP
        FETCH c_empleados INTO fila_empl.dato;
        EXIT WHEN c_empleados%NOTFOUND;
        
        OPEN c_departamentos(fila_empl.dato.employee_id);
           LOOP
                FETCH c_departamentos INTO fila_dep.dato;
                IF c_departamentos%FOUND THEN
                    dbms_output.put_line(fila_empl.dato.first_name || ' ' || fila_empl.dato.last_name || ' ----> ' || fila_dep.dato.department_name);
                    EXIT;
                ELSE
                    dbms_output.put_line(fila_empl.dato.first_name || ' ' || fila_empl.dato.last_name || ': No es jefe de nada');
                    EXIT;
                END IF;
            END LOOP;
        CLOSE c_departamentos;
        ------------------------------------------------------------------------
    END LOOP;
    CLOSE c_empleados;
END;
/
---------------
-- Su equivalente en sql
---------------
SELECT  jefe.employee_id,
        jefe.first_name || ' ' || jefe.last_name AS jefe, 
        CASE
            WHEN dep.department_name IS NOT NULL THEN dep.department_name
            ELSE 'No es jefe de nada'                
         END AS departamento
FROM employees jefe 
    LEFT JOIN departments dep ON(jefe.employee_id = dep.manager_id)
ORDER BY departamento;
/
---------------

/*
3-Crear un cursor con parámetros que pasando el número de departamento 
visualice el número de empleados de ese departamento
*/
DECLARE
    CURSOR c_empleados(num_dep departments.department_id%TYPE)
    IS SELECT COUNT(*)
        FROM employees
        WHERE department_id = num_dep;
        
    total_empleados NUMBER;
    num_dep departments.department_id%TYPE;

BEGIN
    num_dep := 60;
    OPEN c_empleados(num_dep);
    
    FETCH c_empleados INTO total_empleados;
    dbms_output.put_line('Dep: N° ' ||  num_dep || ', total de empleados: ' || total_empleados);
    
    CLOSE c_empleados;
END;
/

SELECT * FROM departments;
SELECT * FROM employees;
/


/*
4-Crear un bucle FOR donde declaramos una subconsulta que nos devuelva el nombre 
de los empleados cuyo JOB_ID sean ST_CLERK. 
Es decir, no declaramos el cursor sino que lo indicamos directamente en el FOR.
*/
BEGIN
    FOR i IN (SELECT first_name FROM employees WHERE job_id = 'ST_CLERK') LOOP
        dbms_output.put_line(i.first_name);
    END LOOP;
END;
/

SELECT * FROM departments;
SELECT * FROM employees WHERE job_id = 'ST_CLERK';
/


/*
5-Creamos un bloque que tenga un cursor para empleados. Debemos crearlo con FOR UPDATE.

Por cada fila recuperada, si el salario es mayor de 8000 incrementamos el salario un 2%
Si es menor de 800 lo hacemos en un 3%
Debemos modificarlo con la cláusula CURRENT OF
Comprobar que los salarios se han modificado correctamente.
*/
DECLARE
    CURSOR c_empleados
    IS SELECT *
        FROM employees
    FOR UPDATE;
        
    v_empleado employees%ROWTYPE;
BEGIN
    OPEN c_empleados;
    LOOP
        FETCH c_empleados INTO v_empleado;
        EXIT WHEN c_empleados%NOTFOUND;
        
        IF v_empleado.salary > 8000 THEN
            UPDATE employees
            SET salary = salary * 1.02
            WHERE CURRENT OF c_empleados;
        ELSIF v_empleado.salary < 800 THEN
            UPDATE employees
            SET salary = salary * 1.03
            WHERE CURRENT OF c_empleados;
        END IF;
        
    END LOOP;
    CLOSE c_empleados;
END;
/
SELECT * FROM employees;















