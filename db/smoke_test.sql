#Basic Connectivity Test
SELECT 1 AS status;

#Table Exists Check

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'users'
)
BEGIN
    THROW 50000, 'Table users does not exist', 1;
END

# Column Exists Check

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'users' AND COLUMN_NAME = 'email'
)
BEGIN
    THROW 50000, 'Column email missing in users table', 1;
END

# Data Integrity Check
SELECT COUNT(*) AS total_users FROM users;

#Index Validation (performance-related)
IF NOT EXISTS (
    SELECT name FROM sys.indexes 
    WHERE name = 'idx_users_email'
)
BEGIN
    THROW 50000, 'Index idx_users_email not created', 1;
END

#Liquibase Tracking Check (very important)
SELECT COUNT(*) 
FROM DATABASECHANGELOG
WHERE ID = '002';
