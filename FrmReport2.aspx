<%@ Page Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FrmReport2.aspx.cs" Inherits="TreeViewProject.FrmReport2" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="smRep2" runat="server"></asp:ScriptManager>
    <div class="container">
        <asp:UpdatePanel ID="updatepnlrpt2" UpdateMode="Always" runat="server">
            <ContentTemplate>                
                    <rsweb:ReportViewer ID="RepViewer2" runat="server" Width="100%" Height="800px" ZoomMode="PageWidth" PageCountMode="Actual">
                    </rsweb:ReportViewer>                           
             </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
