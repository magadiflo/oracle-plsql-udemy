-- 11. Ámbito de variables en bloques anidados
SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 20;  --GLOBAL
    z NUMBER := 30;
    padre NUMBER := 33;
BEGIN
    dbms_output.put_line('X:=' || x);
    DECLARE
        x NUMBER := 10;  --LOCAL
        z NUMBER := 100;
        y NUMBER := 200;
    BEGIN
        dbms_output.put_line('X:=' || x);
        dbms_output.put_line('Z:=' || z);
        dbms_output.put_line('padre:=' || padre);
    END;

    --Si descomentamos esta línea arrojará error ya que no está declarado la variable padre
    --dbms_output.put_line('Y:=' || y);
END;