-- 8. Atributo %Type
--Permite crear una variable del mismo tipo que de otra variable.
--Por ejemplo, una varible puede ser del mismo TIPO que de una columna de una tabla
DECLARE
    x       NUMBER;
    z       x%TYPE;
    salario employees.salary%TYPE;
BEGIN
    salario := 250;
    dbms_output.put_line(salario);
END;