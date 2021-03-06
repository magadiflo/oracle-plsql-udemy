--04. Colecciones
/*
Colecciones y tipos compuestos
- Colecciones
    * Arrays asociativos (En este tutorial se ve este tipo de colecci?n)
    * Nested tables
    * varrays

Arrays asociativos (INDEX BY tables)
- Son colecciones PLSQL con dos columnas: 1 clave primaria 1 valor
    * Clave primaria: de tipo entero o cadena
    * Valores: Un tipo que puede ser escalar o record
    
- Sintaxis
TYPE type_name IS TABLE OF 
    { column_type [NOT NULL] | variable%TYPE [NOT NULL] | table.column%TYPE [NOT NULL] | table%ROWTYPE }
    INDEX BY { PLS_INTEGER | BINARY_INTEGER | VARCHAR2(X) };
    
VARIABLE TIPO;

- Acceso al array
    array(n)        ----> escalar
    array(n).campo  ----> rowtype
*/
