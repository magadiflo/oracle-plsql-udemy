--08. Excepciones personalizadas por el desarrollador
/*
RAISE, cl�usula que se usa en excepciones personalizadas por el usuario. 
Le decimos: dispara tal excepci�n, y esta se ir� al bloque de excepciones. 
Ya que al ser una excpci�n personalizada ORACLE no sabe en qu� momento disparar la excepci�n, 
nosotros expl�citamente debemos de indicar cu�ndo lo har�, y eso es con el RISE
*/
SET SERVEROUTPUT ON;

DECLARE
    reg_max EXCEPTION; --<--- 1� Paso, declarar la excepci�n
    regn NUMBER;
    regt VARCHAR2(200);

BEGIN
    regn := 101;
    regt := 'Asia';
    
    IF regn > 100 THEN
        RAISE reg_max; -- <---- 2� Paso, ubicarla d�nde lo lanzar�. Aqu� le decimos que dispare la excepci�n reg_max 
    ELSE
        INSERT INTO regions
        VALUES(regn, regt);
        
        COMMIT;
    END IF;
    
EXCEPTION
    WHEN reg_max THEN -- <---- 3� Paso, capturamos la excepci�n personalizada
        dbms_output.put_line('La regi�n no puede ser mayor de 100');
    WHEN OTHERS THEN
        dbms_output.put_line('Error indefinido');
END;
/

select * from regions;