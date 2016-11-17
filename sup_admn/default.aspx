<%@ Page Title="" Language="C#" MasterPageFile="~/sup_admn/sup_admn_master.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="sup_admn_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta charset="utf-8">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
        <title>CannyBee Solutions</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
<link rel="Stylesheet" href="../css/additional.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />

        <link rel="stylesheet" href="../css/styles.css" />

        <style type="text/css">
          
  th
    {
        text-align:center !important;
     
        }

        ul.masterActions li {
background-color: white;
cursor: pointer;
display: inline-block;
height: 70px !important;
padding-bottom: 10px;
text-align: left;
width: 70px !important;
-webkit-box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, .3);
box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, .3);
position: relative;
transition: all .2s linear;
-webkit-transition: all .2s linear;
margin-left: 0;
margin-right: 30px;
margin-bottom: 30px;
}
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="content">

            <!-- ==================== TITLE LINE FOR HEADLINE ==================== -->
            <div class="titleLine">
                <div class="container-fluid">
                    <div class="titleIcon"><i class="icon-dashboard"></i></div>
                    <ul class="titleLineHeading">
                        <li class="heading"><h1>Dashboard</h1></li>
                    </ul>                    
                </div>
            </div>
            <!-- ==================== END OF TITLE LINE ==================== -->

            <!-- ==================== BREADCRUMBS / DATETIME ==================== -->
            <ul class="breadcrumb">
                <li><i class="icon-home"></i>
                <li class="active">Dashboard</li>
                <li class="moveDown pull-right">
                    <span class="time">14:07:08</span>
                    <span class="date">Thursday 20 February 2014</span>
                </li>    
            </ul>
            <!-- ==================== END OF BREADCRUMBS / DATETIME ==================== -->

            <!-- ==================== WIDGETS CONTAINER ==================== -->
            <div class="container-fluid">

                <!-- ==================== MASTER ACTIONS ROW ==================== -->
                <div class="row-fluid">
                    <div class="span4">
                        <div class="floatingBox" style="min-height:300px">
                            <!-- ==================== ALLWAY TOP TABS ==================== -->
                            <ul class="nav nav-tabs nav-tabs-normal" style="margin-bottom: 10px !important">
                                <li class="active"><a href="#RoomsTab1">To Day Calls</a></li>
                                <li><a href="#RoomsTab2">Assigned Calls</a></li>
                                <li><a href="#RoomsTab3">Closed Calls</a></li>                              
                            </ul>
                            <!-- ==================== END OF ALLWAY TOP TABS ==================== -->
                            <div class="container-fluid">
                                <!-- ==================== FIRST TAB CONTENT ==================== -->
                                <ul id="RoomsTab1">
                                    <li>
                                        <ul class="masterActions">
                                            <li class="active"><i class="redText" style="margin-left: 0px; margin-top: 2px;">
                                                <asp:Label ID="lblTotalCalls" runat="server"  CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="redText">
                                                    Total</h1>
                                                <p>
                                                    Calls</p>
                                            </li>
                                            <li><i class="cyanText" style="margin-left: 0px;">
                                                <asp:Label ID="lblAssignedCalls" runat="server"  CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="cyanText">
                                                    Assigned</h1>
                                                <p>
                                                    Calls</p>
                                            </li>
                                            <li><i class="greenText" style="margin-left: 0px;">
                                                <asp:Label ID="lblClosedCalls" runat="server" CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="greenText">
                                                    Closed</h1>
                                                <p>
                                                    Calls
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <!-- ==================== END OF FIRST TAB CONTENT ==================== -->
                                <!-- ==================== SECOND TAB CONTENT ==================== -->
                                <ul id="RoomsTab2" style="display: none">
                                    <li>
                                      <asp:UpdatePanel ID="updatePanel1" runat="server">
                                                            <ContentTemplate>
                                        <asp:GridView ID="grid_asscalls" EmptyDataText="No Assined Calls Today" runat="server" ShowHeader="true" Width="90%" 
                                       OnPageIndexChanging="grid_asscalls_PageIndexChanging" AllowPaging="true" PageSize="5" 
                                        AutoGenerateColumns="false" CssClass="tablesorter centerFirstLast tablesorter-default hasFilters">
                                        <Columns>
                                        <asp:TemplateField>
                                        <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Ticked ID" DataField="reqno" />
                                        <asp:BoundField HeaderText="Assigned To" DataField="emp_name" />
                                        <asp:BoundField HeaderText="Assigned Time" DataField="assign_time" />
                                        </Columns>
                                        </asp:GridView>
                                        </ContentTemplate>
                                        </asp:UpdatePanel>
                                       
                                    </li>
                                </ul>
                                <!-- ==================== END OF SECOND TAB CONTENT ==================== -->
                                <!-- ==================== THIRD CONTENT ==================== -->
                                <ul id="RoomsTab3" style="display: none">
                                    <li>
                                            <asp:UpdatePanel ID="updatePanel2" runat="server">
                                                            <ContentTemplate>
                                        <asp:GridView ID="grid_close_calls" runat="server" ShowHeader="true" Width="90%"  EmptyDataText="No Closed Calls Today"
                                       OnPageIndexChanging="grid_close_calls_PageIndexChanging" AllowPaging="true" PageSize="5" 
                                        AutoGenerateColumns="false" CssClass="tablesorter centerFirstLast tablesorter-default hasFilters">
                                        <Columns>
                                        <asp:TemplateField>
                                        <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Ticked ID" DataField="reqno" />
                                        <asp:BoundField HeaderText="Assigned To" DataField="emp_name" />
                                        <asp:BoundField HeaderText="Assigned Time" DataField="assign_time" />
                                         <asp:BoundField HeaderText="Closed Time" DataField="close_time" />
                                        </Columns>
                                        </asp:GridView>
                                       </ContentTemplate>
                                       </asp:UpdatePanel>
                                    </li>
                                </ul>
                                <!-- ==================== END OF THIRD TAB CONTENT ==================== -->                              
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="floatingBox"  style="min-height:300px">
                            <!-- ==================== ALLWAY TOP TABS ==================== -->
                            <ul class="nav nav-tabs nav-tabs-normal" style="margin-bottom: 10px !important">
                                <li class="active"><a href="#ServiceTab1">Weekly Calls</a></li>
                                <li><a href="#ServiceTab2">Assigned Calls</a></li>
                                <li><a href="#ServiceTab3">Closed Calls</a></li>                                 
                            </ul>
                            <!-- ==================== END OF ALLWAY TOP TABS ==================== -->
                            <div class="container-fluid">
                                <!-- ==================== FIRST TAB CONTENT ==================== -->
                                <ul id="ServiceTab1">
                                    <li>
                                        <ul class="masterActions">
                                            <li class="active"><i class="redText" style="margin-left: 0px; margin-top: 2px;">
                                                <asp:Label ID="lblTotalCalls2" runat="server" CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="redText">
                                                    Total</h1>
                                                <p>
                                                    Calls</p>
                                            </li>
                                            <li><i class="cyanText" style="margin-left: 0px;">
                                                <asp:Label ID="lblAssignedCalls2" runat="server" CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="cyanText">
                                                    Assigned </h1>
                                                <p>
                                                    Calls</p>
                                            </li>
                                            <li><i class="greenText" style="margin-left: 0px;">
                                                <asp:Label ID="lblClosedCalls2" runat="server" CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="greenText">
                                                    Closed</h1>
                                                <p>
                                                    Calls
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <!-- ==================== END OF FIRST TAB CONTENT ==================== -->
                                <!-- ==================== SECOND TAB CONTENT ==================== -->
                                <ul id="ServiceTab2" style="display: none">
                                    <li>
                                             <asp:UpdatePanel ID="updatePanel3" runat="server">
                                                            <ContentTemplate>
                                        <asp:GridView ID="grid_asscalls2" runat="server" ShowHeader="true" Width="90%" EmptyDataText="No Assigned Calls this Week"
                                       OnPageIndexChanging="grid_asscalls2_PageIndexChanging" AllowPaging="true" PageSize="5" 
                                        AutoGenerateColumns="false" CssClass="tablesorter centerFirstLast tablesorter-default hasFilters">
                                        <Columns>
                                        <asp:TemplateField>
                                        <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField HeaderText="Ticked ID" DataField="reqno" />
                                        <asp:BoundField HeaderText="Assigned To" DataField="emp_name" />
                                        <asp:BoundField HeaderText="Assigned Time" DataField="assign_time" />
                                        </Columns>
                                        </asp:GridView>
                                       </ContentTemplate>
                                       </asp:UpdatePanel>
                                    </li>
                                </ul>
                                <!-- ==================== END OF SECOND TAB CONTENT ==================== -->
                                <!-- ==================== THIRD CONTENT ==================== -->
                                <ul id="ServiceTab3" style="display: none">
                                    <li>
                                         <asp:UpdatePanel ID="updatePanel4" runat="server">
                                                            <ContentTemplate>
                                        <asp:GridView ID="grid_close_calls2" runat="server" ShowHeader="true" Width="90%" EmptyDataText="No Closed Calls this Week"
                                       OnPageIndexChanging="grid_close_calls2_PageIndexChanging" AllowPaging="true" PageSize="5" 
                                        AutoGenerateColumns="false" CssClass="tablesorter centerFirstLast tablesorter-default hasFilters">
                                        <Columns>
                                        <asp:TemplateField>
                                        <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Ticked ID" DataField="reqno" />
                                        <asp:BoundField HeaderText="Assined To" DataField="emp_name" />
                                        <asp:BoundField HeaderText="Assined Time" DataField="assign_time" />
                                         <asp:BoundField HeaderText="Closed Time" DataField="close_time" />
                                        </Columns>
                                        </asp:GridView>
                                      </ContentTemplate>
                                      </asp:UpdatePanel>
                                    </li>
                                </ul>
                                <!-- ==================== END OF THIRD TAB CONTENT ==================== -->                               
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="floatingBox"  style="min-height:300px">
                            <!-- ==================== ALLWAY TOP TABS ==================== -->
                            <ul class="nav nav-tabs nav-tabs-normal" style="margin-bottom: 10px !important">
                                <li class="active"><a href="#EmployeeTab1">Monthly Calls</a></li>
                                <li><a href="#EmployeeTab2">Assigned Calls</a></li>
                                <li><a href="#EmployeeTab3">Closed Calls</a></li>
                            </ul>
                            <!-- ==================== END OF ALLWAY TOP TABS ==================== -->
                            <div class="container-fluid">
                                <!-- ==================== FIRST TAB CONTENT ==================== -->
                                <ul id="EmployeeTab1">
                                    <li>
                                        <ul class="masterActions">
                                            <li class="active"><i class="redText" style="margin-left: 0px; margin-top: 2px;">
                                                <asp:Label ID="lblTotalCalls3" runat="server" CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="redText">
                                                    Total</h1>
                                                <p>
                                                   Calls</p>
                                            </li>
                                            <li><i class="cyanText" style="margin-left: 0px;">
                                                <asp:Label ID="lblAssignedCalls3" runat="server" CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="cyanText">
                                                    Assigned</h1>
                                                <p>
                                                    Calls</p>
                                            </li>
                                            <li><i class="greenText" style="margin-left: 0px;">
                                                <asp:Label ID="lblClosedCalls3" runat="server" CssClass="dashboard_label"></asp:Label>
                                            </i>
                                                <h1 class="greenText">
                                                    Closed</h1>
                                                <p>
                                                    Calls
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <ul id="EmployeeTab2" style="display: none">
                                    <li>
                                            <asp:UpdatePanel ID="updatePanel5" runat="server">
                                                            <ContentTemplate>
                                        <asp:GridView ID="grid_asscalls3" runat="server" ShowHeader="true" Width="90%" EmptyDataText="No Assigned Calls this Month"
                                       OnPageIndexChanging="grid_asscalls3_PageIndexChanging" AllowPaging="true" PageSize="5" 
                                        AutoGenerateColumns="false" CssClass="tablesorter centerFirstLast tablesorter-default hasFilters">
                                        <Columns>
                                        <asp:TemplateField>
                                        <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Ticked ID" DataField="reqno" />
                                        <asp:BoundField HeaderText="Assined To" DataField="emp_name" />
                                        <asp:BoundField HeaderText="Assined Time" DataField="assign_time" />
                                        </Columns>
                                        </asp:GridView>
                                   </ContentTemplate>
                                   </asp:UpdatePanel>
                                    </li>
                                </ul>
                                <!-- ==================== END OF FIRST TAB CONTENT ==================== -->
                                <!-- ==================== SECOND TAB CONTENT ==================== -->
                                <ul id="EmployeeTab3" style="display: none">
                                    <li>
                                             <asp:UpdatePanel ID="updatePanel6" runat="server">
                                                            <ContentTemplate>
                                        <asp:GridView ID="grid_close_calls3" runat="server" ShowHeader="true" Width="90%" EmptyDataText="No Closed Calls this Month"
                                       OnPageIndexChanging="grid_close_calls3_PageIndexChanging" AllowPaging="true" PageSize="5"                                        
                                        AutoGenerateColumns="false" CssClass="tablesorter centerFirstLast tablesorter-default hasFilters">
                                        <Columns>
                                        <asp:TemplateField>
                                        <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Ticked ID" DataField="reqno" />
                                        <asp:BoundField HeaderText="Assined To" DataField="emp_name" />
                                        <asp:BoundField HeaderText="Assined Time" DataField="assign_time" />
                                         <asp:BoundField HeaderText="Closed Time" DataField="close_time" />
                                        </Columns>
                                        </asp:GridView>
                                      </ContentTemplate>
                                      </asp:UpdatePanel>
                                    </li>
                                </ul>
                                <!-- ==================== END OF SECOND TAB CONTENT ==================== -->
                              
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ==================== END OF MASTER ACTIONS ROW ==================== -->

                <!-- ==================== DIVIDER ROW ==================== -->
                <div class="row-fluid">
                    <div class="span12 contentDivider"></div>
                </div>
              
            </div>
            <!-- ==================== END OF WIDGETS CONTAINER ==================== -->
        </div>
</asp:Content>

