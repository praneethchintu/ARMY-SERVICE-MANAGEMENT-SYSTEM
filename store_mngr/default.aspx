<%@ Page Title="" Language="C#" MasterPageFile="~/store_mngr/store_mngr_master.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="store_mngr_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">
      th
    {
        text-align:center !important;
     
        }
.border
{
    border-right:1px solid #000;
    
    }
    .center_align
    {
        text-align:center !important;
        
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content">
  <div class="container-fluid">
  <div class="floatingBox">
   <div class="row-fluid" style="margin-top:0px !important">
         <asp:Timer runat="server" ID="Timer1" Interval="60000" OnTick="Timer1_Tick" Enabled="true">
                           </asp:Timer>
    
               <div class="span3 allwayTab allwayTab-bottom"  style="margin-left:0px !important">
                   <div class="containerHeadline">
                       <i class="icon-reorder"></i>
                       <h2>
                           SUMMARY</h2>
                       <div class="controlButton pull-right">
                           <i class="icon-remove removeElement"></i>
                       </div>
                       <div class="controlButton pull-right">
                           <i class="icon-caret-down minimizeElement"></i>
                       </div>
                   </div>
                   <!-- ==================== END OF ALLWAY TAB HEADLINE ==================== -->
                   <!-- ==================== ALLWAY BOTTOM TAB FLOATING BOX ==================== -->
                   <div class="floatingBox">
                       <div class="container-fluid" style="height:120px !Important">
                           <!-- ==================== FIRST TAB CONTENT ==================== -->
                           <ul id="bottomtab1">
                               <li>
                                   <p>
                                      PRODUCTS ( <asp:Label ID="lblTotalProducts" runat="server" ForeColor="Green"></asp:Label> )
                                      <table width="100%">
                                      <tr style="text-align:center;">
                                      <td class="border">Store</td>
                                      <td class="border">In Use</td>
                                      <td class="border">Repair</td>
                                      <td class="border">Exp/Disp</td>
                                      </tr>
                                      <tr style="text-align:center; font-weight:bold">
                                      <td class="border"><asp:Label ID="lblProductStore" runat="server" ForeColor="Green" ToolTip="Store"></asp:Label></td>
                                      <td class="border"><asp:Label ID="lblProductUse" runat="server" ForeColor="Purple" ToolTip="Use"></asp:Label></td>
                                      <td class="border"><asp:Label ID="lblProductRepair" runat="server" ForeColor="Orange" ToolTip="Repair"></asp:Label></td>
                                      <td class="border"><asp:Label ID="lblProductsExpDisp" runat="server" ForeColor="Red"  ToolTip="Expire/Disposed"></asp:Label></td>
                                      </tr>
                                      </table>
                                       
                                       </p>
                               </li>
                           </ul>
                           <!-- ==================== END OF FIRST TAB CONTENT ==================== -->
                           <!-- ==================== SECOND TAB CONTENT ==================== -->
                           <ul id="bottomtab2" style="display: none">
                               <li>
                                   <p>
                                        TICKETS ( <asp:Label ID="lblTicketsTotal" runat="server" ForeColor="Green"></asp:Label> )
                                      <table width="100%">
                                      <tr style="text-align:center">
                                      <td class="border">Open</td>
                                      <td class="border">Close</td>
                                      <td class="border">Hold</td>                                   
                                      </tr>
                                      <tr style="text-align:center; font-weight:bold">
                                      <td class="border"><asp:Label ID="lblTicketsOpen" runat="server" ForeColor="Green" ToolTip="Open"></asp:Label></td>                                   
                                      <td class="border"><asp:Label ID="lblTicketsClose" runat="server" ForeColor="Orange" ToolTip="Close"></asp:Label></td>
                                      <td class="border"><asp:Label ID="lblTicketsHold" runat="server" ForeColor="Red" ToolTip="Hold"></asp:Label></td>
                                      </tr>
                                      </table></p>
                               </li>
                           </ul>
                           <!-- ==================== END OF SECOND TAB CONTENT ==================== -->
                           <!-- ==================== THIRD CONTENT ==================== -->
                           <ul id="bottomtab3" style="display: none">
                               <li>
                                   <p>
                                       CONTRACTS ( <asp:Label ID="lblContractsTotal" runat="server" ForeColor="Green" ToolTip="Total Contracts"></asp:Label> )
                                      <table width="100%">
                                      <tr style="text-align:center">
                                      <td class="border">Active</td>
                                      <td class="border">Close to Exp</td>
                                      <td class="border">InActive</td>                                   
                                      </tr>
                                      <tr style="text-align:center; font-weight:bold">
                                      <td class="border"><asp:Label ID="lblContractsActive" runat="server" ForeColor="Green" ToolTip="Active"></asp:Label></td>                                   
                                      <td class="border"><asp:Label ID="lblContractsCloseToExp" runat="server" ForeColor="Orange" ToolTip="Close to Expire"></asp:Label></td>
                                      <td class="border"><asp:Label ID="lblContractsInActive" runat="server" ForeColor="Red" ToolTip="InActive"></asp:Label></td>
                                      </tr>
                                      </table></p>
                               </li>
                           </ul>
                           <!-- ==================== END OF THIRD TAB CONTENT ==================== -->
                           <!-- ==================== FOURTH TAB CONTENT ==================== -->
                           <ul id="bottomtab4" style="display: none">
                               <li>
                                   <p>
                                   <div style="text-align:center">
                                       POs &nbsp;&nbsp;
                                       <asp:Label ID="lblTotalPOs" runat="server"></asp:Label>
                                       &nbsp;&nbsp;
                                       
                                       </div>
                                       </p>
                               </li>
                           </ul>
                           <!-- ==================== END OF FOURTH TAB CONTENT ==================== -->
                       </div>
                       <!-- ==================== ALLWAY RIGHT TABS ==================== -->
                       <ul class="nav nav-tabs nav-tabs-primary">
                           <li class="active"><a href="#bottomtab1">ASSETS</a></li>
                           <li><a href="#bottomtab2" runat="server" id="tickets">TICKETS</a></li>
                           <li><a href="#bottomtab3" style="width:60px">CONTRACTS</a></li>
                           <li><a href="#bottomtab4">POs</a></li>
                       </ul>
                       <!-- ==================== END OF ALLWAY RIGHT TABS ==================== -->
                   </div>
               </div>
               <!-- ==================== END OF ALLWAY RIGHT TAB FLOATING BOX ==================== -->
               <div class="span9">
                   <div class="containerHeadline tableHeadline">
                       <i class="icon-group"></i>
                       <h2>
                           TICKETS</h2>
                   </div>
                   <div class="floatingBox table">
                       <div class="container-fluid">
                           <!-- ==================== TABLESORTER TABLE ==================== -->
                            <asp:UpdatePanel ID="up1" runat="server">
           <ContentTemplate>
          
                           <asp:GridView ID="grid_tiket_list" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                               PageSize="8" OnPageIndexChanging="paging" DataKeyNames="incident_id" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                               Style="width: 100%">
                               <Columns>
                                   <asp:TemplateField  HeaderText="S.No.">
                                       <ItemTemplate>
                                          <div style="text-align:center">
                                           <%#Container.DataItemIndex+1 %>
                                           </div>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Ticket No." HeaderStyle-Width="40px">
                                       <ItemTemplate>
                                       <div style="text-align:center">
                                           <asp:Label ID="lblTicket" runat="server" Text='<%#Eval("incident_id") %>'></asp:Label>
                                           </div>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Subject">
                                       <ItemTemplate>
                                           <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("incident_subject") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Product">
                                       <ItemTemplate>
                                           <asp:Label ID="lblProduct" runat="server" Text='<%#Eval("prod_name") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Status" HeaderStyle-Width="60px" ItemStyle-CssClass="center_align">
                                       <ItemTemplate>
                                           <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Open Time" HeaderStyle-Width="130px" ItemStyle-CssClass="center_align">
                                       <ItemTemplate>
                                           <asp:Label ID="lblOpenTime" runat="server" Text='<%#Eval("mngr_cr_date") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Closed Time" HeaderStyle-Width="130px" ItemStyle-CssClass="center_align">
                                       <ItemTemplate>
                                           <asp:Label ID="lblClosedTime" runat="server" Text='<%#Eval("tech_date") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Duration (in HH:MM)" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Right">
                                       <ItemTemplate>
                                           <asp:Label ID="lblDuration" runat="server" Text='<%#Eval("duration") %>' style="float:right !important"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Time as per Contract(in hrs)" HeaderStyle-Width="100px">
                                       <ItemTemplate>
                                           <asp:Label ID="lblTierHrs" runat="server" Text='<%#Eval("tier_hours") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                           </asp:GridView>
                            </ContentTemplate>
           <Triggers>
           <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
           </Triggers>
       </asp:UpdatePanel>
                       </div>
                   </div>
               </div>
          
                </div>
                </div>
                </div>
                </div>
</asp:Content>

