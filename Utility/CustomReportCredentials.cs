using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Principal;
using System.Web;
using Microsoft.Reporting.WebForms;

namespace TreeViewProject.Utility
{
    public class CustomReportCredentials : IReportServerCredentials
    {
        private string _userName;
        private string _password;
        private string _domain;

        public CustomReportCredentials(string userName, string password, string domain)
        {
            _userName = userName;
            _password = password;
            _domain = domain;
        }

        public WindowsIdentity ImpersonationUser
        {
            get { return null; } // No impersonation
        }

        public ICredentials NetworkCredentials
        {
            get { return new NetworkCredential(_userName, _password, _domain); }
        }

        public bool GetFormsCredentials(out Cookie authCookie, out string user, out string password, out string authority)
        {
            authCookie = null;
            user = password = authority = null;
            return false; // Not using Forms Authentication
        }
    }
}