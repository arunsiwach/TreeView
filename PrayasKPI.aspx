<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PrayasKPI.aspx.cs" Inherits="TreeViewProject.PrayasKPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
/* Remove pager border */
.custom-pager {
    border: none;
    padding: 10px;
    text-align: right;
}

/* Style the paging buttons */
.custom-pager a, 
.custom-pager span {
    display: inline-block;
    margin: 0 1px;
    padding: 6px 12px;
    border-radius: 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    font-size: 14px;
    transition: background-color 0.3s ease;
}

/* Hover effect for active page links */
.custom-pager a:hover {
    background-color: #0056b3;
}

/* Style for current page (non-clickable span) */
.custom-pager span {
    background-color: #6c757d;
    cursor: default;
}

</style>
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
                    <asp:Label ID="lblh2" runat="server" Text="State Level Report"></asp:Label>
                </h2>
                <!-- FILTER BUTTONS -->
                <div class="filters">

                    <div class="select-wrapper">
                        <label for="Sector" class="label">Sector</label>
                        <asp:DropDownList ID="ddlSector" class="dropdown-new" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSector_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="select-wrapper">
                        <label for="Department" class="label">Department</label>
                        <asp:DropDownList ID="ddlDepartment" class="dropdown-new" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                    </div>

                    <div class="select-wrapper">
                        <label for="State" class="label">State</label>
                        <asp:DropDownList ID="ddlState" class="dropdown-new" runat="server">
                        </asp:DropDownList>
                    </div>

                    <%--  <div class="select-wrapper">
                        <label for="District" class="label">District</label>
                        <asp:DropDownList ID="ddlDistrict" class="dropdown-new" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>--%>

                    <div class="select-wrapper">
                        <label for="Scheme" class="label">Scheme</label>
                        <asp:DropDownList ID="ddlScheme" class="dropdown-new" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlScheme_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="select-wrapper">
                        <label for="KPI" class="label">KPI</label>
                        <asp:DropDownList ID="ddlKpi" class="dropdown-new" Width="180px" runat="server"></asp:DropDownList>
                    </div>
                    <div class="select-wrapper">
                        <label for="KPIDate" class="label">Date</label>
                        <asp:TextBox ID="txtdate" runat="server" class="dropdown-new" TextMode="Date"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnShow" class="apply-btn" runat="server" Text="Apply" ToolTip="Click to Show" OnClick="btnShow_Click" />
                </div>
                <!-- RESPONSIVE TABLE -->
                <div class="table-container">

                    <div class="headergrid" id="divgrdheader" runat="server" visible="false">
                        <div class="logo"></div>
                        <div class="menugrid">
                            <img class="icon-btn" src="./img/match.png" alt="Matched" /><span style="color: #b0f5a4">Matched</span>
                            <img class="icon-btn" src="img/Mismatched.png" alt="Mis-Matched" /><span style="color: #f18445">Mis-Matched</span>
                        </div>
                    </div>

                    <asp:GridView ID="gvLedgerDetail" runat="server"
                        OnRowDataBound="gvLedgerDetail_RowDataBound"  EmptyDataText="No Record Found!"
                        AutoGenerateColumns="false" AllowPaging="true" PageSize="10" ShowFooter="true"                          
                        OnPageIndexChanging="gvLedgerDetail_PageIndexChanging" FooterStyle-BorderWidth="0px" >
                        <Columns>
                            <asp:TemplateField HeaderText="Sl.No." HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <%-- <asp:BoundField HeaderText='State Code' DataField="StateCode" HtmlEncode="true" />
                            <asp:BoundField HeaderText='Sector Name' DataField="SectorName" HtmlEncode="true" />
                            <asp:BoundField HeaderText='Department Name' DataField="DepartmentName" HtmlEncode="true" />--%>
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderText='State' DataField="State_name_e" HtmlEncode="true">
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText='Scheme Name' DataField="Project_Name_E" HtmlEncode="true" />
                            <asp:BoundField HeaderText='KPI Name' DataField="KPI_Name_E" HtmlEncode="true" />
                            <asp:BoundField HeaderText='' DataField="outvalue" HtmlEncode="true" />
                            <asp:BoundField HeaderText='' DataField="CedaValue" HtmlEncode="true" />

                            <%--   <asp:TemplateField HeaderText='Prayas Value(A)'>
                                <ItemTemplate>
                                    <asp:Label ID="lblPrayasValue" runat="server"
                                        Text=''>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%-- <asp:TemplateField HeaderText='Department DashBoard(B)'>
                            <ItemTemplate>
                                <asp:Label ID="lblDepDashValue" runat="server"
                                    Text=''>
                                </asp:Label>
                            </ItemTemplate>
                         </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText='Difference (B-A)'>
                                <ItemTemplate>
                                    <asp:Label ID="lblDiffofBandA" runat="server"
                                        Text='<%# Eval("Diffvalue") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText='Difference Percentage (%)'>
                                <ItemTemplate>
                                    <asp:Label ID="lblDiffpercntofBandA" runat="server"
                                        Text='<%# Eval("Diffpercnt") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField HeaderText='Prayas DashBoard views(C)' DataField="customerName"
                                HtmlEncode="true" />--%>
                            <%--<asp:TemplateField HeaderText='Difference(C-A)'>
                                <ItemTemplate>
                                    <asp:Label ID="lblDiffofCandA" runat="server"
                                        Text=''>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%-- <asp:TemplateField HeaderText='Difference Percentage(%)'>
                                <ItemTemplate>
                                    <asp:Label ID="lblDiffpercntofCandA" runat="server"
                                        Text=''>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>                      
                        <PagerSettings FirstPageText="First" NextPageText="Next" PreviousPageText="Previous" LastPageText="Last" Mode="NextPreviousFirstLast"/>
                        <PagerStyle CssClass="custom-pager" BorderWidth="0px" />                        
                    </asp:GridView>
                </div>
                <!-- ACTION BUTTONS -->
                <div class="action-buttons">
                    <button class="pmo">PMO Report - State Wise</button>
                    <button class="summary">Summary Report</button>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
