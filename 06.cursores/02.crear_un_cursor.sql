--02. Crear un cursor
/*
NOTA: En ORACLE, no se puede ir hacia adelante, hacia atrás, 
es decir moverse en cualquier dirección como se hace con otras
bases de datos, como en SQLServer. 
En Oracle se avanza secuencialmente en los cursores
*/
SET SERVEROUTPUT ON;

DECLARE
    --1° Declaramos el cursor
    CURSOR c_cursor
    IS SELECT * 
        FROM regions;
        
    fila_reg regions%ROWTYPE;
    
BEGIN
    --2° Abrimos el cursor
    OPEN c_cursor;
    
    --3° Leemos datos del cursor
    FETCH c_cursor INTO fila_reg;
    
    dbms_output.put_line(fila_reg.region_name);
    
    --4° Cerramos el cursor
    CLOSE c_cursor;

END;