--11. Comando raise application error
/*
RAISE_APPLICATION_ERROR, permite cortar la ejecuci�n del programa y lanzar
la excepci�n con un c�digo de error y un mensaje personalizado. Es como los
errores que lanza oracle cuando ocurre alguna excepci�n
*/

SET SERVEROUTPUT ON;

DECLARE
    regn NUMBER;
    regt VARCHAR2(200);
    
BEGIN
    regn := 101;
    regt := 'Asia';
    
    IF regn > 100 THEN
        --El c�digo debe estar entre -20000 y -20999
        RAISE_APPLICATION_ERROR(-20001, 'La ID no puede ser mayor que 100');
    ELSE
        INSERT INTO regions 
        VALUES(regn, regt);
        
        COMMIT;
    END IF;
END;
/