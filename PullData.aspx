<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="PullData.aspx.cs" Inherits="TreeViewProject.PullData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/TableStyle1.css">
<style type="text/css">
    .modal1 {
        position: fixed;
        z-index: 999;
        height: 100%;
        width: 100%;
        /*top: 0;*/
        background-color: white;
        filter: alpha(opacity=70);
        opacity: 0.7;
        -moz-opacity: 0.8;
    }
    .center1 {
        position: center;
        /*
                z-index: 1000;
                margin: 300px auto;
                padding: 10px;
                width: 75px;
                background-color: White;
                border-radius: 10px;
                filter: alpha(opacity=100);
                opacity: 1;
                -moz-opacity: 1;
                */
    }
    .center1 img1 {
        /* position: center;*/
        height: 200px;
        width: 200px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanagerParayas" runat="server"></asp:ScriptManager>
    <div class="container">
       <%-- <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="updatepnl">
            <ProgressTemplate>
                <div class="modal1">
                    <div class="center1">
                        <img alt="" src="images/lg1.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>--%>
      <%--  <asp:UpdatePanel ID="updatepnl" UpdateMode="Always" runat="server">
            <ContentTemplate>--%>
                <h2>
                    <asp:Label ID="lblh2" runat="server" Text="Push Data into SQL Lite DB"></asp:Label>
                </h2>
                <div class="filters">

                    <div class="select-wrapper">
                        <label for="KPIDate" class="label">Date</label>
                        <asp:TextBox ID="txtdate" runat="server" class="dropdown-new" TextMode="Date"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnShow" class="apply-btn" runat="server" Text="Push" ToolTip="Click to Push" OnClick="btnShow_Click" />
                </div>
        <%--    </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
