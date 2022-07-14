--06. Cursores con parámetros
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_cursor(sal NUMBER) 
    IS SELECT * 
        FROM employees
        WHERE salary > sal;
        
    empl employees%ROWTYPE;
BEGIN 
    OPEN c_cursor(8000);
    
    LOOP
        FETCH c_cursor INTO empl;
        EXIT WHEN c_cursor%NOTFOUND;
        dbms_output.put_line(empl.first_name || ' ' || empl.salary);
    END LOOP;
    
    dbms_output.put_line('He encontrado ' || c_cursor%ROWCOUNT || ' empleados');
    
    CLOSE c_cursor;
END;
