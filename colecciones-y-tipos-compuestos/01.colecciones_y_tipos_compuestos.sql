--01. Colecciones y tipos compuestos
/*Existen de dos tipos: 
1) PL/SQL RECORDS
    - Similares a los registros de una tabla.
    - Pueden albergar una fila de datos de distintos tipos
    - Ya hemos visto un ejemplo al usar el atributo %ROWTYPE
    - Podemos definirlos de FORMA PERSONALIZADA con la cláusula RECORD
        TYPE nombre IS RECORD(campo1, campo2, ....)
        
    - Es como si creáramos una tabla
    Ejemplo:
    - Declarando un record llamado: empleado
        TYPE empleado IS RECORD(
            nombre VARCHAR2(100),
            salario NUMBER,
            fecha employees.hire_date%TYPE,
            datos_completos employees%ROWTYPE
        );
    
    - Haciendo uso del record empleado
        emple1 empleado;
    
2) Colecciones o collections
    - Arrays asociativos (index by)
    - Nested tables
    - Varrays
*/