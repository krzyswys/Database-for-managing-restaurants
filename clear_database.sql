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
EXEC sp_executesql @sql

-- drop triggers
SELECT @sql += 
    N'DROP TRIGGER ' + 
    QUOTENAME(OBJECT_SCHEMA_NAME(t.object_id)) + N'.' + 
    QUOTENAME(t.name) + N'; ' + NCHAR(13)
FROM sys.triggers AS t
WHERE t.is_ms_shipped = 0
 AND t.parent_class_desc = N'OBJECT_OR_COLUMN';

-- drop indexes
SELECT @sql = 
(SELECT  'DROP INDEX ' + quotename(ix.name) + ' ON ' + quotename(object_schema_name(object_id)) + '.' + quotename(OBJECT_NAME(object_id)) + '; '
FROM  sys.indexes ix
WHERE   ix.Name IS NOT null and ix.Name like '%prefix_%'
FOR XML PATH(''));
EXEC sp_executesql @sql
