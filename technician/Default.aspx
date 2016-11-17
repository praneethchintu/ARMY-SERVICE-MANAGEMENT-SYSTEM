<%@ Page Title="" Language="C#" MasterPageFile="~/technician/technician_master_page.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="technician_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<div class="container-fluid">
   <div class="row-fluid" style="margin-top:30px !important">    

                  
                        <div class="span12">
                 <div class="containerHeadline tableHeadline">
                            <i class="icon-group"></i><h2>Tickets</h2>
                            <!-- ==================== TABLE CONTROLS ==================== -->
                             
                            <!-- ==================== END OF TABLE CONTROLS ==================== -->
                        </div>

                        <div class="floatingBox table">
                            <div class="container-fluid">


                              <asp:UpdatePanel id="up1" runat="server">
                              <ContentTemplate>
                              
                              
                                <asp:GridView ID="grid_tiket_list" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="15" OnPageIndexChanging="paging"
                                            DataKeyNames="incident_id" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                            Style="width: 100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button id="btnEditDescription" style="width: 20px; height: 20px;" class="btn btn-mini"
                                                            runat="server" Text="#" title="Status" OnClick="btnEditDescription_Click"  />                                                           
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
                                                <asp:TemplateField HeaderText="Assigned To">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("respect_emp_name") %>'></asp:Label>
                                                        <asp:Label ID="lblVendor" runat="server" Text='<%#Eval("respect_emp_id") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>                                              
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                    
                                                        <asp:Label ID="lblStatusId" runat="server" Text='<%#Eval("status_id") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Created On" HeaderStyle-Width="180px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCreatedOn" runat="server" Text='<%#Eval("mngr_cr_date") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Priority">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPriority" runat="server" Text='<%#Eval("priority") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Description" HeaderStyle-Width="150px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMngrDesc" runat="server" Text='<%#Eval("mngr_comments") %>' Width="150px"></asp:Label>
                                                          <asp:Label ID="lblEmpDesc" runat="server" Text='<%#Eval("description") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                           

                                  <asp:Button ID="btndummy1" runat="server" style="display:none" />
                                          <asp:ModalPopupExtender ID="popUpGenTicket" runat="server" TargetControlID="btndummy1"
                                                            PopupControlID="panelGenerateTicket" >
                                                        </asp:ModalPopupExtender>
                                        <asp:Panel ID="panelGenerateTicket" runat="server" Width="350px" Height="500px">
                                            <div class="floatingBox">
                                                <div class="container-fluid">
                                                    <div class="row-fluid" style="margin-bottom: 0px !Important">
                                                        <div class="span12">
                                                            <div class="containerHeadline">
                                                                <i class="icon-ok-sign"></i>
                                                                <h2>
                                                                    Add Solution</h2>
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
                                                                                       Manager Desc</h5>
                                                                                  <asp:Label ID="lblMngrDesc" runat="server" Width="95%"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                            <td>
                                                                            Status
                                                                            <asp:DropDownList ID="ddlStatus" runat="server" Width="100px"> 
                                                                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="Open" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="Close" Value="2"></asp:ListItem>
                                                                            <asp:ListItem Text="On Hold" Value="3"></asp:ListItem>                                                                           
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfv45" runat="server" ControlToValidate="ddlStatus" ErrorMessage="**" ValidationGroup="ticket" CssClass="validation" InitialValue="0">
                                                                            </asp:RequiredFieldValidator>
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
                                                                                        CssClass="btn btn-mini btn-primary" onclick="btnGenTicketSave_Click"  />
                                                                                    <asp:Button ID="btnGenTicketCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                                                        Style="margin-left: 10px" onclick="btnGenTicketCancel_Click"  />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                </div>

</div></div></div></div></asp:Panel>

                                 </ContentTemplate>
                              </asp:UpdatePanel>

                            </div>
                        </div>
                        </div>
                </div>
                </div>


</asp:Content>

