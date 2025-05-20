

UPDATE Tbl_Display_Consolidate_View
SET Local_Scheme_Code = (
    SELECT vm.Local_SchemeCode
    FROM Tbl_Scheme_ViewName_Mapping_New vm
    WHERE vm.PmoDB_SchemeCode_OLD = Tbl_Display_Consolidate_View.Scheme_Code
)
WHERE EXISTS (
    SELECT 1
    FROM Tbl_Scheme_ViewName_Mapping_New
    WHERE Tbl_Scheme_ViewName_Mapping_New.PmoDB_SchemeCode_OLD = Tbl_Display_Consolidate_View.Scheme_Code
    --and Tbl_Scheme_ViewName_Mapping.IsCritical=1 
);


GO


Select * from Tbl_Scheme_ViewName_Mapping vm where vm.PmoDB_SchemeCode_OLD is not NULL and vm.IsCritical=1
Select * from Tbl_Display_Consolidate_View