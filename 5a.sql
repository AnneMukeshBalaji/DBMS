SET SERVEROUTPUT ON;

DECLARE 
    temp1 NUMBER(10);        
    temp2 VARCHAR(10);       
BEGIN
        SELECT sid, sname 
        INTO temp1, temp2 
        FROM student 
        WHERE rank = 'first' AND ROWNUM = 1;
        DBMS_OUTPUT.PUT_LINE('STUDENT NO: ' || temp1 || ' Name: ' || temp2 || ' got first rank');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('*******************************************************');
            DBMS_OUTPUT.PUT_LINE('#ERROR: THERE IS NO STUDENT WHO GOT FIRST RANK');
END;
/
