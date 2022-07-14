--05. Bucle for con subqueries
SET SERVEROUTPUT ON;
    
BEGIN 
    FOR i IN (SELECT * FROM regions) LOOP    
        dbms_output.put_line(i.region_name);
    END LOOP;
END;

/*
Se abre un cursor directamente el el for 
a través del select
*/