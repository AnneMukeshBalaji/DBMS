CREATE OR REPLACE PROCEDURE findname (
    enquiryno1 IN NUMBER,
    fname1 OUT VARCHAR2
) IS
    fname2 VARCHAR2(30);
BEGIN 
    SELECT fname INTO fname2 
    FROM enquiry 
    WHERE enqno = enquiryno1;  

    fname1 := fname2;  
EXCEPTION
    WHEN NO_DATA_FOUND THEN   
        RAISE_APPLICATION_ERROR(-20100, 'The Given Number Is Not Present');
END;
/
