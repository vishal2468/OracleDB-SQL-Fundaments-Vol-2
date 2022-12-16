-- UPDATE table
-- SET column = value [, column = value, ...]
-- [WHERE condition];

-- Update more than one row at a time (if required).
-- In general, use the primary key column in the WHERE clause to identify a single row for update
-- Using other columns can unexpectedly cause several rows to be updated.

-- update the department of an employee
UPDATE EMPLOYEES
SET
    DEPARTMENT_ID=50
WHERE
    EMPLOYEE_ID=113;

/

-- if we omit the where clause all the rows will be modified
-- update multiple fields of a record
UPDATE EMPLOYEES
SET
    JOB_ID='SA_REP',
    SALARY=100000
WHERE
    EMPLOYEE_ID=112;

/

-- we can fetch value from sub query during updation
UPDATE EMPLOYEES
SET
    JOB_ID=(
        SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID=205
    ),
    SALARY=100000
WHERE
    EMPLOYEE_ID=116;

/

-- we can even update a row depending on the values in another table
UPDATE DEPARTMENTS
SET
    DEPARTMENT_NAME = (
        SELECT DEPARTMENT_NAME FROM DEPT_COPY WHERE DEPARTMENT_ID =110
    )
WHERE
    DEPARTMENT_ID=110;

/
-- we can even update the pk value
UPDATE EMPLOYEES
SET
    EMPLOYEE_ID = 27382
WHERE
    EMPLOYEE_ID=110;

/
