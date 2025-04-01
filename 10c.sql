DECLARE
    CURSOR cur_customers IS 
        SELECT id,salary FROM customers WHERE salary < 2000 FOR UPDATE;
        v_id customers.id%type;
        v_salary customers.salary%type;
BEGIN 
    OPEN cur_customers;
    LOOP
        FETCH cur_customers INTO v_id,v_salary;
        EXIT WHEN cur_customers%NOTFOUND;
        UPDATE customers SET salary = salary + 500 WHERE CURRENT OF cur_customers;
    END LOOP;
    CLOSE cur_customers;
END;
/