set serveroutput on;
declare 
grade char(1);
begin 
grade:='&grade';
case
	when grade ='a' then 
	dbms_output.put_line('excellent');

	when grade ='b' then 
	dbms_output.put_line('very good');

	when grade ='c' then 
	dbms_output.put_line('good');

	when grade ='d' then 
	dbms_output.put_line('fair');
	
	when grade ='f' then 
	dbms_output.put_line('fail');
else
	dbms_output.put_line('no such grade');
end case;
end;
/

	


