using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Data.SqlClient;
using System.Data.SQLite;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;

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
                //DataTable dt1= getSummaryFromLocal();
                DataTable dt1 = getSummaryFromSqlite();
                Keywrd = "0";
                BindDataForGrid(dt1,true);
                DisplayToolTip(dt1);
                lnkbtnAll.Visible = false;
            }
        }

        protected void gvLedgerDetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            /*
            KPIDate = DateTime.Now.ToString("dddd, dd MMMM yyyy"); //"24 Apr 2025";
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
            */

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Ceda Value - local value
                if ((Convert.ToDecimal(e.Row.Cells[8].Text) - Convert.ToDecimal(e.Row.Cells[6].Text)) == 0)
                {
                    e.Row.Cells[9].CssClass = "match";
                    e.Row.Cells[10].CssClass = "match";
                }
                else
                {
                    e.Row.Cells[9].CssClass = "mismatch";
                    e.Row.Cells[10].CssClass = "mismatch";
                }

                string dateValue1 = e.Row.Cells[5].Text.Trim(); // Replace with correct index
                string dateValue2 = e.Row.Cells[7].Text.Trim(); // Replace with correct index

                if (dateValue1 != dateValue2)
                {                    
                    e.Row.Cells[5].Style["color"] = "#f18445";
                    e.Row.Cells[7].Style["color"] = "#f18445";
                    e.Row.Cells[5].Style["font-weight"] = "bold";
                    e.Row.Cells[7].Style["font-weight"] = "bold";
                }           
            }            
        }

        protected void gvLedgerDetail_PreRender_OLD(object sender, EventArgs e)
        {
            // Merge Column 0 (primary column), and conditionally Columns 1 & 2
            int primaryCol = 1; // Department
            int[] dependentCols = {0, 5, 7 }; // Team, Role

            for (int rowIndex = gvLedgerDetail.Rows.Count - 2; rowIndex >= 0; rowIndex--)
            {
                GridViewRow currentRow = gvLedgerDetail.Rows[rowIndex];
                GridViewRow nextRow = gvLedgerDetail.Rows[rowIndex + 1];

                // Compare primary column (e.g., Department)
                string currPrimary = currentRow.Cells[primaryCol].Text.Trim();
                string nextPrimary = nextRow.Cells[primaryCol].Text.Trim();

                if (currPrimary == nextPrimary)
                {
                    // Merge Primary
                    if (nextRow.Cells[primaryCol].RowSpan < 2)
                        currentRow.Cells[primaryCol].RowSpan = 2;
                    else
                        currentRow.Cells[primaryCol].RowSpan = nextRow.Cells[primaryCol].RowSpan + 1;

                    nextRow.Cells[primaryCol].Visible = false;

                    // Now merge dependent columns if they match
                    foreach (int col in dependentCols)
                    {
                        string currVal = currentRow.Cells[col].Text.Trim();
                        string nextVal = nextRow.Cells[col].Text.Trim();

                        if (currVal == nextVal)
                        {
                            if (nextRow.Cells[col].RowSpan < 2)
                                currentRow.Cells[col].RowSpan = 2;
                            else
                                currentRow.Cells[col].RowSpan = nextRow.Cells[col].RowSpan + 1;

                            nextRow.Cells[col].Visible = false;
                        }
                    }
                }
            }
        }

        protected void gvLedgerDetail_PreRender(object sender, EventArgs e)
        {
            int serialCol = 0;      // S.No. column
            int groupCol = 1;       // Grouping column (e.g., Department)
            int[] dependentCols = {5, 7 }; // Optional dependent columns (e.g., Team, Role)

            // ---------- First Pass: Assign serial numbers (forward loop) ----------
            int serialNo = 1;
            for (int i = 0; i < gvLedgerDetail.Rows.Count; i++)
            {
                GridViewRow currentRow = gvLedgerDetail.Rows[i];

                if (i == 0 || currentRow.Cells[groupCol].Text.Trim() != gvLedgerDetail.Rows[i - 1].Cells[groupCol].Text.Trim())
                {
                    currentRow.Cells[serialCol].Text = serialNo.ToString();
                    serialNo++;
                }
                else
                {
                    currentRow.Cells[serialCol].Text = ""; // will be hidden later
                }
            }

            // ---------- Second Pass: Merge cells (reverse loop) ----------
            for (int rowIndex = gvLedgerDetail.Rows.Count - 2; rowIndex >= 0; rowIndex--)
            {
                GridViewRow currentRow = gvLedgerDetail.Rows[rowIndex];
                GridViewRow nextRow = gvLedgerDetail.Rows[rowIndex + 1];

                string currGroupValue = currentRow.Cells[groupCol].Text.Trim();
                string nextGroupValue = nextRow.Cells[groupCol].Text.Trim();

                if (currGroupValue == nextGroupValue)
                {
                    // Merge group column
                    if (nextRow.Cells[groupCol].RowSpan < 2)
                        currentRow.Cells[groupCol].RowSpan = 2;
                    else
                        currentRow.Cells[groupCol].RowSpan = nextRow.Cells[groupCol].RowSpan + 1;

                    nextRow.Cells[groupCol].Visible = false;

                    // Merge serial number column along with group
                    if (nextRow.Cells[serialCol].RowSpan < 2)
                        currentRow.Cells[serialCol].RowSpan = 2;
                    else
                        currentRow.Cells[serialCol].RowSpan = nextRow.Cells[serialCol].RowSpan + 1;

                    nextRow.Cells[serialCol].Visible = false;

                    // Merge dependent columns if values match
                    foreach (int col in dependentCols)
                    {
                        string currVal = currentRow.Cells[col].Text.Trim();
                        string nextVal = nextRow.Cells[col].Text.Trim();

                        if (currVal == nextVal)
                        {
                            if (nextRow.Cells[col].RowSpan < 2)
                                currentRow.Cells[col].RowSpan = 2;
                            else
                                currentRow.Cells[col].RowSpan = nextRow.Cells[col].RowSpan + 1;

                            nextRow.Cells[col].Visible = false;
                        }
                    }
                }
            }
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
        protected void BindDataForGrid(DataTable dt1, bool isShowheader)
        {
            //DataTable dt1= getSummaryFromLocal();
            //DataTable dt1 = getSummaryFromSqlite();
            
            if (dt1.Rows.Count > 0 )
            {
                if (isShowheader)
                {
                    DisplayStatsonHeader(dt1);
                }
                dt1.Columns.Add("Diffvalue");
                dt1.Columns.Add("Diffpercnt");
                dt1.Columns.Add("PrayasDateP");                
                dt1.Columns.Add("CedaDateP");
                decimal v1, v2, Avg;

                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    if (!dt1.Rows[i].IsNull("PrayasDate"))
                    {
                        DateTime dt;
                        if (DateTime.TryParse(dt1.Rows[i]["PrayasDate"].ToString(), out dt))
                        {
                            dt1.Rows[i]["PrayasDateP"] = dt.ToString("dd-MMM-yyyy");
                        }                       
                    }

                    if (!dt1.Rows[i].IsNull("CedaDate"))
                    {
                        DateTime dt;
                        if (DateTime.TryParse(dt1.Rows[i]["CedaDate"].ToString(), out dt))
                        {
                            dt1.Rows[i]["CedaDateP"] = dt.ToString("dd-MMM-yyyy");
                        }
                    }


                    //dt1.Rows[i]["DepartmentName"] = DepartmentName;                    
                    v1 = Convert.ToDecimal(dt1.Rows[i]["outvalue"]);
                    v2 = Convert.ToDecimal(dt1.Rows[i]["CedaValue"]);

                    if ((v1 + v2) != 0)
                    {
                        Avg = (v1 + v2) / 2;
                        dt1.Rows[i]["Diffvalue"] = Convert.ToString(v1 - v2);
                        dt1.Rows[i]["Diffpercnt"] = Convert.ToString(Math.Round((Math.Abs(v1 - v2) / Avg) * 100, 2)) + " %";
                    }
                    else
                    {
                        dt1.Rows[i]["Diffvalue"] = "0.00";
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

        private void DisplayStatsonHeader(DataTable dt1)
        {
            StringBuilder sb = new StringBuilder();

            var rows = dt1.AsEnumerable();

            //int Schemecnt = 39;
            int TotalSchemecnt = rows.AsEnumerable()
                .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")                
                .Select(row => row.Field<string>("Project_Name_E"))
                .Distinct()
                .Count();

            int TotalKpicnt = rows.AsEnumerable()
                     .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");


            var rows1 = dt1.AsEnumerable()
                .Where(row =>
                    !row.IsNull("Project_Name_E") &&
                    !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                    !row.IsNull("outvalue") &&
                    !row.IsNull("CedaValue")
                )
                .GroupBy(row => row.Field<string>("Project_Name_E").Trim())
                .Where(group =>
                    group.All(row =>
                        Convert.ToDecimal(row["outvalue"]) == Convert.ToDecimal(row["CedaValue"])
                    )
                ).SelectMany(group => group);


            int SchemecntMatch = rows1.AsEnumerable()
            .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
            .Select(row => row.Field<string>("Project_Name_E"))
            .Distinct()
            .Count();

            int totalKPImatch = rows1.AsEnumerable()
                .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");
          

            var rows2 = dt1.AsEnumerable()
               .Where(row =>
                   !row.IsNull("Project_Name_E") &&
                   !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                   !row.IsNull("outvalue") &&
                   !row.IsNull("CedaValue")
               ).GroupBy(row => row.Field<string>("Project_Name_E").Trim())
               .Where(group =>
                   group.Any(row =>
                       Convert.ToDecimal(row["outvalue"]) != Convert.ToDecimal(row["CedaValue"])
                   )
               ).SelectMany(group => group);

            int SchemecntMistach = rows2.AsEnumerable()
           .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
           .Select(row => row.Field<string>("Project_Name_E"))
           .Distinct()
           .Count();

            int totalKPImismatch = rows2.AsEnumerable()
              .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");


            sb.AppendLine(Convert.ToString(TotalSchemecnt) + " Schemes having " + Convert.ToString(TotalKpicnt) + " kpis have been Compared.  ");
            sb.AppendLine(" A. " + Convert.ToString(SchemecntMatch) + " Schemes and "+ Convert.ToString(totalKPImatch) + " kpis are Matching");
            sb.AppendLine("B. " + Convert.ToString(SchemecntMistach) + " Schemes and " + Convert.ToString(totalKPImismatch) + " kpis are not Matching");
            
            //lblh2.Text = sb.ToString().Replace(Environment.NewLine, "<br />");

            lblh2.Text = sb.ToString();

            /*
            
            sb.Append("Statement : "+ Convert.ToString(Schemecnt)+ " Schemes having");
            sb.AppendLine(Convert.ToString(Kpicnt)+" KPIs have been compared, out of which " + Convert.ToString(SchemecntMistach)+ " Schemes and ");
            sb.AppendLine(Convert.ToString(totalmismatch) + " KPIs are not matching" );
            
            lbltotalScheme.Text = "Covered Schemes: " + Convert.ToString(Schemecnt);
            lbltotalkpi.Text = "Covered KPIs: " + Convert.ToString(Kpicnt);
            lblMatched.Text = "Total Matched: " + Convert.ToString(totalmatch);
            lblMisMatched.Text = "Total MisMatched: " + Convert.ToString(totalmismatch);
            < asp:Label CssClass = "label-bold-blue" ID = "lbltotalScheme" runat = "server" ></ asp:Label >
            < asp:Label CssClass = "label-bold-blue" ID = "lbltotalkpi" runat = "server" ></ asp:Label >
            < asp:Label CssClass = "label-bold-blue" ID = "lblMatched" runat = "server" ></ asp:Label >
            < asp:Label CssClass = "label-bold-blue" ID = "lblMisMatched" runat = "server" ></ asp:Label >

            */

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

        protected string Keywrd
        {
            set
            {
                if (value != null)
                {
                    ViewState["Keywrd"] = value;
                }
            }
            get
            {
                if (Convert.ToString(ViewState["Keywrd"]) != "")
                {
                    return Convert.ToString(ViewState["Keywrd"]);
                }
                else
                {
                    return "";
                }
            }
        }


        protected void imgEx_Click(object sender, ImageClickEventArgs e)
        {
            ExportGridToExcel();
        }

        protected void imgPdf_Click(object sender, ImageClickEventArgs e)
        {
            //ExportGridToPDF();
            ExportGridToPDFWithFormatting();
        }

        private string GetCellText(TableCell cell)
        {
            if (cell.Controls.Count == 0)
                return cell.Text.Trim().Replace("&nbsp;", " ");

            foreach (Control ctl in cell.Controls)
            {
                if (ctl is Label lbl)
                    return lbl.Text.Trim();
                if (ctl is Literal lit)
                    return lit.Text.Trim();
                if (ctl is TextBox txt)
                    return txt.Text.Trim();
                if (ctl is DropDownList ddl)
                    return ddl.SelectedItem?.Text ?? "";
                if (ctl is CheckBox cb)
                    return cb.Checked ? "Yes" : "No";
                // Add more control types as needed
            }

            return cell.Text.Trim().Replace("&nbsp;", " ");
        }

        public void ExportGridToPDFWithFormatting()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=DataComparisonSheetForCriticalKPIs.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 10f, 20f, 10f); // Landscape A4
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();

            // === Custom Header ===
            string headingp = string.Empty;
            // === Custom Header ===
            switch (Keywrd)
            {
                case "0":
                    headingp = "Data Comparison Sheet ( All Schemes )";
                    break;
                case "1":
                    headingp = "Data Comparison Sheet ( Matched )";
                    break;
                case "2":
                    headingp = "Data Comparison Sheet ( UnMatched )";
                    break;
                case "3":
                    headingp = "Data Comparison Sheet ( MisMatch Without Date Difference )";
                    break;
                case "4":
                    headingp = "Data Comparison Sheet ( MisMatch with Date Difference )";
                    break;
                default:
                    break;
            }
            Paragraph title = new Paragraph(headingp, FontFactory.GetFont("Arial", 14, Font.BOLD));
            title.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(title);

            Paragraph date = new Paragraph("Date: " + DateTime.Now.ToString("dd-MMM-yyyy"), FontFactory.GetFont("Arial", 10));
            date.Alignment = Element.ALIGN_RIGHT;
            date.SpacingAfter = 10f;
            pdfDoc.Add(date);

            // === Create Table from GridView ===
            PdfPTable pdfTable = new PdfPTable(gvLedgerDetail.Columns.Count);
            pdfTable.WidthPercentage = 100;

            // Optional: Set specific widths to avoid wrapping
            float[] widths = new float[gvLedgerDetail.Columns.Count];
            for (int i = 0; i < widths.Length; i++) widths[i] = 1f;
            pdfTable.SetWidths(widths);

            // === Add GridView Header ===
            foreach (DataControlField column in gvLedgerDetail.Columns)
            {
                PdfPCell cell = new PdfPCell(new Phrase(column.HeaderText, FontFactory.GetFont("Arial", 9, Font.BOLD)));
                cell.BackgroundColor = new BaseColor(230, 230, 230);
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                pdfTable.AddCell(cell);
            }

            foreach (GridViewRow row in gvLedgerDetail.Rows)
            {
                for (int i = 0; i < row.Cells.Count; i++)
                {
                    TableCell webCell = row.Cells[i];

                    // Skip if already covered by rowspan/colspan from a previous cell
                    if (webCell.Visible == false)
                        continue;

                    string cellText = GetCellText(webCell); // Get text from template or normal cell                  

                    BaseColor textColor = BaseColor.BLACK;                    
                    if (i == 5 )
                    {
                        TableCell seccell = row.Cells[i+2];
                        string secstring =  GetCellText(seccell);
                        if (cellText != secstring)                        
                        textColor = new BaseColor(255, 140, 0);//orange colour
                        else
                            textColor = BaseColor.BLACK;
                    }
                    if(i == 7 )
                    {
                        TableCell seccell = row.Cells[i -2];
                        string secstring = GetCellText(seccell);
                        if (cellText != secstring)
                            textColor = new BaseColor(255, 140, 0); //orange colour
                        else
                            textColor = BaseColor.BLACK;
                    }
                                        
                    // Create font with color
                    Font font = FontFactory.GetFont("Arial", 8, Font.BOLD, textColor);
                    // Create cell with colored text
                    PdfPCell pdfCell = new PdfPCell(new Phrase(cellText.Replace("&nbsp;", " "), font));
                    
                    pdfCell.HorizontalAlignment = Element.ALIGN_LEFT;
                    pdfCell.VerticalAlignment = Element.ALIGN_MIDDLE;



                    // Apply Colspan
                    if (webCell.ColumnSpan > 1)
                    {
                        pdfCell.Colspan = webCell.ColumnSpan;
                    }

                    // Apply Rowspan
                    if (webCell.RowSpan > 1)
                    {
                        pdfCell.Rowspan = webCell.RowSpan;
                    }

                    pdfTable.AddCell(pdfCell);
                }
            }


            //// === Add GridView Rows ===
            //foreach (GridViewRow row in gvLedgerDetail.Rows)
            //{
            //    for (int i = 0; i < row.Cells.Count; i++)
            //    {
            //        string text = row.Cells[i].Text.Trim().Replace("&nbsp;", " ");
            //        PdfPCell cell = new PdfPCell(new Phrase(text, FontFactory.GetFont("Arial", 8)));
            //        cell.HorizontalAlignment = Element.ALIGN_LEFT;
            //        cell.VerticalAlignment = Element.ALIGN_MIDDLE;
            //        pdfTable.AddCell(cell);
            //    }
            //}

            pdfDoc.Add(pdfTable);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        public void ExportGridToPDF()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=DataComparisonSheetForCriticalKPIs.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            using (StringWriter sw = new StringWriter())
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                // Disable paging before exporting
                gvLedgerDetail.AllowPaging = false;
                // Optionally rebind data here

                gvLedgerDetail.RenderControl(hw);

                using (StringReader sr = new StringReader(sw.ToString()))
                {



                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    string headingp = string.Empty;
                    // === Custom Header ===
                    switch(Keywrd)
                    {
                        case "0":
                            headingp = "Data Comparison Sheet ( All Schemes )";
                            break;
                        case "1":
                            headingp = "Data Comparison Sheet ( Matched )";
                            break;
                        case "2":
                            headingp = "Data Comparison Sheet ( UnMatched )";
                            break;
                        case "3":
                            headingp = "Data Comparison Sheet ( UnMatched )";
                            break;
                        case "4":                        
                            headingp = "Data Comparison Sheet ( UnMatched )";
                            break;
                        default:
                            break;
                    }
                        
                    Paragraph header = new Paragraph(headingp, new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD));
                    header.Alignment = Element.ALIGN_CENTER;
                    pdfDoc.Add(header);

                    // === Current Date ===
                    Paragraph date = new Paragraph("Date: " + DateTime.Now.ToString("dd-MMM-yyyy"), new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL));
                    date.Alignment = Element.ALIGN_RIGHT;
                    date.SpacingAfter = 20f;
                    pdfDoc.Add(date);

                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    htmlparser.Parse(sr);

                    pdfDoc.Close();
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=DataComparisonSheetForCriticalKPIs.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            using (StringWriter sw = new StringWriter())
            {

                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    // === Custom Header ===
                    string headingp = string.Empty;
                    // === Custom Header ===
                    switch (Keywrd)
                    {
                        case "0":
                            headingp = "Data Comparison Sheet ( All Schemes )";
                            break;
                        case "1":
                            headingp = "Data Comparison Sheet ( Matched )";
                            break;
                        case "2":
                            headingp = "Data Comparison Sheet ( UnMatched )";
                            break;
                        case "3":
                            headingp = "Data Comparison Sheet ( MisMatch Without Date Difference )";
                            break;
                        case "4":
                            headingp = "Data Comparison Sheet ( MisMatch with Date Difference )";
                            break;                     
                        default:
                            break;
                    }


                    hw.Write("<table><tr><td colspan='" + gvLedgerDetail.Columns.Count + "' style='font-size:18px; font-weight:bold; text-align:center;'>");
                    hw.Write(headingp);
                    hw.Write("</td></tr>");

                    // === Current Date ===
                    hw.Write("<tr><td colspan='" + gvLedgerDetail.Columns.Count + "' style='font-size:12px; text-align:right;'>");
                    hw.Write("Date: " + DateTime.Now.ToString("dd-MMM-yyyy"));
                    hw.Write("</td></tr></table><br/>");



                    // To Export all pages
                    gvLedgerDetail.AllowPaging = false;
                    // Optionally rebind the data here

                    gvLedgerDetail.RenderControl(hw);

                    Response.Output.Write(sw.ToString());
                    Response.Flush();
                    Response.End();
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required to avoid runtime error during export
        }

        protected void lnkbtnMatch_Click(object sender, EventArgs e)
        {
            try
            {
                FilterRecord("1");
                Keywrd = "1";
                lnkbtnAll.Visible = true;
            }
            catch (Exception ex)
            {

            }
        }

        protected void lnkbtnMismatch_Click(object sender, EventArgs e)
        {
            try
            {
                FilterRecord("2");
                Keywrd = "2";
                lnkbtnAll.Visible = true;
            }
            catch (Exception ex)
            {

            }
        }

        protected void lnkbtndtmismatch_Click(object sender, EventArgs e)
        {
            try { 
            FilterRecord("4");
            Keywrd = "4";   
            lnkbtnAll.Visible = true;
            }
            catch (Exception ex)
            {

            }
        }

        protected void lnkbtnwodtmismatch_Click(object sender, EventArgs e)
        {
            try { 
            FilterRecord("3");
            Keywrd = "3";
            lnkbtnAll.Visible = true;
            }
            catch (Exception ex)
            {

            }
        }
        
        protected void lnkbtnAll_Click(object sender, EventArgs e)
        {
            try { 
            DataTable dt1 = getSummaryFromSqlite();
            Keywrd = "0";
            BindDataForGrid(dt1, true);
            lnkbtnAll.Visible = false;
            }
            catch (Exception ex)
            {

            }
        }

        private void DisplayToolTip(DataTable dtrecords)
        {                  
            int tipSchemeCnt, tipkpiCnt;

            if (dtrecords != null && dtrecords.Rows.Count > 0)
            {
                var rows1 = dtrecords.AsEnumerable()
                    .Where(row =>
                        !row.IsNull("Project_Name_E") &&
                        !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                        !row.IsNull("outvalue") &&
                        !row.IsNull("CedaValue")
                    )
                    .GroupBy(row => row.Field<string>("Project_Name_E").Trim())
                    .Where(group =>
                        group.All(row =>
                            Convert.ToDecimal(row["outvalue"]) == Convert.ToDecimal(row["CedaValue"])
                        )
                    ).SelectMany(group => group);


                tipSchemeCnt = rows1.AsEnumerable()
                .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
                .Select(row => row.Field<string>("Project_Name_E"))
                .Distinct()
                .Count();

                tipkpiCnt = rows1.AsEnumerable()
                    .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");

                lnkbtnMatch.ToolTip = "Schemes : " + tipSchemeCnt + ", KPIs : " + tipkpiCnt;

                var rows2 = dtrecords.AsEnumerable()
                   .Where(row =>
                       !row.IsNull("Project_Name_E") &&
                       !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                       !row.IsNull("outvalue") &&
                       !row.IsNull("CedaValue")
                   ).GroupBy(row => row.Field<string>("Project_Name_E").Trim())
                   .Where(group =>
                       group.Any(row =>
                           Convert.ToDecimal(row["outvalue"]) != Convert.ToDecimal(row["CedaValue"])
                       )
                   ).SelectMany(group => group);

                tipSchemeCnt = rows2.AsEnumerable()
               .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
               .Select(row => row.Field<string>("Project_Name_E"))
               .Distinct()
               .Count();

                tipkpiCnt = rows2.AsEnumerable()
                  .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");

                lnkbtnMismatch.ToolTip = "Schemes : " + tipSchemeCnt + ", KPIs : " + tipkpiCnt;

                var rows3 = dtrecords.AsEnumerable().Where(row =>
                   !row.IsNull("Project_Name_E") &&
                   !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                   !row.IsNull("outvalue") &&
                   !row.IsNull("CedaValue")
               ).GroupBy(row => row.Field<string>("Project_Name_E").Trim())
               .Where(group =>
                   group.Any(row =>
                       Convert.ToDecimal(row["outvalue"]) != Convert.ToDecimal(row["CedaValue"]) &&
                       Convert.ToDateTime(row["PrayasDate"]) == Convert.ToDateTime(row["CedaDate"])
                   )
               ).SelectMany(group => group);

                tipSchemeCnt = rows3.AsEnumerable()
               .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
               .Select(row => row.Field<string>("Project_Name_E"))
               .Distinct()
               .Count();

                tipkpiCnt = rows3.AsEnumerable()
                  .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");

                lnkbtnwodtmismatch.ToolTip = "Schemes : " + tipSchemeCnt + ", KPIs : " + tipkpiCnt;

                var rows4 = dtrecords.AsEnumerable().Where(row =>
                   !row.IsNull("Project_Name_E") &&
                   !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                   !row.IsNull("outvalue") &&
                   !row.IsNull("CedaValue")
               ).GroupBy(row => row.Field<string>("Project_Name_E").Trim())
               .Where(group =>
                   group.Any(row =>
                       Convert.ToDecimal(row["outvalue"]) != Convert.ToDecimal(row["CedaValue"]) &&
                       Convert.ToDateTime(row["PrayasDate"]) != Convert.ToDateTime(row["CedaDate"])
                   )
               ).SelectMany(group => group);

                tipSchemeCnt = rows4.AsEnumerable()
               .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
               .Select(row => row.Field<string>("Project_Name_E"))
               .Distinct()
               .Count();

                tipkpiCnt = rows4.AsEnumerable()
                  .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");

                lnkbtndtmismatch.ToolTip = "Schemes : " + tipSchemeCnt + ", KPIs : " + tipkpiCnt;
            }
        }
      
        private void FilterRecord(string keywrd)
        {

            DataTable dtrecords = getSummaryFromSqlite();         
            DataTable dtfilter = dtrecords.Clone();  // Copy schema
            int tipSchemeCnt, tipkpiCnt;

            if (keywrd == "1") //Match
            {

                var rows1 = dtrecords.AsEnumerable()
                  .Where(row =>
                      !row.IsNull("Project_Name_E") &&
                      !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                      !row.IsNull("outvalue") &&
                      !row.IsNull("CedaValue")
                  )
                  .GroupBy(row => row.Field<string>("Project_Name_E").Trim())
                  .Where(group =>
                      group.All(row =>
                          Convert.ToDecimal(row["outvalue"]) == Convert.ToDecimal(row["CedaValue"])
                      )
                  ).SelectMany(group => group);

                
                 tipSchemeCnt = rows1.AsEnumerable()
                .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
                .Select(row => row.Field<string>("Project_Name_E"))
                .Distinct()
                .Count();

                 tipkpiCnt = rows1.AsEnumerable()
                   .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");

                lnkbtnMatch.ToolTip = "Schemes : " + tipSchemeCnt + ", KPIs : " + tipkpiCnt;

                foreach (var row in rows1)
                {
                    dtfilter.ImportRow(row);
                }
            }
            else if (keywrd == "2") //misMatch regardeless of date and data
            {
                //var rows = dtrecords.AsEnumerable().Where(row =>
                //        !row.IsNull("outvalue") &&
                //        !row.IsNull("CedaValue") &&
                //        Convert.ToDecimal(row["outvalue"]) != Convert.ToDecimal(row["CedaValue"])
                //     );

                var rows1 = dtrecords.AsEnumerable()
               .Where(row =>
                   !row.IsNull("Project_Name_E") &&
                   !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                   !row.IsNull("outvalue") &&
                   !row.IsNull("CedaValue")
               ).GroupBy(row => row.Field<string>("Project_Name_E").Trim())
               .Where(group =>
                   group.Any(row =>
                       Convert.ToDecimal(row["outvalue"]) != Convert.ToDecimal(row["CedaValue"])
                   )
               ).SelectMany(group => group);

                tipSchemeCnt = rows1.AsEnumerable()
               .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
               .Select(row => row.Field<string>("Project_Name_E"))
               .Distinct()
               .Count();

                tipkpiCnt = rows1.AsEnumerable()
                  .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");

                lnkbtnMismatch.ToolTip = "Schemes : " + tipSchemeCnt + ", KPIs : " + tipkpiCnt;

                foreach (var row in rows1)
                {
                    dtfilter.ImportRow(row);
                }
            }
            else if (keywrd == "3")//Mismatch but date are same 
            {

                var rows1 = dtrecords.AsEnumerable().Where(row =>
                   !row.IsNull("Project_Name_E") &&
                   !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                   !row.IsNull("outvalue") &&
                   !row.IsNull("CedaValue")
               ).GroupBy(row => row.Field<string>("Project_Name_E").Trim())
               .Where(group =>
                   group.Any(row =>
                       Convert.ToDecimal(row["outvalue"]) != Convert.ToDecimal(row["CedaValue"]) &&
                       Convert.ToDateTime(row["PrayasDate"]) == Convert.ToDateTime(row["CedaDate"])
                   )
               ).SelectMany(group => group);

                tipSchemeCnt = rows1.AsEnumerable()
               .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
               .Select(row => row.Field<string>("Project_Name_E"))
               .Distinct()
               .Count();

                tipkpiCnt = rows1.AsEnumerable()
                  .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");

                lnkbtnwodtmismatch.ToolTip = "Schemes : " + tipSchemeCnt + ", KPIs : " + tipkpiCnt;

                foreach (var row in rows1)
                {
                    dtfilter.ImportRow(row);
                }
            }
            else if (keywrd == "4")//Mismatch with different date
            {

                var rows1 = dtrecords.AsEnumerable().Where(row =>
                   !row.IsNull("Project_Name_E") &&
                   !string.IsNullOrWhiteSpace(row.Field<string>("Project_Name_E")) &&
                   !row.IsNull("outvalue") &&
                   !row.IsNull("CedaValue")
               ).GroupBy(row => row.Field<string>("Project_Name_E").Trim())
               .Where(group =>
                   group.Any(row =>
                       Convert.ToDecimal(row["outvalue"]) != Convert.ToDecimal(row["CedaValue"]) &&
                       Convert.ToDateTime(row["PrayasDate"]) != Convert.ToDateTime(row["CedaDate"])
                   )
               ).SelectMany(group => group);

                tipSchemeCnt = rows1.AsEnumerable()
               .Where(row => !row.IsNull("Project_Name_E") && row.Field<string>("Project_Name_E").Trim() != "")
               .Select(row => row.Field<string>("Project_Name_E"))
               .Distinct()
               .Count();

                tipkpiCnt = rows1.AsEnumerable()
                  .Count(row => !row.IsNull("KPI_Name_E") && row.Field<string>("KPI_Name_E") != "");

                
                lnkbtndtmismatch.ToolTip = "Schemes : " + tipSchemeCnt + ", KPIs : " + tipkpiCnt;
                foreach (var row in rows1)
                {
                    dtfilter.ImportRow(row);
                }
            }

            BindDataForGrid(dtfilter, false);

        }
    }
}