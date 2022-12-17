-- A database transaction consists of one of the following:
    -- DML statements that constitute one consistent change to the data
    -- One DDL statement
    -- One data control language (DCL) statement

-- Begin when the first DML SQL statement is executed.
-- End with one of the following events:
    -- A COMMIT or ROLLBACK statement is issued.
    -- A DDL or DCL statement executes (automatic commit).
    -- The user exits SQL Developer or SQL*Plus.
    -- The system crashes.

-- With COMMIT and ROLLBACK statements, you can:
    -- Ensure data consistency
    -- Preview data changes before making changes permanent
    -- Group logically-related operations

-- have a look at csr.png

-- time vs statements
-- commit  --> a transaction starts
-- delete --> a dml statement
-- savepoint a -> a savepoint is created with name a
-- insert -- > a dml statement
-- update --> a dml statement
-- savepoint b --> a save point is created with name b
-- insert --> a dml statement
-- .....

-- so for above queries we can use the commands:
-- rollback to savepoint a ( to rollback to a)
-- rollback to savepoint b ( to rollback to b)
-- rollback (this will take us to the start of the txn , the first save point was automatically created)


COMMIT;
-- here a save point is implicitly created
UPDATE EMPLOYEES
SET
    EMPLOYEE_ID = 100
WHERE
    EMPLOYEE_ID =1991;
-- update is a dml statement
-- we can create a savepoint if we cant
SAVEPOINT A;

DELETE FROM EMPLOYEES
WHERE
    EMPLOYEE_ID=1991;
-- we can create a savepoint if we want
SAVEPOINT B;
ROLLBACK;
-- we can rollback to any savepoint by specifying its name
commit;
-- this marks the end of transaction

-- so we can create a marker in the current transaction by using the SAVEPOINT statement,
-- which divides the transaction into smaller sections.
-- if we create a second savepoint with the same name as an earlier savepoint, the earlier savepoint is deleted.

-- Implicit transaction processing
-- auto commit occurs when
    -- a DDL statement is issued (CREATE , ALTER , DROP etc)
    -- a DCL statement is issued ( grant , revoke)
    -- Normal exit from sql developer or SQL plus without issuing commit or rollback
-- auto rollback occurs when
    -- system faliure
    -- abnormal termination of sql developer or SQL plus
