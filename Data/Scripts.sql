 ALTER PROCEDURE [dbo].[spGetSchemeKPIData]      
--=============================================      
-- Author:  vineet      
-- Create date: 11 mar 25      
-- Description: national value of all kpi's for a particular scheme        
-- exec spGetSchemeKPIData 0,10051,0      
-- EXEC spGetSchemeKPIData 0,100359,0      
--kpiid 0 means all kpi's      
--stateid 0 means all states or national data      
-- =============================================     
 (       
 @stateid int,      
 @scheme_code int,      
 @kpiid int      
 )      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
 --this script will only run for data granularity id in 2,3      
--1.get the data granularity id and max level of the scheme      
--input parameter are scheme_code       
--1Jal Jeevan Mission 100359 Villages with 100 Percent Household tap connection      
--2 PM Garib Kalyan Anna Yojana 100565,100646 Number of Beneficiaries in absolute      
--3 PM Awaas Yojana - Grameen 100135 Sanctioned Beneficiaries      
--4 SVAMITVA 100405 Property Card Distributed      
--5 Swachh Bharat Mission - Grameen 100547 Total ODF Plus Villages      
--6 National Rural Livelihood Mission NRLM (10010,10012,10013,100156)      
--7 PM Gram Sadak Yojana 10046 Road Length Built 2014 -19      
--8 PM Awaas Yojana - Urban 100201 Sanctioned Dwelling Units      
--9 PM SVANIDHI 100134 Number of Loans Disbursed      
--10 UJALA 10051 LEDs Distributed by Government      
--11 PM Kaushal Vikas Yojana - Short Term Training 100396 Candidates Trained      
--12 MGNREGA 100613      
      
declare @granularity_id int      
declare @granularity_name varchar(200)      
declare @data_level int      
declare @sector varchar(200),@Ministry varchar(200),@Department varchar(200)      
set @sector=(select b.Sector_Name_e from Tbl_Project_Detail_Intrim a      
inner join m_sector b on a.Sec_Code=b.Sector_ID      
where project_code=@scheme_code      
)      
set @Ministry=(select b.Ministry_Name_e from Tbl_Project_Detail_Intrim a      
inner join M_Ministry b on a.Ministry_Code=b.Ministry_ID      
where project_code=@scheme_code)      
set @Department=(select b.Depertment_Name_e from Tbl_Project_Detail_Intrim a      
inner join M_Department b on a.Dept_Code=b.Depertment_ID      
where project_code=@scheme_code)      
      
set @granularity_id=(select Data_Granularity_ID from M_Data_Granularity a      
inner join Tbl_Project_Detail_Intrim b on b.Project_Data_Granularity_ID=a.Data_Granularity_ID      
where b.Project_Code=@scheme_code)      
set @granularity_name=(select Data_Granularity_Name_e from M_Data_Granularity a      
inner join Tbl_Project_Detail_Intrim b on b.Project_Data_Granularity_ID=a.Data_Granularity_ID      
where b.Project_Code=@scheme_code)      
set @data_level=(select Max_Data_Level from M_Data_Granularity a      
inner join Tbl_Project_Detail_Intrim b on b.Project_Data_Granularity_ID=a.Data_Granularity_ID      
where b.Project_Code=@scheme_code)      
      
if (@granularity_id in (2,3))      
begin      
declare @tbl_kpi_3 table(Datadt datetime,Data_Frequency_id tinyint,Project_Data_Granularity_ID int,Project_Code int,Project_Name_E varchar(100),      
state_Code int,district_Code int,      
State_name_e varchar(100),District_name_e varchar(100),      
kpi_id int,KPI_Name_E varchar(100),Unit_id int,      
Unit_Name_e_actual varchar(100),kpi_data_type_name_e varchar(100),      
Kpi_Data decimal(18,5))      
      
insert into @tbl_kpi_3       
select c.[Datadt],c.Mode_frequency_id, a.Project_Data_Granularity_ID,a.Project_Code,a.Project_Name_E,      
      
c.Level2_Code,      
c.Level3_Code,      
'' ,      
'' ,      
b.kpi_id,      
b.KPI_Name_E,      
b.kpi_unit_id,      
(select Unit_Name_e_actual from M_Unit where b.KPI_Unit_ID=M_Unit.Unit_ID) as lpi_unit_name_e,      
(select kpi_data_type_name_e from M_KPI_Data_Type where b.KPI_Data_Type_ID=M_KPI_Data_Type.KPI_Data_Type_ID) as kpi_data_type_name,      
c.Kpi_Data from       
Tbl_Project_Detail_Intrim a      
inner join Tbl_Project_KPI_Detail_Intrim b on a.Project_Code=b.Project_Code      
inner join Tbl_DataPort_KPI_PORTED_DATA c on c.project_code=a.Project_Code      
and c.Kpi_id=b.KPI_ID      
where a.Project_Code=@scheme_code      
and c.Datadt=(select max(Datadt) from Tbl_DataPort_KPI_PORTED_DATA where project_code=@scheme_code )      
      
update @tbl_kpi_3       
set State_name_e=(select distinct level2_name_e from m_level where m_level.Level2_code=a.state_Code      
and m_level.Data_Granularity_ID=a.Project_Data_Granularity_ID),      
      
 district_name_e=(select top 1 level3_name_e from m_level where m_level.Level2_code=a.state_Code      
and m_level.Level3_code=a.district_Code       
  and m_level.Data_Granularity_ID=a.Project_Data_Granularity_ID)      
from @tbl_kpi_3 a      
      
--select a.Datadt,M_Data_Frequency.Data_Frequency_Name_E, * from @tbl_kpi_3 a      
--inner join M_Data_Frequency on M_Data_Frequency.Data_Frequency_Id=a.Data_Frequency_id      
      
if (@stateid=0 and @kpiid =0)      
begin      
 select Datadt,state_Code,State_name_e,Project_Code,Project_Name_E,kpi_id,KPI_Name_E,      
 Unit_id,      
 Unit_Name_e_actual,      
 sum(Kpi_Data)  as outvalue --National_Value      
 from @tbl_kpi_3        
 group by datadt,state_Code,State_name_e,Project_Name_E,Unit_id,Unit_Name_e_actual,kpi_id,KPI_Name_E,Project_Code      
 --group by state_Code  
 order by state_Code,KPI_Name_E  
end      
      
if (@stateid<>0 and @kpiid <>0)      
begin      
select datadt,Project_Code,Project_Name_E,state_Code,State_name_e, kpi_id,KPI_Name_E,Unit_id,Unit_Name_e_actual,      
sum(Kpi_Data)  as outvalue --state_value      
from @tbl_kpi_3 where state_Code=@stateid and kpi_id=@kpiid        
group by Datadt,project_code,Project_Name_E,Unit_id,Unit_Name_e_actual,kpi_id,KPI_Name_E,state_Code,State_name_e      
order by state_Code,KPI_Name_E      
end      
      
if (@stateid=0 and @kpiid <>0)      
begin      
select datadt,state_Code,State_name_e,Project_Code,Project_Name_E,kpi_id,KPI_Name_E,Unit_id,Unit_Name_e_actual,      
sum(Kpi_Data)  as outvalue --state_value      
from @tbl_kpi_3 where kpi_id=@kpiid      
group by Datadt,state_Code,State_name_e,project_code,Project_Name_E,Unit_id,Unit_Name_e_actual,kpi_id,KPI_Name_E      
order by state_Code,KPI_Name_E      
end      
      
if (@stateid<>0 and @kpiid =0)      
begin      
select datadt,Project_Code,Project_Name_E,state_Code,State_name_e, kpi_id,KPI_Name_E,Unit_id,Unit_Name_e_actual,      
sum(Kpi_Data) as outvalue --state_value        
from @tbl_kpi_3 where state_Code=@stateid        
group by Datadt,project_code,Project_Name_E,Unit_id,Unit_Name_e_actual,kpi_id,KPI_Name_E,state_Code,State_name_e      
order by state_Code,KPI_Name_E      
end      
      
      
      
------------------------------------------------------districtwise value      
--select Datadt,Project_Code,Project_Name_E,state_Code,State_name_e,district_Code,District_name_e, kpi_id,KPI_Name_E,Unit_id,Unit_Name_e_actual,      
--sum(Kpi_Data)  as state_value      
--from @tbl_kpi_3        
--group by Datadt,project_code,Project_Name_E,Unit_id,Unit_Name_e_actual,kpi_id,KPI_Name_E,state_Code,State_name_e,      
--district_Code,District_name_e      
--order by state_Code,district_Code,kpi_id      
      
end      
          
END

GO
-- =============================================  
-- Author:  vineet  
-- Create date: 11 mar 25  
-- Description: get list of departments on the basis of sector_id  
--exec spGetAllDepartmentBySectorId 1  
-- =============================================  
ALTER PROCEDURE spGetAllDepartmentBySectorId  
 @sector_id int  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
 if(@sector_id=0)
 select Depertment_ID,Depertment_Name_e from M_Department 
 order by Depertment_ID,Depertment_Name_e
 else
 select Depertment_ID,Depertment_Name_e from M_Department where Sector_ID=@sector_id  
 order by Depertment_ID,Depertment_Name_e
      
END  

GO

ALTER FUNCTION [dbo].[Split](@String varchar(max) ,@Delimiter char(1))        
returns @temptable TABLE (items varchar(max))        
as        
begin        
    declare @idx int        
    declare @slice varchar(8000)        
      
    select @idx = 1        
       if len(@String)<1 or @String is null  return        
       
    while @idx!= 0        
    begin        
        set @idx = charindex(@Delimiter,@String)        
        if @idx!=0        
            set @slice = left(@String,@idx - 1)        
        else        
            set @slice = @String        
           
        if(len(@slice)>0)   
            insert into @temptable(Items) values(@slice)        
  
        set @String = right(@String,len(@String) - @idx)        
        if len(@String) = 0 break        
    end    
return        
end


GO
  
ALTER PROCEDURE [dbo].[spGetAllscheme]  
 (  
 @dept_id varchar(200)  
 )  
  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
 --1Jal Jeevan Mission 100359 Villages with 100 Percent Household tap connection  
--2 PM Garib Kalyan Anna Yojana 100565,100646 Number of Beneficiaries in absolute  
--3 PM Awaas Yojana - Grameen 100135 Sanctioned Beneficiaries  
--4 SVAMITVA 100405 Property Card Distributed  
--5 Swachh Bharat Mission - Grameen 100547 Total ODF Plus Villages  
--6 National Rural Livelihood Mission NRLM (10010,10012,10013,100156)  
--7 PM Gram Sadak Yojana 10046 Road Length Built 2014 -19  
--8 PM Awaas Yojana - Urban 100201 Sanctioned Dwelling Units  
--9 PM SVANIDHI 100134 Number of Loans Disbursed  
--10 UJALA 10051 LEDs Distributed by Government  
--11 PM Kaushal Vikas Yojana - Short Term Training 100396 Candidates Trained  
--12 MGNREGA 100613  
select Project_Code,Project_Name_E from Tbl_Project_Detail_Intrim where  
 Project_Code in (100359,100565,100646,100135,100405,100547,10010,10012,10013,100156,10046,100201,100134,10051,100396,100613) and   
 Project_Approved_Date is not null and Dept_Code IN (Select cast(items as int) from dbo.split(@dept_id,','))          
END  
