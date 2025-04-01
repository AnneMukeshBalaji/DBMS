declare 
    a number := 10;
    b number := 12;
    c number := 5;
begin 
    dbms_output.put_line('a=' || a || ' b=' || b || ' c=' || c || '');
    
    if a > b and a > c then
        dbms_output.put_line('a is greatest');
    else
        if b > a and b > c then 
            dbms_output.put_line('b is greatest');    
        else
            dbms_output.put_line('c is greatest');        
        end if;
    end if;
end;
/
