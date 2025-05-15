using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SQLite;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TreeViewProject
{
    public partial class Summary : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.AppSettings["MyConnectionString"];
        //static string appDataPath = "~/App_Data/datasanity.db";
        private string connectionStringSqlite = ConfigurationManager.AppSettings["SQLiteDbConnection"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDataForGrid();

            }
        }

        protected void gvLedgerDetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            KPIDate = "24 Apr 2025";
            //Header Row Code
            if (e.Row.RowType == DataControlRowType.Header)
            {
                if (KPIDate.Length > 0)
                {
                    e.Row.Cells[5].Text = "Darpan Data (A)" + "<br/>" + "As On " + KPIDate;
                    e.Row.Cells[6].Text = "Paryas Data / View (B)" + "<br/>" + "As On " + KPIDate;
                }
                else
                {
                    e.Row.Cells[5].Text = "Darpan Data (A)";
                    e.Row.Cells[6].Text = "Paryas Data / View (B)";
                }
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Ceda Value - local value
                if ((Convert.ToDecimal(e.Row.Cells[6].Text) - Convert.ToDecimal(e.Row.Cells[5].Text)) == 0)
                {
                    e.Row.Cells[7].CssClass = "match";
                    e.Row.Cells[8].CssClass = "match";
                }
                else
                {
                    e.Row.Cells[7].CssClass = "mismatch";
                    e.Row.Cells[8].CssClass = "mismatch";
                }
            }


            /* ROWSPAN CODE    
            for (int i = gvLedgerDetail.Rows.Count - 1; i > 0; i--)
            {
                GridViewRow row = gvLedgerDetail.Rows[i];
                GridViewRow previousRow = gvLedgerDetail.Rows[i - 1];
                for (int j = 0; j < row.Cells.Count; j++)
                {
                    if (row.Cells[j].Text == previousRow.Cells[j].Text)
                    {
                        if (previousRow.Cells[j].RowSpan == 0)
                        {
                            if (row.Cells[j].RowSpan == 0)
                            {
                                previousRow.Cells[j].RowSpan += 2;
                            }
                            else
                            {
                                previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
                            }
                            row.Cells[j].Visible = false;
                        }
                    }
                }
            }
            */

        }

        protected void gvLedgerDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLedgerDetail.PageIndex = e.NewPageIndex;
            gvLedgerDetail.DataSource = (DataTable)ViewState["data"];
            gvLedgerDetail.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        protected void BindDataForGrid()
        {
            //DataTable dt1= getSummaryFromLocal();
            DataTable dt1 = getSummaryFromSqlite();
            if (dt1.Rows.Count > 0 )
            {                
                dt1.Columns.Add("Diffvalue");
                dt1.Columns.Add("Diffpercnt");
                decimal v1, v2, Avg;

                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    //dt1.Rows[i]["DepartmentName"] = DepartmentName;                    
                    v1 = Convert.ToDecimal(dt1.Rows[i]["outvalue"]);
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
                ViewState["data"] = dt1;
                gvLedgerDetail.DataSource = dt1;
                gvLedgerDetail.DataBind();                
            }
            else
            {
                ViewState["data"] = null;
                gvLedgerDetail.DataSource = null;
                gvLedgerDetail.DataBind();
                return;
            }


        }

        private DataTable getSummaryFromSqlite()
        {
            DataTable dt ;
            try
            {
                dt = new DataTable();
                using (SQLiteConnection sqlitecon = new SQLiteConnection(connectionStringSqlite))
                {
                    sqlitecon.Open();
                    string query = "Select * FROM View_Summary";                           
                    using (var adapter = new SQLiteDataAdapter(query, sqlitecon))
                    {
                        adapter.Fill(dt); // This fills the DataTable with the query result
                    }                    
                }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        private DataTable getSummaryFromLocal()
        {
            try
            {
                DataTable dt;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("[spGetSummaryData]", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;                      
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

        protected string KPIDate
        {
            set
            {
                if (value != null)
                {
                    ViewState["KPIDate"] = value;
                }
            }
            get
            {
                if (Convert.ToString(ViewState["KPIDate"]) != "")
                {
                    return Convert.ToString(ViewState["KPIDate"]);
                }
                else
                {
                    return "";
                }
            }
        }

    }
}