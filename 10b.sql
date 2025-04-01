DECLARE
   CURSOR cur_salary IS
      SELECT salary
      FROM customers
      WHERE salary < 2000
      FOR UPDATE;
BEGIN
   FOR rec IN cur_salary LOOP
      UPDATE customers 
      SET salary = salary + 500 
      WHERE CURRENT OF cur_salary;
   END LOOP;
   COMMIT;
END;
/
