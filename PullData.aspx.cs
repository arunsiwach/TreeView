using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SQLite;
using System.Web.DynamicData;
using System.Xml.Linq;

namespace TreeViewProject
{
    public partial class PullData : System.Web.UI.Page
    {
        private string connectionStringCEDA = ConfigurationManager.AppSettings["MyConnectionStringCEDA"];
        private string connectionStringLocal = ConfigurationManager.AppSettings["MyConnectionString"];
        private string connectionStringSqlite = ConfigurationManager.AppSettings["SQLiteDbConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            FillData();
        }

        private void FillData()
        {
            int stateid = 0;int kpid = 0;int schemeCode = 0;
            string datevalue = txtdate.Text.Trim().Length > 0 ? txtdate.Text.Trim() : "";
            //DataTable dt = GetCedaConsolidatedData(stateid, kpid, schemeCode, datevalue);
            DataTable dt = GetCedaConsolidatedDataLocal(stateid, kpid, schemeCode, datevalue);
            FilldataintoSqliteTable(dt, connectionStringSqlite, "Tbl_Display_Consolidate_View");
            //UpdateLocalScheme(connectionStringSqlite);
        }

        private DataTable GetCedaConsolidatedDataLocal(int stateCode, int SchemeCode, int KpiID, string datevalue)
        {
            try
            {
                DataTable ds;
                string finalQuery = @"Select Top 2 Scheme_Code,Scheme_Name,KPIID,KPI_Name,DataDate,
                                      Viewkpi_value,Local_Scheme_Code,Localkpi_Value from Tbl_Display_Consolidate_View";
                using (SqlConnection con = new SqlConnection(connectionStringLocal))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand(finalQuery, con))
                    {
                        //command.CommandType = CommandType.StoredProcedure;
                        command.CommandTimeout = 900;
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

        private DataTable GetCedaConsolidatedData(int stateCode, int SchemeCode, int KpiID, string datevalue)
        {            
            try
            {                   
                DataTable ds;
                string paramdeclare = @"declare @stateid int=" + stateCode + " ,@schemecode int=" + SchemeCode + " ,@kpiid int=" + KpiID + " ,@datevalue varchar(30)='" + datevalue + "'";

                StringBuilder sb = new StringBuilder();
                sb.AppendLine(paramdeclare);
                string file = @"E:\TreeView\TreeView\Ceda4.txt";
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
                        command.CommandTimeout = 900;
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
        private void FilldataintoSqliteTable(DataTable dtdata, string connectionstring, string tableName)
        {
            try
            {
                using (var connection = new SQLiteConnection(connectionstring))
                {
                    connection.Open();

                    using (var transaction = connection.BeginTransaction())
                    {
                        foreach (DataRow row in dtdata.Rows)
                        {
                            var columnNames = string.Join(", ", dtdata.Columns.Cast<DataColumn>().Select(c => c.ColumnName));
                            var paramNames = string.Join(", ", dtdata.Columns.Cast<DataColumn>().Select(c => "@" + c.ColumnName));

                            string insertQuery = $"INSERT INTO {tableName} ({columnNames}) VALUES ({paramNames})";

                            using (var command = new SQLiteCommand(insertQuery, connection))
                            {
                                foreach (DataColumn column in dtdata.Columns)
                                {

                                    var value = row[column];

                                    // Convert blank strings to DBNull
                                    if (value is string strValue && string.IsNullOrWhiteSpace(strValue))
                                    {
                                        value = DBNull.Value;
                                    }
                                    else if (value == null || value == DBNull.Value)
                                    {
                                        value = DBNull.Value;
                                    }

                                    command.Parameters.AddWithValue("@" + column.ColumnName, row[column] ?? DBNull.Value);
                                }

                                command.ExecuteNonQuery();
                            }
                        }

                        transaction.Commit();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void UpdateLocalScheme(string connectionstring)
        {
            try
            {
                using (var connection = new SQLiteConnection(connectionstring))
            {
                connection.Open();

                using (var transaction = connection.BeginTransaction())
                {                  
                        string insertQuery = $"UPDATE Tbl_Display_Consolidate_View set Local_Scheme_Code=vm.Local_SchemeCode\r\nFROM Tbl_Display_Consolidate_View cv \r\ninner join Tbl_Scheme_ViewName_Mapping vm ON cv.Scheme_Code = vm.PmoDB_SchemeCode\r\nwhere vm.PmoDB_SchemeCode is not NULL";

                        using (var command = new SQLiteCommand(insertQuery, connection))
                        {                      
                            command.ExecuteNonQuery();
                        }                    
                     
                    transaction.Commit();
                }
            }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}