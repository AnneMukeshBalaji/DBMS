 set serveroutput on;
declare
fname2 varchar(30);
deptno2 number(5);
begin
deptno2 := &deptno;
fname2 := getname(deptno2);
dbms_output.put_line(''||fname2||' is in '||deptno2||'');
end;
/