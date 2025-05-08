using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TreeViewProject
{
    public partial class FrmReport1 : System.Web.UI.Page
    {
        readonly string _reportUrl = ConfigurationManager.AppSettings["ReportsURL"].ToString();
        readonly string _reportServerCredentials = ConfigurationManager.AppSettings["ReportServerCredentails"].ToString();
        readonly string _folderUrl = ConfigurationManager.AppSettings["FolderPath"].ToString();
        readonly string _DataSource = ConfigurationManager.AppSettings["reportconnectionstring"].ToString();
        private string connectionString = ConfigurationManager.AppSettings["MyConnectionString"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReport();
                RepViewer.ServerReport.Refresh();
            }
        }

        protected void RepViewer_PageNavigation(object sender, PageNavigationEventArgs e)
        {
            Session["frmRepCollectionReportBR"] = e.NewPage;
        }
        protected void BindReport()
        {
            try
            {
                string[] ds = _DataSource.Split('=');
                string DataSource = ds[ds.Length - 2].ToString();
                string DataBase = ds[ds.Length - 1].ToString();
                DataBase = DataBase.Remove(DataBase.IndexOf(';'));
                DataSource = DataSource.Remove(DataSource.IndexOf(';'));
                string[] repCre = _reportServerCredentials.Split(Convert.ToChar(","));
                IReportServerCredentials rvc = new Utility.CustomReportCredentials(repCre[0], repCre[1], repCre[2]);
                RepViewer.ServerReport.ReportServerCredentials = rvc;
                RepViewer.ProcessingMode = ProcessingMode.Remote;
                RepViewer.ServerReport.ReportServerUrl = new Uri(_reportUrl);
                RepViewer.ServerReport.ReportPath = "/" + _folderUrl + "/SectorStatus";
                RepViewer.DataBind();
                RepViewer.ServerReport.Refresh();
            }
            catch (Exception ex)
            {
                string sc = "alert('" + ex.Message.Replace("'", "") + "');";
                ScriptManager.RegisterStartupScript(updatepnlrpt1, updatepnlrpt1.GetType(), "alertScript", sc, true);
                return;
            }
        }
    }
}