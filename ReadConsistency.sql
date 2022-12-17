-- Read consistency guarantees a consistent view of the data at all times.
-- Changes made by one user do not conflict with the changes made by another user.
-- Read consistency ensures that, on the same data:
-- Readers do not wait for writers
-- Writers do not wait for readers
-- Writers wait for writers
-- The purpose of read consistency is to ensure that each user sees data as it existed at the last commit, before a DML operation started.
-- The same user can login as different sessions. Each session maintains read consistency in the manner described above, even if they are the same users.
SET AUTOCOMMIT OFF;

UPDATE EMPLOYEES
SET
    SALARY = 8000
WHERE
    LAST_NAME = 'Grant';

SELECT
    *
FROM
    EMPLOYEES
WHERE
    LAST_NAME='Grant';

-- if soem other user runs this select or we run it even from some other tab , it will show the unupdated data

ROLLBACK;

/

-- Read consistency is an automatic implementation.
-- It keeps a partial copy of the database in the undo segments.
-- The read-consistent image is constructed from the committed data in the table and the old data that is being changed and is not yet committed from the undo segment.

------------------------------------------ FOR UPDATE clause-----------------------------

-- Locks the rows in the EMPLOYEES table where job_id is SA_REP.
-- Lock is released only when you issue a ROLLBACK or a COMMIT.
-- If the SELECT statement attempts to lock a row that is locked by another user,
-- then the database waits until the row is available,
-- and then returns the results of the SELECT statement.
SELECT
    EMPLOYEE_ID,
    SALARY,
    COMMISSION_PCT,
    JOB_ID
FROM
    EMPLOYEES
WHERE
    JOB_ID = 'SA_REP' FOR UPDATE
ORDER BY
    EMPLOYEE_ID;

SELECT
    *
FROM
    EMPLOYEES
WHERE
    JOB_ID='SA_REP';

/

ROLLBACK;

/

-- if the rows are already locked wait for not more than 5 seconds

SELECT
    EMPLOYEE_ID,
    SALARY,
    COMMISSION_PCT,
    JOB_ID
FROM
    EMPLOYEES
WHERE
    JOB_ID = 'SA_REP' FOR UPDATE WAIT 5
ORDER BY
    EMPLOYEE_ID;

ROLLBACK;

/

-- You can use the FOR UPDATE clause in a SELECT statement against multiple tables.
-- this statement will lock employees rows where JOB_ID = 'ST_CLERK' AND LOCATION_ID = 1500
-- and also lock the rows of departments where location id is 1500
SELECT
    E.EMPLOYEE_ID,
    E.SALARY,
    E.COMMISSION_PCT
FROM
    EMPLOYEES   E
    JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
WHERE
    JOB_ID = 'ST_CLERK'
    AND LOCATION_ID = 1500 FOR UPDATE
ORDER BY
    E.EMPLOYEE_ID;

/

-- You can use the FOR UPDATE OF column_name to qualify the column that you intend to change
SELECT
    E.EMPLOYEE_ID,
    E.SALARY,
    E.COMMISSION_PCT
FROM
    EMPLOYEES   E
    JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
WHERE
    E.JOB_ID ='ST_CLERK'
    AND LOCATION_ID=1500 FOR UPDATE OF E.SALARY
ORDER BY
    E.EMPLOYEE_ID;

ROLLBACK;

/