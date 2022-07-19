--07. Paquete utl_file
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE read_file
AS
    string VARCHAR2(32767);
    v_file UTL_FILE.FILE_TYPE;

BEGIN
    --Open File
    --EXERCISES, nombre del directorio creado en ORACLE para este usuario HR, que apunta al path C:\exercises-oracle
    v_file := UTL_FILE.FOPEN('EXERCISES', 'f1.txt', 'R'); 
    
    LOOP
        BEGIN
            --Read line
            UTL_FILE.GET_LINE(v_file, string);
            
            dbms_output.put_line(string);            
            INSERT INTO file_1 VALUES(string);
            
            EXCEPTION
                WHEN NO_DATA_FOUND THEN EXIT;
        END;
    END LOOP;
    
    --Close File
    UTL_FILE.FCLOSE(v_file);
END read_file;
/


--***************************** LEYENDO EL STORE PROCEDURE *********************
BEGIN
    read_file;
END;
/

--Creamos una tabla para almacenar el contenido del txt
CREATE TABLE file_1(
    c1 VARCHAR2(100)
);

--Modificamoe el procedimiento para que inserte los datos
--Ejecutamos el store procedure
--Mostramos la tabla file_1
SELECT * 
FROM file_1;
