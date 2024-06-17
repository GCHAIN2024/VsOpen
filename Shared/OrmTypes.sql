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
    CREATE TABLE Ca_EndUser ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS,[Gender] INT,[Status] INT,[Admin] INT,[BizPartner] INT,[Privilege] BIGINT,[Verify] INT,[Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Online] BIT,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[BasicAcct] BIGINT,[Citizen] BIGINT,[Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS,[Referer] BIGINT,[Discord] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[DiscordId] BIGINT,[Google] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[GoogleId] BIGINT,[Apple] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[AppleId] BIGINT,[OAuthProvider] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[OAuthID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[GTV] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Gettr] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Farm] BIGINT,[CountFollows] BIGINT,[CountFollowers] BIGINT,[CountMoments] BIGINT,[CountViews] BIGINT,[CountComments] BIGINT,[CountThumbUps] BIGINT,[CountThumbDns] BIGINT,[Lang] BIGINT,[BizOperator] BIGINT,[Url] NVARCHAR(MAX),[About] NVARCHAR(MAX),[PublicPoints] BIGINT,[Json] NVARCHAR(MAX),[Agentable] INT, CONSTRAINT [PK_Ca_EndUser] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
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
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BizPartner')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [BizPartner] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [BizPartner] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
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
    CREATE TABLE Ca_File ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Encrypt] INT,[SHA256] NVARCHAR(MAX),[Size] BIGINT,[Bind] BIGINT,[BindType] INT,[State] INT,[Folder] BIGINT,[FileType] INT,[JSON] NVARCHAR(MAX), CONSTRAINT [PK_Ca_File] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
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

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Core_BizOwner' AND xtype='U')
BEGIN
    CREATE TABLE Core_BizOwner ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Bind] BIGINT,[BindType] INT,[State] INT, CONSTRAINT [PK_Core_BizOwner] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Core_BizOwner]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='Caption')
BEGIN
 ALTER TABLE Core_BizOwner ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_BizOwner ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_BizOwner]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='Bind')
BEGIN
 ALTER TABLE Core_BizOwner ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_BizOwner ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_BizOwner]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='BindType')
BEGIN
 ALTER TABLE Core_BizOwner ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_BizOwner ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_BizOwner]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_BizOwner') AND name='State')
BEGIN
 ALTER TABLE Core_BizOwner ALTER COLUMN [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_BizOwner ADD [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Core_PromotedLink' AND xtype='U')
BEGIN
    CREATE TABLE Core_PromotedLink ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Expiry] BIGINT,[HashFull] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[HashTiny] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS,[Src] NVARCHAR(MAX),[Promoter] BIGINT,[Dst] BIGINT,[BizOwner] BIGINT,[Data] NVARCHAR(MAX), CONSTRAINT [PK_Core_PromotedLink] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Core_PromotedLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_PromotedLink') AND name='Expiry')
BEGIN
 ALTER TABLE Core_PromotedLink ALTER COLUMN [Expiry] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_PromotedLink ADD [Expiry] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_PromotedLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_PromotedLink') AND name='HashFull')
BEGIN
 ALTER TABLE Core_PromotedLink ALTER COLUMN [HashFull] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_PromotedLink ADD [HashFull] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_PromotedLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_PromotedLink') AND name='HashTiny')
BEGIN
 ALTER TABLE Core_PromotedLink ALTER COLUMN [HashTiny] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_PromotedLink ADD [HashTiny] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_PromotedLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_PromotedLink') AND name='Src')
BEGIN
 ALTER TABLE Core_PromotedLink ALTER COLUMN [Src] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_PromotedLink ADD [Src] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_PromotedLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_PromotedLink') AND name='Promoter')
BEGIN
 ALTER TABLE Core_PromotedLink ALTER COLUMN [Promoter] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_PromotedLink ADD [Promoter] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_PromotedLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_PromotedLink') AND name='Dst')
BEGIN
 ALTER TABLE Core_PromotedLink ALTER COLUMN [Dst] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_PromotedLink ADD [Dst] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_PromotedLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_PromotedLink') AND name='BizOwner')
BEGIN
 ALTER TABLE Core_PromotedLink ALTER COLUMN [BizOwner] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_PromotedLink ADD [BizOwner] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Core_PromotedLink]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Core_PromotedLink') AND name='Data')
BEGIN
 ALTER TABLE Core_PromotedLink ALTER COLUMN [Data] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Core_PromotedLink ADD [Data] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Log' AND xtype='U')
BEGIN
    CREATE TABLE Sys_Log ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Location] NVARCHAR(MAX),[Content] NVARCHAR(MAX),[Sql] NVARCHAR(MAX), CONSTRAINT [PK_Sys_Log] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
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
