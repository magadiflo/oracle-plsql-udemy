--09. Pr�ctica con funciones

/*
1-Crear una funci�n que tenga como par�metro un n�mero de departamento y que 
devuelve la suma de los salarios de dicho departamento. La imprimimos por pantalla.

Si el departamento no existe debemos generar una excepci�n con dicho mensaje
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

-- Ejecutando funci�n
SET SERVEROUTPUT ON;
DECLARE
    suma_total NUMBER;
BEGIN
    suma_total := udf_sum_salary_by_department(100);
    dbms_output.put_line(suma_total);
END;
/

/*
2-Modificar el programa anterior para incluir un par�metro de tipo OUT por el 
que vaya el n�mero de empleados afectados por la query. Debe ser visualizada en 
el programa que llama a la funci�n. De esta forma vemos que se puede usar este 
tipo de par�metros tambi�n en una funci�n
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

-- Ejecutando funci�n
SET SERVEROUTPUT ON;
DECLARE
    suma_total NUMBER;
    empleados_afectados NUMBER;
    
BEGIN
    suma_total := udf_sum_salary_by_department_with_out(90, empleados_afectados);
    dbms_output.put_line('Sumta total por departamento: ' || suma_total);
    dbms_output.put_line('N�mero de empleados afectados: ' || empleados_afectados);
END;
/

/*
3-Crear una funci�n llamada CREAR_REGION,

A la funci�n se le debe pasar como par�metro un nombre de regi�n y debe devolver 
un n�mero, que es el c�digo de regi�n que calculamos dentro de la funci�n

Se debe crear una nueva fila con el nombre de esa REGION

El c�digo de la regi�n se debe calcular de forma autom�tica. Para ello se debe 
averiguar cual es el c�digo de regi�n  m�s alto que tenemos en la tabla en ese 
momento,  le sumamos 1 y el resultado lo ponemos como el c�digo para la nueva 
regi�n que estamos creando.

Si tenemos alg�n problema debemos generar un error

La funci�n debe devolver el n�mero que ha asignado a la regi�n
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
        dbms_output.put_line('Se gener� una PK ya existente');
END;
/

--Ejecutando funci�n
SET SERVEROUTPUT ON;
DECLARE
    codigo NUMBER;
BEGIN
    codigo := udf_crear_region('Ant�rtida');
    dbms_output.put_line(codigo);
END;














