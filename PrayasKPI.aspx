<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PrayasKPI.aspx.cs" Inherits="TreeViewProject.PrayasKPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanagerParayas" runat="server"></asp:ScriptManager>
    <div class="container">
        <h2>State Level Report</h2>
        <asp:UpdatePanel ID="updatepnl" UpdateMode="Always" runat="server">
            <ContentTemplate>
                <!-- FILTER BUTTONS -->
                <div class="filters">

                    <div class="select-wrapper">
                        <label for="Sector" class="label">Sector</label>
                        <asp:DropDownList ID="ddlSector" class="dropdown-new" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSector_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="select-wrapper">
                        <label for="Department" class="label">Department</label>
                        <asp:DropDownList ID="ddlDepartment" class="dropdown-new" runat="server"></asp:DropDownList>
                    </div>

                    <div class="select-wrapper">
                        <label for="State" class="label">State</label>
                        <asp:DropDownList ID="ddlState" class="dropdown-new" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="select-wrapper">
                        <label for="District" class="label">District</label>
                        <asp:DropDownList ID="ddlDistrict" class="dropdown-new" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="select-wrapper">
                        <label for="Scheme" class="label">Scheme</label>
                        <asp:DropDownList ID="ddlScheme" class="dropdown-new" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlScheme_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="select-wrapper">
                        <label for="KPI" class="label">KPI</label>
                        <asp:DropDownList ID="ddlKpi" class="dropdown-new" Width="180px" runat="server"></asp:DropDownList>
                    </div>

                    <asp:Button ID="btnShow" class="apply-btn" runat="server" Text="Apply" ToolTip="Click to Show" OnClick="btnShow_Click" />
                </div>

                <!-- RESPONSIVE TABLE -->
                <div class="table-container">
                    <asp:GridView ID="gvLedgerDetail" runat="server" OnRowCommand="gvLedgerDetail_RowCommand"
                        OnRowDataBound="gvLedgerDetail_RowDataBound"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Sl.No." HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText='State' DataField="StateName" HtmlEncode="true" />
                            <asp:BoundField HeaderText='State Code' DataField="StateCode" HtmlEncode="true" />
                            <asp:BoundField HeaderText='Sector Name' DataField="SectorName" HtmlEncode="true" />
                            <asp:BoundField HeaderText='Department Name' DataField="DepartmentName" HtmlEncode="true" />
                            <asp:BoundField HeaderText='Prayas Value (A)' DataField="National_Value" HtmlEncode="true" />
                            <asp:BoundField HeaderText='Ceda Value (B)' DataField="CedaValue" HtmlEncode="true" />
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
