<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PullData.aspx.cs" Inherits="TreeViewProject.PullData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanagerParayas" runat="server"></asp:ScriptManager>
    <div class="container">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="updatepnl">
            <ProgressTemplate>
                <div class="modal1">
                    <div class="center1">
                        <img alt="" src="images/lg1.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="updatepnl" UpdateMode="Always" runat="server">
            <ContentTemplate>
                <h2>
                    <asp:Label ID="lblh2" runat="server" Text="Fill Data into SQL Lite"></asp:Label>
                </h2>
                <div class="filters">

                    <div class="select-wrapper">
                        <label for="KPIDate" class="label">Date</label>
                        <asp:TextBox ID="txtdate" runat="server" class="dropdown-new" TextMode="Date"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnShow" class="apply-btn" runat="server" Text="Pull" ToolTip="Click to Pull" OnClick="btnShow_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
