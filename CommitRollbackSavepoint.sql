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
