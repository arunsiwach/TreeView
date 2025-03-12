using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Runtime.CompilerServices;

namespace TreeViewProject
{
    public partial class PrayasKPI : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.AppSettings["MyConnectionString"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindSector();
               
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
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

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
            GetAllDistrictByState(stateID);
           
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAllSchemebyDeptID(Convert.ToInt16(ddlDepartment.SelectedValue));
        }

        protected void ddlScheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAllKpiBySchemeCode(Convert.ToInt16(ddlScheme.SelectedValue));
        }
    }
}