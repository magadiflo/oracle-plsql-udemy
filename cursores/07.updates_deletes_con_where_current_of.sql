--07. Updates y deletes con WHERE CURRENT OF
SET SERVEROUTPUT ON;

DECLARE
    empl employees%ROWTYPE;
    
    CURSOR c_cursor 
    IS SELECT * 
        FROM employees
    FOR UPDATE; --Bloqueamos la consulta para que otros usuarios no alterarla mientras se ejecuta el cursor
   
BEGIN 
    OPEN c_cursor;
    LOOP
        FETCH c_cursor INTO empl;
        EXIT WHEN c_cursor%NOTFOUND;
        
        IF empl.COMMISSION_PCT IS NOT NULL THEN
            UPDATE employees
            SET salary = salary * 1.10 
            WHERE CURRENT OF c_cursor; --Fila en la que me encuentro en ese momento
        ELSE
            UPDATE employees
            SET salary = salary * 1.15
            WHERE CURRENT OF c_cursor;
            
        END IF;
    END LOOP;
    
    CLOSE c_cursor;
    
END;
