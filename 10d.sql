DECLARE
    TYPE cur_type IS REF CURSOR;
    v_cursor cur_type;
    v_id customers.id%TYPE;
    v_name customers.name%TYPE;
    v_salary customers.salary%TYPE;
BEGIN
    OPEN v_cursor FOR SELECT id, name, salary FROM customers WHERE salary > 2000;
    LOOP
        FETCH v_cursor INTO v_id, v_name, v_salary;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID :' || v_id || ', Name : ' || v_name || ', Salary : ' || v_salary);
    END LOOP;
    CLOSE v_cursor;
END;
/
