using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
//using System.Runtime.CompilerServices;
using System.Text;
using System.IO;

namespace TreeViewProject
{
    
    public partial class PrayasKPI : System.Web.UI.Page
    {
        #region(page objects) 
        /// <summary>
        /// 
        /// </summary>
        //DataTable dtFinal;
        //DataRow drFinal;
        #endregion

        private string connectionString = ConfigurationManager.AppSettings["MyConnectionString"];
        private string connectionStringCEDA = ConfigurationManager.AppSettings["MyConnectionStringCEDA"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //GetCedaData();
                BindSector();                
            }
        }
        
        #region(DropDown Events and function)
        /// <summary>
        /// 
        /// </summary>
        private void BindSector()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("spGetAllSector", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable ds = new DataTable();
                            adapter.Fill(ds);
                            ddlSector.DataSource = ds;
                            ddlSector.DataTextField = "Sector_Name_e";
                            ddlSector.DataValueField = "Sector_ID";
                            ddlSector.DataBind();
                            ddlSector.Items.Insert(0, new ListItem("---Select Sector---", "-1"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private void GetDepartmentBySector(int sectorID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("spGetAllDepartmentBySectorId", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@sector_id", sectorID);
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable ds = new DataTable();
                            adapter.Fill(ds);
                            ddlDepartment.DataSource = ds;
                            ddlDepartment.DataTextField = "Depertment_Name_e";
                            ddlDepartment.DataValueField = "Depertment_ID";
                            ddlDepartment.DataBind();
                            ddlDepartment.Items.Insert(0, new ListItem("--Select Department--", "-1"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private void BindState()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("spGetAllState", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable ds = new DataTable();
                            adapter.Fill(ds);
                            ddlState.DataSource = ds;
                            ddlState.DataTextField = "Level2_name_e";
                            ddlState.DataValueField = "Level2_code";
                            ddlState.DataBind();
                            ddlState.Items.Insert(0, new ListItem("---Select State---", "-1"));
                            ddlState.Items.Insert(1, new ListItem("----- All -----", "0"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private void GetAllDistrictByState(int stateCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("spGetAllStateByDistrict", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@statecode", stateCode);
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable ds = new DataTable();
                            adapter.Fill(ds);
                            ddlDistrict.DataSource = ds;
                            ddlDistrict.DataTextField = "Level3_name_e";
                            ddlDistrict.DataValueField = "Level3_code";
                            ddlDistrict.DataBind();
                            ddlDistrict.Items.Insert(0, new ListItem("--Select District--", "-1"));
                            //ddlDistrict.Items.Insert(1, new ListItem("----- All -----", "0"));                            
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private void GetAllSchemebyDeptID(int deptID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("[spGetAllscheme]", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@dept_id", deptID);
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable ds = new DataTable();
                            adapter.Fill(ds);
                            ddlScheme.DataSource = ds;
                            ddlScheme.DataTextField = "Project_Name_E";
                            ddlScheme.DataValueField = "Project_Code";
                            ddlScheme.DataBind();
                            ddlScheme.Items.Insert(0, new ListItem("--Select Scheme--", "-1"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        private void GetAllKpiBySchemeCode(int SchemeCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("spGetAllKPIByScheme", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@schemecode", SchemeCode);
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable ds = new DataTable();
                            adapter.Fill(ds);
                            ddlKpi.DataSource = ds;
                            ddlKpi.DataTextField = "KPI_Name_E";
                            ddlKpi.DataValueField = "KPI_ID";
                            ddlKpi.DataBind();
                            ddlKpi.Items.Insert(0, new ListItem("--Select KPI--", "-1"));
                            ddlKpi.Items.Insert(1, new ListItem("----- All -----", "0"));                            
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }     
        protected void ddlSector_SelectedIndexChanged(object sender, EventArgs e)
        {
            Int16 sectorID = Convert.ToInt16(ddlSector.SelectedValue);
            GetDepartmentBySector(sectorID);
            BindState();
        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {            
            Int16 stateID = Convert.ToInt16(ddlState.SelectedValue);
            if (ddlState.SelectedIndex != 1) { 
                ddlDistrict.Items.Clear();
                GetAllDistrictByState(stateID);

            }
            else { 
                ddlDistrict.Items.Clear();
                ddlDistrict.Items.Insert(0, new ListItem("--Select District--", "-1"));
                ddlDistrict.Items.Insert(1, new ListItem("----- All -----", "0"));
                ddlDistrict.SelectedIndex = 1;
                GetAllSchemebyDeptID(Convert.ToInt16(ddlDepartment.SelectedValue));
            }
        }
        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAllSchemebyDeptID(Convert.ToInt16(ddlDepartment.SelectedValue));
        }
        protected void ddlScheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAllKpiBySchemeCode(Convert.ToInt32(ddlScheme.SelectedValue));
        }
        #endregion

        #region(GridView Events)
        /// <summary>
        /// Grid View Row Command
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvLedgerDetail_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        protected void gvLedgerDetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Ceda Value - local value
                if ((Convert.ToDecimal(e.Row.Cells[4].Text) - Convert.ToDecimal(e.Row.Cells[3].Text)) == 0)
                {
                    e.Row.Cells[5].CssClass = "match";
                    e.Row.Cells[6].CssClass = "match";                    
                }
                else {
                    e.Row.Cells[5].CssClass = "mismatch";
                    e.Row.Cells[6].CssClass = "mismatch";
                }
                    
            }
        }
        #endregion

        private string validateDropdowns()
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("");
            if(ddlSector.SelectedValue =="-1")
            {
                stringBuilder.Append("Select Sector is required!");
            }
            else if(ddlDepartment.SelectedValue == "-1")
            {
                stringBuilder.Append("Select Department is required!");
            }
            else if (ddlState.SelectedValue == "-1")
            {
                stringBuilder.Append("Select State is required!");
            }
            else if (ddlDistrict.SelectedValue == "-1")
            {
                stringBuilder.Append("Select District is required!");
            }
            else if (ddlScheme.SelectedValue == "-1")
            {
                stringBuilder.Append("Select Scheme is required!");
            }
            else if (ddlKpi.SelectedValue == "-1")
            {
                stringBuilder.Append("Select KPI is required!");
            }
            return stringBuilder.ToString();
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            string alertmsg = validateDropdowns();
            if (alertmsg.Trim().Length > 0)
            {
                string sc = "alert('" + alertmsg + "');";
                ScriptManager.RegisterStartupScript(updatepnl, updatepnl.GetType(), "alertScript", sc, true);
                return ;
            }
            try
            {
                int stateid = Convert.ToInt32(ddlState.SelectedValue);
                int kpid = Convert.ToInt32(ddlKpi.SelectedValue);
                int schemeCode = Convert.ToInt32(ddlScheme.SelectedValue);

                DataTable dt1 = getDataFromLocal(stateid, schemeCode, kpid);
                //DataTable dt2 = GetCedaDatafromlocal();
                DataTable dt2 = GetCedaData(stateid, schemeCode, kpid);
                //dt1.Columns.Add("StateName");
                //dt1.Columns.Add("Statecode");
                //dt1.Columns.Add("SectorName");
                //dt1.Columns.Add("DepartmentName");
                dt1.Columns.Add("CedaValue");
                dt1.Columns.Add("Diffvalue");
                dt1.Columns.Add("Diffpercnt");

                if (dt1.Rows.Count > 0 && dt2.Rows.Count > 0)
                {
                    //string StateName = ddlState.SelectedItem.ToString();
                    //string StateCode = ddlState.SelectedValue.ToString();
                    //string SectorName = ddlSector.SelectedItem.ToString();
                    //string DepartmentName = ddlDepartment.SelectedItem.ToString();
                    decimal v1, v2;
                    decimal Avg;
                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        //dt1.Rows[i]["StateName"] = StateName;
                        //dt1.Rows[i]["StateCode"] = StateCode;
                        //dt1.Rows[i]["SectorName"] = SectorName;
                        //dt1.Rows[i]["DepartmentName"] = DepartmentName;
                        dt1.Rows[i]["CedaValue"] = dt2.Rows[i]["national_value"];

                        v1 = Convert.ToDecimal(dt1.Rows[i]["national_value"]);
                        v2 = Convert.ToDecimal(dt2.Rows[i]["national_value"]);
                        Avg = (v1 + v2) / 2;
                        dt1.Rows[i]["Diffvalue"] = Convert.ToString(v2 - v1);
                        dt1.Rows[i]["Diffpercnt"] = Convert.ToString(Math.Round((Math.Abs(v2 - v1) / Avg) * 100, 2)) + "%";

                    }

                    gvLedgerDetail.DataSource = dt1;
                    gvLedgerDetail.DataBind();
                }


            }
            catch
            {

            }

        }
        private DataTable getDataFromLocal(int stateCode,int SchemeCode, int KpiID)
        {           
            try
            {
                DataTable dt;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("[spGetSchemeKPIData]", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@stateid", stateCode);
                        command.Parameters.AddWithValue("@scheme_code", SchemeCode);
                        command.Parameters.AddWithValue("@kpiid", KpiID);
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            dt = new DataTable();
                            adapter.Fill(dt);                            
                        }
                    }
                }
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private DataTable GetCedaDatafromlocal()
        {
            try
            {
                DataTable ds;                
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("SELECT * FROM Ceda_Data", con))
                    {
                        //command.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            ds = new DataTable();
                            adapter.Fill(ds);
                        }
                    }
                }
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private DataTable GetCedaData(int stateCode, int SchemeCode, int KpiID)
        {
            try
            {
                int stateid = Convert.ToInt32(ddlState.SelectedValue);
                int kpid = Convert.ToInt32(ddlKpi.SelectedValue);
                int schemeCode = Convert.ToInt32(ddlScheme.SelectedValue);

                DataTable ds;
                string paramdeclare = @"declare @stateid int=" + stateid + " ,@schemecode int=" + schemeCode + " ,@kpiid int=" + kpid + "";                
                StringBuilder sb = new StringBuilder();
                sb.AppendLine(paramdeclare);
                string file = @"E:\TreeView\TreeView\ceda.txt";
                if (File.Exists(file))
                {
                    string[] filedata = File.ReadAllLines(file);
                    foreach (string ln in filedata)
                    sb.AppendLine(ln);
                }
                string finalQuery = sb.ToString();
                using (SqlConnection con = new SqlConnection(connectionStringCEDA))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand(finalQuery, con))
                    {
                        //command.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            ds = new DataTable();
                            adapter.Fill(ds);
                        }
                    }
                }
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}