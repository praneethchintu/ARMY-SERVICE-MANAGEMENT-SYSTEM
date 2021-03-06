﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masters/MastersMater.master" AutoEventWireup="true" 
CodeFile="Service_exe_master.aspx.cs" Inherits="masters_Service_exe_master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script type="text/javascript">
    function UserUpdateConfirmation() {
        return confirm("Are you sure you want to Save this?");
    }

    function ConfirmEdit() {
      
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden";
        confirm_value.name = "confirm_value";
        if (confirm("Yes? or No?")) {
            confirm_value.value = "1";
        }
        else {
            confirm_value.value = "0";
        }
        document.forms[0].appendChild(confirm_value);
    }
 </script>


<style type="text/css">
.select-fleft tbody tr td label, .select-fleft tbody tr td input  { float: left !important; display: block !important; padding: 0 10px !important; }
    th
    {
        text-align:center !important;
     
        }
        
.floatingBox > div.container-fluid {
    padding: 0px !important;
}
.floatingBox {
       min-height: 0px !important;
}
body {
line-height: 0px !important;
}

div.mainmenu2 {
    margin: 0;
    margin-top: -1px;
    padding: 0;
}

div.mainmenu2 .container-fluid {
    padding: 0;
}

.mainmenu2 ul.nav {
    border-top: 1px solid rgba(0, 0, 0, .2);
    border-bottom: 1px solid rgba(0, 0, 0, .2);
    border-radius: 0;
    clear: right;
    float: left;
    height: 33px;
    margin-bottom: 0;
    min-height: 33px;
    padding: 0;
    width: 100%;
      background-color:#545a5f;
}

.mainmenu2 ul.nav li.divider-vertical {
    background: rgba(0,0,0,0.2);
}

.mainmenu2 ul.nav li.divider-vertical.firstDivider {
    margin-left: 20px;
}
.mainmenu2 ul.nav li.divider-vertical:last-child {
    margin-right: 20px;
}

.mainmenu2 ul.nav li {
    color: #e9e9e9;
    cursor: pointer;
    display: block;
    float: left;
    font-size: 11px;
    font-weight: 600;
    list-style-type: none;
    min-width: 100px;
    padding: 0;
    text-align: center;
    text-shadow: 0 1px 0 rgba(0, 0, 0, .1);
    white-space:nowrap;
  
}

.mainmenu2 ul.nav li a {
    color: #e9e9e9;
    display: block;
    height: 19px;
    margin: 0;
    padding: 7px 15px;    
}

.mainmenu2 ul.nav li a:hover {
    background-color: transparent;
    color: #33B5E5;
    text-decoration: none;
}

.mainmenu2 ul.nav li a:focus {
    background-color: transparent;
    text-decoration: none;
    outline: 0;
    color: #e9e9e9;
}

.mainmenu2 ul.nav li.active > a {
    color: #33B5E5;
     background-color: transparent;
}

.mainmenu2 ul.nav li.divider-vertical {
    border: 0;
    height: 33px;
    margin: 0;
    padding: 0;
    width: 1px;
    min-width: 1px;
    -webkit-box-shadow: none;
    box-shadow: none;
}
.mainmenu2 ul.nav li.collapseMenu {
    display: none;
}


/* dropdown list*/

.mainmenu2 ul.nav ul.dropdown-menu {
    border-radius: 0 0 4px 4px;
    min-width: 157px;
    top: 95%;
    background-color:#545a5f;
    
}

.mainmenu2 ul.nav ul.dropdown-menu .dropdown-submenu>.dropdown-menu  {
    border-radius: 4px;
    top: 0;
    left: 99.6%;
}

.mainmenu2 ul.nav ul.dropdown-menu li {
    float: none;
    text-align: left;
}

.mainmenu2 ul.nav ul.dropdown-menu li a:hover 
{
    background-color:transparent;
    color: #33B5E5;
   
}
</style>
    <div class="content">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row-fluid" style="margin-top: 0px !important">
                                <div class="span10 allwayTab allwayTab-bottom" style="margin-left: 0px !important">
                                    <div class="containerHeadline">
                                          <h2>TECHNICIANS Master</h2>
                                    </div>
                                    <!-- ==================== END OF ALLWAY TAB HEADLINE ==================== -->
                                    <!-- ==================== ALLWAY BOTTOM TAB FLOATING BOX ==================== -->
                                    <div class="floatingBox">
                                        <!-- ==================== ALLWAY RIGHT TABS ==================== -->
                                         <div class="mainmenu2">
                                            <div class="container-fluid">
                                             <div class="control-group" style="float:left; height:45px; width:100%">
                                              <div style="width:100%; float:left">
                                                    <ul class="nav  nav-tabs">
                                                   
                                                    <li class="left-side nav-tabs" id="dashboard"><a href="#toptabService"><i class="icon-dashboard"></i>SERVICES</a></li>
                                                    <li class="divider-vertical"></li>
                                                    <li class="left-side" id="Li2" style="width:115px"><a href="#toptabExecutives"><i class="icon-dashboard"></i>TECHNICIANS</a></li>
                                                    <li class="divider-vertical"></li>
                                                </ul>
                                                </div>
                                       </div>
                                        </div>
                                        </div>

                                        <!-- ==================== TABS ==================== -->
                                        <br />
                                        <div class="container-fluid" style="height: 100% !Important">
                                            <!-- ==================== SEVENTH CONTENT ==================== -->
                                            <ul id="toptabService">
                                                <li>
                                                    <p>
                                                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                            <ContentTemplate>
                                                                <%-- TYPE --%>
                                                                <asp:Button ID="btnCreateNewService" runat="server" Text="Add New Service" CssClass="btn btn-mini btn-primary"
                                                                    OnClick="btnCreateNewService_Click" Style="margin-left: 40px" />
                                                                <asp:Panel ID="panelService" runat="server" DefaultButton="btnServiceSave" Visible="False"
                                                                    Width="40%" Style="margin-left: 20%">
                                                                    <table>
                                                                        <tr>
                                                                            <td style="width:61px">
                                                                                Service
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtService" runat="server" Width="115px"></asp:TextBox>
                                                                                <asp:Label ID="lblServiceId" runat="server" Visible="False"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="service" ControlToValidate="txtService" CssClass="validation"></asp:RequiredFieldValidator>
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtService"
                                                                                    FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" "
                                                                                    Enabled="true">
                                                                                </asp:FilteredTextBoxExtender>
                                                                            </td>
                                                                            <td>
                                                                                Status
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlServiceStatus" runat="server" Width="115px">
                                                                                    <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                                    <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <asp:Label ID="lblService_Status_Comp" runat="server" Visible="false"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="service" ControlToValidate="ddlServiceStatus" InitialValue="-1"
                                                                                    CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
</Table>
<Table>
                                                                        <tr>
                                                                            <td>
                                                                                Description
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtServiceDescription" TextMode="MultiLine" runat="server" Width="281px" Height="32px"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="service" ControlToValidate="txtServiceDescription" CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                        <td></td>
                                                                            <td colspan="2">
                                                                                <asp:Label ID="lblServiceResult" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                        <td></td>
                                                                            <td colspan="2" align="center">
                                                                                <asp:Button ID="btnServiceSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                                    ValidationGroup="service" OnClick="btnServiceSave_Click" />
                                                                                    
                                                                                       <asp:ConfirmButtonExtender ID="ConfirmbtnServiceSave" runat="server" TargetControlID="btndummySVC"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?"></asp:ConfirmButtonExtender>
                                                                                  <asp:Button ID="btndummySVC" runat="server" Visible="false" />

                                                                                <asp:Button ID="btnServiceClear" runat="server" Text="Clear" CssClass="btn btn-mini"
                                                                                    Style="margin-left: 10px" OnClick="btnServiceClear_Click" />
                                                                                <asp:Button ID="btnServiceCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                                                    Style="margin-left: 10px" OnClick="btnServiceCancel_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                <br />
                                                                <asp:GridView ID="Grid_Service" runat="server" AutoGenerateColumns="False" Width="40%"
                                                                    AllowPaging="True" DataKeyNames="service_id" PageSize="5" Style="margin-left: 20%;
                                                                    margin-bottom: 50px" OnPageIndexChanging="Grid_Service_PageIndexChanging" OnDataBound="Grid_Service_DataBound"
                                                                    CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblServiceName" runat="server" Text='<%#Eval("service_name") %>'></asp:Label>
                                                                                <asp:Label ID="lblService_Id" runat="server" Visible="false" Text='<%#Eval("service_id") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Status">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblServiceStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                                                               <div style="text-align:center">  <asp:ImageButton ID="imgServiceStatus" runat="server" Width="15px" Height="15px" /></div>
                                                                               </ItemTemplate>
                                                                            <HeaderStyle Width="50px" />
                                                                        </asp:TemplateField>
                                                                          <asp:TemplateField HeaderText="SMS Code">
                                                                            <ItemTemplate>
                                                                              <div style="text-align:center">   <asp:Label ID="lblSms_code" runat="server" Text='<%#Eval("service_id") %>'></asp:Label></div>
                                                                              </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblServiceDescription" runat="server" Text='<%#Eval("serv_desc") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imgbtnServiceEdit" runat="server" Width="15px" Height="15px"
                                                                                    ImageAlign="Middle" OnClick="imgbtnServiceEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                                                                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnServiceEdit"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Update this?">
                                                                                </asp:ConfirmButtonExtender>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="40px" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </p>
                                                </li>
                                            </ul>
                                            <!-- ==================== END OF SEVENTH TAB CONTENT ==================== -->
                                            <!-- ==================== TENTH CONTENT ==================== -->
                                            <ul id="toptabExecutives" style="display: none">
                                                <li>
                                                    <p>
                                                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                            <ContentTemplate>
                                                                <%-- TYPE --%>
                                                                <asp:Button ID="btnCreateNewExecutive" runat="server" Text="Add Services to Technician"
                                                                    CssClass="btn btn-mini btn-primary" OnClick="btnCreateNewExecutive_Click" Style="margin-left: 40px" />
                                                                <asp:Panel ID="panelExecutive" runat="server" DefaultButton="btnExecutiveSave" Visible="False"
                                                                    Width="60%" Style="margin-left: 20%">
                                                                    <table>
                                                                         <tr>
                                                                            <td style="width:62px">
                                                                                Technician
                                                                            </td>
                                                                            <td style="width:115px">
                                                                                <asp:DropDownList ID="ddlExecutive" runat="server" Width="115px">
                                                                                </asp:DropDownList>
                                                                                <asp:Label ID="lblExecutive_ID" runat="server" Visible="false" ></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="executive" ControlToValidate="ddlExecutive" InitialValue="0"
                                                                                    CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
    <td>
                                                                                Status
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlExecutiveStatus" runat="server" Width="115px">
                                                                                    <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                                    <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="executive" ControlToValidate="ddlExecutiveStatus" InitialValue="-1"
                                                                                    CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
    <td>
                                                                                Service
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlServices" runat="server" Width="115px">
                                                                                </asp:DropDownList>
                                                                                <asp:Label ID="lblServices" runat="server" Width="115px"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="executive" ControlToValidate="ddlServices" InitialValue="0"
                                                                                    CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        </Table>
                                                                        <Table>
                                                                        <tr>
                                                                            <td>
                                                                                Description
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtExecutiveDescription" TextMode="MultiLine" runat="server" Width="437px" Height="32px"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="executive" ControlToValidate="txtExecutiveDescription" CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="3">
                                                                                <asp:Label ID="lblExecutiveResult" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                        <td></td>
                                                                            <td colspan="2" align="center">
                                                                                <asp:Button ID="btnExecutiveSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                                    ValidationGroup="executive" OnClick="btnExecutiveSave_Click" />
                                                                                    
                                                                                     <asp:ConfirmButtonExtender ID="ConfirmonEXE" runat="server" TargetControlID="btndummyEXE"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?"></asp:ConfirmButtonExtender>
                                                                                  <asp:Button ID="btndummyEXE" runat="server" Visible="false" />

                                                                                <asp:Button ID="btnExecutiveClear" runat="server" Text="Clear" CssClass="btn btn-mini"
                                                                                    Style="margin-left: 10px" OnClick="btnExecutiveClear_Click" />
                                                                                <asp:Button ID="btnExecutiveCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                                                    Style="margin-left: 10px" OnClick="btnExecutiveCancel_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                <br />
                                                                <asp:GridView ID="Grid_Executive" runat="server" AutoGenerateColumns="False" Width="40.5%"
                                                                    AllowPaging="True" DataKeyNames="emp_id" PageSize="5" Style="margin-left: 20%;
                                                                    margin-bottom: 50px" OnPageIndexChanging="Grid_Executive_PageIndexChanging" OnDataBound="Grid_Executive_DataBound"
                                                                    CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Technician">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExecutive" runat="server" Text='<%#Eval("emp_name") %>'></asp:Label>
                                                                                <asp:Label ID="lblExecutiveId" runat="server" Visible="false" Text='<%#Eval("emp_id") %>'></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Status">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExecutiveStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                                                             <div style="text-align:center"> <asp:ImageButton ID="imgExecutiveStatus" runat="server" Width="15px" Height="15px" /></div>
                                                                             </ItemTemplate>
                                                                            <HeaderStyle Width="50px" />
                                                                        </asp:TemplateField>
                                                                         <asp:TemplateField HeaderText="Service">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblService_exe" runat="server" Text='<%#Eval("service_name") %>'></asp:Label>
                                                                                <asp:Label ID="lblServiceId" runat="server" Visible="false" Text='<%#Eval("serv_id") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExecutiveDescription" runat="server" Text='<%#Eval("serv_exe_desc") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imgExecutEditive" runat="server" Width="15px" Height="15px"
                                                                                    ImageAlign="Middle" OnClick="imgbtnExecutive_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                                                                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgExecutEditive"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Update this?">
                                                                                </asp:ConfirmButtonExtender>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="40px" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </p>
                                                </li>
                                            </ul>
                                            <!-- ==================== END OF TENTH TAB CONTENT ==================== -->
                                           
                                        </div>
                                        <!-- ==================== END OF ALLWAY RIGHT TABS ==================== -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

