<%@ Page Title="" Language="C#" MasterPageFile="~/sup_admn/sup_admn_master.master" AutoEventWireup="true" CodeFile="incident_status_time_delay_Report.aspx.cs" Inherits="incident_status_time_delay_Report" Culture="en-GB" EnableEventValidation="false" %>

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
            <Triggers>
<asp:PostBackTrigger ControlID="btnExport" />
<asp:PostBackTrigger ControlID="btnExportpdf" />
</Triggers>
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
                                                       &emsp;&emsp;&emsp;&nbsp;<asp:DropDownList ID="ddlReportType" runat="server" Width="130px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                                                            <asp:ListItem Text="Daily" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Monthly" Value="2"></asp:ListItem>                                                            
                                                            <asp:ListItem Text="Periodic" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="ddlReportType"
                                                            CssClass="validation" ErrorMessage="Select One Report Type">
                                                        </asp:RequiredFieldValidator>
                                                    </td>                                                                                                
                                                    <td align="left" style="font-weight: bold">
                                                        <asp:Panel ID="pnlDay" runat="server" Width="100%">
                                                            Date :
                                                            <asp:TextBox ID="txtDay" runat="server" AutoPostBack="true" Width="120px" OnTextChanged="ddlReportType_SelectedIndexChanged"></asp:TextBox>
                                                            <asp:CalendarExtender ID="clex1" runat="server" TargetControlID="txtDay" Format="yyyy-MM-dd">
                                                            </asp:CalendarExtender>
                                                        </asp:Panel>
                                                    </td>
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
                                                    <td align="left">
                                                        <asp:Panel ID="pnlPeriodic" runat="server">
                                                            Start Date :
                                                            <asp:TextBox ID="txtStartDate" runat="server" Width="70px" AutoPostBack="true" OnTextChanged="ddlReportType_SelectedIndexChanged"></asp:TextBox>
                                                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate"
                                                                Format="dd-MM-yyyy">
                                                            </asp:CalendarExtender>
                                                            End Date :
                                                            <asp:TextBox ID="txtEndDate" runat="server" Width="70px" OnTextChanged="ddlReportType_SelectedIndexChanged"
                                                                AutoPostBack="true"></asp:TextBox>
                                                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate"
                                                                Format="dd-MM-yyyy">
                                                            </asp:CalendarExtender>
                                                        </asp:Panel>
                                                    </td>
                                                 </tr>                                   
                                                  <tr>
                                                    <td>
                                                        
                                                  <tr>                                                        
                                                    <td align="left" style="font-weight: bold">                                                                
                                                                    Incident Status :
                                                                    &emsp;&emsp;<asp:DropDownList ID="ddlIncidentStatus" Width="130px" runat="server" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged">
                                                                        <asp:ListItem Text="--Status--" Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="Open" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="OnHold" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Resolve" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                         </td>     
                                                      <td colspan="3">
                                                      &nbsp;
                                                      </td>                                               
                                              </tr>
                                            </table>
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
                                    <div style="margin-left: 63%">
                                        <div class="input-append">
                                            <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick = "ExportToExcel" Visible="false" />                                                                                          
                                           <asp:Button ID="btnExportpdf" runat="server" Text="Export To Pdf" OnClick="ExportToPdf"  Visible="false"/>   
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="floatingBox table">
                                    <div class="container-fluid">
                                      <asp:UpdatePanel ID="upa1" runat="server">
            <ContentTemplate>
                                        <asp:GridView ID="grid_incident" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
                                            CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters" OnDataBound="grid_incident_DataBound"
                                            OnPageIndexChanging="grid_incident_PageIndexChanging" EmptyDataText="No Incidents">
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First"
                                                LastPageText="Last" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
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
                                                    HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblassignedto" runat="server" Text='<%#Eval("AssignedTo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>  
                                        </ContentTemplate>
                                        </asp:UpdatePanel>                                                                          
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
      <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>


