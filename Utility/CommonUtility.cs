using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TreeViewProject.Utility
{
    public static class CommonUtility
    {
        public static string CapitalizeFirstLetter(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
                return input;

            input = input.Trim();

            return char.ToUpper(input[0]) + input.Substring(1).ToLower();
        }
    }
}