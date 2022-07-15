--06.Práctica con procedimientos almacenados

/*
1- Crear un procedimiento llamado visualizar que visualice el nombre y 
salario de todos los empleados.
*/

CREATE OR REPLACE PROCEDURE sp_visualizar
AS
    CURSOR c_empleado
    IS SELECT first_name || ' ' || last_name AS empleado, salary AS salario
        FROM employees;
BEGIN
    FOR empleado IN c_empleado LOOP
        dbms_output.put_line(empleado.empleado || ': S/' || empleado.salario);
    END LOOP;    
END;
/
--Llamando al SP
EXECUTE sp_visualizar();
/

/*
2- Modificar el programa anterior para incluir un parámetro que pase el número 
de departamento para que visualice solo los empleados de ese departamento

Debe devolver el número de empleados en una variable de tipo OUT
*/
CREATE OR REPLACE PROCEDURE sp_visualizar_by_department(
    num_dep employees.department_id%TYPE,
    cant_empl OUT NUMBER
)
AS
    CURSOR c_empleado
    IS SELECT first_name || ' ' || last_name AS empleado, salary AS salario
        FROM employees 
        WHERE department_id = num_dep;
    
    num_empl NUMBER := 0;
BEGIN
    FOR empleado IN c_empleado LOOP
        num_empl := num_empl + 1;
        dbms_output.put_line(empleado.empleado || ': S/' || empleado.salario);
    END LOOP;
    cant_empl := num_empl;
END;
/

--Ejecutando
DECLARE 
    num_dep employees.department_id%TYPE;
    cant NUMBER;
BEGIN
    num_dep := 90;
    cant := 0;
    sp_visualizar_by_department(num_dep, cant);
    dbms_output.put_line('Total de empleados para el dep ' || num_dep || ': ' || cant);
END;
/

/*
3- crear un bloque por el cual se de formato a un nº de cuenta suministrado 
por completo, por ej , 11111111111111111111

Formateado a: 1111-1111-11-1111111111
Debemos usar un parámetro de tipo IN-OUT
*/
CREATE OR REPLACE PROCEDURE sp_format_account(
    account IN OUT VARCHAR2
)
AS
BEGIN
    IF LENGTH(account) <> 20 THEN
        RAISE_APPLICATION_ERROR(-20001, 'La longitud de la cuenta no es válida');
    END IF;
    
    account := SUBSTR(account, 1, 4) || '-' || SUBSTR(account, 5, 4) || '-' || SUBSTR(account, 9, 2) || '-' || SUBSTR(account, 11);
END;
/

--Ejecutando procedimiento
SET SERVEROUTPUT ON;
    
DECLARE
     account VARCHAR2(23);
BEGIN
    account := '11111111111111111111';
    sp_format_account(account);
    dbms_output.put_line(account);
END;
/


