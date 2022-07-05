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

--SEGUNDA FORMA: SEARCH CASE
DECLARE 
    bonus NUMBER;
BEGIN
    bonus := 100;
    
    CASE 
        WHEN bonus > 500 THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN bonus <= 500 AND bonus > 250 THEN DBMS_OUTPUT.PUT_LINE('Very good');
        WHEN bonus <= 250 AND bonus > 100 THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('POOR');
    END CASE;
END;