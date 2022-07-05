-- 3. Comando case
--PRIMERA FORMA
DECLARE 
    v1 CHAR(1);
BEGIN
    v1 := 'B';
    
    CASE v1
        WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Very good');
        WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
        WHEN 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
        WHEN 'E' THEN DBMS_OUTPUT.PUT_LINE('Poor');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('No such value');
    END CASE;
END;

--SEGUNDA FORMA
DECLARE 
    v1 CHAR(1);
BEGIN
    v1 := 'C';
    
    CASE 
        WHEN v1 = 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN v1 = 'B' THEN DBMS_OUTPUT.PUT_LINE('Very good');
        WHEN v1 = 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
        WHEN v1 = 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
        WHEN v1 = 'E' THEN DBMS_OUTPUT.PUT_LINE('Poor');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('No such value');
    END CASE;
END;