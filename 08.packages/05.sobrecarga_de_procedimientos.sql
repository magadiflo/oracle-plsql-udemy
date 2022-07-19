--05. Sobrecarga de procedimientos
CREATE OR REPLACE PACKAGE pack_employees
AS
    --Aplicando sobrecarga de métodos, mismo nombre pero distintos parámetros
    FUNCTION count_employees(id NUMBER) RETURN NUMBER;
    FUNCTION count_employees(id VARCHAR2) RETURN NUMBER;
END pack_employees;

--Body del package
CREATE OR REPLACE PACKAGE BODY pack_employees
AS
    FUNCTION count_employees(id NUMBER)
    RETURN NUMBER
    AS
        x NUMBER;
    BEGIN
        SELECT COUNT(*)
            INTO x
        FROM employees
        WHERE department_id = id;
        
        RETURN x;
    END count_employees;
    
    FUNCTION count_employees(id VARCHAR2)
    RETURN NUMBER
    AS
        x NUMBER;
    BEGIN
        SELECT COUNT(*)
            INTO x
        FROM employees e
            INNER JOIN departments d ON(e.department_id = d.department_id)
        WHERE d.department_name = id;
        
        RETURN x;
    END count_employees;
END pack_employees;
/


--********************************* Probando paquete ***************************
SET SERVEROUTPUT ON;
BEGIN
    dbms_output.put_line(pack_employees.count_employees('Executive'));
    dbms_output.put_line(pack_employees.count_employees(90));
END;