﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TreeViewProject
{
    public partial class TreeViewPage1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string getname(string name)
        {
            name = "Arun";
            return "Hello :   " + name;
        }

        [WebMethod]
        public static string saverecord(string level1, string level2, string Level3, string level4, string level5,
            string level6, string level7, string level8, string level9,
            string level10)
        {

            string result = string.Empty;
            try
            {

                using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["MyConnectionString"].ToString()))
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("Status_usp_Insertlevels", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@level1", level1);
                        command.Parameters.AddWithValue("@level2", level2);
                        command.Parameters.AddWithValue("@level3", Level3);
                        command.Parameters.AddWithValue("@level4", level4);
                        command.Parameters.AddWithValue("@level5", level5);
                        command.Parameters.AddWithValue("@level6", level6);
                        command.Parameters.AddWithValue("@level7", level7);
                        command.Parameters.AddWithValue("@level8", level8);
                        command.Parameters.AddWithValue("@level9", level9);
                        command.Parameters.AddWithValue("@level10", level10);
                        command.Parameters.Add("@OutStatus", SqlDbType.Int).Direction = ParameterDirection.Output;
                        command.Parameters.Add("@OutDesc", SqlDbType.VarChar, 200).Direction = ParameterDirection.Output;
                        int rowsAffected = command.ExecuteNonQuery();
                        if (Convert.ToString(command.Parameters["@OutStatus"].Value) == "1")
                        {
                            result = String.Format("status: {0}{2}msg: {1}",
                                Convert.ToString(command.Parameters["@OutStatus"].Value), Convert.ToString(command.Parameters["@OutDesc"].Value), Environment.NewLine);
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            return result;
        }

    }
}