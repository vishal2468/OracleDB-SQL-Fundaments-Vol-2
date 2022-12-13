-- Adding new rows in the table
-- When you want to add, update, or delete data in the database, you execute a DML statement.
-- A collection of DML statements that form a logical unit of work is called a transaction.

-- with below syntax only one row is inserted at a time
-- INSERT INTO table[(column[,column...])] VALUES (value [, value...]);

-- insert a record in departments table
INSERT INTO DEPARTMENTS(
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID
) VALUES (
    71,
    'Public Relations',
    100,
    1700
);

/

-- it is no necessary to specify the list of column when insering record
-- how ever the values must be listed in the default order
-- values for all the columns must be listed
-- also we can list the columns for clearity
INSERT INTO DEPARTMENTS VALUES (
    71,
    'Public Relations1',
    100,
    1700
);

/

-- if we want to omit the columns:
-- we can specify the columns and then the values or
INSERT INTO DEPARTMENTS(
    DEPARTMENT_ID,
    DEPARTMENT_NAME
) VALUES (
    30,
    'Purchasing'
);

/

-- we can seecify null values to other columns
INSERT INTO DEPARTMENTS VALUES (
    100,
    'Finance',
    NULL,
    NULL
);

/

-- we can use functions to enter special values in your table.
-- here we have used sysdate to get system time
-- there are also functions like user , current_date etc that can be used
INSERT INTO EMPLOYEES (
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
) VALUES (
    113,
    'Louis',
    'Popp',
    'LPOPP',
    '515.124.4567',
    SYSDATE,
    'AC_ACCOUNT',
    6900,
    NULL,
    205,
    110
);

-- we can also enter specific date if we want
-- we can take input from users using && or &
INSERT INTO EMPLOYEES VALUES (
    114,
    &FIRST_NAME,
    &LAST_NAME,
    'DRAPHEAL',
    '515.127.4561',
    TO_DATE('FEB 3, 1999', 'MON DD, YYYY'),
    'SA_REP',
    11000,
    0.2,
    100,
    60
);

/

-- Do not use the VALUES clause.
-- Match the number of columns in the INSERT clause to those in the subquery.
-- Inserts all the rows returned by the subquery in the table, sales_reps.
-- Zero or more rows are added depending on the number of rows returned by the subquery.
-- you must have already created the table in which you intend to insert
INSERT INTO SALES_REPS(
    ID,
    NAME,
    SALARY,
    COMMISSION_PCT
)
    SELECT
        EMPLOYEE_ID,
        LAST_NAME,
        SALARY,
        COMMISSION_PCT
    FROM
        EMPLOYEES
    WHERE
        JOB_ID LIKE '%REP%';