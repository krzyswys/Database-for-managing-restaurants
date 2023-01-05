DECLARE @sql NVARCHAR(max)=''

-- drop constraints
SELECT @sql += 'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id))
    + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
    ' DROP CONSTRAINT ' + QUOTENAME(name) + ';'
FROM sys.foreign_keys;
EXEC sp_executesql @sql
SET @sql = ''

--  drop tables
SELECT @sql += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'
Exec Sp_executesql @sql

-- drop views
SELECT @sql += 'DROP VIEW ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(v.name) +';'
FROM sys.views v
EXEC sp_executesql @sql

-- drop procedures
SELECT @sql += 'DROP PROCEDURE ' + QUOTENAME(SCHEMA_NAME(p.schema_id)) + '.' + QUOTENAME(p.NAME) + ';'
FROM sys.procedures p
EXEC sp_executesql @sql
SET @sql = ''

-- drop functions
SELECT @sql = @sql + N' DROP FUNCTION ' 
                   + QUOTENAME(SCHEMA_NAME(schema_id)) 
                   + N'.' + QUOTENAME(name)
FROM sys.objects
WHERE type_desc LIKE '%FUNCTION%';
Exec sp_executesql @sql
