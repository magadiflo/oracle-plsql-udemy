--9. Comando GOTO 
/*Este tipo de comando se debe evitar usar ya que destruye la programaci�n estructurada
*/
SET SERVEROUTPUT ON;

DECLARE
    p VARCHAR2(30);
    n PLS_INTEGER := 11;
    raiz NUMBER;
BEGIN
    FOR j IN 2..round(sqrt(n)) LOOP
        IF n MOD j = 0 THEN
            p := ' no es un n�mero primo';
            GOTO print_now;
        END IF;
    END LOOP;

    p := ' es un n�mero primo';
    <<print_now>> 
    dbms_output.put_line(to_char(n) || p);
END;