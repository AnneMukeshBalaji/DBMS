Declare
cursor cur_customer(p_age number) is select id,name,salary from customers where age = p_age;
v_id customers.id%type;
v_name customers.name%type;
v_salary customers.salary%type;
begin 
open cur_customer(25);
loop
fetch cur_customer into v_id,v_name,v_salary;
exit when cur_customer%notfound;
dbms_output.put_line('ID :'||v_id||',Name : '||v_name||',Salary : '||v_salary||'');
end loop;
close cur_customer;
end;
/