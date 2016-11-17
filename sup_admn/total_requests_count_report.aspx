<%@ Page Title="" Language="C#" MasterPageFile="~/sup_admn/sup_admn_master.master" AutoEventWireup="true" CodeFile="total_requests_count_report.aspx.cs" Inherits="reports_total_requests_count_report" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    .table th, .table td
    {
    	text-align:center !important;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <%--  <asp:UpdatePanel ID="upa1" runat="server">
        <ContentTemplate>--%>
          <div class="content">
           <div class="container-fluid">             
                <div class="row-fluid">
           
                        <div class="span12">
                            <div class="span7" style="margin-left: 5%">
                                <div class="containerHeadline">
                                    <i class="icon-ok-sign"></i>
                                    <h2>
                                        Incident Status Report
                                    </h2>
                                </div>
                                <div class="floatingBox">
                                    <div class="container-fluid">
                                        <div class="form-horizontal contentForm">
                                            <table width="100%">
                                                <tr>
                                                    <td align="left" style="font-weight: bold">
                                                        Report Type :
                                                        <asp:DropDownList ID="ddlReportType" runat="server" Width="80px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                                                            <asp:ListItem Text="Daily" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Monthly" Value="2"></asp:ListItem>                                                            
                                                            <asp:ListItem Text="Periodic" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="ddlReportType"
                                                            CssClass="validation" ErrorMessage="Select One Report Type">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="font-weight: bold">
                                                        <asp:Panel ID="pnlDay" runat="server" Width="100%">
                                                            Date :
                                                            <asp:TextBox ID="txtDay" runat="server" AutoPostBack="true" Width="120px" Text=""  OnTextChanged="ddlReportType_SelectedIndexChanged"></asp:TextBox>
                                                            <asp:CalendarExtender ID="clex1" runat="server" TargetControlID="txtDay" Format="yyyy-MM-dd" >
                                                            </asp:CalendarExtender>                                                            
                                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtDay" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Invalid"
                                                                                    ControlToValidate="txtDay" ValidationGroup="emp_reg" ValidationExpression="^\d{4}-((0[1-9])|(1[012]))-((0[1-9]|[12]\d)|3[01])$"
                                                                                    CssClass="validation"></asp:RegularExpressionValidator>
                                                                                
                                                                                <asp:FilteredTextBoxExtender ID="ftdob" runat="server" TargetControlID="txtDay"
                                                                                    FilterType="Numbers, Custom" ValidChars="-">
                                                                                </asp:FilteredTextBoxExtender>
                                                           
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="font-weight: bold">
                                                        <asp:Panel ID="pnlMonth" runat="server">
                                                            month :
                                                            <asp:DropDownList ID="ddlMonth" runat="server" Width="100px" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            Year :
                                                            <asp:DropDownList ID="ddlYear" runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="font-weight: bold">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Panel ID="pnlPeriodic" runat="server">
                                                            Start Date :
                                                            <asp:TextBox ID="txtStartDate" runat="server" Width="100px" AutoPostBack="true"  ValidationGroup="emp_reg2" OnTextChanged="ddlReportType_SelectedIndexChanged"></asp:TextBox>
                                                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate"
                                                                Format="yyyy-MM-dd">
                                                            </asp:CalendarExtender>
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtStartDate" CssClass="validation" ValidationGroup="emp_reg2"></asp:RequiredFieldValidator>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid"
                                                                                    ControlToValidate="txtStartDate" ValidationGroup="emp_reg2" ValidationExpression="^\d{4}-((0[1-9])|(1[012]))-((0[1-9]|[12]\d)|3[01])$"
                                                                                    CssClass="validation"></asp:RegularExpressionValidator>
                                                                                
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtStartDate"
                                                                                    FilterType="Numbers, Custom" ValidChars="-">
                                                                                </asp:FilteredTextBoxExtender>
                                                            End Date :
                                                            <asp:TextBox ID="txtEndDate" runat="server" Width="100px" OnTextChanged="ddlReportType_SelectedIndexChanged"  ValidationGroup="emp_reg3"
                                                                AutoPostBack="true"></asp:TextBox>
                                                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate"
                                                                Format="yyyy-MM-dd">
                                                            </asp:CalendarExtender>
                                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtEndDate" CssClass="validation" ValidationGroup="emp_reg3"></asp:RequiredFieldValidator>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid"
                                                                                    ControlToValidate="txtEndDate" ValidationGroup="emp_reg3" ValidationExpression="^\d{4}-((0[1-9])|(1[012]))-((0[1-9]|[12]\d)|3[01])$"
                                                                                    CssClass="validation"></asp:RegularExpressionValidator>
                                                                                
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtEndDate"
                                                                                    FilterType="Numbers, Custom" ValidChars="-">
                                                                                </asp:FilteredTextBoxExtender>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table width="60%">
                                                            <tr>
                                                                <td>
                                                                  &nbsp;
                                                                </td>
                                                                <td>
                                                                  <%--  <asp:DropDownList ID="ddlIncident" Width="130px" runat="server" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                                                                    </asp:DropDownList>--%>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <%--<asp:DropDownList ID="ddlIncidentStatus" Width="130px" runat="server" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                                                                        <asp:ListItem Text="--Status--" Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="Open" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="OnHold" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Resolve" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>--%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                             <asp:Label ID="lbl_err" runat="server" ></asp:Label>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="span4">
                            <div style="display:none">
                                <div class="containerHeadline">
                                    <i class="icon-ok-sign"></i>
                                    <h2>
                                        Total Incidents Report
                                    </h2>
                                </div>
                                <div class="floatingBox">
                                    <div class="container-fluid">
                                        <asp:Chart ID="incident_chart" runat="server" Height="200px" Width="300px" Visible="true">
                                            <Titles>
                                                <asp:Title ShadowOffset="3" Name="Items" />
                                            </Titles>
                                            <Legends>
                                                <asp:Legend Alignment="Center" Docking="Right" IsTextAutoFit="False" Name="Default"
                                                    ForeColor="Green" LegendStyle="Table" />
                                            </Legends>
                                            <Series>
                                                <asp:Series Name="Series1" IsValueShownAsLabel="true" LabelForeColor="Black" Palette="EarthTones" />
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BorderWidth="0" BackColor="AliceBlue" />
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </div>
                                </div>
                                <div class="span12">
                                    <!-- ==================== PIE CHART HEADLINE ==================== -->
                                    <div class="containerHeadline">
                                        <i class="icon-bar-chart"></i>
                                        <h2>
                                            Total Incidents Report</h2>
                                        <div class="controlButton pull-right">
                                            <i class="icon-remove removeElement"></i>
                                        </div>
                                        <div class="controlButton pull-right">
                                            <i class="icon-caret-down minimizeElement"></i>
                                        </div>
                                    </div>
                                    <!-- ==================== END OF PIE CHART HEADLINE ==================== -->
                                    <!-- ==================== PIE CHART FLOATING BOX ==================== -->
                                    <div class="floatingBox">
                                        <div class="container-fluid">
                                            <asp:ListBox ID="ListBox01" style="display:none" runat="server"></asp:ListBox>
                                            <div class="demoChart" id="secondPieChart1" runat="server" visible="false">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ==================== END OF PIE CHART FLOATING BOX ==================== -->
                                </div>
                            </div>
                            
                        </div>
                        <div class="span10">
                                <div class="containerHeadline">
                                    <i class="icon-ok-sign"></i>
                                    <h2>
                                        Incident List
                                    </h2>
                                    <div style="margin-left: 75%">
                                        <div class="input-append">
                                            <asp:TextBox class="inp-mini span11" placeholder="search rooms..." ID="txtRoomSearch"
                                                runat="server"></asp:TextBox>
                                            <a id="btnSearch" runat="server" ondblclick="btnsearch_click"><span class="add-on add-on-first add-on-mini">
                                                <i class="icon-search"></i></span></a>
                                            <asp:FilteredTextBoxExtender ID="ft1" runat="server" FilterType="Numbers" Enabled="true"
                                                TargetControlID="txtRoomSearch">
                                            </asp:FilteredTextBoxExtender>
                                        </div>
                                    </div>
                                </div>
                                <div class="floatingBox table">
                                    <div class="container-fluid">
                                        <asp:GridView ID="grid_incident" runat="server" AutoGenerateColumns="false" AllowPaging="true" EmptyDataText="No Incidents"
                                            CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters" OnDataBound="grid_incident_DataBound"
                                            OnPageIndexChanging="grid_incident_PageIndexChanging">
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First"
                                                LastPageText="Last" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Incident" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIncidentName" runat="server" Text='<%#Eval("incident_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Room" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRoomNo" runat="server" Text='<%#Eval("roomno")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Priority" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpriority" runat="server" Text='<%#Eval("priority")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Recived Time" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrecivedtime" runat="server" Text='<%#Eval("Recived_Time")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Open Time" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblopentime" runat="server" Text='<%#Eval("Open_Time")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Close Time" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblclosetime" runat="server" Text='<%#Eval("Close_Time")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delay Time" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldelaytime" runat="server" Text='<%#Eval("Delay_Time")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Assigned To" HeaderStyle-HorizontalAlign="Center"
                                                    HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblassignedto" runat="server" Text='<%#Eval("AssignedTo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">

                var dataPie = [],
                pieSeries = $('#ContentPlaceHolder1_ListBox01').children().length;
                //          alert($('#ListBox01').children().length);
                for (var i = 0; i < pieSeries; i++) {
                    $("#ContentPlaceHolder1_ListBox01").get(0).selectedIndex = i; //main point select list item
                    //           alert($('#ListBox01').get(0).selectedIndex = i);
                    dataPie[i] = {
                        label: $('#ContentPlaceHolder1_ListBox01 option:selected').text(), //main point selected list item name
                        data: $('#ContentPlaceHolder1_ListBox01 option:selected').val() //main point selected list item value
                    }

                }
                $.plot('#ContentPlaceHolder1_secondPieChart1', dataPie, {
                    series: {
                        pie: {
                            show: true,
                            radius: 1,
                            coloumn3D:true,                            
                            label: {
                                show: true,
                                radius: 1,
                                formatter: labelFormatter,
                                background: {
                                    opacity: 0.8
                                }
                            }
                        }
                    },
                    legend: {
                        show: false
                    }
                });

                function labelFormatter(label, series) {
                    return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + series.data[0][1] + "(" + Math.round(series.percent) + "%)</div>";
                }
    </script>
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>


