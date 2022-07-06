--7. Bucle FOR
SET SERVEROUTPUT ON;

/*Ejemplo 1*/
BEGIN
/*i: es del tipo PLS_INTEGER y está declarado implícitamente solo para que funcione en el FOR, 
es un tipo de dato que ocupa menos que el NUMBER*/
    FOR i IN 5..10 LOOP 
        dbms_output.put_line(i);
    END LOOP;
END;

/*Ejemplo 2*/
BEGIN
    FOR i IN REVERSE 5..15 LOOP
        dbms_output.put_line(i);
        
        EXIT WHEN i = 10;
    END LOOP;
END;