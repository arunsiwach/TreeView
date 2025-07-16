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
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Threading;
using System.Collections.Concurrent;
using System.Drawing;
using System.Web.Services.Description;
using System.Runtime.Remoting.Messaging;

namespace TreeViewProject
{
    public partial class PullData : System.Web.UI.Page
    {
        private string connectionStringCEDA = ConfigurationManager.AppSettings["MyConnectionStringCEDA"];
        private string MyConnectionStringprayas = ConfigurationManager.AppSettings["MyConnectionStringprayas"];
        private string connectionStringLocal = ConfigurationManager.AppSettings["MyConnectionString"];
        private string connectionStringSqlite = ConfigurationManager.AppSettings["SQLiteDbConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtdate.Text.Trim().Length == 0)
                {
                    string sc = "alert('Please select Date');";
                    ScriptManager.RegisterStartupScript(scriptmanagerParayas, scriptmanagerParayas.GetType(), "alertScript", sc, true);
                    return;
                }


                //DataTable result;
                //result = RunQueriesByThread("");

                //if (result != null && result.Rows.Count > 0)
                //{
                //    FilldataintoSqliteTable(result, connectionStringSqlite, "Tbl_Display_Consolidate_View");
                //}

                FillData();

                //Task.Run(async () =>
                //{
                //    result = await RunAllQueriesWithDeclarationsAsync("");
                //}).GetAwaiter().GetResult();


            }
            catch (Exception ex)
            {
                string sc = "alert('" + ex.Message + "');";
                ScriptManager.RegisterStartupScript(this.Page,Page.GetType(), "alertScript", sc, true);
                return;
            }
        }


        //Parallel Run 
        public DataTable RunQueriesByThread(string sqlFilePath)
        {
            string datevalue = txtdate.Text.Trim().Length > 0 ? txtdate.Text.Trim() : "";
            string filePath = @"E:\TreeView\TreeView\Consolidate_ViewFirst.txt";
           // string filePath = @"E:\TreeView\TreeView\Consolidate_ViewSecond.txt";
           // string filePath = @"E:\TreeView\TreeView\Consolidate_Temp.txt";
            var (declarations, queries) = ParseSqlFileWithDeclarations(filePath, datevalue);
            var resultTables = new ConcurrentBag<DataTable>();
            string fullQuery = string.Empty;
            int cnt = 0;
            Parallel.ForEach(queries, new ParallelOptions { MaxDegreeOfParallelism =8 }, query =>
            {
                try
                {
                    fullQuery = declarations + "\n" + query;
                    DataTable dt = ExecuteQuery(fullQuery);
                    cnt++;
                    resultTables.Add(dt);

                }
                catch (Exception ex)
                {
                    string logPath = @"E:\TreeView\TreeView\error_log.txt";
                    using (StreamWriter writer = new StreamWriter(logPath, true)) // true = append
                    {
                        writer.WriteLine("----- Exception Occurred -----");
                        writer.WriteLine("Date: " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                        writer.WriteLine("Message: " + ex.Message);
                        writer.WriteLine(fullQuery);
                        //writer.WriteLine("StackTrace: " + ex.StackTrace);
                        writer.WriteLine(); // Blank line for readability
                    }

                }
            });
            cnt = cnt + 0;
            // Merge all result tables
            DataTable merged = resultTables.FirstOrDefault()?.Clone() ?? new DataTable();

            foreach (var dt in resultTables)
            {
                merged.Merge(dt);
            }

            return merged;
        }

        private DataTable ExecuteQuery(string fullQuery)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionStringCEDA))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(fullQuery, conn))
                {
                    cmd.CommandTimeout = 900;
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(dt);
                    }
                }
            }

            return dt;
        }


        #region (    Parallelrun with retry     )
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sqlFilePath"></param>
        /// <returns></returns>
        public DataTable RunQueriesByThreadwithRetry(string sqlFilePath)
        {
            string datevalue = txtdate.Text.Trim().Length > 0 ? txtdate.Text.Trim() : "";
            //string filePath = @"E:\TreeView\TreeView\Consolidate_View1.txt";
            string filePath = @"E:\TreeView\TreeView\Consolidate_View1.txt";
            var (declarations, queries) = ParseSqlFileWithDeclarations(filePath, datevalue);            
            var resultTables = new ConcurrentBag<DataTable>();
            string fullQuery=string.Empty;

            List<string> currentRetryList = queries;
            int maxRetries = 3;
            int retryCount = 0;


            while (currentRetryList.Any() && retryCount < maxRetries)
            {
             
                var failedBlocks = new ConcurrentBag<string>();

                Parallel.ForEach(currentRetryList,
                    new ParallelOptions { MaxDegreeOfParallelism =8},
                    (block, state, index) =>
                    {
                        try
                        {

                            if (TryExecuteWithRetry(declarations + "\n" + block, out DataTable result))
                            {
                                resultTables.Add(result);
                                WriteLog("",$"Block executed successfully (Retry {retryCount + 1})");                                 
                            }
                            else
                            {                              
                                failedBlocks.Add(block);
                            }
                        }
                        catch (Exception ex)
                        {
                            WriteLog("", $"❌ Block crashed: {ex.Message})");                            
                            failedBlocks.Add(block);
                        }
                    });

                // Prepare next round of retry
                currentRetryList = failedBlocks.ToList();
                retryCount++;
            }

            if (currentRetryList.Any())
            {
                WriteLog("",$"{currentRetryList.Count} blocks still failed after {retryCount} retries.");              
            }


            // Merge all result tables
            DataTable merged = resultTables.FirstOrDefault()?.Clone() ?? new DataTable();

            foreach (var dt in resultTables)
            {
                merged.Merge(dt);
            }

            return merged;
        }

        private bool TryExecuteWithRetry(string sql, out DataTable result, int maxAttempts = 2)
        {
            result = null;
            for (int attempt = 1; attempt <= maxAttempts; attempt++)
            {
                try
                {
                    result = ExecuteQuery(sql);
                    return true;
                }
                catch (SqlException ex) 
                {
                    if (ex.Message.Contains("timeout"))
                    {
                        //Console.WriteLine($" Timeout on attempt {attempt}");
                        Thread.Sleep(2000);
                    }
                }
                catch (Exception ex)
                {
                    //Console.WriteLine($"⚠️ Other error: {ex.Message}");
                    break;
                }
            }
            return false;
        }
        #endregion

 

        private (string declarations, List<string> individualQueries) ParseSqlFileWithDeclarations(string filePath,string datevalue)
        {

             string paramdeclare = @"declare @stateid int=" + 0 + " ,@schemecode int=" + 0 + " ,@kpiid int=" + 0 + " ,@datevalue varchar(30)='" + datevalue + "'";
             string fullSql = File.ReadAllText(filePath);

            ////split at the first SELECT (assumes DECLAREs come before first SELECT)
            //var match = Regex.Match(fullSql, @"^(.*?)(SELECT.*)$", RegexOptions.Singleline | RegexOptions.IgnoreCase);

            //string declarations = match.Groups[1].Value.Trim(); // everything before first SELECT
            //string queriesBlock = match.Groups[2].Value.Trim(); // everything after

            // Now split queries using UNION keyword
            /*
            var queries = Regex.Split(fullSql, @"\bUNION\b", RegexOptions.IgnoreCase)
                               .Select(q => q.Trim())
                               .Where(q => !string.IsNullOrWhiteSpace(q))
                               .ToList();
            */

            var queries = Regex.Split(fullSql, @"/\*---block---\*/", RegexOptions.IgnoreCase)
                     .Select(block => block.Trim())
                     .Where(block => !string.IsNullOrWhiteSpace(block))
                     .ToList();
            return (paramdeclare, queries);            
        }

        #region( Async Methods )
        public async Task<DataTable> RunAllQueriesWithDeclarationsAsync(string sqlFilePath)
        {
            string datevalue = txtdate.Text.Trim().Length > 0 ? txtdate.Text.Trim() : "";
            string filePath = @"E:\TreeView\TreeView\Consolidate_View1.txt";
            var result = ParseSqlFileWithDeclarations(filePath, datevalue);            
            var fullQueries = CombineDeclarationsWithQueries(result.declarations, result.individualQueries);

            int maxConcurrency =5;
            var allResults = new List<DataTable>();

            using (SemaphoreSlim throttler = new SemaphoreSlim(maxConcurrency))
            {
                var tasks = fullQueries.Select(async query =>
                {
                    await throttler.WaitAsync();
                    try
                    {
                        return await ExecuteSqlQueryAsync(query);
                    }                  
                    finally
                    {
                        throttler.Release();
                    }
                });

                var results = await Task.WhenAll(tasks);
                allResults.AddRange(results);
            }

            // Merge all tables
            var merged = allResults[0].Clone();
            foreach (var dt in allResults)
                merged.Merge(dt);

            return merged;
        }

        public async Task<DataTable> ExecuteSqlQueryAsync(string sqlQuery)
        {
            var dt = new DataTable();
            
            using (SqlConnection conn = new SqlConnection(connectionStringCEDA))
            {
                using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                {                       
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        await conn.OpenAsync();
                        adapter.Fill(dt);
                    }
                }
            }
            return dt;
        }

        #endregion

        List<string> CombineDeclarationsWithQueries(string declarations, List<string> queries)
        {
            return queries.Select(query => $"{declarations}\n{query}").ToList();
        }

        public void WriteLog(string block,string message)
        {
            string logPath = @"E:\TreeView\TreeView\error_log.txt";
            using (StreamWriter writer = new StreamWriter(logPath, true)) // true = append
            {
                writer.WriteLine("----- Exception Occurred -----");
                writer.WriteLine("Date: " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                writer.WriteLine("Message: " + message);
                writer.WriteLine(block);
                //writer.WriteLine("StackTrace: " + ex.StackTrace);
                writer.WriteLine(); // Blank line for readability
            }
        }


        private void FillData()
        {
            //UpdateLocalScheme(connectionStringSqlite);
            //return;
            DataTable dt = null;
            DataTable dtprayas = null;
            int stateid = 0;int kpid = 0;int schemeCode = 0;
            string datevalue = txtdate.Text.Trim().Length > 0 ? txtdate.Text.Trim() : "";

            // dt = GetCedaConsolidatedViewData(stateid, kpid, schemeCode, datevalue);
             dtprayas = GetCedaConsolidatedDataLocal(stateid, kpid, schemeCode, datevalue);

            /* darpan Data Code will be here      
             * 
                do some thing
            */

            if (dt != null && dt.Rows.Count > 0)
            {
                FilldataintoSqliteTable(dt, connectionStringSqlite, "Tbl_Display_Consolidate_View");
            }
            if (dtprayas != null && dtprayas.Rows.Count > 0)
            {
                FilldataintoSqliteTable(dtprayas, connectionStringSqlite, "Tbl_Display_Consolidate");
            }

            
        }

        private DataTable GetCedaConsolidatedDataLocal(int stateCode, int SchemeCode, int KpiID, string datevalue)
        {
            try
            {
                DataTable ds;
                string paramdeclare = @"declare @stateid int=" + stateCode + " ,@schemecode int=" + SchemeCode + " ,@kpiid int=" + KpiID + " ,@datevalue varchar(30)='" + datevalue + "'";

                StringBuilder sb = new StringBuilder();
                sb.AppendLine(paramdeclare);
                string file = @"E:\TreeView\TreeView\prayasquery.txt";
                if (File.Exists(file))
                {
                    string[] filedata = File.ReadAllLines(file);
                    foreach (string ln in filedata)
                        sb.AppendLine(ln);
                }
                string finalQuery = sb.ToString();

                using (SqlConnection con = new SqlConnection(MyConnectionStringprayas))
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

        private DataTable GetCedaConsolidatedViewData(int stateCode, int SchemeCode, int KpiID, string datevalue)
        {            
            try
            {                   
                DataTable ds;
                string paramdeclare = @"declare @stateid int=" + stateCode + " ,@schemecode int=" + SchemeCode + " ,@kpiid int=" + KpiID + " ,@datevalue varchar(30)='" + datevalue + "'";

                StringBuilder sb = new StringBuilder();
                sb.AppendLine(paramdeclare);
                string file = @"E:\TreeView\TreeView\Consolidate_View1.txt";
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
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            ds = new DataTable();
                            ds.Load(reader);
                        }
                        //using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        //{
                        //    ds = new DataTable();
                        //    adapter.Fill(ds);
                        //}
                    }
                }
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }                 
        }
        private void  FilldataintoSqliteTable(DataTable dtdata, string connectionstring, string tableName)
        {
            try
            {

                if (tableName == "Tbl_Display_Consolidate_View")
                {
                    DataColumn idCol1 = new DataColumn("Local_Scheme_Code", typeof(int));
                    DataColumn idCol2 = new DataColumn("Localkpi_Value", typeof(decimal));
                    idCol1.AllowDBNull = true;
                    idCol2.AllowDBNull = true;
                    dtdata.Columns.Add(idCol1);
                    dtdata.Columns.Add(idCol2);
                }


                var renameMap = new Dictionary<string, string>
                {
                    { "project_code", "Scheme_Code" },
                    { "project_name", "Scheme_Name" },
                    { "label", "KPIID" },
                    { "indicator", "KPI_Name" },
                    { "date", "DataDate" },
                    { "national_value", "Viewkpi_value" },
                };

                foreach (var kvp in renameMap)
                {
                    if (dtdata.Columns.Contains(kvp.Key))
                    {
                        dtdata.Columns[kvp.Key].ColumnName = kvp.Value;
                    }
                }

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
                //return "sucess";
            }
            catch (Exception ex)
            {
                //return "fail";
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
                        string insertQuery = $"UPDATE Tbl_Display_Consolidate_View\r\nSET Local_Scheme_Code = (\r\n    SELECT vm.Local_SchemeCode\r\n    FROM Tbl_Scheme_ViewName_Mapping vm\r\n    WHERE vm.PmoDB_SchemeCode_OLD = Tbl_Display_Consolidate_View.Scheme_Code\r\n)\r\nWHERE EXISTS (\r\n    SELECT 1\r\n    FROM Tbl_Scheme_ViewName_Mapping\r\n    WHERE Tbl_Scheme_ViewName_Mapping.PmoDB_SchemeCode_OLD = Tbl_Display_Consolidate_View.Scheme_Code\r\n);";

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