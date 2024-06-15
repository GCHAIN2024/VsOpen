IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Address' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Address ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Bind] BIGINT,[Type] INT,[Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS,[Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS,[State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[City] BIGINT,[Country] BIGINT,[Remarks] NVARCHAR(MAX), CONSTRAINT [PK_Ca_Address] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Bind')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Type')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Line1')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Line1] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Line1] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Line2')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Line2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Line2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='State')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='County')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [County] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [County] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Town')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Town] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Town] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Contact')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Contact] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Contact] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Tel')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Email')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Email] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Email] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Zip')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Zip] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Zip] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='City')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Country')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Remarks')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Remarks] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Remarks] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Biz' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Biz ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Parent] BIGINT,[BasicAcct] BIGINT,[Desc] NVARCHAR(MAX),[Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[City] BIGINT,[Country] BIGINT,[Lang] BIGINT,[IsSocial] BIT,[IsCmsSource] BIT,[IsPay] BIT,[MomentLatest] BIGINT,[CountFollowers] BIGINT,[CountFollows] BIGINT,[CountMoments] BIGINT,[CountViews] BIGINT,[CountComments] BIGINT,[CountThumbUps] BIGINT,[CountThumbDns] BIGINT,[IsCrawling] BIT,[IsGSeries] BIT,[RemarksCentral] NVARCHAR(MAX),[Agent] BIGINT,[SiteCats] NVARCHAR(MAX),[ConfiguredCats] NVARCHAR(MAX), CONSTRAINT [PK_Ca_Biz] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Code')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Parent')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='BasicAcct')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [BasicAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [BasicAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Desc')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Website')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Website] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Website] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Icon')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='City')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Country')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Lang')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsSocial')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsSocial] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsSocial] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsCmsSource')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsCmsSource] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsCmsSource] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsPay')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsPay] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsPay] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='MomentLatest')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [MomentLatest] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [MomentLatest] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountFollowers')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountFollowers] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountFollowers] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountFollows')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountFollows] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountFollows] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountMoments')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountMoments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountMoments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountViews')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountViews] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountViews] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountComments')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountComments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountComments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountThumbUps')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountThumbUps] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountThumbUps] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountThumbDns')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountThumbDns] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountThumbDns] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsCrawling')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsCrawling] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsCrawling] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsGSeries')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsGSeries] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsGSeries] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='RemarksCentral')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [RemarksCentral] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [RemarksCentral] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Agent')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='SiteCats')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [SiteCats] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [SiteCats] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='ConfiguredCats')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [ConfiguredCats] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [ConfiguredCats] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Country' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Country ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS,[Cur] BIGINT,[Capital] BIGINT,[Place] BIGINT,[Lang] BIGINT, CONSTRAINT [PK_Ca_Country] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Code2')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Code2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Code2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Fullname')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Fullname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Fullname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Icon')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Tel')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Cur')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Cur] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Cur] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Capital')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Capital] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Capital] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Place')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Place] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Place] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Lang')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cur' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Cur ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Hidden] BIT,[IsSac] BIT,[IsTransfer] BIT,[IsCash] BIT,[EnableReward] BIT,[EnableOTC] BIT,[Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS,[CurType] INT,[Dec] BIGINT,[AnchorRate] FLOAT,[Freezable] BIT,[Authorizable] BIT,[ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[BaseRate] FLOAT, CONSTRAINT [PK_Ca_Cur] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Code')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Hidden')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Hidden] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Hidden] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsSac')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [IsSac] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [IsSac] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsTransfer')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [IsTransfer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [IsTransfer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsCash')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [IsCash] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [IsCash] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='EnableReward')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [EnableReward] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [EnableReward] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='EnableOTC')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [EnableOTC] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [EnableOTC] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Icon')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='CurType')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [CurType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [CurType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Dec')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Dec] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Dec] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='AnchorRate')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [AnchorRate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [AnchorRate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Freezable')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Freezable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Freezable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Authorizable')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Authorizable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Authorizable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ChaninID')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [ChaninID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [ChaninID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ChaninName')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [ChaninName] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [ChaninName] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ContractAddress')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [ContractAddress] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [ContractAddress] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='WalletAddress')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [WalletAddress] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [WalletAddress] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='BaseRate')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [BaseRate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [BaseRate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_EndUser' AND xtype='U')
BEGIN
    CREATE TABLE Ca_EndUser ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS,[Gender] INT,[Status] INT,[Admin] INT,[Privilege] BIGINT,[Verify] INT,[Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Online] BIT,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[BasicAcct] BIGINT,[Citizen] BIGINT,[Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS,[Referer] BIGINT,[Discord] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[DiscordId] BIGINT,[Google] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[GoogleId] BIGINT,[Apple] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[AppleId] BIGINT,[OAuthProvider] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[OAuthID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[GTV] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Gettr] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Farm] BIGINT,[CountFollows] BIGINT,[CountFollowers] BIGINT,[CountMoments] BIGINT,[CountViews] BIGINT,[CountComments] BIGINT,[CountThumbUps] BIGINT,[CountThumbDns] BIGINT,[Lang] BIGINT,[BizOperator] BIGINT,[Url] NVARCHAR(MAX),[About] NVARCHAR(MAX),[PublicPoints] BIGINT,[Json] NVARCHAR(MAX),[Agentable] INT, CONSTRAINT [PK_Ca_EndUser] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Caption')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Username')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Username] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Username] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Email')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Email] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Email] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Tel')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Gender')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Gender] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Gender] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Status')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Status] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Status] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Admin')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Admin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Admin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Privilege')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Privilege] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Privilege] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Verify')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Verify] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Verify] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Pwd')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Pwd] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Pwd] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Online')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Online] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Online] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Icon')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Background')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Background] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Background] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BasicAcct')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [BasicAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [BasicAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Citizen')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Citizen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Citizen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Refer')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Refer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Refer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Referer')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Referer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Referer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Discord')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Discord] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Discord] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='DiscordId')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [DiscordId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [DiscordId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Google')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Google] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Google] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='GoogleId')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [GoogleId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [GoogleId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Apple')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Apple] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Apple] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='AppleId')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [AppleId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [AppleId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='OAuthProvider')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [OAuthProvider] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [OAuthProvider] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='OAuthID')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [OAuthID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [OAuthID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='GTV')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [GTV] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [GTV] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Gettr')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Gettr] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Gettr] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Farm')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Farm] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Farm] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountFollows')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountFollows] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountFollows] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountFollowers')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountFollowers] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountFollowers] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountMoments')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountMoments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountMoments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountViews')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountViews] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountViews] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountComments')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountComments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountComments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountThumbUps')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountThumbUps] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountThumbUps] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountThumbDns')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountThumbDns] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountThumbDns] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Lang')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BizOperator')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [BizOperator] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [BizOperator] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Url')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Url] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Url] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='About')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [About] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [About] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='PublicPoints')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [PublicPoints] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [PublicPoints] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Json')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Json] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Json] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Agentable')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Agentable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Agentable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_File' AND xtype='U')
BEGIN
    CREATE TABLE Ca_File ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Content] ,[Encrypt] INT,[SHA256] NVARCHAR(MAX),[Size] BIGINT,[Bind] BIGINT,[BindType] INT,[State] INT,[Folder] BIGINT,[FileType] INT,[JSON] NVARCHAR(MAX), CONSTRAINT [PK_Ca_File] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Caption')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Content')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Content] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Content] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Encrypt')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Encrypt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Encrypt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='SHA256')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [SHA256] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [SHA256] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Size')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Size] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Size] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Bind')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='BindType')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='State')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Folder')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Folder] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Folder] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='FileType')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [FileType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [FileType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='JSON')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [JSON] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [JSON] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Folder' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Folder ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Encrypt] INT,[Bind] BIGINT,[BindType] INT,[Parent] BIGINT, CONSTRAINT [PK_Ca_Folder] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Encrypt')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [Encrypt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [Encrypt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Bind')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='BindType')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Parent')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Lang' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Lang ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[IsBlank] BIT,[IsLocale] BIT,[IsContent] BIT,[IsAutoTranslate] BIT,[TextDirection] INT, CONSTRAINT [PK_Ca_Lang] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Code2')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [Code2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [Code2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Native')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [Native] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [Native] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Icon')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsBlank')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsBlank] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsBlank] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsLocale')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsLocale] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsLocale] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsContent')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsContent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsContent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsAutoTranslate')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsAutoTranslate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsAutoTranslate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='TextDirection')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [TextDirection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [TextDirection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_WebCredential' AND xtype='U')
BEGIN
    CREATE TABLE Ca_WebCredential ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[ExternalId] BIGINT,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[EU] BIGINT,[Biz] BIGINT,[Json] NVARCHAR(MAX), CONSTRAINT [PK_Ca_WebCredential] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Caption')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='ExternalId')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [ExternalId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [ExternalId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Icon')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='EU')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Biz')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Json')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [Json] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [Json] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_ApiLog' AND xtype='U')
BEGIN
    CREATE TABLE Sys_ApiLog ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Location] NVARCHAR(MAX),[ApiKey] NVARCHAR(MAX),[IP] NVARCHAR(MAX),[Session] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Biz] BIGINT,[BizCode] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Api] NVARCHAR(MAX),[Request] NVARCHAR(MAX),[RequestHex] NVARCHAR(MAX),[RequestJson] NVARCHAR(MAX),[Response] NVARCHAR(MAX),[ResponseJson] NVARCHAR(MAX),[Content] NVARCHAR(MAX),[Eu] BIGINT,[Agent] BIGINT,[Data] BIGINT, CONSTRAINT [PK_Sys_ApiLog] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Location')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Location] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Location] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='ApiKey')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [ApiKey] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [ApiKey] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='IP')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Session')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Session] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Session] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Biz')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='BizCode')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [BizCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [BizCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Api')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Api] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Api] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Request')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Request] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Request] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='RequestHex')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [RequestHex] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [RequestHex] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='RequestJson')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [RequestJson] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [RequestJson] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Response')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Response] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Response] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='ResponseJson')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [ResponseJson] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [ResponseJson] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Content')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Content] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Content] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Eu')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Eu] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Eu] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Agent')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_ApiLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_ApiLog') AND name='Data')
BEGIN
 ALTER TABLE Sys_ApiLog ALTER COLUMN [Data] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_ApiLog ADD [Data] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Authorization' AND xtype='U')
BEGIN
    CREATE TABLE Sys_Authorization ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Admin] BIGINT,[Role] BIGINT,[Desc] NVARCHAR(MAX),[Profile] NVARCHAR(MAX),[AdminType] INT, CONSTRAINT [PK_Sys_Authorization] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_Authorization]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Authorization') AND name='Admin')
BEGIN
 ALTER TABLE Sys_Authorization ALTER COLUMN [Admin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Authorization ADD [Admin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Authorization]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Authorization') AND name='Role')
BEGIN
 ALTER TABLE Sys_Authorization ALTER COLUMN [Role] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Authorization ADD [Role] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Authorization]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Authorization') AND name='Desc')
BEGIN
 ALTER TABLE Sys_Authorization ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Authorization ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Authorization]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Authorization') AND name='Profile')
BEGIN
 ALTER TABLE Sys_Authorization ALTER COLUMN [Profile] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Authorization ADD [Profile] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Authorization]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Authorization') AND name='AdminType')
BEGIN
 ALTER TABLE Sys_Authorization ALTER COLUMN [AdminType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Authorization ADD [AdminType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Config' AND xtype='U')
BEGIN
    CREATE TABLE Sys_Config ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Value] NVARCHAR(MAX),[Desc] NVARCHAR(MAX), CONSTRAINT [PK_Sys_Config] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_Config]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Config') AND name='Caption')
BEGIN
 ALTER TABLE Sys_Config ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Config ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Config]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Config') AND name='Code')
BEGIN
 ALTER TABLE Sys_Config ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Config ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Config]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Config') AND name='Value')
BEGIN
 ALTER TABLE Sys_Config ALTER COLUMN [Value] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Config ADD [Value] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Config]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Config') AND name='Desc')
BEGIN
 ALTER TABLE Sys_Config ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Config ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_EuSession' AND xtype='U')
BEGIN
    CREATE TABLE Sys_EuSession ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[EU] BIGINT,[IP] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Session] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[App] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS, CONSTRAINT [PK_Sys_EuSession] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_EuSession]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuSession') AND name='EU')
BEGIN
 ALTER TABLE Sys_EuSession ALTER COLUMN [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuSession ADD [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_EuSession]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuSession') AND name='IP')
BEGIN
 ALTER TABLE Sys_EuSession ALTER COLUMN [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuSession ADD [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_EuSession]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuSession') AND name='Session')
BEGIN
 ALTER TABLE Sys_EuSession ALTER COLUMN [Session] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuSession ADD [Session] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_EuSession]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuSession') AND name='App')
BEGIN
 ALTER TABLE Sys_EuSession ALTER COLUMN [App] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuSession ADD [App] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_EuToken' AND xtype='U')
BEGIN
    CREATE TABLE Sys_EuToken ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[EU] BIGINT,[IP] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Session] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Token] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[App] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS, CONSTRAINT [PK_Sys_EuToken] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_EuToken]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuToken') AND name='EU')
BEGIN
 ALTER TABLE Sys_EuToken ALTER COLUMN [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuToken ADD [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_EuToken]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuToken') AND name='IP')
BEGIN
 ALTER TABLE Sys_EuToken ALTER COLUMN [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuToken ADD [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_EuToken]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuToken') AND name='Session')
BEGIN
 ALTER TABLE Sys_EuToken ALTER COLUMN [Session] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuToken ADD [Session] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_EuToken]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuToken') AND name='Token')
BEGIN
 ALTER TABLE Sys_EuToken ALTER COLUMN [Token] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuToken ADD [Token] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_EuToken]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_EuToken') AND name='App')
BEGIN
 ALTER TABLE Sys_EuToken ALTER COLUMN [App] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_EuToken ADD [App] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Log' AND xtype='U')
BEGIN
    CREATE TABLE Sys_Log ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Desc] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Location] NVARCHAR(MAX),[Content] NVARCHAR(MAX),[Sql] NVARCHAR(MAX),[Level] INT, CONSTRAINT [PK_Sys_Log] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_Log]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Desc')
BEGIN
 ALTER TABLE Sys_Log ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Log ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Log]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Location')
BEGIN
 ALTER TABLE Sys_Log ALTER COLUMN [Location] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Log ADD [Location] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Log]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Content')
BEGIN
 ALTER TABLE Sys_Log ALTER COLUMN [Content] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Log ADD [Content] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Log]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Sql')
BEGIN
 ALTER TABLE Sys_Log ALTER COLUMN [Sql] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Log ADD [Sql] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Log]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Level')
BEGIN
 ALTER TABLE Sys_Log ALTER COLUMN [Level] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Log ADD [Level] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Notification' AND xtype='U')
BEGIN
    CREATE TABLE Sys_Notification ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[BindType] INT,[Bind] BIGINT,[SrcType] INT,[Src] BIGINT,[Type] INT,[Entity] BIGINT,[DataType] INT,[Data] BIGINT,[Msg] NVARCHAR(MAX),[Status] INT,[Readdat] BIGINT, CONSTRAINT [PK_Sys_Notification] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='BindType')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='Bind')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='SrcType')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [SrcType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [SrcType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='Src')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [Src] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [Src] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='Type')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='Entity')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [Entity] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [Entity] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='DataType')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [DataType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [DataType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='Data')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [Data] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [Data] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='Msg')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [Msg] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [Msg] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='Status')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [Status] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [Status] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Notification]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Notification') AND name='Readdat')
BEGIN
 ALTER TABLE Sys_Notification ALTER COLUMN [Readdat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Notification ADD [Readdat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_PageLog' AND xtype='U')
BEGIN
    CREATE TABLE Sys_PageLog ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Url] NVARCHAR(MAX),[Page] NVARCHAR(MAX),[IP] NVARCHAR(MAX),[Lng] FLOAT,[Lat] FLOAT,[City] NVARCHAR(MAX),[Country] BIGINT,[Session] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[EndUser] BIGINT,[App] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Loc] INT,[Bind] BIGINT,[Device] INT,[ReferCode] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Referrer] BIGINT,[ReferApp] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Platform] BIGINT,[Request] NVARCHAR(MAX),[RequestHex] NVARCHAR(MAX),[Response] NVARCHAR(MAX),[Desc] NVARCHAR(MAX),[InnerReferCode] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[ReferrerUrl] NVARCHAR(MAX),[PromotionType] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Promotion] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Domainname] BIGINT,[Agent] BIGINT, CONSTRAINT [PK_Sys_PageLog] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Url')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Url] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Url] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Page')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Page] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Page] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='IP')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Lng')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Lng] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Lng] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Lat')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Lat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Lat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='City')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Country')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Session')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Session] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Session] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='EndUser')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='App')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [App] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [App] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Loc')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Loc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Loc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Bind')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Device')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Device] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Device] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='ReferCode')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [ReferCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [ReferCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Referrer')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Referrer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Referrer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='ReferApp')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [ReferApp] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [ReferApp] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Platform')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Platform] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Platform] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Request')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Request] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Request] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='RequestHex')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [RequestHex] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [RequestHex] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Response')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Response] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Response] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Desc')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='InnerReferCode')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [InnerReferCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [InnerReferCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='ReferrerUrl')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [ReferrerUrl] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [ReferrerUrl] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='PromotionType')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [PromotionType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [PromotionType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Promotion')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Promotion] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Promotion] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Domainname')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Domainname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Domainname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_PageLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_PageLog') AND name='Agent')
BEGIN
 ALTER TABLE Sys_PageLog ALTER COLUMN [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_PageLog ADD [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Privilege' AND xtype='U')
BEGIN
    CREATE TABLE Sys_Privilege ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Type] INT,[Cat] INT,[ApiFullname] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Desc] NVARCHAR(MAX),[Scope] BIGINT, CONSTRAINT [PK_Sys_Privilege] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_Privilege]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Privilege') AND name='Code')
BEGIN
 ALTER TABLE Sys_Privilege ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Privilege ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Privilege]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Privilege') AND name='Caption')
BEGIN
 ALTER TABLE Sys_Privilege ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Privilege ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Privilege]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Privilege') AND name='Type')
BEGIN
 ALTER TABLE Sys_Privilege ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Privilege ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Privilege]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Privilege') AND name='Cat')
BEGIN
 ALTER TABLE Sys_Privilege ALTER COLUMN [Cat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Privilege ADD [Cat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Privilege]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Privilege') AND name='ApiFullname')
BEGIN
 ALTER TABLE Sys_Privilege ALTER COLUMN [ApiFullname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Privilege ADD [ApiFullname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Privilege]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Privilege') AND name='Desc')
BEGIN
 ALTER TABLE Sys_Privilege ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Privilege ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Privilege]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Privilege') AND name='Scope')
BEGIN
 ALTER TABLE Sys_Privilege ALTER COLUMN [Scope] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Privilege ADD [Scope] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Role' AND xtype='U')
BEGIN
    CREATE TABLE Sys_Role ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Inherit] BIGINT,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Cat] INT,[Desc] NVARCHAR(MAX), CONSTRAINT [PK_Sys_Role] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_Role]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Role') AND name='Code')
BEGIN
 ALTER TABLE Sys_Role ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Role ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Role]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Role') AND name='Inherit')
BEGIN
 ALTER TABLE Sys_Role ALTER COLUMN [Inherit] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Role ADD [Inherit] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Role]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Role') AND name='Caption')
BEGIN
 ALTER TABLE Sys_Role ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Role ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Role]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Role') AND name='Cat')
BEGIN
 ALTER TABLE Sys_Role ALTER COLUMN [Cat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Role ADD [Cat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Role]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Role') AND name='Desc')
BEGIN
 ALTER TABLE Sys_Role ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Role ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_RoleAssign' AND xtype='U')
BEGIN
    CREATE TABLE Sys_RoleAssign ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Role] BIGINT,[Type] INT,[Privilege] BIGINT,[Workflow] BIGINT,[WorkflowTransit] BIGINT,[WorkflowState] BIGINT,[Desc] NVARCHAR(MAX),[Profile] NVARCHAR(MAX), CONSTRAINT [PK_Sys_RoleAssign] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_RoleAssign]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_RoleAssign') AND name='Role')
BEGIN
 ALTER TABLE Sys_RoleAssign ALTER COLUMN [Role] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_RoleAssign ADD [Role] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_RoleAssign]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_RoleAssign') AND name='Type')
BEGIN
 ALTER TABLE Sys_RoleAssign ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_RoleAssign ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_RoleAssign]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_RoleAssign') AND name='Privilege')
BEGIN
 ALTER TABLE Sys_RoleAssign ALTER COLUMN [Privilege] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_RoleAssign ADD [Privilege] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_RoleAssign]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_RoleAssign') AND name='Workflow')
BEGIN
 ALTER TABLE Sys_RoleAssign ALTER COLUMN [Workflow] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_RoleAssign ADD [Workflow] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_RoleAssign]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_RoleAssign') AND name='WorkflowTransit')
BEGIN
 ALTER TABLE Sys_RoleAssign ALTER COLUMN [WorkflowTransit] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_RoleAssign ADD [WorkflowTransit] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_RoleAssign]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_RoleAssign') AND name='WorkflowState')
BEGIN
 ALTER TABLE Sys_RoleAssign ALTER COLUMN [WorkflowState] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_RoleAssign ADD [WorkflowState] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_RoleAssign]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_RoleAssign') AND name='Desc')
BEGIN
 ALTER TABLE Sys_RoleAssign ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_RoleAssign ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_RoleAssign]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_RoleAssign') AND name='Profile')
BEGIN
 ALTER TABLE Sys_RoleAssign ALTER COLUMN [Profile] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_RoleAssign ADD [Profile] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_SignLog' AND xtype='U')
BEGIN
    CREATE TABLE Sys_SignLog ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[EU] BIGINT,[IP] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Lng] FLOAT,[Lat] FLOAT,[City] NVARCHAR(MAX),[Country] BIGINT,[CookieIn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[CookieOut] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Agent] INT,[Act] INT,[WebCrential] BIGINT,[Biz] BIGINT,[SessionCount] BIGINT,[Desc] NVARCHAR(MAX), CONSTRAINT [PK_Sys_SignLog] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='EU')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='IP')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [IP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='Lng')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [Lng] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [Lng] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='Lat')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [Lat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [Lat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='City')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='Country')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='CookieIn')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [CookieIn] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [CookieIn] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='CookieOut')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [CookieOut] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [CookieOut] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='Agent')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='Act')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [Act] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [Act] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='WebCrential')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [WebCrential] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [WebCrential] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='Biz')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='SessionCount')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [SessionCount] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [SessionCount] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_SignLog]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_SignLog') AND name='Desc')
BEGIN
 ALTER TABLE Sys_SignLog ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_SignLog ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_TinyLink' AND xtype='U')
BEGIN
    CREATE TABLE Sys_TinyLink ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[TinyLink] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS,[OriginalLink] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Eu] BIGINT, CONSTRAINT [PK_Sys_TinyLink] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_TinyLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLink') AND name='TinyLink')
BEGIN
 ALTER TABLE Sys_TinyLink ALTER COLUMN [TinyLink] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLink ADD [TinyLink] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLink') AND name='OriginalLink')
BEGIN
 ALTER TABLE Sys_TinyLink ALTER COLUMN [OriginalLink] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLink ADD [OriginalLink] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLink') AND name='Eu')
BEGIN
 ALTER TABLE Sys_TinyLink ALTER COLUMN [Eu] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLink ADD [Eu] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_TinyLinkTracking' AND xtype='U')
BEGIN
    CREATE TABLE Sys_TinyLinkTracking ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[App] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Biz] BIGINT,[EndUser] BIGINT,[Bind] BIGINT,[BindType] INT,[Visitor] BIGINT,[VisitorApp] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[ShortLink] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[ReferrerUrl] NVARCHAR(MAX),[InnerRefCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[PromotionType] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Promotion] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS, CONSTRAINT [PK_Sys_TinyLinkTracking] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='App')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [App] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [App] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='Biz')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='EndUser')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='Bind')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='BindType')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='Visitor')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [Visitor] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [Visitor] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='VisitorApp')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [VisitorApp] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [VisitorApp] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='ShortLink')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [ShortLink] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [ShortLink] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='ReferrerUrl')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [ReferrerUrl] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [ReferrerUrl] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='InnerRefCode')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [InnerRefCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [InnerRefCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='PromotionType')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [PromotionType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [PromotionType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_TinyLinkTracking]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_TinyLinkTracking') AND name='Promotion')
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ALTER COLUMN [Promotion] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_TinyLinkTracking ADD [Promotion] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
