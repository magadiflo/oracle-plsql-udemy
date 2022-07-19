--08. Par�ctica paquetes
SET SERVEROUTPUT ON;

/*
1- Crear un paquete denominado REGIONES que tenga los siguientes componentes:
PROCEDIMIENTOS:
         -  ALTA_REGION, con par�metro de c�digo y nombre Regi�n. Debe devolver 
         un error si la regi�n ya existe. Inserta una nueva regi�n en la tabla. 
         Debe llamar a la funci�n EXISTE_REGION para controlarlo.

        - BAJA_REGION, con par�metro de c�digo de regi�n y que debe borrar una regi�n. 
        Debe generar un error si la regi�n no existe, Debe llamar a la funci�n EXISTE_REGION para controlarlo

        -  MOD_REGION: se le pasa un c�digo y el nuevo nombre de la regi�n Debe 
        modificar el nombre de una regi�n ya existente. Debe generar un error si 
        la regi�n no existe, Debe llamar a la funci�n EXISTE_REGION para controlarlo

 FUNCIONES
          CON_REGION. Se le pasa un c�digo de regi�n y devuelve el nombre

          EXISTE_REGION. Devuelve verdadero si la regi�n existe. Se usa en los 
          procedimientos y por tanto es PRIVADA, no debe aparecer en la 
          especificaci�n del paquete
*/
CREATE OR REPLACE PACKAGE pack_regiones
AS
    PROCEDURE alta_region(codigo NUMBER, nombre VARCHAR2);
    PROCEDURE baja_region(codigo NUMBER);
    PROCEDURE mod_region(codigo NUMBER, nuevo_nombre VARCHAR2);
    
    FUNCTION con_region(codigo NUMBER) RETURN VARCHAR2;
END pack_regiones;
/

CREATE OR REPLACE PACKAGE BODY pack_regiones
AS
    FUNCTION existe_region(nombre VARCHAR2)
    RETURN BOOLEAN
    AS
        total NUMBER := 0;
    BEGIN
        SELECT COUNT(*) 
            INTO total
        FROM regions 
        WHERE region_name = nombre;
        
        IF total = 1 THEN
            RETURN true;
        END IF;
        
        RETURN false;
    END existe_region;
    
    FUNCTION existe_region(codigo NUMBER)
    RETURN BOOLEAN
    AS
        total NUMBER := 0;
    BEGIN
        SELECT COUNT(*) 
            INTO total
        FROM regions 
        WHERE region_id = codigo;
        
        IF total = 1 THEN
            RETURN true;
        END IF;
        
        RETURN false;
    END existe_region;
    
    FUNCTION con_region(codigo NUMBER)
    RETURN VARCHAR2
    AS
        nombre VARCHAR2(100);
    BEGIN
        SELECT region_name 
            INTO nombre
        FROM regions
        WHERE region_id = codigo;
        
        RETURN nombre;
    END con_region;
    
    PROCEDURE alta_region(codigo NUMBER, nombre VARCHAR2)
    AS
    BEGIN
        IF existe_region(nombre) THEN
            RAISE_APPLICATION_ERROR(-20001, 'Ya tenemos registrado una regi�n con el NOMBRE ingresado...');
        END IF;
        
        IF existe_region(codigo) THEN
            RAISE_APPLICATION_ERROR(-20001, 'Ya tenemos registrado una regi�n con el C�DIGO ingresado...');
        END IF;
        
        INSERT INTO regions(region_id, region_name)
        VALUES(codigo, nombre);
    END alta_region;
    
    
    PROCEDURE baja_region(codigo NUMBER)
    AS
    BEGIN
        IF NOT existe_region(codigo) THEN
            RAISE_APPLICATION_ERROR(-20001, 'La regi�n con c�digo ingresado NO EXISTE (fallo al eliminar)');
        END IF;
        
        DELETE FROM regions WHERE region_id = codigo;
    END baja_region;
    
    PROCEDURE mod_region(codigo NUMBER, nuevo_nombre VARCHAR2)
    AS
        nombre_actual VARCHAR2(100);
    BEGIN
        IF NOT existe_region(codigo) THEN
            RAISE_APPLICATION_ERROR(-20001, 'La regi�n con c�digo ingresado NO EXISTE (fallo al modificar)');
        END IF;
        
        IF existe_region(nuevo_nombre) THEN
            RAISE_APPLICATION_ERROR(-20001, 'La regi�n con c�digo ingresado YA EXISTE (fallo al modificar)');
        END IF;                
        
        UPDATE regions
        SET region_name = nuevo_nombre
        WHERE region_id = codigo;
        
    END mod_region;    

END pack_regiones;
/


-- Probando package
SET SERVEROUTPUT ON;
DECLARE
    current_id NUMBER;
BEGIN
    SELECT  MAX(region_id)
        INTO current_id
    FROM regions;
    
    pack_regiones.alta_region(current_id + 1, 'MI-REGION');
    pack_regiones.baja_region(191);
    pack_regiones.mod_region(190, 'ASGARD');  
END;
/

SELECT * FROM regions;




