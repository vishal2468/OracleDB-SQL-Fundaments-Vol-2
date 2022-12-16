-- DELETE[FROM] table
-- [WHERE condition];

-- delete employee with id 110
DELETE FROM EMPLOYEES
WHERE
    EMPLOYEE_ID=110;
/
-- all rows are deleted if we remove omit clause
-- this wont work as the inner query returns more then one row
DELETE FROM EMPLOYEES
WHERE
    EMPLOYEE_ID=(
        SELECT
            EMPLOYEE_ID
        FROM
            EMPLOYEES
        WHERE
            FIRST_NAME LIKE 'S%'
    );
/
