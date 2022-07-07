--04.Excepciones no predefinidas

/*
- Estas no son excepciones de usuario, sino son 
excepciones de ORACLE, que como no están predefinidas
nosotros la queremos manipular.

- Todos los errores ORACLE son números negativos, menos el 100

PARGMA, es una especie de orden al compilador de PLSQL, es decir,
es como si le dijera.. "Oye, siempre que aparezca algo como esto, sustitúyelo por esta otra cosa".
En el caso del ejemplo que mostramos, lo que hace PRAGMA es asociar la excepción "mi_excep" con 
el código -937
*/
SET SERVEROUTPUT ON;

DECLARE
    mi_excep EXCEPTION;
    PRAGMA EXCEPTION_INIT(mi_excep, -937);
    v1 NUMBER;
    v2 NUMBER;

BEGIN
    SELECT employee_id, SUM(salary)
        INTO v1, v2
    FROM employees;
    
    dbms_output.put_line(v1);
    
EXCEPTION
    WHEN mi_excep THEN
        dbms_output.put_line('Función de grupo incorrecta');
    WHEN OTHERS THEN
        dbms_output.put_line('Error, no se pudo procesar el bloque plsql');
    
END;