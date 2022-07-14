-- 4. Loop

DECLARE
    x NUMBER := 1;
BEGIN
    LOOP 
        dbms_output.put_line(x);
        x := x + 1;
        
        EXIT WHEN x > 20;
    END LOOP;
END;