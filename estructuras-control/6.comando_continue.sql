-- 6. Comando continue
DECLARE
    x NUMBER := 0;
BEGIN
    LOOP --Con CONTINUE saltamos aquí
        dbms_output.put_line('LOOP: x = ' || TO_CHAR(x));
        x := x + 1;
        /* PRIMERA FORMA
        IF x < 3 THEN
            CONTINUE;
        END IF;
        */
        /*SEGUNDA FORMA*/
        CONTINUE WHEN x < 3;
        dbms_output.put_line('Después del CONTINUE: x = ' || TO_CHAR(x));
        EXIT WHEN x = 5;
    END LOOP;
    dbms_output.put_line('Después del loop: x = ' || TO_CHAR(x));
END;