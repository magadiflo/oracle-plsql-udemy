-- 7. Variables Booleanas
/*Las variables booleanas pueden ser TRUE, FALSE or NULL, este último como
cualquier otra variable */
DECLARE
    is_active BOOLEAN;
BEGIN
    is_active := true;
    dbms_output.put_line(
                        CASE
                            WHEN is_active THEN
                                'TRUE'
                            WHEN NOT is_active THEN
                                'FALSE'
                            ELSE 'NULL'
                        END
    );

END;