<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="TreeViewProject.Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel="stylesheet" href="css/TableStyle.css">--%>
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
    <asp:ScriptManager ID="smParayas" runat="server"></asp:ScriptManager>
    <div class="container">
        <h2>
            <asp:Label ID="lblh2" runat="server" Text="Data Comparison Summary All Critical KPI's"></asp:Label>
        </h2>
        <asp:UpdatePanel ID="updatepnlsummary" UpdateMode="Always" runat="server">
            <ContentTemplate>
                <div class="headergrid" id="divgrdheader" runat="server" visible="true">
                <div class="logo"></div>
                <div class="menugrid">
                    <asp:ImageButton ID="imgEx" class="header_logo" ImageUrl="~/Data Sanity Platform_files/Excel.svg" runat="server" OnClick="imgEx_Click" />
                    <asp:ImageButton ID="imgPdf" class="header_logo" ImageUrl="~/Data Sanity Platform_files/PDF.svg" runat="server" OnClick="imgPdf_Click" />
                    <img class="icon-btn" src="./Data Sanity Platform_files/Matched.svg" alt="Matched" /><span class="font_match">Matched</span>
                    <img class="icon-btn" src="./Data Sanity Platform_files/Mis-Matched.svg" alt="Mis-Matched" /><span class="font_mismatch">Mis-Matched</span>
                </div>
                </div>
                <div class="table-container">                 
                    <asp:GridView ID="gvLedgerDetail" runat="server"
                        OnRowDataBound="gvLedgerDetail_RowDataBound" EmptyDataText="No Record Found!"
                        AutoGenerateColumns="false" AllowPaging="false" PageSize="30" ShowFooter="true"
                        OnPageIndexChanging="gvLedgerDetail_PageIndexChanging" FooterStyle-BorderWidth="0px"
                        OnPreRender="gvLedgerDetail_PreRender">
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
                            <%--  <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderText='State' DataField="State_name_e" HtmlEncode="true">
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>--%>
                            <asp:BoundField HeaderText='Scheme Name' DataField="Project_Name_E" ItemStyle-HorizontalAlign="Left" HtmlEncode="true" />
                            <asp:BoundField HeaderText='KPI Name' DataField="KPI_Name_E" ItemStyle-HorizontalAlign="Left" HtmlEncode="true" />

                            <asp:BoundField HeaderText='Unit Name' DataField="Unit_Name" ItemStyle-HorizontalAlign="Left" HtmlEncode="true" />
                            <asp:BoundField HeaderText='Date Freq.' DataField="Data_Freq" ItemStyle-HorizontalAlign="Left" HtmlEncode="true" />
                            <asp:BoundField HeaderText='' DataField="outvalue" HtmlEncode="true" ItemStyle-HorizontalAlign="Right" />
                            <asp:BoundField HeaderText='' DataField="CedaValue" HtmlEncode="true" ItemStyle-HorizontalAlign="Right" />

                            <%--   <asp:TemplateField HeaderText='Prayas Value(A)'>
                                <ItemTemplate>
                                <asp:Label ID="lblPrayasValue" runat="server" Text=''> </asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>--%>
                            <%-- <asp:TemplateField HeaderText='Department DashBoard(B)'>
                                    <ItemTemplate>
                                <asp:Label ID="lblDepDashValue" runat="server" Text=''> </asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText='Difference (A-B)'>
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
                        <PagerSettings FirstPageText="First" NextPageText="Next" PreviousPageText="Previous" LastPageText="Last" Mode="NextPreviousFirstLast" />
                        <PagerStyle CssClass="custom-pager" BorderWidth="0px" />
                    </asp:GridView>
                </div>
            </ContentTemplate>
              <Triggers>
                <asp:PostBackTrigger ControlID="imgEx" />
                <asp:PostBackTrigger ControlID="imgPdf" />
              </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
