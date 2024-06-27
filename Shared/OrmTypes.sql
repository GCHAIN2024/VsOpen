USE [GCHAIN]

-- [Ca_Address] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Address' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Address ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Bind] BIGINT
        ,[Type] INT
        ,[Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
        ,[Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
        ,[State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS
        ,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[City] BIGINT
        ,[Country] BIGINT
        ,[Remarks] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_Address] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Address NVARCHAR(64)
DECLARE cursor_Ca_Address CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Bind','Type','Line1','Line2','State','County','Town','Contact','Tel','Email','Zip','City','Country','Remarks'))

OPEN cursor_Ca_Address
FETCH NEXT FROM cursor_Ca_Address INTO @name_Ca_Address

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Address.' + @name_Ca_Address;
    
    DECLARE @sql_Ca_Address NVARCHAR(MAX);
    SET @sql_Ca_Address = 'ALTER TABLE Ca_Address DROP COLUMN ' + QUOTENAME(@name_Ca_Address)
    EXEC sp_executesql @sql_Ca_Address
    
    
    FETCH NEXT FROM cursor_Ca_Address INTO @name_Ca_Address
END

CLOSE cursor_Ca_Address;
DEALLOCATE cursor_Ca_Address;


-- [Ca_Address.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Caption = 'ALTER TABLE Ca_Address ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressCaption')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressCaption]
    END

-- [Ca_Address.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Bind')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Bind NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Bind = 'ALTER TABLE Ca_Address ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Address_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressBind')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressBind]
    END

-- [Ca_Address.Type] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Type')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Type] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Type NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Type = 'ALTER TABLE Ca_Address ADD [Type] INT'
    EXEC sp_executesql @sql_add_Ca_Address_Type
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressType')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressType]
    END

-- [Ca_Address.Line1] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Line1')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Line1 NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Line1 = 'ALTER TABLE Ca_Address ADD [Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Line1
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressLine1')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressLine1]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressLine1')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressLine1]
    END

-- [Ca_Address.Line2] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Line2')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Line2 NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Line2 = 'ALTER TABLE Ca_Address ADD [Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Line2
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressLine2')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressLine2]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressLine2')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressLine2]
    END

-- [Ca_Address.State] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='State')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_State NVARCHAR(MAX);
    SET @sql_add_Ca_Address_State = 'ALTER TABLE Ca_Address ADD [State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_State
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressState')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressState]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressState')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressState]
    END

-- [Ca_Address.County] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='County')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_County NVARCHAR(MAX);
    SET @sql_add_Ca_Address_County = 'ALTER TABLE Ca_Address ADD [County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_County
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressCounty')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressCounty]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressCounty')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressCounty]
    END

-- [Ca_Address.Town] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Town')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Town NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Town = 'ALTER TABLE Ca_Address ADD [Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Town
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressTown')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressTown]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressTown')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressTown]
    END

-- [Ca_Address.Contact] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Contact')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Contact NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Contact = 'ALTER TABLE Ca_Address ADD [Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Contact
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressContact')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressContact]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressContact')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressContact]
    END

-- [Ca_Address.Tel] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Tel')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Tel NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Tel = 'ALTER TABLE Ca_Address ADD [Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Tel
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressTel')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressTel]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressTel')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressTel]
    END

-- [Ca_Address.Email] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Email')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Email NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Email = 'ALTER TABLE Ca_Address ADD [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Email
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressEmail')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressEmail]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressEmail')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressEmail]
    END

-- [Ca_Address.Zip] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Zip')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Zip NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Zip = 'ALTER TABLE Ca_Address ADD [Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Zip
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressZip')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressZip]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressZip')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressZip]
    END

-- [Ca_Address.City] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='City')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [City] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_City NVARCHAR(MAX);
    SET @sql_add_Ca_Address_City = 'ALTER TABLE Ca_Address ADD [City] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Address_City
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressCity')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressCity]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressCity')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressCity]
    END

-- [Ca_Address.Country] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Country')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Country] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Country NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Country = 'ALTER TABLE Ca_Address ADD [Country] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Address_Country
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressCountry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressCountry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressCountry')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressCountry]
    END

-- [Ca_Address.Remarks] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Remarks')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Remarks] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Remarks NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Remarks = 'ALTER TABLE Ca_Address ADD [Remarks] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Address_Remarks
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressRemarks')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressRemarks]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressRemarks')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressRemarks]
    END
-- [Ca_Biz] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Biz' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Biz ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Parent] BIGINT
        ,[BasicAcct] BIGINT
        ,[Desc] NVARCHAR(MAX)
        ,[Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[City] BIGINT
        ,[Country] BIGINT
        ,[Lang] BIGINT
        ,[IsSocial] BIT
        ,[IsCmsSource] BIT
        ,[IsPay] BIT
        ,[MomentLatest] BIGINT
        ,[CountFollowers] BIGINT
        ,[CountFollows] BIGINT
        ,[CountMoments] BIGINT
        ,[CountViews] BIGINT
        ,[CountComments] BIGINT
        ,[CountThumbUps] BIGINT
        ,[CountThumbDns] BIGINT
        ,[IsCrawling] BIT
        ,[IsGSeries] BIT
        ,[RemarksCentral] NVARCHAR(MAX)
        ,[Agent] BIGINT
        ,[SiteCats] NVARCHAR(MAX)
        ,[ConfiguredCats] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_Biz] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Biz NVARCHAR(64)
DECLARE cursor_Ca_Biz CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code','Caption','Parent','BasicAcct','Desc','Website','Icon','City','Country','Lang','IsSocial','IsCmsSource','IsPay','MomentLatest','CountFollowers','CountFollows','CountMoments','CountViews','CountComments','CountThumbUps','CountThumbDns','IsCrawling','IsGSeries','RemarksCentral','Agent','SiteCats','ConfiguredCats'))

OPEN cursor_Ca_Biz
FETCH NEXT FROM cursor_Ca_Biz INTO @name_Ca_Biz

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Biz.' + @name_Ca_Biz;
    
    DECLARE @sql_Ca_Biz NVARCHAR(MAX);
    SET @sql_Ca_Biz = 'ALTER TABLE Ca_Biz DROP COLUMN ' + QUOTENAME(@name_Ca_Biz)
    EXEC sp_executesql @sql_Ca_Biz
    
    
    FETCH NEXT FROM cursor_Ca_Biz INTO @name_Ca_Biz
END

CLOSE cursor_Ca_Biz;
DEALLOCATE cursor_Ca_Biz;


-- [Ca_Biz.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Code')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Code NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Code = 'ALTER TABLE Ca_Biz ADD [Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Biz_Code
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCode')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCode]
    END

-- [Ca_Biz.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Caption = 'ALTER TABLE Ca_Biz ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Biz_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCaption')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCaption]
    END

-- [Ca_Biz.Parent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Parent')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Parent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Parent NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Parent = 'ALTER TABLE Ca_Biz ADD [Parent] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_Parent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizParent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizParent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizParent')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizParent]
    END

-- [Ca_Biz.BasicAcct] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='BasicAcct')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [BasicAcct] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_BasicAcct NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_BasicAcct = 'ALTER TABLE Ca_Biz ADD [BasicAcct] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_BasicAcct
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizBasicAcct')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizBasicAcct]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizBasicAcct')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizBasicAcct]
    END

-- [Ca_Biz.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Desc')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Desc NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Desc = 'ALTER TABLE Ca_Biz ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Biz_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizDesc')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizDesc]
    END

-- [Ca_Biz.Website] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Website')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Website NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Website = 'ALTER TABLE Ca_Biz ADD [Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Biz_Website
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizWebsite')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizWebsite]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizWebsite')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizWebsite]
    END

-- [Ca_Biz.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Icon = 'ALTER TABLE Ca_Biz ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Biz_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIcon')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIcon]
    END

-- [Ca_Biz.City] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='City')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [City] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_City NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_City = 'ALTER TABLE Ca_Biz ADD [City] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_City
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCity')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCity]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCity')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCity]
    END

-- [Ca_Biz.Country] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Country')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Country] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Country NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Country = 'ALTER TABLE Ca_Biz ADD [Country] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_Country
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountry')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountry]
    END

-- [Ca_Biz.Lang] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Lang')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Lang] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Lang NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Lang = 'ALTER TABLE Ca_Biz ADD [Lang] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_Lang
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizLang')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizLang]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizLang')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizLang]
    END

-- [Ca_Biz.IsSocial] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsSocial')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsSocial] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsSocial NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsSocial = 'ALTER TABLE Ca_Biz ADD [IsSocial] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsSocial
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsSocial')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsSocial]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsSocial')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsSocial]
    END

-- [Ca_Biz.IsCmsSource] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsCmsSource')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsCmsSource] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsCmsSource NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsCmsSource = 'ALTER TABLE Ca_Biz ADD [IsCmsSource] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsCmsSource
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsCmsSource')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsCmsSource]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsCmsSource')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsCmsSource]
    END

-- [Ca_Biz.IsPay] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsPay')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsPay] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsPay NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsPay = 'ALTER TABLE Ca_Biz ADD [IsPay] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsPay
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsPay')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsPay]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsPay')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsPay]
    END

-- [Ca_Biz.MomentLatest] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='MomentLatest')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [MomentLatest] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_MomentLatest NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_MomentLatest = 'ALTER TABLE Ca_Biz ADD [MomentLatest] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_MomentLatest
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizMomentLatest')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizMomentLatest]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizMomentLatest')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizMomentLatest]
    END

-- [Ca_Biz.CountFollowers] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountFollowers')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountFollowers] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountFollowers NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountFollowers = 'ALTER TABLE Ca_Biz ADD [CountFollowers] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountFollowers
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountFollowers')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountFollowers]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountFollowers')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountFollowers]
    END

-- [Ca_Biz.CountFollows] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountFollows')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountFollows] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountFollows NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountFollows = 'ALTER TABLE Ca_Biz ADD [CountFollows] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountFollows
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountFollows')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountFollows]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountFollows')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountFollows]
    END

-- [Ca_Biz.CountMoments] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountMoments')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountMoments] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountMoments NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountMoments = 'ALTER TABLE Ca_Biz ADD [CountMoments] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountMoments
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountMoments')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountMoments]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountMoments')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountMoments]
    END

-- [Ca_Biz.CountViews] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountViews')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountViews] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountViews NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountViews = 'ALTER TABLE Ca_Biz ADD [CountViews] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountViews
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountViews')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountViews]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountViews')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountViews]
    END

-- [Ca_Biz.CountComments] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountComments')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountComments] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountComments NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountComments = 'ALTER TABLE Ca_Biz ADD [CountComments] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountComments
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountComments')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountComments]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountComments')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountComments]
    END

-- [Ca_Biz.CountThumbUps] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountThumbUps')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountThumbUps] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountThumbUps NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountThumbUps = 'ALTER TABLE Ca_Biz ADD [CountThumbUps] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountThumbUps
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountThumbUps')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountThumbUps]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountThumbUps')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountThumbUps]
    END

-- [Ca_Biz.CountThumbDns] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountThumbDns')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountThumbDns] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountThumbDns NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountThumbDns = 'ALTER TABLE Ca_Biz ADD [CountThumbDns] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountThumbDns
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountThumbDns')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountThumbDns]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountThumbDns')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountThumbDns]
    END

-- [Ca_Biz.IsCrawling] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsCrawling')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsCrawling] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsCrawling NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsCrawling = 'ALTER TABLE Ca_Biz ADD [IsCrawling] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsCrawling
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsCrawling')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsCrawling]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsCrawling')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsCrawling]
    END

-- [Ca_Biz.IsGSeries] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsGSeries')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsGSeries] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsGSeries NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsGSeries = 'ALTER TABLE Ca_Biz ADD [IsGSeries] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsGSeries
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsGSeries')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsGSeries]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsGSeries')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsGSeries]
    END

-- [Ca_Biz.RemarksCentral] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='RemarksCentral')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [RemarksCentral] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_RemarksCentral NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_RemarksCentral = 'ALTER TABLE Ca_Biz ADD [RemarksCentral] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Biz_RemarksCentral
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizRemarksCentral')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizRemarksCentral]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizRemarksCentral')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizRemarksCentral]
    END

-- [Ca_Biz.Agent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Agent')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Agent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Agent NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Agent = 'ALTER TABLE Ca_Biz ADD [Agent] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_Agent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizAgent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizAgent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizAgent')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizAgent]
    END

-- [Ca_Biz.SiteCats] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='SiteCats')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [SiteCats] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_SiteCats NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_SiteCats = 'ALTER TABLE Ca_Biz ADD [SiteCats] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Biz_SiteCats
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizSiteCats')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizSiteCats]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizSiteCats')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizSiteCats]
    END

-- [Ca_Biz.ConfiguredCats] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='ConfiguredCats')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [ConfiguredCats] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_ConfiguredCats NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_ConfiguredCats = 'ALTER TABLE Ca_Biz ADD [ConfiguredCats] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Biz_ConfiguredCats
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizConfiguredCats')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizConfiguredCats]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizConfiguredCats')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizConfiguredCats]
    END
-- [Ca_Country] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Country' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Country ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
        ,[Cur] BIGINT
        ,[Capital] BIGINT
        ,[Place] BIGINT
        ,[Lang] BIGINT
, CONSTRAINT [PK_Ca_Country] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Country NVARCHAR(64)
DECLARE cursor_Ca_Country CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code2','Caption','Fullname','Icon','Tel','Cur','Capital','Place','Lang'))

OPEN cursor_Ca_Country
FETCH NEXT FROM cursor_Ca_Country INTO @name_Ca_Country

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Country.' + @name_Ca_Country;
    
    DECLARE @sql_Ca_Country NVARCHAR(MAX);
    SET @sql_Ca_Country = 'ALTER TABLE Ca_Country DROP COLUMN ' + QUOTENAME(@name_Ca_Country)
    EXEC sp_executesql @sql_Ca_Country
    
    
    FETCH NEXT FROM cursor_Ca_Country INTO @name_Ca_Country
END

CLOSE cursor_Ca_Country;
DEALLOCATE cursor_Ca_Country;


-- [Ca_Country.Code2] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Code2')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Code2 NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Code2 = 'ALTER TABLE Ca_Country ADD [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Code2
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryCode2')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryCode2]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryCode2')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryCode2]
    END

-- [Ca_Country.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Caption = 'ALTER TABLE Ca_Country ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryCaption')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryCaption]
    END

-- [Ca_Country.Fullname] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Fullname')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Fullname NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Fullname = 'ALTER TABLE Ca_Country ADD [Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Fullname
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryFullname')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryFullname]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryFullname')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryFullname]
    END

-- [Ca_Country.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Icon = 'ALTER TABLE Ca_Country ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryIcon')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryIcon]
    END

-- [Ca_Country.Tel] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Tel')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Tel NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Tel = 'ALTER TABLE Ca_Country ADD [Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Tel
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryTel')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryTel]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryTel')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryTel]
    END

-- [Ca_Country.Cur] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Cur')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Cur] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Cur NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Cur = 'ALTER TABLE Ca_Country ADD [Cur] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Country_Cur
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryCur')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryCur]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryCur')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryCur]
    END

-- [Ca_Country.Capital] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Capital')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Capital] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Capital NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Capital = 'ALTER TABLE Ca_Country ADD [Capital] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Country_Capital
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryCapital')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryCapital]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryCapital')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryCapital]
    END

-- [Ca_Country.Place] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Place')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Place] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Place NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Place = 'ALTER TABLE Ca_Country ADD [Place] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Country_Place
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryPlace')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryPlace]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryPlace')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryPlace]
    END

-- [Ca_Country.Lang] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Lang')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Lang] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Lang NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Lang = 'ALTER TABLE Ca_Country ADD [Lang] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Country_Lang
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryLang')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryLang]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryLang')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryLang]
    END
-- [Ca_Cur] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cur' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Cur ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Hidden] BIT
        ,[IsSac] BIT
        ,[IsTransfer] BIT
        ,[IsCash] BIT
        ,[EnableReward] BIT
        ,[EnableOTC] BIT
        ,[Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS
        ,[CurType] INT
        ,[Dec] BIGINT
        ,[AnchorRate] FLOAT
        ,[Freezable] BIT
        ,[Authorizable] BIT
        ,[ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[BaseRate] FLOAT
, CONSTRAINT [PK_Ca_Cur] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Cur NVARCHAR(64)
DECLARE cursor_Ca_Cur CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code','Caption','Hidden','IsSac','IsTransfer','IsCash','EnableReward','EnableOTC','Icon','CurType','Dec','AnchorRate','Freezable','Authorizable','ChaninID','ChaninName','ContractAddress','WalletAddress','BaseRate'))

OPEN cursor_Ca_Cur
FETCH NEXT FROM cursor_Ca_Cur INTO @name_Ca_Cur

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Cur.' + @name_Ca_Cur;
    
    DECLARE @sql_Ca_Cur NVARCHAR(MAX);
    SET @sql_Ca_Cur = 'ALTER TABLE Ca_Cur DROP COLUMN ' + QUOTENAME(@name_Ca_Cur)
    EXEC sp_executesql @sql_Ca_Cur
    
    
    FETCH NEXT FROM cursor_Ca_Cur INTO @name_Ca_Cur
END

CLOSE cursor_Ca_Cur;
DEALLOCATE cursor_Ca_Cur;


-- [Ca_Cur.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Code')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Code NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Code = 'ALTER TABLE Ca_Cur ADD [Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_Code
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurCode')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurCode]
    END

-- [Ca_Cur.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Caption = 'ALTER TABLE Ca_Cur ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurCaption')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurCaption]
    END

-- [Ca_Cur.Hidden] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Hidden')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Hidden] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Hidden NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Hidden = 'ALTER TABLE Ca_Cur ADD [Hidden] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_Hidden
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurHidden')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurHidden]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurHidden')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurHidden]
    END

-- [Ca_Cur.IsSac] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsSac')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [IsSac] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_IsSac NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_IsSac = 'ALTER TABLE Ca_Cur ADD [IsSac] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_IsSac
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurIsSac')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurIsSac]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurIsSac')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurIsSac]
    END

-- [Ca_Cur.IsTransfer] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsTransfer')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [IsTransfer] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_IsTransfer NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_IsTransfer = 'ALTER TABLE Ca_Cur ADD [IsTransfer] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_IsTransfer
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurIsTransfer')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurIsTransfer]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurIsTransfer')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurIsTransfer]
    END

-- [Ca_Cur.IsCash] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsCash')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [IsCash] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_IsCash NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_IsCash = 'ALTER TABLE Ca_Cur ADD [IsCash] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_IsCash
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurIsCash')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurIsCash]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurIsCash')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurIsCash]
    END

-- [Ca_Cur.EnableReward] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='EnableReward')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [EnableReward] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_EnableReward NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_EnableReward = 'ALTER TABLE Ca_Cur ADD [EnableReward] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_EnableReward
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurEnableReward')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurEnableReward]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurEnableReward')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurEnableReward]
    END

-- [Ca_Cur.EnableOTC] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='EnableOTC')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [EnableOTC] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_EnableOTC NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_EnableOTC = 'ALTER TABLE Ca_Cur ADD [EnableOTC] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_EnableOTC
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurEnableOTC')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurEnableOTC]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurEnableOTC')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurEnableOTC]
    END

-- [Ca_Cur.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Icon = 'ALTER TABLE Ca_Cur ADD [Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurIcon')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurIcon]
    END

-- [Ca_Cur.CurType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='CurType')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [CurType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_CurType NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_CurType = 'ALTER TABLE Ca_Cur ADD [CurType] INT'
    EXEC sp_executesql @sql_add_Ca_Cur_CurType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurCurType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurCurType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurCurType')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurCurType]
    END

-- [Ca_Cur.Dec] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Dec')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Dec] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Dec NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Dec = 'ALTER TABLE Ca_Cur ADD [Dec] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Cur_Dec
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurDec')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurDec]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurDec')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurDec]
    END

-- [Ca_Cur.AnchorRate] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='AnchorRate')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [AnchorRate] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_AnchorRate NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_AnchorRate = 'ALTER TABLE Ca_Cur ADD [AnchorRate] FLOAT'
    EXEC sp_executesql @sql_add_Ca_Cur_AnchorRate
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurAnchorRate')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurAnchorRate]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurAnchorRate')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurAnchorRate]
    END

-- [Ca_Cur.Freezable] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Freezable')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Freezable] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Freezable NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Freezable = 'ALTER TABLE Ca_Cur ADD [Freezable] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_Freezable
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurFreezable')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurFreezable]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurFreezable')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurFreezable]
    END

-- [Ca_Cur.Authorizable] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Authorizable')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Authorizable] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Authorizable NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Authorizable = 'ALTER TABLE Ca_Cur ADD [Authorizable] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_Authorizable
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurAuthorizable')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurAuthorizable]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurAuthorizable')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurAuthorizable]
    END

-- [Ca_Cur.ChaninID] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ChaninID')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_ChaninID NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_ChaninID = 'ALTER TABLE Ca_Cur ADD [ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_ChaninID
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurChaninID')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurChaninID]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurChaninID')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurChaninID]
    END

-- [Ca_Cur.ChaninName] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ChaninName')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_ChaninName NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_ChaninName = 'ALTER TABLE Ca_Cur ADD [ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_ChaninName
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurChaninName')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurChaninName]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurChaninName')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurChaninName]
    END

-- [Ca_Cur.ContractAddress] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ContractAddress')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_ContractAddress NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_ContractAddress = 'ALTER TABLE Ca_Cur ADD [ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_ContractAddress
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurContractAddress')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurContractAddress]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurContractAddress')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurContractAddress]
    END

-- [Ca_Cur.WalletAddress] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='WalletAddress')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_WalletAddress NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_WalletAddress = 'ALTER TABLE Ca_Cur ADD [WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_WalletAddress
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurWalletAddress')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurWalletAddress]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurWalletAddress')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurWalletAddress]
    END

-- [Ca_Cur.BaseRate] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='BaseRate')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [BaseRate] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_BaseRate NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_BaseRate = 'ALTER TABLE Ca_Cur ADD [BaseRate] FLOAT'
    EXEC sp_executesql @sql_add_Ca_Cur_BaseRate
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurBaseRate')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurBaseRate]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurBaseRate')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurBaseRate]
    END
-- [Ca_EndUser] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_EndUser' AND xtype='U')

BEGIN

    CREATE TABLE Ca_EndUser ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[SocialAuthBiz] BIGINT
        ,[SocialAuthId] NVARCHAR(MAX)
        ,[SocialAuthAvatar] NVARCHAR(MAX)
        ,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS
        ,[Gender] INT
        ,[Status] INT
        ,[Admin] INT
        ,[BizPartner] INT
        ,[Privilege] BIGINT
        ,[Verify] INT
        ,[Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[Online] BIT
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[BasicAcct] BIGINT
        ,[Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS
        ,[Referer] BIGINT
        ,[Url] NVARCHAR(MAX)
        ,[About] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_EndUser] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_EndUser NVARCHAR(64)
DECLARE cursor_Ca_EndUser CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Username','SocialAuthBiz','SocialAuthId','SocialAuthAvatar','Email','Tel','Gender','Status','Admin','BizPartner','Privilege','Verify','Pwd','Online','Icon','Background','BasicAcct','Refer','Referer','Url','About'))

OPEN cursor_Ca_EndUser
FETCH NEXT FROM cursor_Ca_EndUser INTO @name_Ca_EndUser

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_EndUser.' + @name_Ca_EndUser;
    
    DECLARE @sql_Ca_EndUser NVARCHAR(MAX);
    SET @sql_Ca_EndUser = 'ALTER TABLE Ca_EndUser DROP COLUMN ' + QUOTENAME(@name_Ca_EndUser)
    EXEC sp_executesql @sql_Ca_EndUser
    
    
    FETCH NEXT FROM cursor_Ca_EndUser INTO @name_Ca_EndUser
END

CLOSE cursor_Ca_EndUser;
DEALLOCATE cursor_Ca_EndUser;


-- [Ca_EndUser.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Caption = 'ALTER TABLE Ca_EndUser ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserCaption')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserCaption]
    END

-- [Ca_EndUser.Username] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Username')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Username NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Username = 'ALTER TABLE Ca_EndUser ADD [Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Username
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserUsername')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserUsername]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserUsername')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserUsername]
    END

-- [Ca_EndUser.SocialAuthBiz] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='SocialAuthBiz')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [SocialAuthBiz] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_SocialAuthBiz NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_SocialAuthBiz = 'ALTER TABLE Ca_EndUser ADD [SocialAuthBiz] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_SocialAuthBiz
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserSocialAuthBiz')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserSocialAuthBiz]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserSocialAuthBiz')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserSocialAuthBiz]
    END

-- [Ca_EndUser.SocialAuthId] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='SocialAuthId')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [SocialAuthId] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_SocialAuthId NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_SocialAuthId = 'ALTER TABLE Ca_EndUser ADD [SocialAuthId] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_EndUser_SocialAuthId
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserSocialAuthId')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserSocialAuthId]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserSocialAuthId')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserSocialAuthId]
    END

-- [Ca_EndUser.SocialAuthAvatar] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='SocialAuthAvatar')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [SocialAuthAvatar] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_SocialAuthAvatar NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_SocialAuthAvatar = 'ALTER TABLE Ca_EndUser ADD [SocialAuthAvatar] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_EndUser_SocialAuthAvatar
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserSocialAuthAvatar')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserSocialAuthAvatar]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserSocialAuthAvatar')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserSocialAuthAvatar]
    END

-- [Ca_EndUser.Email] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Email')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Email NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Email = 'ALTER TABLE Ca_EndUser ADD [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Email
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserEmail')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserEmail]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserEmail')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserEmail]
    END

-- [Ca_EndUser.Tel] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Tel')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Tel NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Tel = 'ALTER TABLE Ca_EndUser ADD [Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Tel
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserTel')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserTel]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserTel')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserTel]
    END

-- [Ca_EndUser.Gender] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Gender')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Gender] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Gender NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Gender = 'ALTER TABLE Ca_EndUser ADD [Gender] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Gender
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserGender')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserGender]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserGender')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserGender]
    END

-- [Ca_EndUser.Status] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Status')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Status] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Status NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Status = 'ALTER TABLE Ca_EndUser ADD [Status] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Status
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserStatus')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserStatus]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserStatus')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserStatus]
    END

-- [Ca_EndUser.Admin] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Admin')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Admin] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Admin NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Admin = 'ALTER TABLE Ca_EndUser ADD [Admin] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Admin
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserAdmin')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserAdmin]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserAdmin')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserAdmin]
    END

-- [Ca_EndUser.BizPartner] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BizPartner')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [BizPartner] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_BizPartner NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_BizPartner = 'ALTER TABLE Ca_EndUser ADD [BizPartner] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_BizPartner
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserBizPartner')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserBizPartner]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserBizPartner')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserBizPartner]
    END

-- [Ca_EndUser.Privilege] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Privilege')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Privilege] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Privilege NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Privilege = 'ALTER TABLE Ca_EndUser ADD [Privilege] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Privilege
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserPrivilege')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserPrivilege]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserPrivilege')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserPrivilege]
    END

-- [Ca_EndUser.Verify] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Verify')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Verify] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Verify NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Verify = 'ALTER TABLE Ca_EndUser ADD [Verify] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Verify
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserVerify')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserVerify]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserVerify')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserVerify]
    END

-- [Ca_EndUser.Pwd] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Pwd')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Pwd NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Pwd = 'ALTER TABLE Ca_EndUser ADD [Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Pwd
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserPwd')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserPwd]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserPwd')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserPwd]
    END

-- [Ca_EndUser.Online] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Online')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Online] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Online NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Online = 'ALTER TABLE Ca_EndUser ADD [Online] BIT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Online
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserOnline')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserOnline]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserOnline')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserOnline]
    END

-- [Ca_EndUser.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Icon = 'ALTER TABLE Ca_EndUser ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserIcon')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserIcon]
    END

-- [Ca_EndUser.Background] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Background')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Background NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Background = 'ALTER TABLE Ca_EndUser ADD [Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Background
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserBackground')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserBackground]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserBackground')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserBackground]
    END

-- [Ca_EndUser.BasicAcct] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BasicAcct')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [BasicAcct] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_BasicAcct NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_BasicAcct = 'ALTER TABLE Ca_EndUser ADD [BasicAcct] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_BasicAcct
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserBasicAcct')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserBasicAcct]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserBasicAcct')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserBasicAcct]
    END

-- [Ca_EndUser.Refer] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Refer')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Refer NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Refer = 'ALTER TABLE Ca_EndUser ADD [Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Refer
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserRefer')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserRefer]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserRefer')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserRefer]
    END

-- [Ca_EndUser.Referer] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Referer')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Referer] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Referer NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Referer = 'ALTER TABLE Ca_EndUser ADD [Referer] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Referer
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserReferer')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserReferer]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserReferer')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserReferer]
    END

-- [Ca_EndUser.Url] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Url')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Url] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Url NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Url = 'ALTER TABLE Ca_EndUser ADD [Url] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_EndUser_Url
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserUrl')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserUrl]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserUrl')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserUrl]
    END

-- [Ca_EndUser.About] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='About')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [About] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_About NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_About = 'ALTER TABLE Ca_EndUser ADD [About] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_EndUser_About
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserAbout')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserAbout]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserAbout')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserAbout]
    END
-- [Ca_File] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_File' AND xtype='U')

BEGIN

    CREATE TABLE Ca_File ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Encrypt] INT
        ,[SHA256] NVARCHAR(MAX)
        ,[Size] BIGINT
        ,[Bind] BIGINT
        ,[BindType] INT
        ,[State] INT
        ,[Folder] BIGINT
        ,[FileType] INT
        ,[JSON] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_File] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_File NVARCHAR(64)
DECLARE cursor_Ca_File CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Encrypt','SHA256','Size','Bind','BindType','State','Folder','FileType','JSON'))

OPEN cursor_Ca_File
FETCH NEXT FROM cursor_Ca_File INTO @name_Ca_File

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_File.' + @name_Ca_File;
    
    DECLARE @sql_Ca_File NVARCHAR(MAX);
    SET @sql_Ca_File = 'ALTER TABLE Ca_File DROP COLUMN ' + QUOTENAME(@name_Ca_File)
    EXEC sp_executesql @sql_Ca_File
    
    
    FETCH NEXT FROM cursor_Ca_File INTO @name_Ca_File
END

CLOSE cursor_Ca_File;
DEALLOCATE cursor_Ca_File;


-- [Ca_File.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_File_Caption = 'ALTER TABLE Ca_File ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_File_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileCaption')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileCaption]
    END

-- [Ca_File.Encrypt] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Encrypt')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Encrypt] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Encrypt NVARCHAR(MAX);
    SET @sql_add_Ca_File_Encrypt = 'ALTER TABLE Ca_File ADD [Encrypt] INT'
    EXEC sp_executesql @sql_add_Ca_File_Encrypt
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileEncrypt')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileEncrypt]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileEncrypt')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileEncrypt]
    END

-- [Ca_File.SHA256] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='SHA256')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [SHA256] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_SHA256 NVARCHAR(MAX);
    SET @sql_add_Ca_File_SHA256 = 'ALTER TABLE Ca_File ADD [SHA256] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_File_SHA256
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileSHA256')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileSHA256]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileSHA256')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileSHA256]
    END

-- [Ca_File.Size] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Size')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Size] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Size NVARCHAR(MAX);
    SET @sql_add_Ca_File_Size = 'ALTER TABLE Ca_File ADD [Size] BIGINT'
    EXEC sp_executesql @sql_add_Ca_File_Size
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileSize')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileSize]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileSize')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileSize]
    END

-- [Ca_File.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Bind')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Bind NVARCHAR(MAX);
    SET @sql_add_Ca_File_Bind = 'ALTER TABLE Ca_File ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Ca_File_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileBind')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileBind]
    END

-- [Ca_File.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='BindType')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_BindType NVARCHAR(MAX);
    SET @sql_add_Ca_File_BindType = 'ALTER TABLE Ca_File ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Ca_File_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileBindType')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileBindType]
    END

-- [Ca_File.State] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='State')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [State] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_State NVARCHAR(MAX);
    SET @sql_add_Ca_File_State = 'ALTER TABLE Ca_File ADD [State] INT'
    EXEC sp_executesql @sql_add_Ca_File_State
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileState')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileState]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileState')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileState]
    END

-- [Ca_File.Folder] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Folder')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Folder] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Folder NVARCHAR(MAX);
    SET @sql_add_Ca_File_Folder = 'ALTER TABLE Ca_File ADD [Folder] BIGINT'
    EXEC sp_executesql @sql_add_Ca_File_Folder
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileFolder')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileFolder]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileFolder')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileFolder]
    END

-- [Ca_File.FileType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='FileType')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [FileType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_FileType NVARCHAR(MAX);
    SET @sql_add_Ca_File_FileType = 'ALTER TABLE Ca_File ADD [FileType] INT'
    EXEC sp_executesql @sql_add_Ca_File_FileType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileFileType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileFileType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileFileType')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileFileType]
    END

-- [Ca_File.JSON] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='JSON')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [JSON] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_JSON NVARCHAR(MAX);
    SET @sql_add_Ca_File_JSON = 'ALTER TABLE Ca_File ADD [JSON] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_File_JSON
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileJSON')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileJSON]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileJSON')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileJSON]
    END
-- [Ca_Folder] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Folder' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Folder ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Encrypt] INT
        ,[Bind] BIGINT
        ,[BindType] INT
        ,[Parent] BIGINT
, CONSTRAINT [PK_Ca_Folder] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Folder NVARCHAR(64)
DECLARE cursor_Ca_Folder CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Encrypt','Bind','BindType','Parent'))

OPEN cursor_Ca_Folder
FETCH NEXT FROM cursor_Ca_Folder INTO @name_Ca_Folder

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Folder.' + @name_Ca_Folder;
    
    DECLARE @sql_Ca_Folder NVARCHAR(MAX);
    SET @sql_Ca_Folder = 'ALTER TABLE Ca_Folder DROP COLUMN ' + QUOTENAME(@name_Ca_Folder)
    EXEC sp_executesql @sql_Ca_Folder
    
    
    FETCH NEXT FROM cursor_Ca_Folder INTO @name_Ca_Folder
END

CLOSE cursor_Ca_Folder;
DEALLOCATE cursor_Ca_Folder;


-- [Ca_Folder.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_Caption = 'ALTER TABLE Ca_Folder ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Folder_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderCaption')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderCaption]
    END

-- [Ca_Folder.Encrypt] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Encrypt')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Encrypt] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_Encrypt NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_Encrypt = 'ALTER TABLE Ca_Folder ADD [Encrypt] INT'
    EXEC sp_executesql @sql_add_Ca_Folder_Encrypt
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderEncrypt')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderEncrypt]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderEncrypt')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderEncrypt]
    END

-- [Ca_Folder.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Bind')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_Bind NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_Bind = 'ALTER TABLE Ca_Folder ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Folder_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderBind')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderBind]
    END

-- [Ca_Folder.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='BindType')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_BindType NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_BindType = 'ALTER TABLE Ca_Folder ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Ca_Folder_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderBindType')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderBindType]
    END

-- [Ca_Folder.Parent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Parent')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Parent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_Parent NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_Parent = 'ALTER TABLE Ca_Folder ADD [Parent] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Folder_Parent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderParent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderParent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderParent')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderParent]
    END
-- [Ca_Lang] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Lang' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Lang ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[IsBlank] BIT
        ,[IsLocale] BIT
        ,[IsContent] BIT
        ,[IsAutoTranslate] BIT
        ,[TextDirection] INT
, CONSTRAINT [PK_Ca_Lang] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Lang NVARCHAR(64)
DECLARE cursor_Ca_Lang CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code2','Caption','Native','Icon','IsBlank','IsLocale','IsContent','IsAutoTranslate','TextDirection'))

OPEN cursor_Ca_Lang
FETCH NEXT FROM cursor_Ca_Lang INTO @name_Ca_Lang

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Lang.' + @name_Ca_Lang;
    
    DECLARE @sql_Ca_Lang NVARCHAR(MAX);
    SET @sql_Ca_Lang = 'ALTER TABLE Ca_Lang DROP COLUMN ' + QUOTENAME(@name_Ca_Lang)
    EXEC sp_executesql @sql_Ca_Lang
    
    
    FETCH NEXT FROM cursor_Ca_Lang INTO @name_Ca_Lang
END

CLOSE cursor_Ca_Lang;
DEALLOCATE cursor_Ca_Lang;


-- [Ca_Lang.Code2] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Code2')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_Code2 NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_Code2 = 'ALTER TABLE Ca_Lang ADD [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Lang_Code2
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangCode2')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangCode2]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangCode2')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangCode2]
    END

-- [Ca_Lang.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_Caption = 'ALTER TABLE Ca_Lang ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Lang_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangCaption')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangCaption]
    END

-- [Ca_Lang.Native] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Native')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_Native NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_Native = 'ALTER TABLE Ca_Lang ADD [Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Lang_Native
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangNative')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangNative]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangNative')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangNative]
    END

-- [Ca_Lang.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_Icon = 'ALTER TABLE Ca_Lang ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Lang_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIcon')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIcon]
    END

-- [Ca_Lang.IsBlank] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsBlank')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsBlank] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsBlank NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsBlank = 'ALTER TABLE Ca_Lang ADD [IsBlank] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsBlank
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsBlank')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsBlank]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsBlank')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsBlank]
    END

-- [Ca_Lang.IsLocale] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsLocale')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsLocale] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsLocale NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsLocale = 'ALTER TABLE Ca_Lang ADD [IsLocale] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsLocale
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsLocale')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsLocale]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsLocale')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsLocale]
    END

-- [Ca_Lang.IsContent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsContent')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsContent] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsContent NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsContent = 'ALTER TABLE Ca_Lang ADD [IsContent] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsContent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsContent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsContent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsContent')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsContent]
    END

-- [Ca_Lang.IsAutoTranslate] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsAutoTranslate')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsAutoTranslate] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsAutoTranslate NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsAutoTranslate = 'ALTER TABLE Ca_Lang ADD [IsAutoTranslate] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsAutoTranslate
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsAutoTranslate')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsAutoTranslate]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsAutoTranslate')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsAutoTranslate]
    END

-- [Ca_Lang.TextDirection] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='TextDirection')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [TextDirection] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_TextDirection NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_TextDirection = 'ALTER TABLE Ca_Lang ADD [TextDirection] INT'
    EXEC sp_executesql @sql_add_Ca_Lang_TextDirection
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangTextDirection')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangTextDirection]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangTextDirection')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangTextDirection]
    END
-- [Ca_WebCredential] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_WebCredential' AND xtype='U')

BEGIN

    CREATE TABLE Ca_WebCredential ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[ExternalId] BIGINT
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[EU] BIGINT
        ,[Biz] BIGINT
        ,[Json] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_WebCredential] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_WebCredential NVARCHAR(64)
DECLARE cursor_Ca_WebCredential CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','ExternalId','Icon','EU','Biz','Json'))

OPEN cursor_Ca_WebCredential
FETCH NEXT FROM cursor_Ca_WebCredential INTO @name_Ca_WebCredential

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_WebCredential.' + @name_Ca_WebCredential;
    
    DECLARE @sql_Ca_WebCredential NVARCHAR(MAX);
    SET @sql_Ca_WebCredential = 'ALTER TABLE Ca_WebCredential DROP COLUMN ' + QUOTENAME(@name_Ca_WebCredential)
    EXEC sp_executesql @sql_Ca_WebCredential
    
    
    FETCH NEXT FROM cursor_Ca_WebCredential INTO @name_Ca_WebCredential
END

CLOSE cursor_Ca_WebCredential;
DEALLOCATE cursor_Ca_WebCredential;


-- [Ca_WebCredential.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_Caption = 'ALTER TABLE Ca_WebCredential ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_WebCredential_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialCaption')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialCaption]
    END

-- [Ca_WebCredential.ExternalId] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='ExternalId')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [ExternalId] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_ExternalId NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_ExternalId = 'ALTER TABLE Ca_WebCredential ADD [ExternalId] BIGINT'
    EXEC sp_executesql @sql_add_Ca_WebCredential_ExternalId
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialExternalId')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialExternalId]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialExternalId')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialExternalId]
    END

-- [Ca_WebCredential.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_Icon = 'ALTER TABLE Ca_WebCredential ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_WebCredential_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialIcon')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialIcon]
    END

-- [Ca_WebCredential.EU] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='EU')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [EU] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_EU NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_EU = 'ALTER TABLE Ca_WebCredential ADD [EU] BIGINT'
    EXEC sp_executesql @sql_add_Ca_WebCredential_EU
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialEU')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialEU]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialEU')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialEU]
    END

-- [Ca_WebCredential.Biz] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Biz')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Biz] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_Biz NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_Biz = 'ALTER TABLE Ca_WebCredential ADD [Biz] BIGINT'
    EXEC sp_executesql @sql_add_Ca_WebCredential_Biz
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialBiz')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialBiz]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialBiz')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialBiz]
    END

-- [Ca_WebCredential.Json] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Json')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Json] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_Json NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_Json = 'ALTER TABLE Ca_WebCredential ADD [Json] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_WebCredential_Json
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialJson')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialJson]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialJson')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialJson]
    END
-- [Core_BizOwner] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Core_BizOwner' AND xtype='U')

BEGIN

    CREATE TABLE Core_BizOwner ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Bind] BIGINT
        ,[BindType] INT
        ,[State] INT
, CONSTRAINT [PK_Core_BizOwner] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Core_BizOwner NVARCHAR(64)
DECLARE cursor_Core_BizOwner CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Bind','BindType','State'))

OPEN cursor_Core_BizOwner
FETCH NEXT FROM cursor_Core_BizOwner INTO @name_Core_BizOwner

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Core_BizOwner.' + @name_Core_BizOwner;
    
    DECLARE @sql_Core_BizOwner NVARCHAR(MAX);
    SET @sql_Core_BizOwner = 'ALTER TABLE Core_BizOwner DROP COLUMN ' + QUOTENAME(@name_Core_BizOwner)
    EXEC sp_executesql @sql_Core_BizOwner
    
    
    FETCH NEXT FROM cursor_Core_BizOwner INTO @name_Core_BizOwner
END

CLOSE cursor_Core_BizOwner;
DEALLOCATE cursor_Core_BizOwner;


-- [Core_BizOwner.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='Caption')
    BEGIN
     ALTER TABLE Core_BizOwner ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_BizOwner_Caption NVARCHAR(MAX);
    SET @sql_add_Core_BizOwner_Caption = 'ALTER TABLE Core_BizOwner ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Core_BizOwner_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_BizOwnerCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_BizOwnerCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_BizOwnerCaption')
    BEGIN
    ALTER TABLE Core_BizOwner DROP  CONSTRAINT [UniqueNonclustered_Core_BizOwnerCaption]
    END

-- [Core_BizOwner.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='Bind')
    BEGIN
     ALTER TABLE Core_BizOwner ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_BizOwner_Bind NVARCHAR(MAX);
    SET @sql_add_Core_BizOwner_Bind = 'ALTER TABLE Core_BizOwner ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Core_BizOwner_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_BizOwnerBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_BizOwnerBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_BizOwnerBind')
    BEGIN
    ALTER TABLE Core_BizOwner DROP  CONSTRAINT [UniqueNonclustered_Core_BizOwnerBind]
    END

-- [Core_BizOwner.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='BindType')
    BEGIN
     ALTER TABLE Core_BizOwner ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_BizOwner_BindType NVARCHAR(MAX);
    SET @sql_add_Core_BizOwner_BindType = 'ALTER TABLE Core_BizOwner ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Core_BizOwner_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_BizOwnerBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_BizOwnerBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_BizOwnerBindType')
    BEGIN
    ALTER TABLE Core_BizOwner DROP  CONSTRAINT [UniqueNonclustered_Core_BizOwnerBindType]
    END

-- [Core_BizOwner.State] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='State')
    BEGIN
     ALTER TABLE Core_BizOwner ALTER COLUMN [State] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_BizOwner_State NVARCHAR(MAX);
    SET @sql_add_Core_BizOwner_State = 'ALTER TABLE Core_BizOwner ADD [State] INT'
    EXEC sp_executesql @sql_add_Core_BizOwner_State
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_BizOwnerState')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_BizOwnerState]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_BizOwnerState')
    BEGIN
    ALTER TABLE Core_BizOwner DROP  CONSTRAINT [UniqueNonclustered_Core_BizOwnerState]
    END
-- [Core_CryptoLink] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Core_CryptoLink' AND xtype='U')

BEGIN

    CREATE TABLE Core_CryptoLink ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Expiry] BIGINT
        ,[HashFull] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[HashTiny] NVARCHAR(9) COLLATE Chinese_PRC_CI_AS
        ,[Src] NVARCHAR(MAX)
        ,[DomainName] BIGINT
        ,[Owner] BIGINT
        ,[Dst] BIGINT
        ,[BizOwner] BIGINT
        ,[Data] NVARCHAR(MAX)
        ,[OgTitle] NVARCHAR(MAX)
        ,[OgDesc] NVARCHAR(MAX)
        ,[OgImg] NVARCHAR(MAX)
, CONSTRAINT [PK_Core_CryptoLink] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Core_CryptoLink NVARCHAR(64)
DECLARE cursor_Core_CryptoLink CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Expiry','HashFull','HashTiny','Src','DomainName','Owner','Dst','BizOwner','Data','OgTitle','OgDesc','OgImg'))

OPEN cursor_Core_CryptoLink
FETCH NEXT FROM cursor_Core_CryptoLink INTO @name_Core_CryptoLink

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Core_CryptoLink.' + @name_Core_CryptoLink;
    
    DECLARE @sql_Core_CryptoLink NVARCHAR(MAX);
    SET @sql_Core_CryptoLink = 'ALTER TABLE Core_CryptoLink DROP COLUMN ' + QUOTENAME(@name_Core_CryptoLink)
    EXEC sp_executesql @sql_Core_CryptoLink
    
    
    FETCH NEXT FROM cursor_Core_CryptoLink INTO @name_Core_CryptoLink
END

CLOSE cursor_Core_CryptoLink;
DEALLOCATE cursor_Core_CryptoLink;


-- [Core_CryptoLink.Expiry] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='Expiry')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [Expiry] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_Expiry NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_Expiry = 'ALTER TABLE Core_CryptoLink ADD [Expiry] BIGINT'
    EXEC sp_executesql @sql_add_Core_CryptoLink_Expiry
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkExpiry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkExpiry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkExpiry')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkExpiry]
    END

-- [Core_CryptoLink.HashFull] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='HashFull')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [HashFull] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_HashFull NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_HashFull = 'ALTER TABLE Core_CryptoLink ADD [HashFull] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Core_CryptoLink_HashFull
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkHashFull')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkHashFull]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkHashFull')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkHashFull]
    END

-- [Core_CryptoLink.HashTiny] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='HashTiny')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [HashTiny] NVARCHAR(9) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_HashTiny NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_HashTiny = 'ALTER TABLE Core_CryptoLink ADD [HashTiny] NVARCHAR(9) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Core_CryptoLink_HashTiny
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkHashTiny')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkHashTiny]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkHashTiny')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkHashTiny]
    END

-- [Core_CryptoLink.Src] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='Src')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [Src] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_Src NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_Src = 'ALTER TABLE Core_CryptoLink ADD [Src] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Core_CryptoLink_Src
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkSrc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkSrc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkSrc')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkSrc]
    END

-- [Core_CryptoLink.DomainName] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='DomainName')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [DomainName] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_DomainName NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_DomainName = 'ALTER TABLE Core_CryptoLink ADD [DomainName] BIGINT'
    EXEC sp_executesql @sql_add_Core_CryptoLink_DomainName
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkDomainName')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkDomainName]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkDomainName')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkDomainName]
    END

-- [Core_CryptoLink.Owner] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='Owner')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [Owner] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_Owner NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_Owner = 'ALTER TABLE Core_CryptoLink ADD [Owner] BIGINT'
    EXEC sp_executesql @sql_add_Core_CryptoLink_Owner
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkOwner')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkOwner]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkOwner')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkOwner]
    END

-- [Core_CryptoLink.Dst] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='Dst')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [Dst] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_Dst NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_Dst = 'ALTER TABLE Core_CryptoLink ADD [Dst] BIGINT'
    EXEC sp_executesql @sql_add_Core_CryptoLink_Dst
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkDst')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkDst]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkDst')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkDst]
    END

-- [Core_CryptoLink.BizOwner] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='BizOwner')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [BizOwner] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_BizOwner NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_BizOwner = 'ALTER TABLE Core_CryptoLink ADD [BizOwner] BIGINT'
    EXEC sp_executesql @sql_add_Core_CryptoLink_BizOwner
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkBizOwner')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkBizOwner]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkBizOwner')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkBizOwner]
    END

-- [Core_CryptoLink.Data] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='Data')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [Data] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_Data NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_Data = 'ALTER TABLE Core_CryptoLink ADD [Data] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Core_CryptoLink_Data
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkData')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkData]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkData')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkData]
    END

-- [Core_CryptoLink.OgTitle] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='OgTitle')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [OgTitle] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_OgTitle NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_OgTitle = 'ALTER TABLE Core_CryptoLink ADD [OgTitle] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Core_CryptoLink_OgTitle
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkOgTitle')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkOgTitle]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkOgTitle')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkOgTitle]
    END

-- [Core_CryptoLink.OgDesc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='OgDesc')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [OgDesc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_OgDesc NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_OgDesc = 'ALTER TABLE Core_CryptoLink ADD [OgDesc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Core_CryptoLink_OgDesc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkOgDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkOgDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkOgDesc')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkOgDesc]
    END

-- [Core_CryptoLink.OgImg] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='OgImg')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [OgImg] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_CryptoLink_OgImg NVARCHAR(MAX);
    SET @sql_add_Core_CryptoLink_OgImg = 'ALTER TABLE Core_CryptoLink ADD [OgImg] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Core_CryptoLink_OgImg
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_CryptoLinkOgImg')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_CryptoLinkOgImg]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_CryptoLinkOgImg')
    BEGIN
    ALTER TABLE Core_CryptoLink DROP  CONSTRAINT [UniqueNonclustered_Core_CryptoLinkOgImg]
    END
-- [Core_DomainName] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Core_DomainName' AND xtype='U')

BEGIN

    CREATE TABLE Core_DomainName ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Biz] BIGINT
        ,[EndUser] BIGINT
        ,[BizOwner] BIGINT
, CONSTRAINT [PK_Core_DomainName] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Core_DomainName NVARCHAR(64)
DECLARE cursor_Core_DomainName CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Core_DomainName') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Biz','EndUser','BizOwner'))

OPEN cursor_Core_DomainName
FETCH NEXT FROM cursor_Core_DomainName INTO @name_Core_DomainName

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Core_DomainName.' + @name_Core_DomainName;
    
    DECLARE @sql_Core_DomainName NVARCHAR(MAX);
    SET @sql_Core_DomainName = 'ALTER TABLE Core_DomainName DROP COLUMN ' + QUOTENAME(@name_Core_DomainName)
    EXEC sp_executesql @sql_Core_DomainName
    
    
    FETCH NEXT FROM cursor_Core_DomainName INTO @name_Core_DomainName
END

CLOSE cursor_Core_DomainName;
DEALLOCATE cursor_Core_DomainName;


-- [Core_DomainName.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_DomainName') AND name='Caption')
    BEGIN
     ALTER TABLE Core_DomainName ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_DomainName_Caption NVARCHAR(MAX);
    SET @sql_add_Core_DomainName_Caption = 'ALTER TABLE Core_DomainName ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Core_DomainName_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_DomainNameCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_DomainNameCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_DomainNameCaption')
    BEGIN
    ALTER TABLE Core_DomainName DROP  CONSTRAINT [UniqueNonclustered_Core_DomainNameCaption]
    END

-- [Core_DomainName.Biz] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_DomainName') AND name='Biz')
    BEGIN
     ALTER TABLE Core_DomainName ALTER COLUMN [Biz] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_DomainName_Biz NVARCHAR(MAX);
    SET @sql_add_Core_DomainName_Biz = 'ALTER TABLE Core_DomainName ADD [Biz] BIGINT'
    EXEC sp_executesql @sql_add_Core_DomainName_Biz
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_DomainNameBiz')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_DomainNameBiz]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_DomainNameBiz')
    BEGIN
    ALTER TABLE Core_DomainName DROP  CONSTRAINT [UniqueNonclustered_Core_DomainNameBiz]
    END

-- [Core_DomainName.EndUser] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_DomainName') AND name='EndUser')
    BEGIN
     ALTER TABLE Core_DomainName ALTER COLUMN [EndUser] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_DomainName_EndUser NVARCHAR(MAX);
    SET @sql_add_Core_DomainName_EndUser = 'ALTER TABLE Core_DomainName ADD [EndUser] BIGINT'
    EXEC sp_executesql @sql_add_Core_DomainName_EndUser
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_DomainNameEndUser')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_DomainNameEndUser]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_DomainNameEndUser')
    BEGIN
    ALTER TABLE Core_DomainName DROP  CONSTRAINT [UniqueNonclustered_Core_DomainNameEndUser]
    END

-- [Core_DomainName.BizOwner] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_DomainName') AND name='BizOwner')
    BEGIN
     ALTER TABLE Core_DomainName ALTER COLUMN [BizOwner] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Core_DomainName_BizOwner NVARCHAR(MAX);
    SET @sql_add_Core_DomainName_BizOwner = 'ALTER TABLE Core_DomainName ADD [BizOwner] BIGINT'
    EXEC sp_executesql @sql_add_Core_DomainName_BizOwner
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Core_DomainNameBizOwner')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Core_DomainNameBizOwner]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Core_DomainNameBizOwner')
    BEGIN
    ALTER TABLE Core_DomainName DROP  CONSTRAINT [UniqueNonclustered_Core_DomainNameBizOwner]
    END
-- [Sys_Log] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Log' AND xtype='U')

BEGIN

    CREATE TABLE Sys_Log ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Location] NVARCHAR(MAX)
        ,[Content] NVARCHAR(MAX)
        ,[Sql] NVARCHAR(MAX)
, CONSTRAINT [PK_Sys_Log] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Sys_Log NVARCHAR(64)
DECLARE cursor_Sys_Log CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Location','Content','Sql'))

OPEN cursor_Sys_Log
FETCH NEXT FROM cursor_Sys_Log INTO @name_Sys_Log

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Sys_Log.' + @name_Sys_Log;
    
    DECLARE @sql_Sys_Log NVARCHAR(MAX);
    SET @sql_Sys_Log = 'ALTER TABLE Sys_Log DROP COLUMN ' + QUOTENAME(@name_Sys_Log)
    EXEC sp_executesql @sql_Sys_Log
    
    
    FETCH NEXT FROM cursor_Sys_Log INTO @name_Sys_Log
END

CLOSE cursor_Sys_Log;
DEALLOCATE cursor_Sys_Log;


-- [Sys_Log.Location] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Location')
    BEGIN
     ALTER TABLE Sys_Log ALTER COLUMN [Location] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Sys_Log_Location NVARCHAR(MAX);
    SET @sql_add_Sys_Log_Location = 'ALTER TABLE Sys_Log ADD [Location] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Sys_Log_Location
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Sys_LogLocation')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Sys_LogLocation]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Sys_LogLocation')
    BEGIN
    ALTER TABLE Sys_Log DROP  CONSTRAINT [UniqueNonclustered_Sys_LogLocation]
    END

-- [Sys_Log.Content] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Content')
    BEGIN
     ALTER TABLE Sys_Log ALTER COLUMN [Content] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Sys_Log_Content NVARCHAR(MAX);
    SET @sql_add_Sys_Log_Content = 'ALTER TABLE Sys_Log ADD [Content] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Sys_Log_Content
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Sys_LogContent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Sys_LogContent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Sys_LogContent')
    BEGIN
    ALTER TABLE Sys_Log DROP  CONSTRAINT [UniqueNonclustered_Sys_LogContent]
    END

-- [Sys_Log.Sql] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Sql')
    BEGIN
     ALTER TABLE Sys_Log ALTER COLUMN [Sql] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Sys_Log_Sql NVARCHAR(MAX);
    SET @sql_add_Sys_Log_Sql = 'ALTER TABLE Sys_Log ADD [Sql] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Sys_Log_Sql
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Sys_LogSql')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Sys_LogSql]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Sys_LogSql')
    BEGIN
    ALTER TABLE Sys_Log DROP  CONSTRAINT [UniqueNonclustered_Sys_LogSql]
    END