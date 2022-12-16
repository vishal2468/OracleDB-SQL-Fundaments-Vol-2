-- it is a DDL statement and not DML
-- it cannot be easily undone

-- TRUNCATE TABLE table_name;

-- it is more effecient way to empty a table_name( we can empty a table using delete too)

-- it generates no roll back information
-- it does not fire the delete triggers of the table
-- If the table is the parent of a referential integrity constraint, you cannot truncate the table.

-- ex departments table will be the paernt for referencial integrity in employee -department integrity constraint
-- generally the parent is one with the pk ex department_id ( one side) and the child is one with pk employee (many side)

