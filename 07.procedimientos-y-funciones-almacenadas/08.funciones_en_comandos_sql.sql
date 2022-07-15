--08. Funciones en comandos SQL
SELECT first_name, salary, udf_calc_tax(employee_id, 50) AS impuesto
FROM employees;