<%@ Page Title="" Language="C#" MasterPageFile="~/sup_admn/sup_admn_master.master" AutoEventWireup="true" CodeFile="Requests.aspx.cs" Inherits="sup_admn_Requests" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
th
{
    height:30px;
    text-align:center ! important;
    
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row-fluid" style="margin-top: 0px !important">
                                <div class="span10 allwayTab allwayTab-bottom" style="margin-left: 0px !important">
                                    <div class="containerHeadline">
                                        <h2>
                                            Requests Master</h2>
                                    </div>
                                    <!-- ==================== END OF ALLWAY TAB HEADLINE ==================== -->
                                    <!-- ==================== ALLWAY BOTTOM TAB FLOATING BOX ==================== -->
                                    <div class="floatingBox">
                                        <!-- ==================== ALLWAY RIGHT TABS ==================== -->
                                        <%--<div class="mainmenu2">
                                            <div class="container-fluid">
                                             <div class="control-group" style="float:left; height:45px; width:100%">
                                              <div style="width:100%; float:left">
                                                    <ul class="nav  nav-tabs">
                                                   
                                                    <li class="left-side nav-tabs" id="dashboard"><a href="#toptabRequests"><i class="icon-dashboard"></i>REQUESTS</a></li>
                                                    <li class="divider-vertical"></li>
                                                   
                                                </ul>
                                                </div>
                                       </div>
                                        </div>
                                        </div>--%>


                                        
                                        <!-- ==================== TABS ==================== -->
                                        <br />
                                        <div class="container-fluid" style="height: 100% !Important">
                                            <!-- ==================== SEVENTH CONTENT ==================== -->
                                            <ul id="toptabRequests">
                                                <li>
                                                    <p>
                                                                                <asp:Label ID="lblRequestResult" runat="server"></asp:Label>
                                                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                            <ContentTemplate>
                                                                <%-- TYPE --%>
                                                                <%--<asp:Button ID="btnCreateNewRequests" runat="server" Text="Add New Request" CssClass="btn btn-mini btn-primary"
                                                                    OnClick="btnCreateNewRequest_Click" Style="margin-left: 40px; margin-top: 30px" />--%>
                                                                <asp:Panel ID="panelRequests" runat="server" DefaultButton="btnRequestSave" Visible="False"
                                                                    Width="80%" Style="margin-left: 20%">
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                Prefix
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPrefix" runat="server"  MaxLength="5" Width="115px" TextMode="SingleLine" style="text-transform:uppercase"></asp:TextBox>
                                                                                <asp:Label ID="lblPrefixId" runat="server" Visible="False"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="requests" ControlToValidate="txtPrefix" CssClass="validation"></asp:RequiredFieldValidator>
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtPrefix"
                                                                                    FilterType="UppercaseLetters,Custom,LowercaseLetters" Enabled="true">
                                                                                </asp:FilteredTextBoxExtender>
                                                                            </td>
                                                                          
                                                                            <td>
                                                                                SMS Reply
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlSMSReply" runat="server" Width="115px" 
                                                                                    AutoPostBack="true" onselectedindexchanged="ddlSMSReply_SelectedIndexChanged">
                                                                                    <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                                    <asp:ListItem Text="Reply" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No Reply" Value="0"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="requests" ControlToValidate="ddlSMSReply" InitialValue="-1"
                                                                                    CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        
                                                                        </tr>
                                                                       
                                                                         
                                                                        <tr>
                                                                            <td>
                                                                                Status
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlRequestStatus" runat="server" Width="115px">
                                                                                    <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                                    <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="requests" ControlToValidate="ddlRequestStatus" InitialValue="-1"
                                                                                    CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                     
                                                                            <td>
                                                                                SMS Port
                                                                            </td>
                                                                            <td>
                                                                               <b> COM</b><asp:TextBox ID="txtSMSPort" runat="server" AutoPostBack="true" MaxLength="3" Width="90px" 
                                                                                    ontextchanged="txtSMSPort_TextChanged"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="requests" ControlToValidate="txtSMSPort" CssClass="validation"></asp:RequiredFieldValidator>
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSMSPort"
                                                                                    FilterType="Numbers,Custom" Enabled="true">
                                                                                </asp:FilteredTextBoxExtender>
                                                                            </td>
                                                                      
                                                                        </tr>
                                                                        
                                                                        
                                                                        <tr>
                                                                            <td>
                                                                                Description
                                                                            </td>
                                                                            <td colspan="4">
                                                                                <asp:TextBox ID="txtRequestDescription" TextMode="MultiLine" runat="server" CssClass="span12"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="**"
                                                                                    ValidationGroup="requests" ControlToValidate="txtRequestDescription" CssClass="validation"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                         
                                                                        <tr>
                                                                            <td colspan="3">
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="3" align="right">
                                                                                <asp:Button ID="btnRequestSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                                    ValidationGroup="requests" OnClick="btnRequestSave_Click" />

                                                                                     <asp:ConfirmButtonExtender ID="ConfirmbtnRequestSave" runat="server" TargetControlID="btndummyRequest"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?"></asp:ConfirmButtonExtender>
                                                                                  <asp:Button ID="btndummyRequest" runat="server" Visible="false" />

                                                                                <asp:Button ID="btnRequestClear" runat="server" Text="Clear" CssClass="btn btn-mini"
                                                                                    Style="margin-left: 10px" OnClick="btnRequestClear_Click" />
                                                                                <asp:Button ID="btnRequestCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                                                    Style="margin-left: 10px" OnClick="btnRequestCancel_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                <br />
                                                                <asp:GridView ID="Grid_Request" runat="server" AutoGenerateColumns="False" Width="40%"
                                                                    AllowPaging="True" DataKeyNames="id,replay" PageSize="5" Style="margin-left: 20%;
                                                                    margin-bottom: 50px" OnPageIndexChanging="Grid_Request_PageIndexChanging" OnDataBound="Grid_Request_DataBound"
                                                                    CssClass="table  tablesorter-default table-striped">
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Prefix">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPrefix" runat="server" Text='<%#Eval("prefix") %>'></asp:Label>
                                                                              
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                       
                                                                        <asp:TemplateField HeaderText="SMS Reply">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSMSReply" runat="server" Text='<%#Eval("replystatus") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="SMS Port">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSMSPort" runat="server" Text='<%#Eval("sms_port") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                       
                                                                        <asp:TemplateField HeaderText="Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRequestDescription" runat="server" width="150px" Text='<%#Eval("description") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                         <asp:TemplateField HeaderText="Status">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRequestStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                                                                
                                                                               <div style=" text-align:center">
                                                                               <asp:ImageButton ID="imgRequestStatus" runat="server" Width="15px" Height="15px" />
                                                                               </div>
                                                                                </ItemTemplate>
                                                                            <HeaderStyle Width="50px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                            <div style=" text-align:center">
                                                                                <asp:ImageButton ID="imgbtnRequestEdit" runat="server" Width="15px" Height="15px" CausesValidation="false"
                                                                                    ImageAlign="Middle" OnClick="imgbtnRequestEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                                                                     <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnRequestEdit"
                                                                               ConfirmOnFormSubmit="true" ConfirmText="Are you sure you want to Update this?">
                                                                                </asp:ConfirmButtonExtender>
                                                                                </div>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="40px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                           
                                                        </asp:UpdatePanel>
                                                    </p>
                                                </li>
                                            </ul>
                                            <!-- ==================== END OF SEVENTH TAB CONTENT ==================== -->
                                           
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

