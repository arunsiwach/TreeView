<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmReport3.aspx.cs" Inherits="TreeViewProject.FrmReport3" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="smRep1" runat="server"></asp:ScriptManager>
        <div>
            <rsweb:ReportViewer ID="RepViewer" runat="server" Width="100%" Height="800px" ZoomMode="PageWidth" PageCountMode="Actual">
            </rsweb:ReportViewer>
        </div>
    </form>
</body>
</html>

