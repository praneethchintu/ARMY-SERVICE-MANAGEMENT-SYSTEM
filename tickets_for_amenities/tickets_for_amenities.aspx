<%@ Page Title="" Language="C#" MasterPageFile="~/incident_creation/MasterIncident.master" AutoEventWireup="true" CodeFile="tickets_for_amenities.aspx.cs" Inherits="incident_creation_incident" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
         th
    {
        text-align:center !important;
     
     
	height:30px;
	text-align:center;
	}
	
	.mainmenu ul.nav li.divider-vertical
	{
	border-bottom:0;
	display:none;
	}

    .mainmenu ul.nav li.divider-vertical
    {
    border:0;
    height:30px;
    margin:0px;
    padding:0px;
    width:1px;
    -webkit-box-shadow:none;
    }
    .mainmenu ul.nav li.divider-vertical.firstDivider
    {
    margin-left:20px;	
    }
    
    .mainmenu ul.nav li.divider-vertical
    {
    background:rgba(0,0,0,0.2);	
    }
    
    
    .mainmenu ul.nav li
    {
    float:left;
    font-size:11px;
    font-weight:normal;
    text-transform:lowercase;
    	list-style-type:none;
    	text-align:center;
    	text-shadow:0 1px 0 rgba(0,0,0,0.3);
    	
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <div class="mainmenu">
            <div class="container-fluid">
                <ul class="nav">
                    <li class="divider-vertical firstDivider"></li>
                   <li class="dropdown-toggle" id="Li3"><a href="../incident_creation/incident.aspx"><i class="icon-tint"></i> INCIDENT</a></li>
                    
                    <li class="divider-vertical"></li>
                  <li class="dropdown-toggle" id="Li4"><a href="../tickets_for_amenities/tickets_for_amenities.aspx"><i class="icon-tint"></i> TICKETS</a></li>
                    <li class="divider-vertical"></li>
                   
                </ul>
           </div>
        </div>

    <div class="content">

        <div class="container-fluid">
       
            <asp:UpdatePanel ID="updatepanel1" runat="server">
                <ContentTemplate>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="containerHeadline">
                                <i class="icon-tag"></i>
                                <h2>
                                    TICKETS
                                </h2>
                            </div>
                            <div class="floatingBox examples">
                                <div class="container-fluid">
                                    <div class="span12">
                                        <asp:Label ID="lblIncidentResult" runat="server" ></asp:Label>

                                       <asp:Timer ID="Timer1" Enabled="false" runat="server" OnTick="Timer1_Tick">
                                        </asp:Timer>
                                        <asp:Panel ID="panelIncidents" CssClass="span10" runat="server" Visible="false">
                                            <table width="60%" style="margin-left: 15%;margin-bottom:30px">
                                                <tr>
                                                    <td>
                                                        Mode
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlMode" runat="server" Width="135px">
                                                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Email" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Phone Call" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Web Form" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlMode"
                                                            InitialValue="0" ErrorMessage="**" CssClass="validation" ValidationGroup="incident"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        Subject
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtsuject" CssClass="span4" runat="server" Width="134px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtsuject"
                                                            CssClass="validation" ErrorMessage="**" ValidationGroup="incident"></asp:RequiredFieldValidator>
                                                    </td>

                                                    
                                                    <td>
                                                        Issue Item
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlissuecode" runat="server" Width="135px">
<%--                                                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Chair" Value="23"></asp:ListItem>
                                                            <asp:ListItem Text="LCD TV" Value="24"></asp:ListItem>
                                                            <asp:ListItem Text="BIKE" Value="25"></asp:ListItem>--%>
                                                            <%--<asp:ListItem Value="0">--select--</asp:ListItem>
                                            <asp:ListItem Value="1">LP001</asp:ListItem>
                                            <asp:ListItem Value="2">PC001</asp:ListItem>
                                            <asp:ListItem Value="3">LP002</asp:ListItem>--%>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlissuecode"
                                                            InitialValue="0" ErrorMessage="**" CssClass="validation" ValidationGroup="incident"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                   
                                                    <td>
                                                        Flat Address
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFlatAddr" runat="server" Text="Flat Address" Width="121px"></asp:TextBox>
                                                        <asp:Label ID="lblFlat_id" runat="server" Visible="false"></asp:Label>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFlatAddr"
                                                            InitialValue="0" ErrorMessage="**" CssClass="validation" ValidationGroup="incident"></asp:RequiredFieldValidator>
                                                    </td>

                                                    <td>
                                                        Phone No
                                                    </td>
                                                    <td>
                                                        +91<asp:TextBox ID="txtphno" CssClass="span4" MaxLength="10" runat="server" Width="114px"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender ID="filternotxtno" FilterType="Numbers" TargetControlID="txtphno"
                                                            runat="server">
                                                        </asp:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtphno"
                                                            CssClass="validation" ErrorMessage="**" ValidationGroup="incident"></asp:RequiredFieldValidator>
                                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="**"
                                                                                    ValidationExpression="^[6789]\d{9}$" ControlToValidate="txtphno" CssClass="validation"
                                                                                    ValidationGroup="incident"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>
                                                        Priority
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlPriority" runat="server" Width="135px">
                                                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="High" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Medium" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Low" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Normal" Value="4"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPriority"
                                                            InitialValue="0" ErrorMessage="**" CssClass="validation" ValidationGroup="incident"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr runat="server" id="trassign">

                                                <td>
                                                    Assign Department
                                                    </td>
                                                    <td>
                                                    
                                                    <asp:DropDownList ID="ddl_assign_dept" runat="server" Width="135px" OnSelectedIndexChanged="ddl_assign_dept_indexchanged" autopostback="true">
                                                    <asp:ListItem Value="0" Text="--select--"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Technician"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="StoreManager"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        Assign to
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlemp" runat="server" Width="135px">
                                                        </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlemp"
                                                            InitialValue="0" ErrorMessage="**" CssClass="validation" ValidationGroup="incident1"></asp:RequiredFieldValidator>
                                                    
                                                    </td>
                                                    <td>
                                                        Issue Status
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlissuestatus" runat="server" Width="135px">
                                                            <asp:ListItem Value="0">Open</asp:ListItem>
                                                            <asp:ListItem Value="1">On Hold</asp:ListItem>
                                                            <asp:ListItem Value="2">Resolved</asp:ListItem>
                                                            <asp:ListItem Value="3">Closed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    </tr>
                                                    <tr>

                                                   <td>
                                                        Description
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="121px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtDescription"
                                                            CssClass="validation" ErrorMessage="**" ValidationGroup="incident"></asp:RequiredFieldValidator>
                                                    </td>

                                                     <td>
                                                        Comments
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Width="121px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtComments"
                                                            CssClass="validation" ErrorMessage="**" ValidationGroup="incident"></asp:RequiredFieldValidator>
                                                    </td>
                                                  
                                                    <td colspan="2">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                </table>
                                                <table  width="60%" style="margin-left: 15%;margin-bottom:30px">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblhide" Visible="false" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="center">
                                                       
                                                        <asp:Button ID="btnupdate" runat="server" Visible="false" Text="Update" CssClass="btn  btn-primary"
                                                            ValidationGroup="incident" OnClick="btnupdate_Click" Style="margin-left:70px" />
                                                   
                                                       
                                                        <asp:Button ID="btnIncidentCancel" runat="server" Text="Cancel" CssClass="btn btn-danger"
                                                            Style="margin-left: 10px" OnClick="btnIncidentCancel_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="panelIncidentList" runat="server">
                                            <asp:GridView ID="grid_incident_list" runat="server" DataKeyNames="code,id,auto_id,Flat_id,req_type_id,priority_type_id,issuestatus_id,emp_id"
                                                AutoGenerateColumns="false" EmptyDataText="sorry No data found" EmptyDataRowStyle-BackColor="Red" AllowPaging="true"
                                                OnPageIndexChanging="grid_incident_list_PageIndexChanging" PageSize="10"
                                                CssClass="tablesorter-default table-striped" Style="margin-left: 0%; width: 100%;margin-top:30px">
                                                <%--id,,,,,,,,,req_type_id,priority_type_id,subject--%>
                                                <Columns>
                                                 <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SUBJECT">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("subject") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="REQUESTER">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRequester" Text='<%#Eval("empname") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ISSUE">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblissue" runat="server" Text='<%#Eval("service_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ROOM NO">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblroom_no" runat="server" Text='<%#Eval("roomno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="PHONE NO">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblphone_no" runat="server" Text='<%#Eval("phoneno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="REQ NO">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblreq_no" runat="server" Text='<%#Eval("reqno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="REPLY STATUS">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblreplay_status" runat="server" Text='<%#Eval("replay_status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="REQ TYPE">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblreq_type" runat="server" Text='<%#Eval("req_type") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="STATUS">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("issuestatus") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CREATED ON">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCreatedOn" runat="server" Text='<%#Eval("date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                   <%-- <asp:TemplateField HeaderText="CLOSE TIME">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClose" runat="server" Text='<%#Eval("close_time") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="PRIORITY">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPriority" runat="server" Text='<%#Eval("priority_type") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DESCRIPTION" HeaderStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                   <%-- <asp:TemplateField HeaderText="ASSIGN TO" HeaderStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblassignto" Text='<%#Eval("emp_name") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="COMMENTS" HeaderStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblComments" runat="server" Text='<%#Eval("comments") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
--%>                                                    <asp:TemplateField HeaderText="EDIT">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgedit" OnClick="grid_edit_click" runat="server" ImageUrl="~/Icons/1385390972_write.png"
                                                                Height="20" Width="20" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="Timer1" />
                </Triggers>
            </asp:UpdatePanel>
            
        </div>
    </div>
</asp:Content>


