--01. Atributos implícios

/*
SQL%ISOPEN -- false
SQL%FOUND
SQL%NOTFOUND
SQL%ROWCOUNT
*/

SET SERVEROUTPUT ON;

BEGIN
    UPDATE test 
    SET c2 = 'ppppp'
    WHERE c1 = 10;
    
    dbms_output.put_line(SQL%ROWCOUNT);
    IF SQL%FOUND THEN
        dbms_output.put_line('econtrado!');
    END IF;
END;