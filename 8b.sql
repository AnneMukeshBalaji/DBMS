SET SERVEROUTPUT ON;
DECLARE
    enqno2 number(5);
    fname2 VARCHAR(20);
BEGIN 
    enqno2 := & enqno2;
    findname(enqno2,fname2);
    DBMS_OUTPUT.PUT_LINE('Person Name Of Enquiry ID '||enqno2||' is '||fname2||'');
END;
/