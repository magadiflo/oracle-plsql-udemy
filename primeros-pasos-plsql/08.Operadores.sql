-- 08. Operadores


SET SERVEROUTPUT ON

DECLARE
/* OPERADORES M�S HABITUALES

   +    SUMA
   -    RESTA
   /    DIVISI�N
   *    MULTIPLICACI�N
   **   EXPONENTE
   ||   CONCATENAR
*/
    x NUMBER := 5;
    z NUMBER := 10;
    a VARCHAR2(100) := 'EXAMPLE';
    d DATE := '10-01-1990';
BEGIN
    dbms_output.put_line(sysdate);
    dbms_output.put_line(d + 1);
END;