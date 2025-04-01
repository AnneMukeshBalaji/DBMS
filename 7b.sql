SET SERVEROUTPUT ON;
DECLARE 
	var1 NUMBER;
	var2 NUMBER;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Enter Number To Print Multiplication Table ');
	var1 := &var1;
	FOR var2 IN 1 .. 10 LOOP
		DBMS_OUTPUT.PUT_LINE(''|| var1 ||' X '||var2||' = '||var1*var2||'');
	END LOOP;
END;
/		