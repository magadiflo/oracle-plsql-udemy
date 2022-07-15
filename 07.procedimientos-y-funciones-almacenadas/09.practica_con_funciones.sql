--09. Práctica con funciones

/*
1-Crear una función que tenga como parámetro un número de departamento y que 
devuelve la suma de los salarios de dicho departamento. La imprimimos por pantalla.

Si el departamento no existe debemos generar una excepción con dicho mensaje
*/
CREATE OR REPLACE FUNCTION udf_sum_salary_by_department(id_dep employees.department_id%TYPE)
RETURN NUMBER
AS
    suma NUMBER;
BEGIN
    SELECT SUM(salary)
        INTO suma
    FROM employees
    WHERE department_id = id_dep;    
    
    RETURN suma;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No existe el departamento con el id ingresado');
        
END;
/

-- Ejecutando función
SET SERVEROUTPUT ON;
DECLARE
    suma_total NUMBER;
BEGIN
    suma_total := udf_sum_salary_by_department(100);
    dbms_output.put_line(suma_total);
END;
/

/*
2-Modificar el programa anterior para incluir un parámetro de tipo OUT por el 
que vaya el número de empleados afectados por la query. Debe ser visualizada en 
el programa que llama a la función. De esta forma vemos que se puede usar este 
tipo de parámetros también en una función
*/
CREATE OR REPLACE FUNCTION udf_sum_salary_by_department_with_out(
    id_dep employees.department_id%TYPE,
    affected_rows OUT NUMBER
)
RETURN NUMBER
AS
    CURSOR c_empleados 
    IS SELECT * 
        FROM employees
        WHERE department_id = id_dep;
        
    suma NUMBER := 0;
    contador NUMBER := 0;
BEGIN
    FOR empleado IN c_empleados LOOP
        contador := contador + 1;
        suma := suma + empleado.salary;
    END LOOP;
    
    affected_rows := contador;
    RETURN suma;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No existe el departamento con el id ingresado');
        
END;
/

-- Ejecutando función
SET SERVEROUTPUT ON;
DECLARE
    suma_total NUMBER;
    empleados_afectados NUMBER;
    
BEGIN
    suma_total := udf_sum_salary_by_department_with_out(90, empleados_afectados);
    dbms_output.put_line('Sumta total por departamento: ' || suma_total);
    dbms_output.put_line('Número de empleados afectados: ' || empleados_afectados);
END;
/

/*
3-Crear una función llamada CREAR_REGION,

A la función se le debe pasar como parámetro un nombre de región y debe devolver 
un número, que es el código de región que calculamos dentro de la función

Se debe crear una nueva fila con el nombre de esa REGION

El código de la región se debe calcular de forma automática. Para ello se debe 
averiguar cual es el código de región  más alto que tenemos en la tabla en ese 
momento,  le sumamos 1 y el resultado lo ponemos como el código para la nueva 
región que estamos creando.

Si tenemos algún problema debemos generar un error

La función debe devolver el número que ha asignado a la región
*/

CREATE OR REPLACE FUNCTION udf_crear_region(nombre regions.region_name%TYPE)
RETURN NUMBER
AS
    codigo regions.region_id%TYPE;
    
BEGIN
    SELECT MAX(region_id)
        INTO codigo
    FROM regions;
    
    codigo := codigo + 1;
    
    INSERT INTO regions(region_id, region_name)
    VALUES(codigo, nombre);

    RETURN codigo;
    
EXCEPTION 
    WHEN DUP_VAL_ON_INDEX THEN
        dbms_output.put_line('Se generó una PK ya existente');
END;
/

--Ejecutando función
SET SERVEROUTPUT ON;
DECLARE
    codigo NUMBER;
BEGIN
    codigo := udf_crear_region('Antártida');
    dbms_output.put_line(codigo);
END;














