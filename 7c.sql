SET SERVEROUTPUT ON;
DECLARE
	i NUMBER(3);
	j NUMBER(3);
BEGIN 
	i := 2;
	LOOP 
		j := 2;
		LOOP 
			exit WHEN((mod(i,j) = 0) or (j = i));
			j := j+1;
		END LOOP;
	IF (j = i) THEN
		DBMS_OUTPUT.PUT_LINE(''||i||' is Prime');
	END IF;
	i := i+1;
	exit WHEN i = 50;
	END LOOP;
END;
/