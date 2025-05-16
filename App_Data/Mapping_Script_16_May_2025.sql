CREATE TABLE [Tbl_Scheme_ViewName_Mapping] (
  [Record_ID] int NOT NULL
, [Local_SchemeCode] nvarchar(250) NULL COLLATE NOCASE
, [Local_Scheme_Name] nvarchar(250) NULL COLLATE NOCASE
, [PmoDB_SchemeCode] nvarchar(250) NULL COLLATE NOCASE
, [PmoDB_Scheme_Name] nvarchar(250) NULL COLLATE NOCASE
, [PmoDB_ViewName] nvarchar(250) NULL COLLATE NOCASE
, [Status] tinyint NULL
, [StatusDescription] nvarchar(500) NULL COLLATE NOCASE
, [IsCritical] tinyint NULL
, [PmoDB_SchemeCode_OLD] nvarchar(250) NULL COLLATE NOCASE
, [Parent_SchemeCode] nvarchar(250) NULL COLLATE NOCASE
);

INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
1,'10018','Atal Pension Yojna','70018','Atal Pension Yojna','[APY]',NULL,NULL,1,'70018','10018');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
2,'10021','Ayushman Bharat PM Jan Arogya Yojana','70021','Ayushman Bharat PM Jan Arogya Yojana','[AB PMJAY daily]',NULL,NULL,1,'70021','10021');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
3,'100351','BharatNet','100351','BharatNet(Villages)','[BharatNet_Status_Util],[BharatNet_CurrentMonth]',0,NULL,1,'100351','100351');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
4,'10025','Common Services Centre ','70025','Common Services Centre ','[Common Services Centre]',NULL,NULL,1,'70025','10025');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
5,'10063','Direct Benefit Transfer for LPG DBTL','70063','Direct Benefit Transfer for LPG DBTL','[Direct Benefit Transfer for LPG DBTL]',NULL,NULL,NULL,'70063',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
6,'10084','Gram Panchayat Development Plan GPDP','70084','Gram Panchayat Development Plan GPDP','[Gram Panchayat Development Plan GPDP]',NULL,NULL,NULL,'70084',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
7,'10086','Digital India Land Records Modernization','70086','Digital India Land Records Modernization','[DILRM]',NULL,NULL,NULL,'70086',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
8,'100102','INSPIRE','70102','INSPIRE','[INSPIRE]',NULL,NULL,NULL,'70102',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
9,'100104','eTaal','70104','eTaal','[eTaal]',NULL,NULL,NULL,'70104',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
10,'100105','INSPIRE Awards MANAK','70105','INSPIRE Awards MANAK','[INSPIRE Awards MANAK]',NULL,NULL,NULL,'70105',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
11,'100127','DDU GKY','100127','DDU GKY','[DDU GKY]',NULL,NULL,NULL,'100127',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
12,'100138','Development of National Highways','100138','Development of National Highways','[Development of National Highways]',NULL,NULL,1,'100138','100138');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
13,'100143','Coal Production','100143','Coal Production','[Coal Production]',NULL,NULL,NULL,'100143',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
14,'100155','Capacity Building for Service Providers','100155','Capacity Building for Service Providers','[Capacity Building]',NULL,NULL,NULL,'100155',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
15,'100157','EPFO Payroll DATA','100157','EPFO Payroll DATA','[EPFO Payroll]',NULL,NULL,NULL,'100157',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
16,'100159','Capital Expenditure (CAPEX)','100159','Capital Expenditure (CAPEX)','[CAPEX_New]',NULL,'One More Scheme Code 100442 with Same Scheme Name',NULL,'100159',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
17,'100202','Service Trade Imports and Exports','100202','Service Trade Imports and Exports','[Services Trade I/E]',NULL,NULL,NULL,'100202',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
18,'100217','Defence Production','100217','Defence Production','[Defence Production]',NULL,NULL,NULL,'100217',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
19,'100219','Coal Dispatch','100219','Coal Dispatch','[Coal_Dispatch]',NULL,NULL,NULL,'100219',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
20,'100220','Ministry of External Affairs','100220','Ministry of External Affairs','[MEA_new]',NULL,'100490	Indian Peace Keeping Force
100407
Ministry of External Affairs II',NULL,'100220',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
21,'100231','Commodity Wise Exports and Imports','100231','Commodity Wise Exports and Imports','[I/E Commodity Wise]',NULL,NULL,NULL,'100231',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
22,'100234','Biotech Intervention(Aspirational Distt)','100234','Biotech Intervention(Aspirational Distt)','[Biotech Intervention(Aspirational Distt)]',NULL,NULL,NULL,'100234',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
23,'100238','Ayushman Bharat Health Wellness Centres','100238','Ayushman Bharat Health Wellness Centres','[AB_Health_Wellness_Centres]',NULL,NULL,1,'100238','100238');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
24,'100240','Area Protected under Eco Sensitive Zone','100240','Area Protected under Eco Sensitive Zone','[Area protected]',NULL,NULL,NULL,'100240',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
25,'100242','CGTMSE','100242','CGTMSE','[CGTMSE]',NULL,NULL,NULL,'100242',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
26,'100366','DEFENCE OFFSET','100366','DEFENCE OFFSET','[DEFENCE OFFSET]',NULL,NULL,NULL,'100366',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
27,'100369','Innovations for Defence Excellence','100369','Innovations for Defence Excellence','[Innovations for Defence Excellence]',NULL,'',NULL,'100369',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
28,'100370','AI IN DEFENCE','100370','AI IN DEFENCE','[AI IN DEFENCE]',NULL,NULL,NULL,'100370',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
29,'100372',' Aatmanirbhar Bharat Rojgar Yojana','100372',' Aatmanirbhar Bharat Rojgar Yojana','[ABRY_Weekly]',NULL,NULL,NULL,'100372',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
30,'100382','eSHRAM','100382','eSHRAM','[eSHRAM]',NULL,NULL,NULL,'100382',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
31,'100385','Foreign Direct Investment','100385','Foreign Direct Investment','[Total_FDI_Sector_State_Country]',NULL,NULL,NULL,'100385',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
32,'100387','ESI CORPORATION','100387','ESI CORPORATION','[ESI Corporation Daily]',NULL,NULL,NULL,'100387',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
33,'100397','Defence Exports ','100397','Defence Exports ','[Defence Exports]',NULL,NULL,NULL,'100397',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
34,'100411','HRD Activities','100411','HRD Activities','[HRD Activities]',NULL,NULL,NULL,'100411',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
35,'100414','Integrated Cold Chain','100414','Integrated Cold Chain','[Integrated Cold Chain]',NULL,NULL,NULL,'100414',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
36,'100415','CEFPPC','100415','CEFPPC','[CEFPPC]',NULL,'',NULL,'100415',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
37,'100416','Food Safety and Quality Assurance Infra','100416','Food Safety and Quality Assurance Infra','[Food Safety]',NULL,NULL,NULL,'100416',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
38,'100439','India Post Payment Bank ','100439','India Post Payments Bank','[India Post Payment New_Daily]',NULL,'100247	India Post payment Bank I
100365	India Post payment Bank II',NULL,'100439',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
39,'100448','Agri-Clinics and Agri-Business Scheme','100448','Agri-Clinics and Agri-Business Scheme','[Agri Clinics and Business]',NULL,NULL,NULL,'100448',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
40,'100449','Ease of Doing Business','100449','Ease of Doing Business','[Ease_of_Doing_Business_updated]',NULL,NULL,NULL,'100449',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
41,'100474','eBISv3','100474','eBISv3','[eBISv4],[eBIS_Daily
]',NULL,NULL,NULL,'100474',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
42,'100475','Extension Reforms (ATMA)','100475','Extension Reforms (ATMA)','[Extension Reforms (ATMA)]',NULL,NULL,NULL,'100475',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
43,'100476','Agriculture Infrastructure Fund','100476','Agriculture Infrastructure Fund','[Agriculture Infrastructure Fund]',NULL,NULL,1,'100476','100476');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
44,'100552','DigiLocker','100552','DigiLocker','[DigiLocker_New]',NULL,NULL,NULL,'100552',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
45,'100561','5G BTS','100561','5G BTS','[5G_BTS]',NULL,NULL,NULL,'100561',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
46,'100575','AMRIT BHARAT STATIONS (WORK STARTED)','100575','AMRIT BHARAT STATIONS (WORK STARTED)','[Amrit_Bharat_Stations]',NULL,NULL,NULL,'100575',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
47,'100580','GOVERNMENT EMARKETPLACE','100580','GOVERNMENT EMARKETPLACE','[Government_emarketplace]',NULL,NULL,NULL,'100580',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
48,'100584','All India Survey on Higher Education','100584','All India Survey on Higher Education','[aishe]',NULL,NULL,NULL,'100584',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
49,'100589','DGQI','100589','DGQI','[DGQI]',NULL,NULL,NULL,'100589',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
50,'100593','DBT','100137,100130,100132,100133','Direct Benefit Transfer
','[Direct_Benefit_Transfer_New]',0,'Schem Found 100130	DBT Nationwise Monthly
100137	DBT Districtwise Monthly
100132	DBT Nationwise Annual
100133	DBT Statewise Monthly',1,'100130','100593');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
51,'100600','Craftsmen Training Scheme (ITI)','100600','Craftsmen Training Scheme (ITI)','[Craftsmen_Training_Scheme_ITI]',NULL,NULL,NULL,'100600',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
52,'100614','GPs connected to Broadband','100614','GPs connected to Broadband','[GPs_connected_block],[GPs_connected_currmonth
]',NULL,NULL,NULL,'100614',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
53,'100689','181 Women Helpline','100689','181 Women Helpline','[Women_Helpline]',NULL,NULL,NULL,'100689',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
54,'100359','Jal Jeevan Mission II','100359,100355,70050','Jal Jeevan Mission II','[JJM_Daily_Blocks_Villages_updated]',NULL,'100355	Jal Jeevan Mission I
70050	Jal Jeevan Mission',1,'100359','100359');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
55,'100134','PM Street Vendors AatmaNirmbhar Nidhi','100134','PM Street Vendors AatmaNirmbhar Nidhi','[pm_svanidhi]',NULL,NULL,NULL,'100134',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
56,'100396','PMKVY','100396,70008','PMKVY','[pmkvy_stt]',NULL,NULL,1,'100396','100396');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
57,'100613','MGNREGA (At a Glance)','100613,70007,70041,70058,70059','MGNREGA (At a Glance)','[PM_DASBOARD_MGNREGA_Updated]',NULL,NULL,1,'100613','100613');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
58,'100135','Pradhan Mantri Awaas Yojana Gramin PMAYG','100135','Pradhan Mantri Awaas Yojana Gramin PMAYG','[pradhan mantri awaas yojana gramin]',NULL,NULL,1,'100135','100135');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
59,'100405','SVAMITVA Scheme','100405','SVAMITVA Scheme','[svamitva scheme]',NULL,NULL,1,'100405','100405');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
60,'100156','Deendayal Antyodaya Yojana NRLM FinIncl3','100156,70010,70012,70013','Deendayal Antyodaya Yojana NRLM FinIncl3','[deendayal antyodaya yojana nrlm]',NULL,NULL,1,'100156','100156');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
61,'10046','Pradhan Mantri Gram Sadak Yojana','70046','Pradhan Mantri Gram Sadak Yojana','[pradhan mantri gram sadak yojana]',NULL,NULL,1,'70046','10046');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
62,'100565','One Nation One Ration Card v2','100565','One Nation One Ration Card v2','[onorc_v3]',NULL,NULL,NULL,'100565',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
63,'100646','Food Subsidy(Monthly)','100646','Food Subsidy(Monthly)','[onorc_v3]',NULL,NULL,NULL,'100646',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
64,'100201','Pradhan Mantri Awas Yojana Urban 3','100201,70066,100140,70026,100147','Pradhan Mantri Awas Yojana Urban 3','[pm_awaas_yojana_urban_weekly]',NULL,NULL,1,'100201','100201');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
65,'10051','UJALA','70051,70052','UJALA','[ujala]',NULL,NULL,1,'70051','10051');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
66,'10052','UJALA LED bulb sold by Private Agencies','70051','UJALA LED bulb sold by Private Agencies','[ujala]',NULL,NULL,NULL,'70051',NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
67,NULL,NULL,NULL,'Defence Industrial Corridor','DEFENCE CORRIDOR',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
68,NULL,NULL,NULL,'Exports & Imports: Country Wise','Import_Export',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
69,NULL,NULL,NULL,'Exports & Imports: Port Wise','Import_Export',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
70,NULL,NULL,NULL,'Exports: State Wise','Principal Commodity',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
71,NULL,NULL,NULL,'Fertilizers','Fertilizers',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
72,NULL,NULL,NULL,'Foodgrains Procurement Data','Procurement_updated_New',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
73,NULL,NULL,NULL,'Income Tax','Income Tax Department',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
74,NULL,NULL,NULL,'International Cooperation','[International Cooperation],[National Agriculture Market
]',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
75,NULL,NULL,NULL,'IR Operations & CAPEX','IR_OPERATIONS_CAPEX',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
76,NULL,NULL,NULL,'IR Projects','IR_PROJECTS',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
77,NULL,NULL,NULL,'IVFRT','IVFRT',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
78,NULL,NULL,NULL,'Jan Sikshan Sansthan (JSS)','Jan_Sikshan_Sansthan',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
79,NULL,NULL,NULL,'Major NER Projects','North_East_Region',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
80,NULL,NULL,NULL,'Make-II Projects','MAKE II PROJECTS',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
81,NULL,NULL,NULL,'MCA21','MCA_Daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
82,NULL,NULL,NULL,'Mega Food Parks','Mega Food Parks',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
83,NULL,NULL,NULL,'Merchandise Trade: Exports & Imports','Merchandise Trade Export and Import',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
84,NULL,NULL,NULL,'Mission Raksha Gyan Shakti','Mission_Raksha_Gyan',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
85,NULL,NULL,NULL,'Mission Saksham Anganwadi and Poshan ','Mission_Saksham_Anganwadi',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
86,NULL,NULL,NULL,'MoMA: Merit cum Means based Scholarship Scheme','Merit cum Means based',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
87,NULL,NULL,NULL,'MoMA: Post Matric Scholarship Scheme','Minority_Post_Matric',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
88,NULL,NULL,NULL,'MoMA: Pre Matric Scholarship Scheme','Minority_Pre_Matric',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
89,NULL,NULL,NULL,'MPLADS','MPLADS',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
90,NULL,NULL,NULL,'MSECDP','MSE Cluster Development Programme',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
91,NULL,NULL,NULL,'Nagar VAN','Nagar_VAN',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
92,NULL,NULL,NULL,'Namami Gange Programme','Namami Gange Programme',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
93,'10043','National Agriculture Market','70043','National Agriculture Market','[National Agriculture Market]',NULL,NULL,1,'70043','10043');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
94,NULL,NULL,NULL,'National Animal Disease Control Programme','National Animal Disease Control Programm',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
95,NULL,NULL,NULL,'National Ayush Mission','National_Ayush_Mission_Monthly',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
96,NULL,NULL,NULL,'National Career Service','national_career_service_project',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
97,NULL,NULL,NULL,'National Food Security Mission (NFSM)','National Food Security Mission (NFSM)',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
98,NULL,NULL,NULL,'National Medicinal Plants Board','National_Medicinal_Plants_Board',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
99,NULL,NULL,NULL,'National Sickle Cell Anaemia Elimination Mission','SICKLE_CELL_DISEASE_CONTROL_PROGRAMME_NEW',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
100,NULL,NULL,NULL,'National Social Assistance Programme','National Social Assistance Programme',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
102,NULL,NULL,NULL,'NextGen-eHospital','NextGen_eHospital_daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
103,NULL,NULL,NULL,'NJDG District & Subordinate Courts','NJDG District and Subordinate Courts',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
104,NULL,NULL,NULL,'NJDG High court','NJDG High court',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
105,NULL,NULL,NULL,'NPCDCS Programme','NPCDCS_Programme',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
106,NULL,NULL,NULL,'Nurturing Biotech Ecosystem','Nurturing Biotech Ecosystem',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
107,NULL,NULL,NULL,'O-SMART','Osmart',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
108,NULL,NULL,NULL,'One Station One Product (Stalls)','One_Station_One_Product',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
109,NULL,NULL,NULL,'One Stop Centre','One Stop Centre',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
110,NULL,NULL,NULL,'Per Drop More Crop','PM_Krishi_Sinchayee_Yojana',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
111,NULL,NULL,NULL,'PLI - Bulk Drugs','PLI - Bulk Drugs',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
112,NULL,NULL,NULL,'PLI - Medical Devices','PLI - Medical Devices',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
113,NULL,NULL,NULL,'PLI - Pharmaceuticals','PLI - Pharmaceuticals',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
114,NULL,NULL,NULL,'PLI - Telecom and Networking Products','PLI_Telecom_Networking',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
115,NULL,NULL,NULL,'PLI - White Goods','PLI_White_Goods',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
116,NULL,NULL,NULL,'PLI Automobile and Auto Components','PLI_Automobile_and_Auto_Components_New',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
117,NULL,NULL,NULL,'PLI for Category 1','PLI_for_category1',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
118,NULL,NULL,NULL,'PLI for Textiles','PLI for Textiles',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
119,NULL,NULL,NULL,'PLI Scheme For Specialty Steel','Pli_scheme_for_specialty_steel',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
120,NULL,NULL,NULL,'PLI Scheme on Solar PV Modules','PLI Scheme on Solar PV Modules',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
121,NULL,NULL,NULL,'PM Adarsh Gram Yojana','PM Adarsh Gram Yojana_Daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
122,'100447','Jan Aushadhi Pariyojana','70054,100447','PM Bhartiya Janaushadhi Pariyojana','[Jan Aushadhi Pariyojana_Daily]',NULL,NULL,1,'100447','100447');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
123,NULL,NULL,NULL,'PM Employment Generation Programme','PM Employment Generation',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
124,'100248','Pradhan Mantri Fasal Bima Yojana (PMFBY)','100248','PM Fasal Bima Yojana','[PM Fasal Bima Yojana_New]',NULL,NULL,1,'100248','100248');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
125,NULL,NULL,NULL,'PM GatiShakti','PM_GatiShakti',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
126,'10032','PM Jan Dhan Yojana  II','70015,70032','PM Jan Dhan Yojana','PMJDY',NULL,NULL,1,'70032','10032');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
127,'10017','PM Jeevan Jyoti Bima Yojana','70017','PM Jeevan Jyoti Bima Yojana','PMJJBY',NULL,NULL,1,'70017','10017');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
128,NULL,NULL,NULL,'PM Khanij Kshetra Kalyan Yojana','PM Khanij Kshetra Kalyan Yojana',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
129,NULL,NULL,NULL,'PM Kisan Mandhan Yojana','PM_Kisan_Mandhan_Scheme',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
130,'100674','PM Kisan Samman Nidhi','100674','PM Kisan Samman Nidhi','PM_kisan_samman_nidhi_latest',NULL,NULL,1,'100674','100674');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
131,NULL,NULL,NULL,'PM Kisan SAMPADA Yojana','PM Kisan Sampada Yojana',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
132,NULL,NULL,NULL,'PM Krishi Sinchai Yojana - WDC','Watershed_Development_Component_PMKSY2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
133,NULL,NULL,NULL,'PM Krishi Sinchayee Yojana - AIBP','PMKSY AIBP_Yearly_Monthly',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
134,'100560','Pradhan Mantri Matru Vandana Yojana','100560','PM Matru Vandana Yojana','pm_matru_vandana_updated',NULL,NULL,1,'100560','100560');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
134,'100378','Pradhan Mantri Matsya Sampada Yojana','100378','PM Matsya Sampada Yojana','[PM Matsya Sampada]',NULL,NULL,1,'100378','100378');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
137,'100576','PM POSHAN','100576','PM Poshan','PM_POSHAN',NULL,NULL,1,'100576','100576');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
138,NULL,NULL,NULL,'PM Shram Yogi Maandhan Yojana','PM Shram Yogi_Daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
139,'10016','PM Suraksha Bima Yojana','70016','PM Suraksha Bima Yojana','PMSBY',NULL,NULL,1,'70016','10016');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
140,'100383','Pradhan Mantri Ujjwala Yojana 2','70062,100383,100675','PM Ujjwala Yojana','PM_Ujjwala_Phase1_Phase2',NULL,NULL,1,'100383','100383');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
141,NULL,NULL,NULL,'PM Vishwakarma','PM_Vishwakarma_Monthly',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
142,NULL,NULL,NULL,'PM WANI','PM WANI daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
143,NULL,NULL,NULL,'PMFME','PMFME',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
144,NULL,NULL,NULL,'PMKSY CADWM','PMKSY_CADWM_Updated',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
145,NULL,NULL,NULL,'PMKVY - Recognition of Prior Learning','PMKVY_RPL',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
146,'100524','PMNDP Programme','100524','PMNDP Programme','PMNDP_Programme_Daily',NULL,NULL,1,'100524','100524');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
147,NULL,NULL,NULL,'Post Office Small Savings','PO Small Savings Daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
148,NULL,NULL,NULL,'Postal Life Insurance','Postal Life Insurance Daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
149,NULL,NULL,NULL,'Pradhan Mantri Jan Vikas Karyakram','Pm_Jan_Vikas_Karyakram_Quarterly',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
150,NULL,NULL,NULL,'PRASAD','PRASHAD',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
151,NULL,NULL,NULL,'Production Linked Incentive - ALL','PLI_ALL',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
152,NULL,NULL,NULL,'Rashtriya Gram Swaraj Abhiyaan','Rashtriya Gram Swaraj',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
153,NULL,NULL,NULL,'Regional Connectivity Scheme (RCS) UDAN ','Regional Connectivity Scheme (RCS) UDAN ',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
154,NULL,NULL,NULL,'Reproductive and Child Health (RCH)','RCH_daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
155,NULL,NULL,NULL,'Restoration of Land','Restoration of Land',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
156,NULL,NULL,NULL,'RGNIYD','RGNIYD',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
157,'100237','Routine Immunization','100237','Routine Immunization Programme','[Routine Immunization_New]',NULL,NULL,1,'100237','100237');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
158,NULL,NULL,NULL,'Rural Self Employment Training Institute','Rural_Self_employment_Training_Ins',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
159,NULL,NULL,NULL,'Sagar Unnati','Sagar Unnati',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
160,NULL,NULL,NULL,'Samagra Shiksha','Samagra_Shiksha',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
161,NULL,NULL,NULL,'Samarth','Samarth_Weekly',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
162,NULL,NULL,NULL,'SARATHI','SARATHI Daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
163,NULL,NULL,NULL,'Seismology and Geosciences (SAGE)','Seismology and Geosciences (SAGE)',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
164,NULL,NULL,NULL,'SERB Fellowships','SERB Fellowships',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
165,NULL,NULL,NULL,'SFURTI','SFURTI',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
166,NULL,NULL,NULL,'Soil Health and Fertility','soil_health_and_fertility',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
167,NULL,NULL,NULL,'Solar Rooftop','Solar_Roof_Top',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
168,'10019','Stand Up India','70019,70034','Stand Up India','[Stand Up India]',NULL,NULL,1,'70019','10019');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
197,'10067','Swachh Bharat Mission - Urban','70067','Swachh Bharat Mission Urban 1','[Swachh Bharat Mission Urban]',NULL,NULL,1,'70067','10027');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
170,NULL,NULL,NULL,'Steel Import','Steel Import Monitoring System',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
171,NULL,NULL,NULL,'Steel Production and Consumption','Steel',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
172,NULL,NULL,NULL,'Steel Trade','Trade of Steel',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
173,NULL,NULL,NULL,'Strengthening of IPR','IPR_Combined,Patents_updated
,Designs_updated
,Trade_Marks_updated
,Copyright
,FDI_Sector_State_category
',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
174,'10045','Sukanya Samriddhi Yojana','70045','Sukanya Samriddhi Yojana','[Sukanya Samriddhi Yojana]',NULL,NULL,1,'70045','10045');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
201,'100547','Swachh Bharat Mission - Grameen','100547','Swachh Bharat Mission Grameen Phase II','Swachh_Bharat_Mission_Grameen_New_Daily',NULL,NULL,1,'100547','100547');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
177,NULL,NULL,NULL,'Swadesh Darshan','Swadesh Darshan',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
178,NULL,NULL,NULL,'Tele - Law','TeleLaw_Latest',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
179,NULL,NULL,NULL,'Tribal: Eklavya Model Residential School','Eklavya Model School',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
180,NULL,NULL,NULL,'Tribal: National Fellowship Scheme','[National Fellowship Scheme],PMNDP_Programme_Daily
',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
181,NULL,NULL,NULL,'Tribal: National Overseas Scholarship','National Overseas Scholarship Scheme',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
182,NULL,NULL,NULL,'Tribal: NGO Grants','NGO Grants',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
183,NULL,NULL,NULL,'Tribal: Post Matric Scholarship Scheme','Post Matric Scholarship New',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
184,NULL,NULL,NULL,'Tribal: Pre Matric Scholarship Scheme','Tribal Pre Matric Scholarship New',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
185,NULL,NULL,NULL,'Tribal: Scholarship for Top Class ST Students','Scholarship for Top Class ST Students',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
186,NULL,NULL,NULL,'Udyam Registration','Udyam_Registration',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
187,NULL,NULL,NULL,'USOF Mobile Towers','useof_mobile_towers,useof_mobileTower_CurrMonth
',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
188,NULL,NULL,NULL,'VAHAN','VAHAN Daily',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
189,NULL,NULL,NULL,'Virtual Court (Traffic)','Virtual_Court',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
190,NULL,NULL,NULL,'Women Scientist Scheme Awards','Women Scientists',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
191,'100565','Pradhan Mantri Garib Kalyan Anna Yojana ','100565,100624,100638,100646','Pradhan Mantri Garib Kalyan Anna Yojana','[ONORC_v3]',NULL,NULL,1,'100446','100565');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
192,'100134','PM Street Vendors AatmaNirmbhar Nidhi','100134','PM SVANidhi','PM_SVANidhi',NULL,NULL,1,'100134','100134');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
193,'100418','Startup India','100418','Startup India','startups_recognized_latest',NULL,NULL,1,'100418','100579');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
194,'100579','Startup India','100579','Startup India (Category-Wise)','startups_recognized_latest',NULL,NULL,1,'100579','100579');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
195,'100681','Startup India','100681','Startup India (State wise)','startups_recognized_latest',NULL,NULL,1,'100681','100579');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
196,'100435','Startup India','100435','Startups recognised Industry-wise','startups_recognized_latest',NULL,NULL,1,'100435','100579');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
198,'10027','Swachh Bharat Mission - Urban','70027','Swachh Bharat Mission Urban','[Swachh Bharat Mission Urban]',NULL,NULL,1,'70027','10027');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
199,'10069','Swachh Bharat Mission - Urban','70069','Swachh Bharat Mission Urban 3','[Swachh Bharat Mission Urban]',NULL,NULL,1,'70069','10027');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
200,'10068','Swachh Bharat Mission - Urban','70068','Swachh Bharat Mission Urban 2','[Swachh Bharat Mission Urban]',NULL,NULL,1,'70068','10027');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
202,'100548','Swachh Bharat Mission - Grameen','100548','Swachh Bharat Mission Grameen Phase-II','Swachh_Bharat_Mission_Grameen_New_Daily',NULL,NULL,1,'100548','100547');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
203,'100450','Swachh Bharat Mission - Grameen','100450','Swachh Bharat Mission Grameen Phase2','Swachh_Bharat_Mission_Grameen_New_Daily',NULL,NULL,1,'100450','100547');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
205,'10038','PM Mudra Yojana','70038','PM Mudra Yojana  II','PM Mudra Yojana',NULL,NULL,1,'70038','10038');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
206,'10033','PM Mudra Yojana','70033','PM Mudra Yojana  III','PM Mudra Yojana',NULL,NULL,1,'70033','10033');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
207,'100508','NAIP Progress Report - NAIP II','100508','NAIP Progress report - NAIP IV','[Nationwide Artificial Insemination Progr_update]',NULL,NULL,1,'100508','100508');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
208,'100379','NAIP Progress Report - NAIP II','100379','NAIP Progress Report - NAIP II','[Nationwide Artificial Insemination Progr_update]',NULL,NULL,1,'100379','100508');
INSERT INTO [Tbl_Scheme_ViewName_Mapping] ([Record_ID],[Local_SchemeCode],[Local_Scheme_Name],[PmoDB_SchemeCode],[PmoDB_Scheme_Name],[PmoDB_ViewName],[Status],[StatusDescription],[IsCritical],[PmoDB_SchemeCode_OLD],[Parent_SchemeCode]) VALUES (
209,'100381','NAIP Progress Report - NAIP II','100381','NAIP Progress Report- NAIP III','[Nationwide Artificial Insemination Progr_update]',NULL,NULL,1,'100381','100508');


