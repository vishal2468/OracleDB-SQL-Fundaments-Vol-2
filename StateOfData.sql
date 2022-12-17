-- State of data before/after commit/rollback


-- State of the Data Before COMMIT or ROLLBACK
-- the previous state of data can be recovered
-- the current user can review the results of the DML operations using select
-- others user cannnot view the results of the DML operations issued by the current user(The Oracle server institutes read consistency to ensure that each user sees data as it existed at the last commit).
-- the affected rows are locked

-- State of data after commit
-- data  states are saved to database
-- previous states of data is overwritten
-- all users can view the results
-- Locks on the affected rows are released; those rows are available for other users to manipulate.
-- all save points are erased


SET AUTOCOMMIT OFF;

-- lets delete a row
DELETE FROM EMPLOYEES
WHERE
    EMPLOYEE_ID = 140;

-- and insert a department
INSERT INTO DEPARTMENTS VALUES (
    1900,
    'Corporate Tax',
    NULL,
    1700
);

-- other users cant view this state
-- and the effected rows will be locked
-- we can wiew the state of data using select statement
SELECT
    *
FROM
    EMPLOYEES
WHERE
    EMPLOYEE_ID =140;

--  we can commit or rollback and thsi transaction will end
COMMIT;

/

-- suppose we deleted the table by mistake
DELETE FROM EMPLOYEE_ID;

-- we can roll back
ROLLBACK;

/

-- statements level roll back

-- if a single dml fails during a execution , only that statement is rolledback;
-- The Oracle server implements an implicit savepoint.
-- All other changes are retained.
-- The user should terminate transactions explicitly by executing a COMMIT or ROLLBACK statement.


INSERT INTO DEPARTMENTS VALUES (
    1919,
    'Corporate Tax',
    NULL,
    1700
);

-- delete will fail and the changes for this ststement will be rolled back but  the above changes will be retained
DELETE FROM EMPLOYEES;
-- so as we can see the insert do the department is not rolled back;
-- we we want that the user should explicitly do that.
SELECT
    *
FROM
    DEPARTMENTS
WHERE
    DEPARTMENT_ID=1919;

ROLLBACK;
/

