--5. Constantes y Not Null
DECLARE
    pi CONSTANT NUMBER(8, 6) := 3.141516;
    z  NUMBER NOT NULL := 20;
BEGIN
    dbms_output.put_line(pi);
    dbms_output.put_line(z);
END;