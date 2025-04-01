SET SERVEROUTPUT ON;
DECLARE 
    sno student.sid%type;
    name student.sname%type;
    srank student.rank%type;
BEGIN
    sno := &sno;
    name := '&name';
    srank := '&srank';
    INSERT INTO student VALUES(sno,name,srank);
    DBMS_OUTPUT.PUT_LINE('ONE RECORD INSERTED');
    COMMIT;
    SAVEPOINT s1;
    sno := &sno;
    name := '&name';
    srank := '&srank';
    INSERT INTO student VALUES(sno,name,srank);
    DBMS_OUTPUT.PUT_LINE('ONE RECORD INSERTED');
    ROLLBACK TO SAVEPOINT s1;
END;
/