<%@ Page Title="" Language="C#" EnableViewState="true" MasterPageFile="~/sup_admn/sup_admn_master.master" AutoEventWireup="true" CodeFile="service_management.aspx.cs" Inherits="sup_admn_service_management" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <link rel="stylesheet" href="../css/styles.css" />
    <style type="text/css">

/*table header*/
  th
        {
        	text-align:center ! important;
        	
        	height:30px;
        	
        	
        	}  
        	/* tab stlye*/
        	#ContentPlaceHolder1_tabservice .ajax__tab_header span
  {color:#e9e9e9;
  	
  	}
  	 #ContentPlaceHolder1_tabservice .ajax__tab_header  span :hover
  {
  	
  	 background-color: transparent;
    color: #33B5E5;
    text-decoration: none;
  	 	}
  

        	
        .MyTabStyle .ajax__tab_header
        {
        
    display: block;
    font-size: 11px;
    font-weight: 600;
    list-style-type: none;
    padding: 0;
    text-shadow: 0 1px 0 rgba(0, 0, 0, .1);
    white-space:nowrap;
    font-family: 'Open Sans', sans-serif;
    background-color:#545a5f;
    display: block;
   
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_outer
        {
    
           background-color:#545a5f;
            padding-left: 10px;
            margin-right: 3px;
            border: 1px solid rgba(0,0,0,0.2);
            border-left:none;          
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_inner
        {
        	color:White;
            border-color: #666;
            padding: 3px 10px 2px 0px;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_outer
        {
        	  background-color: transparent;
              text-decoration: none;
              color:#e9e9e9;
    
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_inner
        {
        	background-color: transparent;
        	color:#e9e9e9;
            text-decoration : none;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_outer
        {
           border-bottom-color: #545a5f;
          
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_inner
        {
         
            border-color: #333;
        }
        .MyTabStyle .ajax__tab_body
        {
        }
    #ContentPlaceHolder1_tabservice_TABSERVICEEXEMNGT
    {
    	visibility:visible ! important;
    	
    	}
         tbody tr td label,  tbody tr td input { float: left !important; display: block !important; padding: 0 10px !important; }
        .style1
        {
            height: 32px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<asp:UpdatePanel ID="updatePanel1" runat="server">
   <ContentTemplate>
   <script language="javascript" type="text/javascript">
       function ValidateChkexeserviceList(source, arguments) {
           arguments.IsValid = IsCheckBoxChecked() ? true : false;

       }

       function IsCheckBoxChecked() {
           var isChecked = false;
           var list = document.getElementById('<%= chbxlistexeservice.ClientID %>');
           if (list != null) {
               for (var i = 0; i < list.rows.length; i++) {
                   for (var j = 0; j < list.rows[i].cells.length; j++) {
                       var listControl = list.rows[i].cells[j].childNodes[0];
                       if (listControl.checked) {
                           isChecked = true;
                       }
                   }
               }
           }
           return isChecked;

       }
       function ValidateChkmgrserviceList(source, arguments) {
           arguments.IsValid = IsCheckBoxChecked() ? true : false;

       }
       /*chbxtaxlst*/
       function IsCheckBoxChecked() {
           var isChecked = false;
           var list = document.getElementById('<%= chbxtypeservices.ClientID %>');
           if (list != null) {
               for (var i = 0; i < list.rows.length; i++) {
                   for (var j = 0; j < list.rows[i].cells.length; j++) {
                       var listControl = list.rows[i].cells[j].childNodes[0];
                       if (listControl.checked) {
                           isChecked = true;
                       }
                   }
               }
           }
           return isChecked;

       }

       function Validatechbxtaxlst(source, arguments) {
           arguments.IsValid = IsCheckBoxChecked() ? true : false;

       }
       /*chbxtaxlst*/
       function IsCheckBoxChecked() {
           var isChecked = false;
           var list = document.getElementById('<%=  chbxtaxlst.ClientID %>');
           if (list != null) {
               for (var i = 0; i < list.rows.length; i++) {
                   for (var j = 0; j < list.rows[i].cells.length; j++) {
                       var listControl = list.rows[i].cells[j].childNodes[0];
                       if (listControl.checked) {
                           isChecked = true;
                       }
                   }
               }
           }
           return isChecked;

       }

      

                                                                            </script>
   <ul class="breadcrumb">
                <li><i class="icon-home"></i><a href="default.aspx">Super Admin</a> <span class="divider"><i class="icon-angle-right"></i></span></li>
                <li class="active">Services</li>
                <li class="moveDown pull-right">
                    <span class="time">15:04:12</span>
                    <span class="date">Sunday 5 January 2014</span>
                </li>   
            </ul>
   <div class="container-fluid">
   <!-- ==================== TAB ROW ==================== -->
            <div class="row-fluid">
                    <div class="span12 tabContainer">
                        <!-- ==================== TAB NAVIGATION ==================== -->
                       <!-- ==================== END OF TAB NAVIGATIION ==================== -->

                        <div class="container-fluid">
                            <!-- ==================== FIRST TAB CONTENT ==================== -->
                            
                            
                            <asp:TabContainer ID="tabservice" Width="100%" runat="server"
                                TabIndex="0" ActiveTabIndex="0" CssClass="MyTabStyle">
                                <asp:TabPanel runat="server" ID="tabservices">
                                    <HeaderTemplate>
                                        SERVICES</HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="floatingBox span12">
                                            <div class="container-fluid">
                                                <p>
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="width: 100%">
                                                                <asp:GridView ID="gridServices" runat="server" AutoGenerateColumns="False" DataKeyNames="service_id,status"
                                                                    Width="50%" OnRowDataBound="gridServices_RowBound" OnRowCommand="gridServices_RowCommand"
                                                                    CssClass="tablesorter-default table-striped" OnRowEditing="gridServices_RowEditing">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.No">
                                                                        <ItemTemplate>
                                                                        <%#Container.DataItemIndex+1 %>
                                                                        </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Bottom" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Service Name" >
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblServiceName" runat="server" Text='<%#Eval("service_name") %>'></asp:Label></ItemTemplate>
                                                                            <HeaderStyle CssClass="tablesorter-headerRow" HorizontalAlign="Center" Width="150px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Taxes Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbltaxesName" runat="server"></asp:Label></ItemTemplate>
                                                                            <HeaderStyle CssClass="tablesorter-headerRow" HorizontalAlign="Center" Width="150px" />
                                                                            
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Status">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imgStatus1" runat="server" CommandName="changestatus" Style="height: 20px; width: 20px; text-align:center !important; float:none !important"
                                                                                 CommandArgument='<%#Container.DataItemIndex %>' /></ItemTemplate>
                                                                            <HeaderStyle  Width="15%" />
                                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="ImgBtnEdit2" runat="server" CommandName="edit" CommandArgument='<%#Container.DataItemIndex %>'
                                                                                    CssClass="icon-adjust" Style="height: 20px; width: 20px; text-align:center !important; float:none !important" ImageUrl="~/Icons/1385390972_write.png" /></ItemTemplate>
                                                                            <HeaderStyle Width="10%" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField Visible="False" HeaderText="delete">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ToolTip="DELETE" Width="20px" Height="20px" ImageUrl="~/Icons/1385391089_delete-outline.png"
                                                                                    Text="Delete" OnClientClick="return confirm('do you want to delete?')" class="icon-remove-circle btn-danger"
                                                                                    ID="btnservicedelete" runat="server" CausesValidation="false" OnClick="btnservicedelete_click" /></ItemTemplate>
                                                                            <HeaderStyle CssClass="tablesorter-headerRow" HorizontalAlign="Center" Width="10%" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <div class="control-group" style="padding-right: 50%">
                                                                    <label class="control-label" for="fullname" style="font-size: large; font-weight: bold">
                                                                        Service Name :</label>
                                                                    <asp:TextBox ID="txtServiceName" runat="server" class="span4"></asp:TextBox><asp:RequiredFieldValidator
                                                                        ID="rqrdfildname" runat="server" ControlToValidate="txtServiceName" CssClass="validation"
                                                                        ErrorMessage="Enter Service Name" ValidationGroup="cat"></asp:RequiredFieldValidator></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label class="control-label" for="fullname" style="font-size: large; font-weight: bold">
                                                                    Taxes Name :</label>
                                                                <asp:CheckBoxList ID="chbxtaxlst" RepeatDirection="Horizontal" runat="server">
                                                                </asp:CheckBoxList>
                                                       <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="cat" ClientValidationFunction="Validatechbxtaxlst"
                                                                        ErrorMessage="Please Select Atleast one" ForeColor="Red"></asp:CustomValidator>

                                                            </td>
                                                            <tr>
                                                                <td>
                                                                    <div class="control-group" style="margin-left: 20%">
                                                                        <asp:Button ID="btnAddServicePanel" runat="server" CssClass="btn btn-primary" OnClick="btnAddServicePanel_Click"
                                                                            Text="Add" ValidationGroup="cat" />
                                                                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" OnClick="btnUpdate_Click"
                                                                            Text="Update" ValidationGroup="cat" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Button ID="BtnClear" runat="server" CssClass="btn" OnClick="btnClear_Click"
                                                                            Text="Clear" /></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="control-group">
                                                                        <asp:Label ID="lblMsg1" runat="server"></asp:Label></div>
                                                                    <div class="control-group">
                                                                        <asp:Label ID="lblHiddenValue" runat="server" Visible="False"></asp:Label></div>
                                                                </td>
                                                            </tr>
                                                        </tr>
                                                    </table>
                                                </p>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="tabcat">
                                    <HeaderTemplate>
                                        CATEGORY</HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="floatingBox span12">
                                            <div class="container-fluid">
                                                <p>
                                                    <table width="50%">
                                                        <tr>
                                                            <td>
                                                                Service Name :
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlServices" runat="server" Width="120px" AutoPostBack="True"
                                                                    ValidationGroup="category" OnSelectedIndexChanged="ddlServices_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                &nbsp;&nbsp;
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorqw1" runat="server" ErrorMessage="Enter Service Name"
                                                                    ControlToValidate="ddlServices" InitialValue="0" CssClass="validation" ValidationGroup="category"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="width: 100%">
                                                                <asp:GridView ID="gridCategory" runat="server" AutoGenerateColumns="False" CssClass="tablesorter-default table-striped"
                                                                    DataKeyNames="cat_id,status" OnDataBound="gridCategory_DataBound" OnRowCancelingEdit="gridCategory_RowCancelingEdit"
                                                                    OnRowDeleting="gridCategory_RowDeleting" OnRowEditing="gridCategory_RowEditing"
                                                                    OnRowUpdating="gridCategory_RowUpdating" Width="100%" 
                                                                    OnRowCommand="gridCategory_RowCommand" 
                                                                    >
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.No">
                                                                        <ItemTemplate>
                                                                        <%#Container.DataItemIndex+1 %>
                                                                        </ItemTemplate>
                                                                            <HeaderStyle Width="50px"/>
                                                                            <ItemStyle  HorizontalAlign="Center" VerticalAlign="Bottom" />

                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Category Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCategoryName" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Status">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton Style="height: 20px; width: 20px; text-align:center !important; float:none !important" ID="imgStatusCategory" CommandArgument='<%#Container.DataItemIndex %>'
                                                                                    CommandName="changecatstatus" runat="server" /></ItemTemplate>
                                                                            <HeaderStyle  Width="15%" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="ImgBtnEditCategory" runat="server" ImageUrl="~/Icons/1385390972_write.png"
                                                                                    CommandArgument='<%#Eval("cat_id") %>' CommandName="edit" Style="height: 20px; width: 20px; text-align:center !important; float:none !important"
                                                                                    Text="Edit" ValidationGroup="edit" /></ItemTemplate>
                                                                            <HeaderStyle Width="10%" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="btncatdelete" runat="server" CausesValidation="false" class="icon-remove-circle btn-danger"
                                                                                    CommandName="delete" Height="20px" ImageUrl="~/Icons/1385391089_delete-outline.png"
                                                                                    OnClientClick="return confirm('do you want to delete?')" Text="Delete" ToolTip="DELETE"
                                                                                    Width="20px" /></ItemTemplate>
                                                                            <HeaderStyle CssClass="tablesorter-headerRow" HorizontalAlign="Center" Width="10%" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label class="control-label" for="fullname">
                                                                    Category Name :</label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtCatName" runat="server" class="span10" Width="100px"></asp:TextBox><asp:RequiredFieldValidator
                                                                    ID="RequiredFieldValidatorqwyyq1" runat="server" ControlToValidate="txtCatName"
                                                                    CssClass="validation" ErrorMessage="Enter Category Name" ValidationGroup="category"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnAddCategory" runat="server" CssClass="btn btn-primary" OnClick="btnAddCategoryPanel_Click"
                                                                    Text="Add" ValidationGroup="category" />
                                                                    
                                                                    <asp:Button ID="btnupdateCategory" Visible="False"
                                                                        runat="server" Text="Update" ValidationGroup="category" CssClass="btn btn-primary"
                                                                        OnClick="btnupdateCategory_Click" />&nbsp;&nbsp;<asp:Button ID="btncatclear" runat="server" OnClick="btncatclear_Click"
                                                                            Text="Clear" CausesValidation="False" CssClass="btn" />&nbsp;&nbsp;<asp:Label
                                                                                ID="lblhidcat_id" Visible="False" runat="server" ForeColor="Red"></asp:Label><asp:Label
                                                                                    ID="lblMsg2" runat="server" ForeColor="Red"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        </table>
                                                </p>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="Tabitemsrate">
                                    <HeaderTemplate>
                                        ITEMS-RATES</HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="floatingBox span12">
                                            <div class="container-fluid">
                                                <p>
                                                    <asp:Button ID="btnCreateMenuItem" runat="server" Text="Create New Item" CssClass="btn-primary btn-mini"
                                                        OnClick="btnCreateMenuItem_Click" /></p>
                                                <div>
                                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label><asp:Label ID="lblMessage2"
                                                        runat="server"></asp:Label></div>
                                                <asp:Panel ID="panel_category_list" runat="server" Width="100%">
                                                    <h4>
                                                        Category
                                                        <asp:DropDownList ID="ddlCategoryList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoryList_selectIndexChanged"
                                                            Width="120px">
                                                        </asp:DropDownList>
                                                    </h4>
                                                    <div style="height: 350px; overflow: scroll">
                                                        <asp:GridView ID="gv_Items" runat="server" AutoGenerateColumns="False" CssClass="tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                                            DataKeyNames="item_id,status" OnDataBound="gv_Items_DataBound" OnRowCancelingEdit="gv_Items_RowCancelingEdit"
                                                            OnRowEditing="gv_Items_RowEditing" OnRowUpdating="gv_Items_RowUpdating" Width="60%"
                                                            OnRowDeleting="gv_Items_RowDeleting" OnRowCommand="gv_Items_RowCommand">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="S.No">
                                                                <ItemTemplate>
                                                                <%#Container.DataItemIndex+1 %>
                                                                </ItemTemplate>
                                                                    <HeaderStyle Width="10%" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemName" runat="server" Text='<%#Eval("item_name") %>'></asp:Label><asp:Label
                                                                            ID="lblItem_id" runat="server" Text='<%#Eval("item_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" Width="20%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Price">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemPrice" runat="server" Text='<%#Eval("item_cost") %>'></asp:Label></ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" Width="20%" />
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Description">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("description") %>'></asp:Label></ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" Width="40%" />
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Status">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton runat="server" Style="height: 20px; width: 20px; text-align:center !important; float:none !important"
                                                                         ID="imgStatus1" CommandArgument='<%# Container.DataItemIndex %>'
                                                                            CommandName="changestatus"  /></ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" Width="15%" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Edit">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImgBtnEdit2" runat="server" CommandArgument="edit" CommandName="edit"
                                                                          Style="height: 20px; width: 20px; text-align:center !important; float:none !important" ImageUrl="~/Icons/1385390972_write.png"
                                                                           /></ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" Width="20%" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Delete" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ToolTip="DELETE" Width="20px" CommandName="delete" Height="20px"
                                                                            ImageUrl="~/Icons/1385391089_delete-outline.png" Text="Delete" OnClientClick="return confirm('do you want to delete?')"
                                                                            class="icon-remove-circle btn-danger" ID="btnimagcatdelete" runat="server" CausesValidation="false" /></ItemTemplate>
                                                                    <HeaderStyle CssClass="tablesorter-headerRow" HorizontalAlign="Center" Width="10%" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="panelCreateItem" runat="server" Visible="False" Width="100%">
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <table width="100%">
                                                        <tr>
                                                            <td colspan="2">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            Category
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlCategory" runat="server" Width="165px">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="ddlCategory"
                                                                                CssClass="validation" ErrorMessage="category" InitialValue="0" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td rowspan="4">
                                                                            <asp:Image Width="102px" ID="imgitem" Height="102px" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style1">
                                                                            Item Name
                                                                        </td>
                                                                        <td class="style1">
                                                                            <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemName" CssClass="validation"
                                                                                ErrorMessage="Name" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Cost
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtCost" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCost" CssClass="validation"
                                                                                ErrorMessage="Cost" ValidationGroup="add"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                                    ID="ft16" runat="server" Enabled="True" FilterType="Custom, Numbers" TargetControlID="txtCost"
                                                                                    ValidChars=".">
                                                                                </asp:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 50%">
                                                                            Upload Photo
                                                                        </td>
                                                                        <td>
                                                                            <asp:FileUpload ID="fileuploadimg" runat="server" /><br />
                                                                            <br />
                                                                            <br />
                                                                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Description
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtDescrption" runat="server" TextMode="MultiLine" Width="165px"></asp:TextBox><asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescrption"
                                                                                CssClass="validation" ErrorMessage="Description" ValidationGroup="add"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                        <td align="right">
                                                                            <asp:Button ID="btnCancel" runat="server" CssClass="btn" OnClick="btnCancel_Click"
                                                                                Text="Cancel" />
                                                                                
                                                                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary"
                                                                                    OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="add" /><asp:Button ID="btnitem_update"
                                                                                        runat="server" CssClass="btn btn-primary" OnClick="btnitem_update_Click" Text="Update"
                                                                                        ValidationGroup="add" Visible="False" /><asp:Label ID="lblhiditem_id" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <p>
                                                </p>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="SERVIECMNRMNGT">
                                    <HeaderTemplate>
                                        SERVICE MNR MGMT</HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="floatingBox span12">
                                            <div class="container-fluid">
                                                <p>
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="width: 100%;">
                                                                <div style="overflow-y: scroll; max-height: 400px; padding-left: 25px;">
                                                                    <asp:GridView ID="gridservicemngr" runat="server" AutoGenerateColumns="False" DataKeyNames="id,status,emp_id"
                                                                        Width="70%" OnRowDataBound="gridservicemngr_RowBound" OnRowCommand="gridservicemngr_RowCommand"
                                                                        CssClass="tablesorter-default table-striped" OnRowDeleting="gridservicemngr_RowDeleting">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                 <ItemTemplate>
                                                                <%#Container.DataItemIndex+1 %>
                                                                </ItemTemplate>
                                                                <HeaderStyle Width="10%" />
                                                                                <ItemStyle HorizontalAlign="Center"   />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Employees">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblEmpName" runat="server" Text='<%#Eval("emp_name") %>'></asp:Label></ItemTemplate>
                                                                                <HeaderStyle  Width="1px" />
                                                                                
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Service Name">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkbtnservicename" runat="server" CommandArgument='<%#Container.DataItemIndex %>'></asp:LinkButton></ItemTemplate>
                                                                                <HeaderStyle Width="150px" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Status">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="imgStatus1" CommandName="status" CommandArgument='<%#Container.DataItemIndex %>'
                                                                                        runat="server" Style="height: 20px; width: 20px; text-align:center !important; float:none !important" /></ItemTemplate>
                                                                                <HeaderStyle Width="4%" />
                                                                                <ItemStyle  HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Edit">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="ImgBtnEdit" runat="server" Text="Edit" CommandName="serviceview"
                                                                                        CssClass="icon-adjust"  ImageAlign="Middle" ImageUrl="~/Icons/1385390972_write.png"
                                                                                        Style="height: 20px; width: 20px; text-align:center !important; float:none !important" CommandArgument='<%# Container.DataItemIndex %>' /></ItemTemplate>
                                                                                <HeaderStyle Width="4%" />
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField Visible="False" HeaderText="Delete">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ToolTip="DELETE" Width="20px" CommandName="delete" Height="20px"
                                                                                        ImageUrl="~/Icons/1385391089_delete-outline.png" Text="Delete" OnClientClick="return confirm('do you want to delete?')"
                                                                                        class="icon-remove-circle btn-danger" ID="btnimgservicemngrdelete" runat="server"
                                                                                        CausesValidation="false" /></ItemTemplate>
                                                                                <HeaderStyle CssClass="tablesorter-headerRow" HorizontalAlign="Center" Width="10%" />
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Panel ID="servicesnames" runat="server">
                                                                    <div class="row-fluid">
                                                                        <div class="container-fluid">
                                                                            <div class="floatingBox span12">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td colspan="2">
                                                                                            <div class="control-group">
                                                                                                <label class="control-label" for="fullname" style="font-size: large; font-weight: bold">
                                                                                                    Service Manager Name :</label>
                                                                                                <asp:DropDownList ID="ddlsermngrname" runat="server">
                                                                                                </asp:DropDownList>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Service Name"
                                                                                                    ControlToValidate="ddlsermngrname" CssClass="validation" ValidationGroup="mngr"
                                                                                                    InitialValue="0"></asp:RequiredFieldValidator></div>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="2">
                                                                                            <div class="control-group">
                                                                                                <label class="control-label" for="fullname" style="font-size: large; font-weight: bold">
                                                                                                    Services Name</label>
                                                                                                <asp:CheckBoxList ID="chbxtypeservices" runat="server" ValidationGroup="mngr" RepeatColumns="10"
                                                                                                    RepeatDirection="Horizontal">
                                                                                                </asp:CheckBoxList>
                                                                                                <asp:CustomValidator ID="cvmodulelist2" runat="server" ClientValidationFunction="ValidateChkmgrserviceList"
                                                                                                    ErrorMessage="Please Select Atleast one" ValidationGroup="mngr" ForeColor="Red"></asp:CustomValidator>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="2" align="center">
                                                                                            <div class="control-group" style=" margin-left:30%" >
                                                                                            <div class="control-label">
                                                                                                <asp:Button ID="btnserviceupdate" ValidationGroup="mngr" Visible="False" runat="server"
                                                                                                    Text="Update" Style="height: 29px !important" OnClick="btnserviceupdate_Click"
                                                                                                    CssClass=" btn btn-primary" /><asp:Button ID="btnaddservicemngr" runat="server" CssClass="btn btn-primary"
                                                                                                        Text="Add" ValidationGroup="mngr" OnClick="btnaddservicemngr_Click" Style="height: 29px !important" />
                                                                                                       
                                                                                                        <asp:Button

                                                                                                            ID="btncancel1" runat="server" Height="29px" CssClass="btn" Text="Clear"
                                                                                                            CausesValidation="False" Style="height: 29px !important" OnClick="btncancel1_Click" /></div>
                                                                                                        </div>
                                                                                                        
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:HiddenField ID="hid" runat="server" />
                                                                                <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label></div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </p>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TABSERVICEEXEMNGT" runat="server">
                                    <HeaderTemplate>
                                        SERVICE EXE MGMT</HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="floatingBox span12">
                                            <div class="container-fluid">
                                                <p>
                                                    <table class="span12">
                                                        <tr>
                                                            <td>
                                                                <div style="overflow-y: scroll; max-height: 400px;">
                                                                    <asp:GridView ID="gridserviceexe" EmptyDataText="No Data Found" runat="server" AutoGenerateColumns="False"
                                                                        CssClass="tablesorter-default table-striped" DataKeyNames="id,status,emp_id"
                                                                        OnRowCommand="gridserviceexe_RowCommand" OnRowDataBound="gridserviceexe_RowBound"
                                                                        Width="80%" OnRowDeleting="gridserviceexe_RowDeleting">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                 <ItemTemplate>
                                                                <%#Container.DataItemIndex+1 %>
                                                                </ItemTemplate>
                                                                                <HeaderStyle Width="5%" />
                                                                                <ItemStyle  HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Employees">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblserviceexeEmpName" runat="server" Text='<%#Eval("emp_name") %>'></asp:Label></ItemTemplate>
                                                                                <HeaderStyle Width="20%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Service Name">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkbtnserviceexeservicename" runat="server" CommandArgument="<%#Container.DataItemIndex %>"></asp:LinkButton></ItemTemplate>
                                                                                <HeaderStyle  Width="20%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Status">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="imgexeStatus" runat="server" CommandArgument="<%#Container.DataItemIndex %>"
                                                                                        CommandName="status" Style="height: 20px; width: 20px; text-align:center !important; float:none !important" /></ItemTemplate>
                                                                                <HeaderStyle  Width="5%" />
                                                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Edit">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="ImgBtnexeEdit" runat="server" CommandArgument="<%#Container.DataItemIndex %>"
                                                                                        CommandName="serviceview" CssClass="icon-adjust" Style="height: 20px; width: 20px; text-align:center !important; float:none !important"
                                                                                        ImageUrl="~/Icons/1385390972_write.png" /></ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Delete" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ToolTip="DELETE" Width="20px" CommandName="delete" Height="20px"
                                                                                        ImageUrl="~/Icons/1385391089_delete-outline.png" Text="Delete" OnClientClick="return confirm('do you want to delete?')"
                                                                                        class="icon-remove-circle btn-danger" ID="btnimgserviceexedelete" runat="server"
                                                                                        CausesValidation="false" /></ItemTemplate>
                                                                                <HeaderStyle CssClass="tablesorter-headerRow" HorizontalAlign="Center" Width="10%" />
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label class="control-label" for="fullname" style="font-size: large; font-weight: bold">
                                                                    Service Executives Name :</label>
                                                                <asp:DropDownList ID="ddlserviceexe" runat="server">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlserviceexe"
                                                                    ValidationGroup="exe" CssClass="validation" InitialValue="0" ErrorMessage="Select Service Executive Name"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="fullname" style="font-size: large; font-weight: bold">
                                                                        Services Name :</label>
                                                                    <asp:CheckBoxList ID="chbxlistexeservice" runat="server" RepeatColumns="10" RepeatDirection="Horizontal">
                                                                    </asp:CheckBoxList>
                                                                    <asp:CustomValidator ID="cvmodulelist1" runat="server" ValidationGroup="exe" ClientValidationFunction="ValidateChkexeserviceList"
                                                                        ErrorMessage="Please Select Atleast one" ForeColor="Red"></asp:CustomValidator></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="control-group">
                                                                <div class="control-label" style="margin-left:20%">

                                                                    <asp:Button ID="btnexeupdate" runat="server" OnClick="btnexeupdate_Click" CssClass=" btn btn-primary"
                                                                        Style="height: 29px !important" Text="Update" Visible="False" /><asp:Button ID="btnexeadd"
                                                                            runat="server" OnClick="btnexeadd_Click" ValidationGroup="exe" CssClass="btn  btn-primary"
                                                                            Style="height: 29px !important" Text="Add" /><asp:Button ID="btnexecancel" ValidationGroup="exe"
                                                                                OnClick="btnexecancel_Click" CausesValidation="False" runat="server" CssClass="btn"
                                                                                Height="29px" Text="Clear" />
                                                                                </div>
                                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="control-group">
                                                                    <asp:Label ID="lblexemsg" runat="server"></asp:Label></div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </p>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                                    <HeaderTemplate>
                                        TAX MGMT</HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="floatingBox table">
                                            <div class="container-fluid">
                                                <div class="row-fluid">
                                                    <div class="span6">
                                                        <div class="containerHeadline tableHeadline">
                                                            <h2>
                                                                Tax Details</h2>
                                                            <div class="controlButton pull-right">
                                                                <i class="icon-remove removeElement"></i>
                                                            </div>
                                                            <div class="controlButton pull-right">
                                                                <i class="icon-caret-down minimizeElement"></i>
                                                            </div>
                                                        </div>
                                                        <div class="floatingBox">
                                                            <div class="container-fluid" style="overflow-y: scroll; max-height: 182px;">
                                                                <asp:DataList ID="membersTable" CssClass="tablesorter-default table-striped" Width="100%"
                                                                    runat="server" DataKeyField="id" OnItemDataBound="membersTable_ItemDataBound"
                                                                    OnUpdateCommand="membersTable_UpdateCommand" OnItemCommand="membersTable_ItemCommand">
                                                                    <HeaderTemplate>
                                                                        <th>
                                                                            Tax Name
                                                                        </th>
                                                                        <th>
                                                                            Tax%
                                                                        </th>
                                                                        <th>
                                                                            Status
                                                                        </th>
                                                                        <th>
                                                                            Edit
                                                                        </th>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                    
                                                                        <td>
                                                                                <asp:Label ID="lbltaxname" runat="server" Text='<%#Eval("taxname") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="text-align:right ! important">
                                                                                <asp:Label ID="lbltaxper" runat="server" Text='<%#Eval("taxper") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width:6%" >
                                                                        <div style="text-align:center; margin-left:20%"><asp:ImageButton ID="imgstatus" CommandName="changestatus" runat="server" /><asp:Label
                                                                                ID="lblstatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label></a></div>
                                                                            
                                                                        </td>
                                                                        <td style="width:6%" >
                                                                        <div style="text-align:center; margin-left:20%">
                                                                            <asp:ImageButton ID="ImageButton2" OnClick="edit_click" ImageUrl="~/Icons/1385390972_write.png"
                                                                               Style="height: 20px; width: 20px; text-align:center !important; float:none !important" runat="server" />
                                                                                </div>
                                                                        </td>
                                                                    </ItemTemplate>
                                                                </asp:DataList></div>
                                                        </div>
                                                    </div>
                                                    <div class="span6">
                                                        <div class="containerHeadline">
                                                            <h2>
                                                                Tax Master</h2>
                                                            <div class="controlButton pull-right">
                                                                <i class="icon-remove removeElement"></i>
                                                            </div>
                                                            <div class="controlButton pull-right">
                                                                <i class="icon-caret-down minimizeElement"></i>
                                                            </div>
                                                        </div>
                                                        <div class="floatingBox">
                                                            <div class="container-fluid" style="max-height: 182px;">
                                                                <form class="form-horizontal contentForm" data-validate="parsley">
                                                                <div class="control-group" style="margin-bottom: 0px; padding-bottom: 0px;">
                                                                    <label class="control-label">
                                                                        Tax Name</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox runat="server" ID="txttaxname" class="span6"></asp:TextBox><asp:FilteredTextBoxExtender
                                                                            ID="filtaxname" TargetControlID="txttaxname" runat="server" FilterType="UppercaseLetters,LowercaseLetters">
                                                                        </asp:FilteredTextBoxExtender>
                                                                        <asp:RequiredFieldValidator ID="rfvtax" ControlToValidate="txttaxname" ValidationGroup="tax"
                                                                            runat="server" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="control-group" style="margin-bottom: 0px; padding-bottom: 0px;">
                                                                    <label class="control-label">
                                                                        Tax%</label>
                                                                    <div class="controls">
                                                                        <asp:TextBox runat="server" ID="txtper" class="span6"></asp:TextBox><asp:RequiredFieldValidator
                                                                            ID="rfvper" ControlToValidate="txtper" ValidationGroup="tax" runat="server" ErrorMessage="*"
                                                                            ForeColor="red"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender ID="txtfilter"
                                                                                TargetControlID="txtper" runat="server" FilterType="Numbers,Custom" ValidChars=".">
                                                                            </asp:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="control-group" style="margin-bottom: 0px; padding-bottom: 0px;">
                                                                    <label class="control-label">
                                                                    </label>
                                                                    <div class="controls">
                                                                        <asp:Button ID="btnupdatetax" runat="server" ValidationGroup="tax" CssClass=" btn btn-primary"
                                                                            Style="height: 29px !important" Text="Update" Visible="False" OnClick="btnupdatetax_Click" /><asp:Button
                                                                                ID="btnaddtax" runat="server" ValidationGroup="tax" CssClass="btn  btn-primary"
                                                                                Style="height: 29px !important" Text="Add" OnClick="btnaddtax_Click" /><asp:Button
                                                                                    ID="btncanceltax" CausesValidation="False" runat="server" CssClass="btn"
                                                                                    Height="29px" Text="Clear" OnClick="btncanceltax_Click" /></div>
                                                                    <div class="controls">
                                                                        <asp:Literal ID="lit_tax_id" Visible="False" runat="server" /><asp:Label ID="lbltaxmsg"
                                                                            runat="server"></asp:Label></div>
                                                                </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                
                                
                            </asp:TabContainer>


                            
                            <!-- ==================== END OF FIRST TAB CONTENT ==================== -->

                          
                        </div>
                    </div>
                </div>
                </div>
    
   </ContentTemplate>
   <Triggers>
   <asp:PostBackTrigger ControlID="tabservice" />
   </Triggers>
   </asp:UpdatePanel>
   
</asp:Content>

