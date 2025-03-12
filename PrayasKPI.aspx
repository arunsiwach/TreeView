<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PrayasKPI.aspx.cs" Inherits="TreeViewProject.PrayasKPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
</asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>   
    <asp:UpdatePanel ID="updatepnl" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div class="newProject_container">
                <%-- <div class="row">
        <div class="col mx-auto newProject">
            <h2 class="main-title">Create New Project</h2>
            <div class="user-info-container">
               <div class="user-info">
                    <p class="">Welcome</p>
                    <h6 class="text-medium-bold ">Manish Kumar</h6>
                </div>
                <img src="./images/user.png" class="user-img" alt="" />
            </div>
        </div>
    </div>--%>
                <div class="row gx-5">
                    <div class="col menu">
                        <div class=".col-sm  ">
                            <div class="p-3 border bg-light">
                                <asp:DropDownList  ID="ddlSector" class="form-control custom-inputs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSector_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class=".col-sm ">
                            <asp:DropDownList ID="ddlDepartment" class="form-control custom-inputs" runat="server"></asp:DropDownList>
                        </div>
                        <div class=".col-sm ">
                            <asp:DropDownList ID="ddlState" class="form-control custom-inputs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class=".col-sm ">
                            <asp:DropDownList ID="ddlDistrict" class="form-control custom-inputs" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class=".col-sm ">
                            <asp:DropDownList ID="ddlScheme" class="form-control custom-inputs" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlScheme_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class=".col-sm ">
                            <asp:DropDownList ID="ddlKpi" class="form-control custom-inputs" runat="server"></asp:DropDownList></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="card">
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>
