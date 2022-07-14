--08. Excepciones personalizadas por el desarrollador
/*
RAISE, cláusula que se usa en excepciones personalizadas por el usuario. 
Le decimos: dispara tal excepción, y esta se irá al bloque de excepciones. 
Ya que al ser una excpción personalizada ORACLE no sabe en qué momento disparar la excepción, 
nosotros explícitamente debemos de indicar cuándo lo hará, y eso es con el RISE
*/
SET SERVEROUTPUT ON;

DECLARE
    reg_max EXCEPTION; --<--- 1° Paso, declarar la excepción
    regn NUMBER;
    regt VARCHAR2(200);

BEGIN
    regn := 101;
    regt := 'Asia';
    
    IF regn > 100 THEN
        RAISE reg_max; -- <---- 2° Paso, ubicarla dónde lo lanzará. Aquí le decimos que dispare la excepción reg_max 
    ELSE
        INSERT INTO regions
        VALUES(regn, regt);
        
        COMMIT;
    END IF;
    
EXCEPTION
    WHEN reg_max THEN -- <---- 3° Paso, capturamos la excepción personalizada
        dbms_output.put_line('La región no puede ser mayor de 100');
    WHEN OTHERS THEN
        dbms_output.put_line('Error indefinido');
END;
/

select * from regions;