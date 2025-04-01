set serveroutput on;
declare 
	inval number;
	endval number;
	s number default 0;
begin 
	inval:=1;
	endval:=&endval;
	while inval<endval loop
		s:=s+inval;
		inval:= inval+2;
	end loop;
	dbms_output.put_line('Sum of odd numbers between 1 and '||endval||' is '||s||'');
end;
/