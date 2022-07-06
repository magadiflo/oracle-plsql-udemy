--10. Práctica con bucles
SET SERVEROUTPUT ON;

/*Práctica 01*/
DECLARE
    numero PLS_INTEGER := 1;
    contador INTEGER;
BEGIN 
    <<tabla>>
    LOOP 
    dbms_output.put_line('***** Tabla del ' || TO_CHAR(numero) || '******');
    contador := 1;
    
        <<secuencia>>
        LOOP
            dbms_output.put_line(TO_CHAR(numero) || 'x' || TO_CHAR(contador) || '=' || TO_CHAR(numero * contador));
            contador := contador + 1;
            EXIT WHEN contador = 11;
        END LOOP;
        
        numero := numero + 1;
        EXIT WHEN numero = 11;
    END LOOP;
END;

/*Práctica 02*/
DECLARE
    texto VARCHAR2(100) := 'Soy Ing. de Sistemas e Informática';
    cadena VARCHAR2(100) := '';
    contador INTEGER;
BEGIN 
    contador := LENGTH(texto);
    WHILE contador > 0 LOOP
        cadena := cadena || substr(texto, contador, 1);
        contador := contador - 1;
    END LOOP; 
    dbms_output.put_line(cadena);
    
END;

/*Práctica 03*/
DECLARE
    texto VARCHAR2(100) := 'Expedientes secretos';
    cadena VARCHAR2(100) := '';
    caracter VARCHAR2(1);
    contador INTEGER;
BEGIN 
    contador := LENGTH(texto);
    WHILE contador > 0 LOOP
        caracter := substr(texto, contador, 1);
        cadena := cadena || caracter;
        contador := contador - 1;
        EXIT WHEN LOWER(caracter) = 'x';
    END LOOP; 
    dbms_output.put_line(cadena);
    
END;

/*Práctica 04*/
DECLARE
    nombre VARCHAR2(100) := 'Are';
    cadena VARCHAR2(100) := '';
BEGIN 
    FOR i IN 1..LENGTH(nombre) LOOP
        cadena := cadena || '*';
    END LOOP;
    dbms_output.put_line(cadena);
    
END;




