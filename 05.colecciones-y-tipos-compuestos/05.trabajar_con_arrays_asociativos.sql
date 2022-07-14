--05. Trabajar con arrays asociativos
SET SERVEROUTPUT ON;

DECLARE
    --Declaraci�n de un array asociativo
    TYPE departamentos IS TABLE OF
        departments.department_name%TYPE
    INDEX BY PLS_INTEGER;
    
    TYPE empleados IS TABLE OF
        employees%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    --Definiendo variables del tipo array asociativo
    depts departamentos;
    emples empleados;

BEGIN
    -- Tipo simple
    depts(1) := 'Inform�tica';
    depts(2) := 'RRHH';
    
    dbms_output.put_line(depts(1));
    dbms_output.put_line(depts(2));
    dbms_output.put_line('�ltima posici�n: ' || depts.last);
    dbms_output.put_line('Primera posici�n: ' || depts.first);
    
    IF depts.exists(3) THEN
        dbms_output.put_line(depts(3));
    ELSE
        dbms_output.put_line('El valor en �ndice 3, no existe');
    END IF;
    
    --Tipo compuesto
    SELECT * 
        INTO emples(1)
    FROM employees
    WHERE employee_id = 100;
    
    dbms_output.put_line(emples(1).first_name);   

END;