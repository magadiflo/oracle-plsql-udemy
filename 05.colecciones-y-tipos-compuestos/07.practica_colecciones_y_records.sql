--07. Práctica de colecciones y records
SET SERVEROUTPUT ON;

DECLARE
    --TYPE RECORD
    TYPE empl_record IS RECORD(
        name VARCHAR2(100),
        sal employees.salary%TYPE,
        cod_dept employees.department_id%TYPE
    );
    
    --TYPE TABLE
    TYPE empl_table IS TABLE OF
        empl_record
    INDEX BY PLS_INTEGER;
    
    var_empl_table empl_table;

BEGIN
    FOR i IN 1..107 LOOP
        SELECT e.first_name || ' ' || e.last_name, e.salary, e.department_id 
            INTO var_empl_table(i)
        FROM employees e 
        WHERE e.employee_id = i + 99;
    END LOOP;
    
    dbms_output.put_line('1° Visualizando toda la colección');
    FOR i IN var_empl_table.FIRST..var_empl_table.LAST LOOP
        dbms_output.put_line(var_empl_table(i).name || ', ' || var_empl_table(i).sal || ', ' || var_empl_table(i).cod_dept);
    END LOOP;
    
    dbms_output.put_line('2° Visualizando el primer empleado');    
    dbms_output.put_line(var_empl_table(var_empl_table.FIRST).name);
    dbms_output.put_line('');
    
    dbms_output.put_line('3° Visualizando el último empleado');
    dbms_output.put_line(var_empl_table(var_empl_table.LAST).name);
    dbms_output.put_line('');
    
    dbms_output.put_line('4° Visualizando el número de empleados');
    dbms_output.put_line(var_empl_table.COUNT);
    dbms_output.put_line('');
    
    dbms_output.put_line('5° Borramos los empleados que ganan menos de 7000 y visualizamos de nuevo la colección');
    FOR i IN var_empl_table.FIRST..var_empl_table.LAST LOOP
        IF var_empl_table(i).sal < 7000 THEN
            dbms_output.put_line(var_empl_table(i).name || ', eliminado!');
            var_empl_table.DELETE(i);            
        END IF;
    END LOOP;
    dbms_output.put_line('');
    
    dbms_output.put_line('6° Número de empleados luego de la eliminación');
    dbms_output.put_line(var_empl_table.COUNT);
    dbms_output.put_line('');
    
END;