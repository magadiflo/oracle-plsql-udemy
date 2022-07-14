--06.Práctica con excepciones
SET SERVEROUTPUT ON;

/*EJERCICIO 01*/
DECLARE
    empleado_id employees.employee_id%TYPE;
    nombre employees.first_name%TYPE;
        
BEGIN
    empleado_id := 1000;
    
    SELECT first_name 
        INTO nombre
    FROM employees
    WHERE employee_id = empleado_id;

    dbms_output.put_line(nombre);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Empleado inexistente');
END;
/

/*EJERCICIO 02*/
DECLARE
    nombre employees.first_name%TYPE;
        
BEGIN
    SELECT first_name 
        INTO nombre
    FROM employees
    WHERE employee_id > 100;

    dbms_output.put_line(nombre);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Empleado inexistente');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Demasiados empleados en la consulta');
END;
/

/*EJERCICIO 03*/
DECLARE
    salario employees.salary%TYPE;
        
BEGIN
    SELECT salary 
        INTO salario
    FROM employees
    WHERE employee_id = 100;

    dbms_output.put_line(salario/0);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Empleado inexistente');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Demasiados empleados en la consulta');
    WHEN OTHERS THEN
        dbms_output.put_line(SQLCODE);
        dbms_output.put_line(SQLERRM);
END;
/

/*EJERCICIO 04. 
El error -00001 es clave primaria duplicada. Aunque ya existe una predefinida 
(DUP_VAL_ON_INDEX) vamos a crear una excepción no -predefinida que haga lo mismo.*/
DECLARE
    duplicado_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(duplicado_exception, -00001);
        
BEGIN
    INSERT INTO regions(region_id, region_name)
    VALUES(1, 'Europa Moderna');
    
EXCEPTION
    WHEN duplicado_exception THEN
        dbms_output.put_line('Clave duplicada, intente otra por favor');

END;
/