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


DECLARE @Ca_Address TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_Address (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Caption'),('Bind'),('Type'),('Line1'),('Line2'),('State'),('County'),('Town'),('Contact'),('Tel'),('Email'),('Zip'),('City'),('Country'),('Remarks');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') 
AND (name in ('ID','Createdat','Updatedat','Sort','Caption','Bind','Type','Line1','Line2','State','County','Town','Contact','Tel','Email','Zip','City','Country','Remarks'))
DECLARE @CounterCa_Address INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_Address'));
WHILE @CounterCa_Address > 0
BEGIN
    SET @CounterCa_Address = @CounterCa_Address - 1;
    PRINT @CounterCa_Address
END


-- [Ca_Address.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_Address ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Bind] BIGINT
    END

UPDATE Ca_Address SET [Bind]='' WHERE ([Bind] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Type] INT
    END

UPDATE Ca_Address SET [Type]='' WHERE ([Type] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [Line1]='' WHERE ([Line1] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [Line2]='' WHERE ([Line2] IS NULL)

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
    ALTER TABLE Ca_Address ADD [State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [State]='' WHERE ([State] IS NULL)

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
    ALTER TABLE Ca_Address ADD [County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [County]='' WHERE ([County] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [Town]='' WHERE ([Town] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [Contact]='' WHERE ([Contact] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [Tel]='' WHERE ([Tel] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [Email]='' WHERE ([Email] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Address SET [Zip]='' WHERE ([Zip] IS NULL)

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
    ALTER TABLE Ca_Address ADD [City] BIGINT
    END

UPDATE Ca_Address SET [City]='' WHERE ([City] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Country] BIGINT
    END

UPDATE Ca_Address SET [Country]='' WHERE ([Country] IS NULL)

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
    ALTER TABLE Ca_Address ADD [Remarks] NVARCHAR(MAX)
    END

UPDATE Ca_Address SET [Remarks]='' WHERE ([Remarks] IS NULL)

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


DECLARE @Ca_Biz TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_Biz (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Code'),('Caption'),('Parent'),('BasicAcct'),('Desc'),('Website'),('Icon'),('City'),('Country'),('Lang'),('IsSocial'),('IsCmsSource'),('IsPay'),('MomentLatest'),('CountFollowers'),('CountFollows'),('CountMoments'),('CountViews'),('CountComments'),('CountThumbUps'),('CountThumbDns'),('IsCrawling'),('IsGSeries'),('RemarksCentral'),('Agent'),('SiteCats'),('ConfiguredCats');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') 
AND (name in ('ID','Createdat','Updatedat','Sort','Code','Caption','Parent','BasicAcct','Desc','Website','Icon','City','Country','Lang','IsSocial','IsCmsSource','IsPay','MomentLatest','CountFollowers','CountFollows','CountMoments','CountViews','CountComments','CountThumbUps','CountThumbDns','IsCrawling','IsGSeries','RemarksCentral','Agent','SiteCats','ConfiguredCats'))
DECLARE @CounterCa_Biz INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz'));
WHILE @CounterCa_Biz > 0
BEGIN
    SET @CounterCa_Biz = @CounterCa_Biz - 1;
    PRINT @CounterCa_Biz
END


-- [Ca_Biz.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Code')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_Biz ADD [Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Biz SET [Code]='' WHERE ([Code] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Biz SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [Parent] BIGINT
    END

UPDATE Ca_Biz SET [Parent]='' WHERE ([Parent] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [BasicAcct] BIGINT
    END

UPDATE Ca_Biz SET [BasicAcct]='' WHERE ([BasicAcct] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [Desc] NVARCHAR(MAX)
    END

UPDATE Ca_Biz SET [Desc]='' WHERE ([Desc] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Biz SET [Website]='' WHERE ([Website] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Biz SET [Icon]='' WHERE ([Icon] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [City] BIGINT
    END

UPDATE Ca_Biz SET [City]='' WHERE ([City] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [Country] BIGINT
    END

UPDATE Ca_Biz SET [Country]='' WHERE ([Country] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [Lang] BIGINT
    END

UPDATE Ca_Biz SET [Lang]='' WHERE ([Lang] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [IsSocial] BIT
    END

UPDATE Ca_Biz SET [IsSocial]='' WHERE ([IsSocial] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [IsCmsSource] BIT
    END

UPDATE Ca_Biz SET [IsCmsSource]='' WHERE ([IsCmsSource] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [IsPay] BIT
    END

UPDATE Ca_Biz SET [IsPay]='' WHERE ([IsPay] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [MomentLatest] BIGINT
    END

UPDATE Ca_Biz SET [MomentLatest]='' WHERE ([MomentLatest] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [CountFollowers] BIGINT
    END

UPDATE Ca_Biz SET [CountFollowers]='' WHERE ([CountFollowers] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [CountFollows] BIGINT
    END

UPDATE Ca_Biz SET [CountFollows]='' WHERE ([CountFollows] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [CountMoments] BIGINT
    END

UPDATE Ca_Biz SET [CountMoments]='' WHERE ([CountMoments] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [CountViews] BIGINT
    END

UPDATE Ca_Biz SET [CountViews]='' WHERE ([CountViews] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [CountComments] BIGINT
    END

UPDATE Ca_Biz SET [CountComments]='' WHERE ([CountComments] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [CountThumbUps] BIGINT
    END

UPDATE Ca_Biz SET [CountThumbUps]='' WHERE ([CountThumbUps] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [CountThumbDns] BIGINT
    END

UPDATE Ca_Biz SET [CountThumbDns]='' WHERE ([CountThumbDns] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [IsCrawling] BIT
    END

UPDATE Ca_Biz SET [IsCrawling]='' WHERE ([IsCrawling] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [IsGSeries] BIT
    END

UPDATE Ca_Biz SET [IsGSeries]='' WHERE ([IsGSeries] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [RemarksCentral] NVARCHAR(MAX)
    END

UPDATE Ca_Biz SET [RemarksCentral]='' WHERE ([RemarksCentral] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [Agent] BIGINT
    END

UPDATE Ca_Biz SET [Agent]='' WHERE ([Agent] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [SiteCats] NVARCHAR(MAX)
    END

UPDATE Ca_Biz SET [SiteCats]='' WHERE ([SiteCats] IS NULL)

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
    ALTER TABLE Ca_Biz ADD [ConfiguredCats] NVARCHAR(MAX)
    END

UPDATE Ca_Biz SET [ConfiguredCats]='' WHERE ([ConfiguredCats] IS NULL)

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


DECLARE @Ca_Country TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_Country (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Code2'),('Caption'),('Fullname'),('Icon'),('Tel'),('Cur'),('Capital'),('Place'),('Lang');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') 
AND (name in ('ID','Createdat','Updatedat','Sort','Code2','Caption','Fullname','Icon','Tel','Cur','Capital','Place','Lang'))
DECLARE @CounterCa_Country INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_Country'));
WHILE @CounterCa_Country > 0
BEGIN
    SET @CounterCa_Country = @CounterCa_Country - 1;
    PRINT @CounterCa_Country
END


-- [Ca_Country.Code2] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Code2')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_Country ADD [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Country SET [Code2]='' WHERE ([Code2] IS NULL)

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
    ALTER TABLE Ca_Country ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Country SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_Country ADD [Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Country SET [Fullname]='' WHERE ([Fullname] IS NULL)

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
    ALTER TABLE Ca_Country ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Country SET [Icon]='' WHERE ([Icon] IS NULL)

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
    ALTER TABLE Ca_Country ADD [Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Country SET [Tel]='' WHERE ([Tel] IS NULL)

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
    ALTER TABLE Ca_Country ADD [Cur] BIGINT
    END

UPDATE Ca_Country SET [Cur]='' WHERE ([Cur] IS NULL)

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
    ALTER TABLE Ca_Country ADD [Capital] BIGINT
    END

UPDATE Ca_Country SET [Capital]='' WHERE ([Capital] IS NULL)

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
    ALTER TABLE Ca_Country ADD [Place] BIGINT
    END

UPDATE Ca_Country SET [Place]='' WHERE ([Place] IS NULL)

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
    ALTER TABLE Ca_Country ADD [Lang] BIGINT
    END

UPDATE Ca_Country SET [Lang]='' WHERE ([Lang] IS NULL)

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


DECLARE @Ca_Cur TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_Cur (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Code'),('Caption'),('Hidden'),('IsSac'),('IsTransfer'),('IsCash'),('EnableReward'),('EnableOTC'),('Icon'),('CurType'),('Dec'),('AnchorRate'),('Freezable'),('Authorizable'),('ChaninID'),('ChaninName'),('ContractAddress'),('WalletAddress'),('BaseRate');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') 
AND (name in ('ID','Createdat','Updatedat','Sort','Code','Caption','Hidden','IsSac','IsTransfer','IsCash','EnableReward','EnableOTC','Icon','CurType','Dec','AnchorRate','Freezable','Authorizable','ChaninID','ChaninName','ContractAddress','WalletAddress','BaseRate'))
DECLARE @CounterCa_Cur INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur'));
WHILE @CounterCa_Cur > 0
BEGIN
    SET @CounterCa_Cur = @CounterCa_Cur - 1;
    PRINT @CounterCa_Cur
END


-- [Ca_Cur.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Code')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_Cur ADD [Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Cur SET [Code]='' WHERE ([Code] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Cur SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [Hidden] BIT
    END

UPDATE Ca_Cur SET [Hidden]='' WHERE ([Hidden] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [IsSac] BIT
    END

UPDATE Ca_Cur SET [IsSac]='' WHERE ([IsSac] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [IsTransfer] BIT
    END

UPDATE Ca_Cur SET [IsTransfer]='' WHERE ([IsTransfer] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [IsCash] BIT
    END

UPDATE Ca_Cur SET [IsCash]='' WHERE ([IsCash] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [EnableReward] BIT
    END

UPDATE Ca_Cur SET [EnableReward]='' WHERE ([EnableReward] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [EnableOTC] BIT
    END

UPDATE Ca_Cur SET [EnableOTC]='' WHERE ([EnableOTC] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Cur SET [Icon]='' WHERE ([Icon] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [CurType] INT
    END

UPDATE Ca_Cur SET [CurType]='' WHERE ([CurType] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [Dec] BIGINT
    END

UPDATE Ca_Cur SET [Dec]='' WHERE ([Dec] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [AnchorRate] FLOAT
    END

UPDATE Ca_Cur SET [AnchorRate]='' WHERE ([AnchorRate] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [Freezable] BIT
    END

UPDATE Ca_Cur SET [Freezable]='' WHERE ([Freezable] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [Authorizable] BIT
    END

UPDATE Ca_Cur SET [Authorizable]='' WHERE ([Authorizable] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Cur SET [ChaninID]='' WHERE ([ChaninID] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Cur SET [ChaninName]='' WHERE ([ChaninName] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Cur SET [ContractAddress]='' WHERE ([ContractAddress] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Cur SET [WalletAddress]='' WHERE ([WalletAddress] IS NULL)

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
    ALTER TABLE Ca_Cur ADD [BaseRate] FLOAT
    END

UPDATE Ca_Cur SET [BaseRate]='' WHERE ([BaseRate] IS NULL)

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


DECLARE @Ca_EndUser TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_EndUser (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Caption'),('Username'),('SocialAuthBiz'),('SocialAuthId'),('SocialAuthAvatar'),('Email'),('Tel'),('Gender'),('Status'),('Admin'),('BizPartner'),('Privilege'),('Verify'),('Pwd'),('Online'),('Icon'),('Background'),('BasicAcct'),('Refer'),('Referer'),('Url'),('About');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') 
AND (name in ('ID','Createdat','Updatedat','Sort','Caption','Username','SocialAuthBiz','SocialAuthId','SocialAuthAvatar','Email','Tel','Gender','Status','Admin','BizPartner','Privilege','Verify','Pwd','Online','Icon','Background','BasicAcct','Refer','Referer','Url','About'))
DECLARE @CounterCa_EndUser INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser'));
WHILE @CounterCa_EndUser > 0
BEGIN
    SET @CounterCa_EndUser = @CounterCa_EndUser - 1;
    PRINT @CounterCa_EndUser
END


-- [Ca_EndUser.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_EndUser ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_EndUser SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_EndUser SET [Username]='' WHERE ([Username] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [SocialAuthBiz] BIGINT
    END

UPDATE Ca_EndUser SET [SocialAuthBiz]='' WHERE ([SocialAuthBiz] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [SocialAuthId] NVARCHAR(MAX)
    END

UPDATE Ca_EndUser SET [SocialAuthId]='' WHERE ([SocialAuthId] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [SocialAuthAvatar] NVARCHAR(MAX)
    END

UPDATE Ca_EndUser SET [SocialAuthAvatar]='' WHERE ([SocialAuthAvatar] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_EndUser SET [Email]='' WHERE ([Email] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_EndUser SET [Tel]='' WHERE ([Tel] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Gender] INT
    END

UPDATE Ca_EndUser SET [Gender]='' WHERE ([Gender] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Status] INT
    END

UPDATE Ca_EndUser SET [Status]='' WHERE ([Status] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Admin] INT
    END

UPDATE Ca_EndUser SET [Admin]='' WHERE ([Admin] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [BizPartner] INT
    END

UPDATE Ca_EndUser SET [BizPartner]='' WHERE ([BizPartner] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Privilege] BIGINT
    END

UPDATE Ca_EndUser SET [Privilege]='' WHERE ([Privilege] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Verify] INT
    END

UPDATE Ca_EndUser SET [Verify]='' WHERE ([Verify] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_EndUser SET [Pwd]='' WHERE ([Pwd] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Online] BIT
    END

UPDATE Ca_EndUser SET [Online]='' WHERE ([Online] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_EndUser SET [Icon]='' WHERE ([Icon] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_EndUser SET [Background]='' WHERE ([Background] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [BasicAcct] BIGINT
    END

UPDATE Ca_EndUser SET [BasicAcct]='' WHERE ([BasicAcct] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_EndUser SET [Refer]='' WHERE ([Refer] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Referer] BIGINT
    END

UPDATE Ca_EndUser SET [Referer]='' WHERE ([Referer] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [Url] NVARCHAR(MAX)
    END

UPDATE Ca_EndUser SET [Url]='' WHERE ([Url] IS NULL)

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
    ALTER TABLE Ca_EndUser ADD [About] NVARCHAR(MAX)
    END

UPDATE Ca_EndUser SET [About]='' WHERE ([About] IS NULL)

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


DECLARE @Ca_File TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_File (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Caption'),('Encrypt'),('SHA256'),('Size'),('Bind'),('BindType'),('State'),('Folder'),('FileType'),('JSON');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_File') 
AND (name in ('ID','Createdat','Updatedat','Sort','Caption','Encrypt','SHA256','Size','Bind','BindType','State','Folder','FileType','JSON'))
DECLARE @CounterCa_File INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_File'));
WHILE @CounterCa_File > 0
BEGIN
    SET @CounterCa_File = @CounterCa_File - 1;
    PRINT @CounterCa_File
END


-- [Ca_File.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_File ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_File SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_File ADD [Encrypt] INT
    END

UPDATE Ca_File SET [Encrypt]='' WHERE ([Encrypt] IS NULL)

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
    ALTER TABLE Ca_File ADD [SHA256] NVARCHAR(MAX)
    END

UPDATE Ca_File SET [SHA256]='' WHERE ([SHA256] IS NULL)

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
    ALTER TABLE Ca_File ADD [Size] BIGINT
    END

UPDATE Ca_File SET [Size]='' WHERE ([Size] IS NULL)

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
    ALTER TABLE Ca_File ADD [Bind] BIGINT
    END

UPDATE Ca_File SET [Bind]='' WHERE ([Bind] IS NULL)

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
    ALTER TABLE Ca_File ADD [BindType] INT
    END

UPDATE Ca_File SET [BindType]='' WHERE ([BindType] IS NULL)

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
    ALTER TABLE Ca_File ADD [State] INT
    END

UPDATE Ca_File SET [State]='' WHERE ([State] IS NULL)

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
    ALTER TABLE Ca_File ADD [Folder] BIGINT
    END

UPDATE Ca_File SET [Folder]='' WHERE ([Folder] IS NULL)

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
    ALTER TABLE Ca_File ADD [FileType] INT
    END

UPDATE Ca_File SET [FileType]='' WHERE ([FileType] IS NULL)

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
    ALTER TABLE Ca_File ADD [JSON] NVARCHAR(MAX)
    END

UPDATE Ca_File SET [JSON]='' WHERE ([JSON] IS NULL)

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


DECLARE @Ca_Folder TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_Folder (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Caption'),('Encrypt'),('Bind'),('BindType'),('Parent');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') 
AND (name in ('ID','Createdat','Updatedat','Sort','Caption','Encrypt','Bind','BindType','Parent'))
DECLARE @CounterCa_Folder INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder'));
WHILE @CounterCa_Folder > 0
BEGIN
    SET @CounterCa_Folder = @CounterCa_Folder - 1;
    PRINT @CounterCa_Folder
END


-- [Ca_Folder.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_Folder ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Folder SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_Folder ADD [Encrypt] INT
    END

UPDATE Ca_Folder SET [Encrypt]='' WHERE ([Encrypt] IS NULL)

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
    ALTER TABLE Ca_Folder ADD [Bind] BIGINT
    END

UPDATE Ca_Folder SET [Bind]='' WHERE ([Bind] IS NULL)

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
    ALTER TABLE Ca_Folder ADD [BindType] INT
    END

UPDATE Ca_Folder SET [BindType]='' WHERE ([BindType] IS NULL)

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
    ALTER TABLE Ca_Folder ADD [Parent] BIGINT
    END

UPDATE Ca_Folder SET [Parent]='' WHERE ([Parent] IS NULL)

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


DECLARE @Ca_Lang TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_Lang (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Code2'),('Caption'),('Native'),('Icon'),('IsBlank'),('IsLocale'),('IsContent'),('IsAutoTranslate'),('TextDirection');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') 
AND (name in ('ID','Createdat','Updatedat','Sort','Code2','Caption','Native','Icon','IsBlank','IsLocale','IsContent','IsAutoTranslate','TextDirection'))
DECLARE @CounterCa_Lang INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang'));
WHILE @CounterCa_Lang > 0
BEGIN
    SET @CounterCa_Lang = @CounterCa_Lang - 1;
    PRINT @CounterCa_Lang
END


-- [Ca_Lang.Code2] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Code2')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_Lang ADD [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Lang SET [Code2]='' WHERE ([Code2] IS NULL)

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
    ALTER TABLE Ca_Lang ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Lang SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_Lang ADD [Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Lang SET [Native]='' WHERE ([Native] IS NULL)

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
    ALTER TABLE Ca_Lang ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_Lang SET [Icon]='' WHERE ([Icon] IS NULL)

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
    ALTER TABLE Ca_Lang ADD [IsBlank] BIT
    END

UPDATE Ca_Lang SET [IsBlank]='' WHERE ([IsBlank] IS NULL)

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
    ALTER TABLE Ca_Lang ADD [IsLocale] BIT
    END

UPDATE Ca_Lang SET [IsLocale]='' WHERE ([IsLocale] IS NULL)

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
    ALTER TABLE Ca_Lang ADD [IsContent] BIT
    END

UPDATE Ca_Lang SET [IsContent]='' WHERE ([IsContent] IS NULL)

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
    ALTER TABLE Ca_Lang ADD [IsAutoTranslate] BIT
    END

UPDATE Ca_Lang SET [IsAutoTranslate]='' WHERE ([IsAutoTranslate] IS NULL)

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
    ALTER TABLE Ca_Lang ADD [TextDirection] INT
    END

UPDATE Ca_Lang SET [TextDirection]='' WHERE ([TextDirection] IS NULL)

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


DECLARE @Ca_WebCredential TABLE (FieldName NVARCHAR(64));
INSERT INTO @Ca_WebCredential (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Caption'),('ExternalId'),('Icon'),('EU'),('Biz'),('Json');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') 
AND (name in ('ID','Createdat','Updatedat','Sort','Caption','ExternalId','Icon','EU','Biz','Json'))
DECLARE @CounterCa_WebCredential INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential'));
WHILE @CounterCa_WebCredential > 0
BEGIN
    SET @CounterCa_WebCredential = @CounterCa_WebCredential - 1;
    PRINT @CounterCa_WebCredential
END


-- [Ca_WebCredential.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Ca_WebCredential ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_WebCredential SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Ca_WebCredential ADD [ExternalId] BIGINT
    END

UPDATE Ca_WebCredential SET [ExternalId]='' WHERE ([ExternalId] IS NULL)

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
    ALTER TABLE Ca_WebCredential ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Ca_WebCredential SET [Icon]='' WHERE ([Icon] IS NULL)

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
    ALTER TABLE Ca_WebCredential ADD [EU] BIGINT
    END

UPDATE Ca_WebCredential SET [EU]='' WHERE ([EU] IS NULL)

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
    ALTER TABLE Ca_WebCredential ADD [Biz] BIGINT
    END

UPDATE Ca_WebCredential SET [Biz]='' WHERE ([Biz] IS NULL)

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
    ALTER TABLE Ca_WebCredential ADD [Json] NVARCHAR(MAX)
    END

UPDATE Ca_WebCredential SET [Json]='' WHERE ([Json] IS NULL)

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


DECLARE @Core_BizOwner TABLE (FieldName NVARCHAR(64));
INSERT INTO @Core_BizOwner (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Caption'),('Bind'),('BindType'),('State');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') 
AND (name in ('ID','Createdat','Updatedat','Sort','Caption','Bind','BindType','State'))
DECLARE @CounterCore_BizOwner INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner'));
WHILE @CounterCore_BizOwner > 0
BEGIN
    SET @CounterCore_BizOwner = @CounterCore_BizOwner - 1;
    PRINT @CounterCore_BizOwner
END


-- [Core_BizOwner.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='Caption')
    BEGIN
     ALTER TABLE Core_BizOwner ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Core_BizOwner ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Core_BizOwner SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Core_BizOwner ADD [Bind] BIGINT
    END

UPDATE Core_BizOwner SET [Bind]='' WHERE ([Bind] IS NULL)

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
    ALTER TABLE Core_BizOwner ADD [BindType] INT
    END

UPDATE Core_BizOwner SET [BindType]='' WHERE ([BindType] IS NULL)

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
    ALTER TABLE Core_BizOwner ADD [State] INT
    END

UPDATE Core_BizOwner SET [State]='' WHERE ([State] IS NULL)

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


DECLARE @Core_CryptoLink TABLE (FieldName NVARCHAR(64));
INSERT INTO @Core_CryptoLink (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Expiry'),('HashFull'),('HashTiny'),('Src'),('DomainName'),('Owner'),('Dst'),('BizOwner'),('Data'),('OgTitle'),('OgDesc'),('OgImg');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') 
AND (name in ('ID','Createdat','Updatedat','Sort','Expiry','HashFull','HashTiny','Src','DomainName','Owner','Dst','BizOwner','Data','OgTitle','OgDesc','OgImg'))
DECLARE @CounterCore_CryptoLink INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink'));
WHILE @CounterCore_CryptoLink > 0
BEGIN
    SET @CounterCore_CryptoLink = @CounterCore_CryptoLink - 1;
    PRINT @CounterCore_CryptoLink
END


-- [Core_CryptoLink.Expiry] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_CryptoLink') AND name='Expiry')
    BEGIN
     ALTER TABLE Core_CryptoLink ALTER COLUMN [Expiry] BIGINT
    END
ELSE
    BEGIN
    ALTER TABLE Core_CryptoLink ADD [Expiry] BIGINT
    END

UPDATE Core_CryptoLink SET [Expiry]='' WHERE ([Expiry] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [HashFull] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Core_CryptoLink SET [HashFull]='' WHERE ([HashFull] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [HashTiny] NVARCHAR(9) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Core_CryptoLink SET [HashTiny]='' WHERE ([HashTiny] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [Src] NVARCHAR(MAX)
    END

UPDATE Core_CryptoLink SET [Src]='' WHERE ([Src] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [DomainName] BIGINT
    END

UPDATE Core_CryptoLink SET [DomainName]='' WHERE ([DomainName] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [Owner] BIGINT
    END

UPDATE Core_CryptoLink SET [Owner]='' WHERE ([Owner] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [Dst] BIGINT
    END

UPDATE Core_CryptoLink SET [Dst]='' WHERE ([Dst] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [BizOwner] BIGINT
    END

UPDATE Core_CryptoLink SET [BizOwner]='' WHERE ([BizOwner] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [Data] NVARCHAR(MAX)
    END

UPDATE Core_CryptoLink SET [Data]='' WHERE ([Data] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [OgTitle] NVARCHAR(MAX)
    END

UPDATE Core_CryptoLink SET [OgTitle]='' WHERE ([OgTitle] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [OgDesc] NVARCHAR(MAX)
    END

UPDATE Core_CryptoLink SET [OgDesc]='' WHERE ([OgDesc] IS NULL)

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
    ALTER TABLE Core_CryptoLink ADD [OgImg] NVARCHAR(MAX)
    END

UPDATE Core_CryptoLink SET [OgImg]='' WHERE ([OgImg] IS NULL)

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


DECLARE @Core_DomainName TABLE (FieldName NVARCHAR(64));
INSERT INTO @Core_DomainName (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Caption'),('Biz'),('EndUser'),('BizOwner');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Core_DomainName') 
AND (name in ('ID','Createdat','Updatedat','Sort','Caption','Biz','EndUser','BizOwner'))
DECLARE @CounterCore_DomainName INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Core_DomainName'));
WHILE @CounterCore_DomainName > 0
BEGIN
    SET @CounterCore_DomainName = @CounterCore_DomainName - 1;
    PRINT @CounterCore_DomainName
END


-- [Core_DomainName.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_DomainName') AND name='Caption')
    BEGIN
     ALTER TABLE Core_DomainName ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    ALTER TABLE Core_DomainName ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END

UPDATE Core_DomainName SET [Caption]='' WHERE ([Caption] IS NULL)

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
    ALTER TABLE Core_DomainName ADD [Biz] BIGINT
    END

UPDATE Core_DomainName SET [Biz]='' WHERE ([Biz] IS NULL)

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
    ALTER TABLE Core_DomainName ADD [EndUser] BIGINT
    END

UPDATE Core_DomainName SET [EndUser]='' WHERE ([EndUser] IS NULL)

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
    ALTER TABLE Core_DomainName ADD [BizOwner] BIGINT
    END

UPDATE Core_DomainName SET [BizOwner]='' WHERE ([BizOwner] IS NULL)

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


DECLARE @Sys_Log TABLE (FieldName NVARCHAR(64));
INSERT INTO @Sys_Log (FieldName) VALUES ('ID'),('Createdat'),('Updatedat'),('Sort'),('Location'),('Content'),('Sql');

SELECT name FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') 
AND (name in ('ID','Createdat','Updatedat','Sort','Location','Content','Sql'))
DECLARE @CounterSys_Log INT = (SELECT COUNT(*) FROM SYSCOLUMNS WHERE id=object_id('Sys_Log'));
WHILE @CounterSys_Log > 0
BEGIN
    SET @CounterSys_Log = @CounterSys_Log - 1;
    PRINT @CounterSys_Log
END


-- [Sys_Log.Location] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Location')
    BEGIN
     ALTER TABLE Sys_Log ALTER COLUMN [Location] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    ALTER TABLE Sys_Log ADD [Location] NVARCHAR(MAX)
    END

UPDATE Sys_Log SET [Location]='' WHERE ([Location] IS NULL)

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
    ALTER TABLE Sys_Log ADD [Content] NVARCHAR(MAX)
    END

UPDATE Sys_Log SET [Content]='' WHERE ([Content] IS NULL)

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
    ALTER TABLE Sys_Log ADD [Sql] NVARCHAR(MAX)
    END

UPDATE Sys_Log SET [Sql]='' WHERE ([Sql] IS NULL)

IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Sys_LogSql')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Sys_LogSql]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Sys_LogSql')
    BEGIN
    ALTER TABLE Sys_Log DROP  CONSTRAINT [UniqueNonclustered_Sys_LogSql]
    END