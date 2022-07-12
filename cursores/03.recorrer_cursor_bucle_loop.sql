--03. Recorrer cursor con el bucle loop
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_cursor
    IS SELECT * 
        FROM regions;
        
    fila_reg regions%ROWTYPE;
    
BEGIN
    OPEN c_cursor;
    
    LOOP
        FETCH c_cursor INTO fila_reg;
        EXIT WHEN c_cursor%NOTFOUND;
    
        dbms_output.put_line(fila_reg.region_name);
    END LOOP;
    
    CLOSE c_cursor;

END;