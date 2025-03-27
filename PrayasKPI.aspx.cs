using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Newtonsoft.Json;
using System.Text;
using System.IO;
using System.Net.Http;
using RestSharp;
using System.Threading.Tasks;
using System.Web.Management;
using static TreeView.TreeviewPage2;

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
                            ddlSector.Items.Insert(1, new ListItem("----- All -----", "0"));
                            
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
                            ddlDepartment.Items.Insert(1, new ListItem("----- All -----", "0"));
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
                if (ddlState.Items.Count == 0)
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
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        
        /*  (    Distirct Drp Down Code  )
       
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
        */
        private void GetAllSchemebyDeptID(int deptID)
        {
            try
            {
                string Deptids = string.Empty;
                if (deptID == 0){
                    Deptids = string.Empty;
                    foreach (ListItem items in ddlDepartment.Items)
                    {
                        if(items.Value != "0" && items.Value != "-1")
                        Deptids += items.Value + ",";
                    }
                }
                else { Deptids = Convert.ToString(deptID);  }

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        using (SqlCommand command = new SqlCommand("[spGetAllscheme]", con))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@dept_id", Deptids);
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
            if (ddlState.Items.Count == 0) { BindState(); }
            if (ddlScheme.Items.Count >0) { ddlScheme.Items.Clear();}
            if (ddlKpi.Items.Count > 0) { ddlKpi.Items.Clear(); }
        }

        /* ( drp down Select Index changed    )
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {            
            Int16 stateID = Convert.ToInt16(ddlState.SelectedValue);
            GetAllSchemebyDeptID(Convert.ToInt16(ddlDepartment.SelectedValue));
            if (ddlState.SelectedIndex != 1) {
                //ddlDistrict.Items.Clear();
                //GetAllDistrictByState(stateID);
               
            }
            else { 
                //ddlDistrict.Items.Clear();
                //ddlDistrict.Items.Insert(0, new ListItem("--Select District--", "-1"));
                //ddlDistrict.Items.Insert(1, new ListItem("----- All -----", "0"));
                //ddlDistrict.SelectedIndex = 1;
               
            }
        }
        */
        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAllSchemebyDeptID(Convert.ToInt16(ddlDepartment.SelectedValue));
        }
        protected void ddlScheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAllKpiBySchemeCode(Convert.ToInt32(ddlScheme.SelectedValue));
        }
        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlState.Items.Count==0){ BindState(); }            
            GetAllSchemebyDeptID(Convert.ToInt16(ddlDepartment.SelectedValue));
            if (ddlKpi.Items.Count > 0) { ddlKpi.Items.Clear(); }           
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
                if ((Convert.ToDecimal(e.Row.Cells[5].Text) - Convert.ToDecimal(e.Row.Cells[4].Text)) == 0)
                {
                    e.Row.Cells[6].CssClass = "match";
                    e.Row.Cells[7].CssClass = "match";                    
                }
                else {
                    e.Row.Cells[6].CssClass = "mismatch";
                    e.Row.Cells[7].CssClass = "mismatch";
                }                    
            }

            //for (int i = gvLedgerDetail.Rows.Count - 1; i > 0; i--)
            //{
            //    GridViewRow row = gvLedgerDetail.Rows[i];
            //    GridViewRow previousRow = gvLedgerDetail.Rows[i - 1];
            //    for (int j = 0; j < row.Cells.Count; j++)
            //    {
            //        if (row.Cells[j].Text == previousRow.Cells[j].Text)
            //        {
            //            if (previousRow.Cells[j].RowSpan == 0)
            //            {
            //                if (row.Cells[j].RowSpan == 0)
            //                {
            //                    previousRow.Cells[j].RowSpan += 2;
            //                }
            //                else
            //                {
            //                    previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
            //                }
            //                row.Cells[j].Visible = false;
            //            }
            //        }
            //    }
            //}

        }
        #endregion

        private string validateDropdowns()
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("");
            if (ddlSector.SelectedValue == "-1")
            {
                stringBuilder.Append("Select Sector is required!");
            }
            else if (ddlDepartment.SelectedValue == "-1")
            {
                stringBuilder.Append("Select Department is required!");
            }
            else if (ddlState.SelectedValue == "-1")
            {
                stringBuilder.Append("Select State is required!");
            }
            //else if (ddlDistrict.SelectedValue == "-1")
            //{
            //    stringBuilder.Append("Select District is required!");
            //}
            else if (ddlScheme.SelectedValue == "-1")
            {
                stringBuilder.Append("Select Scheme is required!");
            }
            else if (ddlKpi.SelectedValue == "-1")
            {
                stringBuilder.Append("Select KPI is required!");
            }
            else if (string.IsNullOrEmpty(txtdate.Text.Trim()))
            {
                stringBuilder.Append("Select Date is required!");
            }
                return stringBuilder.ToString();
        }

        private void ClearGridView()
        {
            DataTable dtclear = null;
            gvLedgerDetail.DataSource = dtclear;
            gvLedgerDetail.DataBind();
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            //Validation part
            string alertmsg = validateDropdowns();
            if (alertmsg.Trim().Length > 0)
            {
                string sc = "alert('" + alertmsg + "');";
                ScriptManager.RegisterStartupScript(updatepnl, updatepnl.GetType(), "alertScript", sc, true);
                return;
            }

            try
            {
                /*       (API Code)
                //Task.Run(async () =>
                //{
                //    string schemestring1 = await GetJSONStringFromAPI("", 123);
                //}).GetAwaiter().GetResult();
                //return;
                string schemestring = GetJSONString();
                if (!string.IsNullOrEmpty(schemestring))
                {
                    //Deserializing JSON
                    Scheme myschemeclass = JsonConvert.DeserializeObject<Scheme>(schemestring);
                    // Convert List to DataTable
                    DataTable dt = ConvertToDataTable(myschemeclass.Data);
                    DataTable dtfiterdata = FilterRows(Convert.ToInt32(ddlState.SelectedValue), ddlKpi.SelectedItem.Text, ddlScheme.SelectedItem.Text, dt);

                    //getdata from CEDA server using Query
                    //DataTable dtfiterdata = GetCedaData(stateid, schemeCode, kpid);      

                    int stateid = Convert.ToInt32(ddlState.SelectedValue);
                    int kpid = Convert.ToInt32(ddlKpi.SelectedValue);
                    int schemeCode = Convert.ToInt32(ddlScheme.SelectedValue);
                    DataTable dt1 = getDataFromLocal(stateid, schemeCode, kpid);
                    //return;

                    //Code to update CedaValue of matching rows 
                    dt1.Columns.Add("CedaValue");
                    // Perform LINQ Join and Update
                    var query = from row1 in dt1.AsEnumerable()
                                join row2 in dtfiterdata.AsEnumerable()
                                on new
                                {
                                    KpiName = row1.Field<string>("KPI_Name_E"),
                                    StateCode = row1.Field<int>("state_Code"),
                                    SchemeName = row1.Field<string>("Project_Name_E")
                                }
                                equals new
                                {
                                    KpiName = row2.Field<string>("KpiName"),
                                    StateCode = row2.Field<int>("StateCode"),
                                    SchemeName = row2.Field<string>("SchemeName")
                                }
                                select new { Row1 = row1, NewScore = row2.Field<decimal>("national_value") };

                                // Update dt1 using the joined result
                                foreach (var item in query)
                                {
                                    item.Row1["CedaValue"] = item.NewScore; // Update the "Score" column
                                }
                    //Code ends to update matching rows


                    if (dt1.Rows.Count > 0 && dtfiterdata.Rows.Count > 0)
                    {
                        //dt1.Columns.Add("CedaValue");
                        dt1.Columns.Add("Diffvalue");
                        dt1.Columns.Add("Diffpercnt");
                        decimal v1, v2, Avg;

                        for (int i = 0; i < dt1.Rows.Count; i++)
                        {
                            //dt1.Rows[i]["DepartmentName"] = DepartmentName;
                            //dt1.Rows[i]["CedaValue"] = dtfiterdata.Rows[i]["national_value"];

                            v1 = Convert.ToDecimal(dt1.Rows[i]["outvalue"]);
                            //v2 = Convert.ToDecimal(dtfiterdata.Rows[i]["national_value"]);
                            v2 = Convert.ToDecimal(dt1.Rows[i]["CedaValue"]);
                            if ((v1 + v2) != 0)
                            {
                                Avg = (v1 + v2) / 2;
                                dt1.Rows[i]["Diffvalue"] = Convert.ToString(v2 - v1);
                                dt1.Rows[i]["Diffpercnt"] = Convert.ToString(Math.Round((Math.Abs(v2 - v1) / Avg) * 100, 2)) + " %";
                            }
                            else
                            {
                                dt1.Rows[i]["Diffvalue"] = "0.00000";
                                dt1.Rows[i]["Diffpercnt"] = Convert.ToString("0 %");
                            }

                        }

                        gvLedgerDetail.DataSource = dt1;
                        gvLedgerDetail.DataBind();
                    }
                }
                */
               
                int stateid = Convert.ToInt32(ddlState.SelectedValue);
                int kpid = Convert.ToInt32(ddlKpi.SelectedValue);
                int schemeCode = Convert.ToInt32(ddlScheme.SelectedValue);
                string datevalue = string.Format("yyyy-MM-dd", txtdate.Text.Trim()); 
                DataTable dt1 = getDataFromLocal(stateid, schemeCode, kpid,datevalue);
                //getdata from CEDA server using Query
                return;
                DataTable dtfiterdata = GetCedaData(stateid, schemeCode, kpid);

                if (dt1.Rows.Count > 0 && dtfiterdata.Rows.Count > 0)
                {
                    dt1.Columns.Add("CedaValue");
                    dt1.Columns.Add("Diffvalue");
                    dt1.Columns.Add("Diffpercnt");
                    decimal v1, v2, Avg;

                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        //dt1.Rows[i]["DepartmentName"] = DepartmentName;
                        dt1.Rows[i]["CedaValue"] = dtfiterdata.Rows[i]["national_value"];
                        v1 = Convert.ToDecimal(dt1.Rows[i]["outvalue"]);
                        v2 = Convert.ToDecimal(dtfiterdata.Rows[i]["national_value"]);
                        
                        if ((v1 + v2) != 0)
                        {
                            Avg = (v1 + v2) / 2;
                            dt1.Rows[i]["Diffvalue"] = Convert.ToString(v2 - v1);
                            dt1.Rows[i]["Diffpercnt"] = Convert.ToString(Math.Round((Math.Abs(v2 - v1) / Avg) * 100, 2)) + " %";
                        }
                        else
                        {
                            dt1.Rows[i]["Diffvalue"] = "0.00000";
                            dt1.Rows[i]["Diffpercnt"] = Convert.ToString("0 %");
                        }

                    }

                    gvLedgerDetail.DataSource = dt1;
                    gvLedgerDetail.DataBind();
                }

                //return;


            }


            catch (Exception ex)
            {
                string sc = "alert('" + ex.Message + "');";
                ScriptManager.RegisterStartupScript(updatepnl, updatepnl.GetType(), "alertScript", sc, true);
                return;
            }          
        }

        private async Task<DataTable> GetDateFromAPIAsync (int schemeCode)
        {
            try
            {
                DataTable dt = null;
                var options = new RestClientOptions("http://164.100.166.65")
                {                   
                };
                var client = new RestClient(options);
                var request = new RestRequest("/DataSanity_API/api/prayasdatasanitytool", Method.Get);
                request.AddHeader("Content-Type", "application/json");
                var body = @"{
                    " + "\n" +
                        @"""ProjectCode"":100359
                    " + "\n" +
                           @"}";
                request.AddParameter("application/json", body, ParameterType.RequestBody);                
                RestResponse response = await client.ExecuteAsync(request);

                if (response != null)
                {
                    dt = (DataTable)JsonConvert.DeserializeObject(response.Content, (typeof(DataTable)));
                }
                return dt;
            }
            catch
            {
                throw;
            }
        }

        private DataTable getDataFromLocal(int stateCode,int SchemeCode, int KpiID,string datevalue)
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
                        command.Parameters.AddWithValue("@datevalue", datevalue);
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
                //int stateid = Convert.ToInt32(ddlState.SelectedValue);
                //int kpid = Convert.ToInt32(ddlKpi.SelectedValue);
                //int schemeCode = Convert.ToInt32(ddlScheme.SelectedValue);

                DataTable ds;
                string paramdeclare = @"declare @stateid int=" + stateCode + " ,@schemecode int=" + SchemeCode + " ,@kpiid int=" + KpiID + "";                
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

        #region(API Methods)

        // Method to call the API
        public static async Task<string> GetJSONStringFromAPI(string url, int jsonBody)
        {
            try
            {
                string responseBody = "";
                var client = new HttpClient();
                var request = new HttpRequestMessage(HttpMethod.Get, "http://164.100.166.65/DataSanity_API/api/prayasdatasanitytool");
                var content = new StringContent("{ \"ProjectCode\": 100359 }", null, "application/json");
                request.Content = content;
                var response = await client.SendAsync(request);
                response.EnsureSuccessStatusCode();
                return  responseBody = await response.Content.ReadAsStringAsync();

               
            }
            catch(Exception )
            {
                throw;
            }      
        }
        private string GetJSONString()
        {
            //var filePath = Path.Combine(Directory.GetCurrentDirectory(), @"Data", "ceda.json");
            var filePath = @"C:\Users\Hp\source\repos\TreeView\Data\ceda.json";
            //var filePath = @"E:\TreeView\TreeView\Data\ceda.json";
            var fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            var sr = new StreamReader(fs, System.Text.Encoding.UTF8);
            string content_data = sr.ReadToEnd();
            return content_data;
        }        
        private  DataTable ConvertToDataTable(List<SchemeAttributes> data)
        {
            try
            {
                // Create DataTable
                DataTable table = new DataTable();

                // Define Columns
                table.Columns.Add("KpiName", typeof(string));
                table.Columns.Add("SchemeName", typeof(string));
                table.Columns.Add("NationalValue", typeof(string));  // object to handle nulls
                table.Columns.Add("StateCode", typeof(Int32));
                table.Columns.Add("StateName", typeof(string));
                table.Columns.Add("StateValue", typeof(string));
                table.Columns.Add("DistrictCode", typeof(Int32));
                table.Columns.Add("DistrictName", typeof(string));
                table.Columns.Add("DistrictValue", typeof(string));
                table.Columns.Add("Date", typeof(string));

                // Populate Rows
                foreach (var item in data)
                {
                    table.Rows.Add(
                        item.KpiName,
                        item.SchemeName,
                        item.NationalValue,
                        item.StateCode,
                        item.StateName,
                        item.StateValue,
                        item.DistrictCode,
                        item.DistrictName,
                        item.DistrictValue,
                        item.Date
                    );
                }

                return table;
            }
            catch {
                throw;
            }
            
        }


        private DataTable FilterRows(int stateCode, string kpiname, string schemename ,DataTable dt)
        {
            try
            {

                // LINQ Query to filter rows
                var filteredRows = from row in dt.AsEnumerable()
                                   where (stateCode == 0 || row.Field<Int32>("StateCode") == stateCode)
                                   && row.Field<string>("SchemeName") == schemename
                                   && (kpiname == "----- All -----" || row.Field<string>("KpiName") == kpiname)
                                   //orderby row.Field<Int32>("StateCode"), row.Field<string>("KpiName")                                   
                                   group row by new
                                   {
                                       KpiName = row.Field<string>("KpiName"),
                                       SchemeName = row.Field<string>("SchemeName"),
                                       StateCode = row.Field<Int32>("StateCode"),
                                       StateName = row.Field<string>("StateName"),
                                       //DistrictCode = row.Field<Int32>("DistrictCode"),
                                       //DistrictName = row.Field<string>("DistrictName"),
                                       Date = row.Field<string>("Date")
                                   }
                                    into grp
                                   // Order by StateCode, SchemeName, and DistrictName
                                   orderby grp.Key.StateCode, grp.Key.SchemeName,grp.Key.KpiName
                                   select new
                                   {
                                       grp.Key.KpiName,
                                       grp.Key.SchemeName,
                                       grp.Key.StateCode,
                                       grp.Key.StateName,
                                       //grp.Key.DistrictCode,
                                       //grp.Key.DistrictName,
                                       grp.Key.Date,
                                       TotalDistrictValue = grp.Sum(
                                           x =>
                                           {
                                               string districtValue = x.Field<string>("DistrictValue");
                                               return string.IsNullOrWhiteSpace(districtValue)
                                                   ? 0.00M
                                                   : Convert.ToDecimal(districtValue);
                                           }
                                           //Convert.ToDecimal(x["DistrictValue"])
                                           )
                                   };
                
                // Convert the grouped results back to a DataTable
                DataTable groupedTable = new DataTable();                
                groupedTable.Columns.Add("KpiName", typeof(string));
                groupedTable.Columns.Add("SchemeName", typeof(string));
                groupedTable.Columns.Add("StateCode", typeof(Int32));
                groupedTable.Columns.Add("StateName", typeof(string));
                //groupedTable.Columns.Add("DistrictCode", typeof(Int32));
                //groupedTable.Columns.Add("DistrictName", typeof(string));
                groupedTable.Columns.Add("Date", typeof(string));
                groupedTable.Columns.Add("national_value", typeof(decimal));

                // Populate the grouped DataTable
                foreach (var row in filteredRows)
                {
                    groupedTable.Rows.Add(
                        row.KpiName,
                        row.SchemeName,
                        row.StateCode,
                        row.StateName,
                        //row.DistrictCode,
                        //row.DistrictName,
                        row.Date,
                        row.TotalDistrictValue
                    );
                }

                return groupedTable;
            }
            catch
            {
                throw;
            }

        }

        #endregion

        #region( json classes )
        /// <summary>
        /// 
        /// </summary>
        public class SchemeAttributes
        {
            public string KpiName { get; set; }
            public string SchemeName { get; set; }
            public object NationalValue { get; set; }
            public string StateCode { get; set; }
            public string StateName { get; set; }
            public object StateValue { get; set; }
            public string DistrictCode { get; set; }
            public string DistrictName { get; set; }
            public string DistrictValue 
            {
                get;
                set;
                //get
                //{
                //    return DistrictValue;                    
                //}
                //set 
                //{

                //    if (string.IsNullOrEmpty(DistrictValue))
                //    {
                //       DistrictValue = "0.00";
                //    }
                //    else
                //    {
                //        DistrictValue = value;
                //    }                    
                //}
            }
            public string Date { get; set; }
        }

        public class Scheme
        { 
            public string Status { get; set; }
            public List<SchemeAttributes> Data { get; set; }
        }
        #endregion

       
    }
}