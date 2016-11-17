<%@ Page Title="" Language="C#" MasterPageFile="~/sup_admn/sup_admn_master.master" AutoEventWireup="true" CodeFile="Employee_report_status.aspx.cs" Inherits="sup_admn_Employee_report_status" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
     th
    {
        text-align:center !important;
     
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content">
        <div class="container-fluid">
            <div class="row-fluid">
            <div class="span12">
               
                <div class="span8">
                    <asp:UpdatePanel ID="upa1" runat="server">
                        <ContentTemplate>
                            <div class="containerHeadline">
                                <i class="icon-ok-sign"></i>
                                <h2>
                                    Employees List
                                </h2>
                                <div style="margin-left: 63%">
                                <asp:Panel ID="panel1" runat="server" DefaultButton="button1">
                                    <div class="input-append">
                                    
                                        <asp:TextBox class="inp-mini span11" placeholder="search..." ID="txtSearch"
                                            AutoPostBack="true" runat="server" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                        <a id="btnSearch" runat="server" ondblclick="btnsearch_click"><span class="add-on add-on-first add-on-mini">
                                            <i class="icon-search"></i>                                            
                                            </span></a>
                                        <asp:FilteredTextBoxExtender ID="ft1" runat="server" FilterType="Custom,Numbers,UppercaseLetters,LowercaseLetters"
                                            ValidChars=" ,-" Enabled="true" TargetControlID="txtSearch">
                                        </asp:FilteredTextBoxExtender>
                                    <asp:Button ID="button1" runat="server" Visible="false" />
                                    </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="floatingBox table">
                                <div class="container-fluid">
                                    <asp:GridView ID="grid_employees" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                        PageSize="10" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters"
                                        OnDataBound="grid_incident_DataBound" OnPageIndexChanging="grid_incident_PageIndexChanging">
                                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First"
                                            LastPageText="Last" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Emp Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmpName" runat="server" Text='<%#Eval("emp_name")%>'></asp:Label>
                                                    <asp:Label ID="lbleid" runat="server" Text='<%#Eval("emp_id")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Designation Name" HeaderStyle-HorizontalAlign="Center"
                                                HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldesignName" runat="server" Text='<%#Eval("designation_name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Gender" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblgender" runat="server" Text='<%#Eval("gender")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Father Name" HeaderStyle-HorizontalAlign="Center"
                                                HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFName" runat="server" Text='<%#Eval("father_name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date Of Birth" HeaderStyle-HorizontalAlign="Center"
                                                HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldob" runat="server" Text='<%# Convert.ToDateTime(Eval("dateofbirth")).ToString("yyyy-MM-dd") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("present_address")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact No" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcontact" runat="server" Text='<%#Eval("contact_no1")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                             <div class="span4">
                    <!-- ==================== PIE CHART HEADLINE ==================== -->
                    <div class="containerHeadline">
                        <i class="icon-bar-chart"></i>
                        <h2>
                            Employee Report status</h2>
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
                            <asp:ListBox ID="ListBox01" Style="display: none" runat="server"></asp:ListBox>
                            <div class="demoPieChart" id="secondPieChart1" runat="server">
                            </div>
                        </div>
                    </div>
                    <!-- ==================== END OF PIE CHART FLOATING BOX ==================== -->
                </div>
                            </div>
            </div>
        </div>
    </div>
   <script language="javascript" type="text/javascript">

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
               show: false,
               
           }
       });

       function labelFormatter(label, series) {
           return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>"+label+"<br/>"+ series.data[0][1] + "(" + Math.round(series.percent) + "%)</div>";
       }
    </script>
  
</asp:Content>

