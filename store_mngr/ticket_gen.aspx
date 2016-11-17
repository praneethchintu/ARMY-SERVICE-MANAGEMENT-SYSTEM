<%@ Page Title="" Language="C#" MasterPageFile="~/store_mngr/store_mngr_master.master"
    AutoEventWireup="true" CodeFile="ticket_gen.aspx.cs" Inherits="store_mngr_ticket_gen" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        th
        {
            text-align: center !important;
        }
        .MyTabStyle .ajax__tab_header
        {
            font-family: "Helvetica Neue" , Arial, Sans-Serif;
            font-size: 14px;
            font-weight: bold;
            display: block;
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_outer
        {
            border-color: #222;
            color: #222;
            padding-left: 10px;
            margin-right: 3px;
            border: solid 1px #d7d7d7;
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_inner
        {
            border-color: #666;
            color: #666;
            padding: 3px 10px 2px 0px;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_outer
        {
            background-color: #9c3;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_inner
        {
            color: #fff;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_outer
        {
            border-bottom-color: #ffffff;
            background-color: #d7d7d7;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_inner
        {
            color: #000;
            border-color: #333;
        }
        .MyTabStyle .ajax__tab_body
        {
            font-family: verdana,tahoma,helvetica;
            font-size: 10pt;
            background-color: #fff;
            border-top-width: 0;
            border: solid 1px #d7d7d7;
            border-top-color: #ffffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="containerHeadline">
                    <i class="icon-tag"></i>
                    <h2>
                        TICKET GENERATION
                    </h2>
                </div>
                <div class="floatingBox examples">
                    <div class="container-fluid">
                        <div class="span12">
                            <div class="floatingBox">
                                <asp:UpdatePanel ID="up1" runat="server">
                                    <ContentTemplate>
                                        <asp:TabContainer ID="Tab_Incidents" runat="server" ActiveTabIndex="0" Visible="true"
                                            Width="100%" CssClass="MyTabStyle">
                                            <asp:TabPanel ID="tab1" HeaderText="Incidents" runat="server">
                                                <ContentTemplate>
                                                    <asp:GridView ID="grid_incident_list_sm" runat="server" AutoGenerateColumns="false" EmptyDataText="No INCIDENTS"
                                                        DataKeyNames="incident_id" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                                        Style="margin-left: 15%; width: 70%">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Button ID="btnEditDescription" Style="width: 20px; height: 20px;" class="btn btn-mini"
                                                                        runat="server" Text="#" title="Generate Ticket" OnClick="btnAddDescription_Click" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Subject">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("incident_subject") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Requester">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRequester" runat="server" Text='<%#Eval("emp_name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Service Category">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblServiceCategory" runat="server" Text='<%#Eval("service_category_name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Status">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Created On">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCreatedOn" runat="server" Text='<%#Eval("cr_date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Priority">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPriority" runat="server" Text='<%#Eval("priority") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Description" HeaderStyle-Width="150px">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel ID="tab2" HeaderText="Tickets" runat="server">
                                                <ContentTemplate>
                                                    <asp:GridView ID="grid_tiket_list" runat="server" AutoGenerateColumns="false" DataKeyNames="incident_id"
                                                      EmptyDataText="No TICKETS"  CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                                        Style="margin-left: 15%; width: 70%">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Button ID="btnEditDescription" Style="width: 20px; height: 20px;" class="btn btn-mini"
                                                                        runat="server" Text="#" title="Edit" OnClick="btnEditDescription_Click" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Subject">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("incident_subject") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Service Category">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblServiceCategory" runat="server" Text='<%#Eval("service_category_name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Assigned To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("respect_emp_name") %>'></asp:Label>
                                                                    <asp:Label ID="lblVendor" runat="server" Text='<%#Eval("respect_emp_id") %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Status">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Created On">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCreatedOn" runat="server" Text='<%#Eval("mngr_cr_date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Description" HeaderStyle-Width="150px">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMngrDesc" runat="server" Text='<%#Eval("mngr_comments") %>'></asp:Label>
                                                                    <asp:Label ID="lblEmpDesc" runat="server" Text='<%#Eval("description") %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                        <asp:Button ID="btndummy1" runat="server" Style="display: none" />
                                        <asp:ModalPopupExtender ID="popUpGenTicket" runat="server" TargetControlID="btndummy1"
                                            PopupControlID="panelGenerateTicket">
                                        </asp:ModalPopupExtender>
                                        <asp:Panel ID="panelGenerateTicket" runat="server" Width="350px" Height="500px">
                                            <div class="floatingBox">
                                                <div class="container-fluid">
                                                    <div class="row-fluid" style="margin-bottom: 0px !Important">
                                                        <div class="span12">
                                                            <div class="containerHeadline">
                                                                <i class="icon-ok-sign"></i>
                                                                <h2>
                                                                    Generate Ticket</h2>
                                                            </div>
                                                            <div class="floatingBox" style="margin-bottom: 0px !Important">
                                                                <div class="container-fluid">
                                                                    <div class="form-horizontal contentForm">
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <h5>
                                                                                        Employee Desc</h5>
                                                                                    <asp:Label ID="lblIncidentId" runat="server" Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblEmpDescription" runat="server" TextMode="MultiLine" Width="95%"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h5>
                                                                                        Vendor
                                                                                    </h5>
                                                                                    <asp:DropDownList ID="ddlEmployee" runat="server">
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlEmployee"
                                                                                        ErrorMessage="**" InitialValue="0" ValidationGroup="ticket" CssClass="validation"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h5>
                                                                                        Technician
                                                                                    </h5>
                                                                                    <asp:DropDownList ID="ddlTechnician" runat="server">
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTechnician"
                                                                                        ErrorMessage="**" InitialValue="0" ValidationGroup="ticket" CssClass="validation"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtEditDesc" runat="server" TextMode="MultiLine" Width="95%" Height="100px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtEditDesc"
                                                                                        ErrorMessage="**" ValidationGroup="ticket" CssClass="validation"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="lblDescResult" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right">
                                                                                    <asp:Button ID="btnGenTicketSave" runat="server" Text="Save" ValidationGroup="ticket"
                                                                                        CssClass="btn btn-mini btn-primary" OnClick="btnGenTicketSave_Click" />
                                                                                    <asp:Button ID="btnGenTicketCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                                                        Style="margin-left: 10px" OnClick="btnGenTicketCancel_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
