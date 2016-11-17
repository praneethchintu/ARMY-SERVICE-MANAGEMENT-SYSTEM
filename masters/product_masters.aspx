<%@ Page Title="" Language="C#" MasterPageFile="~/store_mngr/store_mngr_master.master" AutoEventWireup="true" CodeFile="product_masters.aspx.cs" Inherits="store_mngr_product_masters" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="../css/styles.css" />
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
                text-align: center !important;
            }
            .href
            {
                color: White;
                font-weight: bold;
                text-decoration: none;
            }
            .forDiv
            {
                width: 70px;
                height: 80px;
                margin-top: 5px;
                margin-left: 5px;
                border-width: 1px;
                border-style: groove;
                float: left;
            }
            .linkButton
            {
                text-decoration: none;
            }
        </style>
    <style type="text/css">
        #ContentPlaceHolder1_tabContainer1 .ajax__tab_header span
        {
            color: #e9e9e9;
        }
        #ContentPlaceHolder1_tabContainer1 .ajax__tab_header span :hover
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
            white-space: nowrap;
            font-family: 'Open Sans' , sans-serif;
            background-color: #545a5f;
            display: block;
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_outer
        {
            background-color: #545a5f;
            padding-left: 10px;
            margin-right: 3px;
            border: 1px solid rgba(0,0,0,0.2);
            border-left: none;
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_inner
        {
            color: White;
            border-color: #666;
            padding: 3px 10px 2px 0px;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_outer
        {
            background-color: transparent;
            text-decoration: none;
            color: #e9e9e9;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_inner
        {
            background-color: transparent;
            color: #e9e9e9;
            text-decoration: none;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
    
      <div class="floatingBox">
                <div class="container-fluid">
                    <div class="row-fluid">
                  
                        <div class="span12">
    <asp:UpdatePanel ID="updatePanel1" runat="server">
        <ContentTemplate>
           
                        <div class="containerHeadline">
                    <i class="icon-tag"></i>
                    <h2>
                      PRODUCT MASTERS
                    </h2>
                </div>   
            <asp:TabContainer runat="server" Width="100%" ID="tabContainer1" TabIndex="0" ActiveTabIndex="0"
                CssClass="MyTabStyle" >
              <%--  <asp:TabPanel ID="tabpanel1" runat="server">
                    <HeaderTemplate>
                        PRODUCT</HeaderTemplate>
                    <ContentTemplate>
                        <asp:Button ID="btnAddNewProduct" runat="server" Text="Add New Product" CssClass="btn btn-mini btn-primary"
                            OnClick="btnAddNewProduct_Click" Style="margin-left: 40px; margin-top: 30px" />
                        
                        <asp:Panel ID="panelProduct" runat="server" DefaultButton="btnProductSave" Visible="False"
                            Width="40%" Style="margin-left: 20%">
                            <table>
                                <tr>
                                    <td>
                                        Product  
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProductName" runat="server" Width="115px"></asp:TextBox>
                                        <asp:Label ID="lblProductId" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="**"
                                            ValidationGroup="p" ControlToValidate="txtProductName" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Status
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlProductStatus" runat="server" Width="115px">
                                            <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="**"
                                            ValidationGroup="p" ControlToValidate="ddlProductStatus" InitialValue="-1" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        Product Type 
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlProductTypeListProd" runat="server" Width="115px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="**"
                                            ValidationGroup="p" ControlToValidate="ddlProductTypeListProd" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        Comments
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProductComments" TextMode="MultiLine" runat="server" Width="115px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="**"
                                            ValidationGroup="p" ControlToValidate="txtProductComments" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="lblProductResult" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="right">
                                        <asp:Button ID="btnProductSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                            ValidationGroup="p" OnClick="btnProductSave_Click" />
                                        <asp:Button ID="btnProductClear" runat="server" Text="Clear" CssClass="btn btn-mini"
                                            Style="margin-left: 10px" OnClick="btnProductClear_Click" />
                                        <asp:Button ID="btnProductCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                            Style="margin-left: 10px" OnClick="btnProductCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <asp:GridView ID="grid_products" runat="server" AutoGenerateColumns="False" Width="40%"
                            AllowPaging="True" DataKeyNames="prod_id" PageSize="5" Style="margin-left: 20%;
                            margin-bottom: 50px" OnPageIndexChanging="grid_products_PageIndexChanging" OnDataBound="grid_products_DataBound"
                            CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProdName" runat="server" Text='<%#Eval("prod_name") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProdStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                        <asp:ImageButton ID="imgProdStatus" runat="server" Width="15px" Height="15px" /></ItemTemplate>
                                    <HeaderStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProdTypeName" runat="server" Text='<%#Eval("p_type_name") %>'></asp:Label>
                                        <asp:Label ID="lblProdTypeId" runat="server" Text='<%#Eval("p_type_id") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comments">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProdComments" runat="server" Text='<%#Eval("comments") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnProdEdit" runat="server" Width="15px" Height="15px" ImageAlign="Middle"
                                            OnClick="imgbtnProdEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="40px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:TabPanel>--%>
                <asp:TabPanel ID="tabpanel2" runat="server">
                    <HeaderTemplate>
                        PRODUCT TYPE</HeaderTemplate>
                    <ContentTemplate>
                        <asp:Button ID="btnAddNewProductType" runat="server" Text="Add New Product Type" CssClass="btn btn-mini btn-primary"
                            OnClick="btnAddNewProductType_Click" Style="margin-left: 40px; margin-top: 30px" />
                        
                        <asp:Panel ID="panelProductType" runat="server" DefaultButton="btnProductTypeSave"
                            Width="60%" Style="margin-left: 20%">
                            <table>
                                <tr>
                                    <td>
                                        Product
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProductTypeName" runat="server" Width="115px"></asp:TextBox>
                                        <asp:Label ID="lblProductTypeId" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="**"
                                            ValidationGroup="pt" ControlToValidate="txtProductTypeName" CssClass="validation"></asp:RequiredFieldValidator>
                                            <asp:FilteredTextBoxExtender ID="fte1" runat="server" 
                                            TargetControlID="txtProductTypeName" 
                                            FilterType="Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"></asp:FilteredTextBoxExtender>
                                    </td>
    <td>
                                        Status
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlProductTypeStatus" runat="server" Width="115px">
                                            <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="**"
                                            ValidationGroup="pt" ControlToValidate="ddlProductTypeStatus" InitialValue="-1" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                 <tr>
                                     <td style="width:62px">
                                        SMS Code 
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_smscode" runat="server" Width="115px"></asp:TextBox>                                      
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="**"
                                            ValidationGroup="pt" ControlToValidate="txt_smscode" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>

                                    <td>
                                        TYPE
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTypeListProdType" runat="server" Width="115px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="**"
                                            ValidationGroup="pt" ControlToValidate="ddlTypeListProdType" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        CATEGORY
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCategoryListInProdType" runat="server" Width="115px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="**"
                                            ValidationGroup="pt" ControlToValidate="ddlCategoryListInProdType" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                </Table>
                                <Table>
                                <tr>
                                    <td>
                                        Comments
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProductTypeCommnets" TextMode="MultiLine" runat="server" Width="477px" Height="32px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="**"
                                            ValidationGroup="pt" ControlToValidate="txtProductTypeCommnets" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="lblProductTypeResult" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:Button ID="btnProductTypeSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                            ValidationGroup="pt" OnClick="btnProductTypeSave_Click" />

                                              <asp:ConfirmButtonExtender ID="ConfirmbtnProductSave" runat="server" TargetControlID="btndummyProd"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?"></asp:ConfirmButtonExtender>
                                                                                  <asp:Button ID="btndummyProd" runat="server" Visible="false" />
                                        <asp:Button ID="btnProductTypeClear" runat="server" Text="Clear" CssClass="btn btn-mini"
                                            Style="margin-left: 10px" OnClick="btnProductTypeClear_Click" />
                                        <asp:Button ID="btnProductTypeCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                            Style="margin-left: 10px" OnClick="btnProductTypeCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <asp:GridView ID="grid_productType" runat="server" AutoGenerateColumns="False" Width="41.5%"
                            AllowPaging="True" DataKeyNames="p_type_id" PageSize="5" Style="margin-left: 20%;
                            margin-bottom: 50px" OnPageIndexChanging="grid_productType_PageIndexChanging" OnDataBound="grid_productType_DataBound"
                            CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProdTypeName" runat="server" Text='<%#Eval("p_type_name") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                    <div style="text-align:center">
                                        <asp:Label ID="lblProdTypeStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                        <asp:ImageButton ID="imgProdTypeStatus" runat="server" Width="15px" Height="15px" />
                                          </div>
                                          </ItemTemplate>
                                  
                                    <HeaderStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label>
                                        <asp:Label ID="lblCatId" runat="server" Text='<%#Eval("cat_id") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTypeName" runat="server" Text='<%#Eval("type_name") %>'></asp:Label>
                                        <asp:Label ID="lblTypeId" runat="server" Text='<%#Eval("type_id") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="SMS Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_sms_code" runat="server" Text='<%#Eval("sms_code") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comments">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProdTypeComments" runat="server" Text='<%#Eval("comments") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnProdTypeEdit" runat="server" Width="15px" Height="15px" ImageAlign="Middle"
                                            OnClick="imgbtnProdTypeEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                             <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnProdTypeEdit"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Update this?">
                                                                                </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                    <HeaderStyle Width="40px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tab1pan3" runat="server">
                    <HeaderTemplate>
                        CATEGORY</HeaderTemplate>
                    <ContentTemplate>
                        <asp:Button ID="btnAddNewCategory" runat="server" Text="Add New Category" CssClass="btn btn-mini btn-primary"
                            OnClick="btnAddNewCategory_Click" Style="margin-left: 40px; margin-top: 30px" />
                        
                        <asp:Panel ID="panelCategory" runat="server" DefaultButton="btnCatSave"
                            Width="40%" Style="margin-left: 20%">
                            <table>
                                <tr>
                                    <td style="width:62px">
                                        Category 
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCatName" runat="server" Width="115px"></asp:TextBox>
                                        <asp:Label ID="lblCatId" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**"
                                            ValidationGroup="cat" ControlToValidate="txtCatName" CssClass="validation"></asp:RequiredFieldValidator>
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtCatName" FilterType="Numbers,UppercaseLetters,LowercaseLetters" Enabled="true"></asp:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        Status
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCatStatus" runat="server" Width="115px">
                                            <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                           <asp:Label ID="lblProdCategory_Status_comp" runat="server" Visible="false"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="**"
                                            ValidationGroup="cat" ControlToValidate="ddlCatStatus" InitialValue="-1" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
</Table>
<table>
                                <tr>
                                    <td>
                                        Comments
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCatComments" TextMode="MultiLine" runat="server" Width="281px" Height="32px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="**"
                                            ValidationGroup="cat" ControlToValidate="txtCatComments" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="lblCatResult" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:Button ID="btnCatSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                            ValidationGroup="cat" OnClick="btnCatSave_Click" />
                                            
                                                                                     <asp:ConfirmButtonExtender ID="ConfirmbtnCatSave" runat="server" TargetControlID="btndummyCat"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?"></asp:ConfirmButtonExtender>
                                                                                  <asp:Button ID="btndummyCat" runat="server" Visible="false" />

                                        <asp:Button ID="btnCatClear" runat="server" Text="Clear" CssClass="btn btn-mini"
                                            Style="margin-left: 10px" OnClick="btnCatClear_Click" />
                                        <asp:Button ID="btnCatCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                            Style="margin-left: 10px" OnClick="btnCatCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <asp:GridView ID="grid_category" runat="server" AutoGenerateColumns="False" Width="40%"
                            AllowPaging="True" DataKeyNames="cat_id" PageSize="5" Style="margin-left: 20%;
                            margin-bottom: 50px" OnPageIndexChanging="grid_category_PageIndexChanging" OnDataBound="grid_category_DataBound"
                            CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                     <div style="text-align:center">
                                        <asp:Label ID="lblCatStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                        <asp:ImageButton ID="imgCatStatus" runat="server" Width="15px" Height="15px" />
                                        </div>
                                        </ItemTemplate>
                                    <HeaderStyle Width="50px" />
                                </asp:TemplateField>                              
                                <asp:TemplateField HeaderText="Comments">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCatComments" runat="server" Text='<%#Eval("comments") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnCatEdit" runat="server" Width="15px" Height="15px" ImageAlign="Middle"
                                            OnClick="imgbtnCatEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                               <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnCatEdit"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Update this?">
                                                                                </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                    <HeaderStyle Width="40px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tabpanel4" runat="server">
                    <HeaderTemplate>
                        TYPE</HeaderTemplate>
                    <ContentTemplate>
                        <asp:Button ID="btnCreateNewType" runat="server" Text="Add New Type" CssClass="btn btn-mini btn-primary"
                            OnClick="btnCreateNewType_Click" style="margin-left:40px; margin-top:30px" />
                            
                            
                            <asp:Panel ID="panelType" runat="server" DefaultButton="btnTypeSave" Visible="False"
                                Width="40%" Style="margin-left: 20%">
                                <table>
                                    <tr>
                                        <td>
                                            Type Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTypeName" runat="server" Width="115px"></asp:TextBox><asp:Label
                                                ID="lblTypeId" runat="server" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**"
                                                ValidationGroup="type" ControlToValidate="txtTypeName" CssClass="validation"></asp:RequiredFieldValidator>
                                           <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtTypeName" FilterType="Numbers,UppercaseLetters,LowercaseLetters" Enabled="true"></asp:FilteredTextBoxExtender>     
                                        </td>
                                      <td>
                                            Status
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlTypeStatus" runat="server" Width="115px">
                                                <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                              <asp:Label ID="lblProdType_Status_Comp" runat="server" Visible="false"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**"
                                                ValidationGroup="type" ControlToValidate="ddlTypeStatus" InitialValue="-1" CssClass="validation"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    </Table>
                                    <table>
                                    <tr>
                                        <td>
                                            Comments
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtComments" TextMode="MultiLine" runat="server" Width="282px" height="32px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="**"
                                                ValidationGroup="type" ControlToValidate="txtComments" CssClass="validation"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblTypeResult" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="center">
                                            <asp:Button ID="btnTypeSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                ValidationGroup="type" OnClick="btnTypeSave_Click" />
                                                   <asp:ConfirmButtonExtender ID="ConfirmbtnTypeSave" runat="server" TargetControlID="btndummyType"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?"></asp:ConfirmButtonExtender>
                                                                                  <asp:Button ID="btndummyType" runat="server" Visible="false" />
                                            <asp:Button ID="btnTypeClear" runat="server" Text="Clear" CssClass="btn btn-mini"
                                                Style="margin-left: 10px" onclick="btnTypeClear_Click" />
                                            <asp:Button ID="btnTypeCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                Style="margin-left: 10px" OnClick="btnTypeCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                     <br />
                        <asp:GridView ID="grid_type" runat="server" AutoGenerateColumns="False" Width="40%"  AllowPaging="True" DataKeyNames="type_id"
                            PageSize="5" Style="margin-left: 20%;margin-bottom:50px"
                            OnPageIndexChanging="grid_type_PageIndexChanging" 
                            ondatabound="grid_type_DataBound"
                            CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                            >
                            <Columns>
                                <asp:TemplateField>
                                <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTypeName" runat="server" Text='<%#Eval("type_name") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                       <div style="text-align:center">
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                        <asp:ImageButton ID="imgTypeStatus" runat="server" Width="15px" Height="15px" />
                                           </div></ItemTemplate>
                                    <HeaderStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comments">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTypeComments" runat="server" Text='<%#Eval("comments") %>'></asp:Label></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnTypeEdit" runat="server" Width="15px" Height="15px"
                                         ImageAlign="Middle" OnClick="imgbtnTypeEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                                                                                                          <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnTypeEdit"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Update this?">
                                                                                </asp:ConfirmButtonExtender>
                                      </ItemTemplate>
                                    <HeaderStyle Width="40px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tabpanelContractType" runat="server">
                                    <HeaderTemplate>
                                        CONTRACT TYPE</HeaderTemplate>
                                    <ContentTemplate>
                                
                                        <asp:Button ID="btnAddNewContractType" runat="server" Text="Add New Contract Type"
                                            CssClass="btn btn-mini btn-primary" OnClick="btnAddNewContractType_Click" Style="margin-left: 40px;
                                            margin-top: 30px" />
                                        <asp:Panel ID="panelContractType" runat="server" 
                                            DefaultButton="btnContractTypeSave" Visible="False"
                                            Width="40%" Style="margin-left: 20%">
                                            <table>
                                                <tr>
                                                    <td>
                                                        Contract Type
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtContractTypeName" runat="server" Width="115px"></asp:TextBox>
                                                        <asp:Label ID="lblContractTypeId" runat="server" Visible="False"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="**"
                                                            ValidationGroup="pt" ControlToValidate="txtContractTypeName" CssClass="validation"></asp:RequiredFieldValidator>

                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtContractTypeName" FilterType="Numbers,UppercaseLetters,LowercaseLetters" Enabled="true"></asp:FilteredTextBoxExtender>     
                                                    </td>

                                    <td>
                                        Status
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlContractTypeStatus" runat="server" Width="115px">
                                            <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="**"
                                            ValidationGroup="pt" ControlToValidate="ddlContractTypeStatus" InitialValue="-1" CssClass="validation"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                </Table>
                                <table>
                                                <tr>
                                                    <td style="width:74px">
                                                        Comments
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtContractTypeDesc" TextMode="MultiLine" runat="server" Width="282px" Height="32px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="**"
                                                            ValidationGroup="pt" ControlToValidate="txtContractTypeDesc" CssClass="validation"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:Label ID="lblContractTypeResult" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="center">
                                                        <asp:Button ID="btnContractTypeSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                            ValidationGroup="pt" OnClick="btnContractTypeSave_Click" />
                                                              <asp:ConfirmButtonExtender ID="Confirm_ContractSave" runat="server" TargetControlID="btndummyContract"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?"></asp:ConfirmButtonExtender>
                                                                                  <asp:Button ID="btndummyContract" runat="server" Visible="false" />
                                                        <asp:Button ID="btnContractTypeClear" runat="server" Text="Clear" CssClass="btn btn-mini"
                                                            Style="margin-left: 10px" OnClick="btnContractTypeClear_Click" />
                                                        <asp:Button ID="btnContractTypeCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                            Style="margin-left: 10px" OnClick="btnContractTypeCancel_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <br />
                                        <asp:GridView ID="grid_ContractType" runat="server" AutoGenerateColumns="False" Width="40%"
                                            AllowPaging="True" DataKeyNames="contract_type_id" PageSize="5" Style="margin-left: 20%;
                                            margin-bottom: 50px" OnPageIndexChanging="grid_ContractType_PageIndexChanging"
                                            
                                            CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped" 
                                            OnDataBound="grid_ContractType_DataBound">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContractTypeName" runat="server" Text='<%#Eval("contract_type_name") %>'></asp:Label></ItemTemplate>
                                                </asp:TemplateField> 
                                                 <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                    <div style="text-align:center">
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                                        <asp:ImageButton ID="imgContractType" runat="server" Width="15px" Height="15px" ImageAlign="Middle" />
                                                        </div> 
                                                        </ItemTemplate>
                                                </asp:TemplateField>                                              
                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContractTypeDesc" runat="server" Text='<%#Eval("contract_type_desc") %>'></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                 
                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnContarctTypeEdit" runat="server" Width="15px" Height="15px"
                                                            ImageAlign="Middle" OnClick="imgbtnContarctTypeEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                                              <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnContarctTypeEdit"
                                                                               ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Update this?">
                                                                                </asp:ConfirmButtonExtender>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="40px" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                   
                      </ContentTemplate>
                                </asp:TabPanel>
            </asp:TabContainer>
                       
        </ContentTemplate>
    </asp:UpdatePanel>
     </div>
                    </div>
                    </div>
                </div>
            </div>
</asp:Content>

