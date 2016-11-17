<%@ Page Title="" Language="C#" MasterPageFile="~/store_mngr/store_mngr_master.master" AutoEventWireup="true" CodeFile="add_product.aspx.cs" Inherits="store_mngr_purchase_order"  Culture = "en-GB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
     th
    {
        text-align:center !important;
     
        }
    .calender
    {
        width:auto !important;
        background-color:White;
        border:1px solid;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="container-fluid">
            <div class="row-fluid">
                
                <div class="span12">
                 <div class="containerHeadline">
                    <i class="icon-tag"></i>
                    <h2>
                        ADD PRODUCT
                    </h2>
                </div>
                <div class="floatingBox">
                    
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>
                        <br />
                        <asp:Button ID="btnNewProduct" runat="server" Text="Add New Product"  style="margin-left:30px"
                                CssClass="btn btn-mini btn-primary" onclick="btnNewProduct_Click" />
                        <br />
                        <asp:Panel ID="panel_add_product"  style="margin-left:50px;margin-top:30px" runat="server" DefaultButton="btnProductSave">
                            <table style="margin-left:20px; width:95%">
                                <tr style="margin-top:30px !important">
                                    <td>
                                        Product Type
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlProdType" runat="server" Width="138px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv1" runat="server" CssClass="validation" ControlToValidate="ddlProdType"
                                            InitialValue="0" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        Product Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProdName" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validation"
                                            ControlToValidate="txtProdName" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="fte1" runat="server" FilterType="UppercaseLetters,Numbers,LowercaseLetters,Custom" ValidChars=" "
                                            Enabled="true" TargetControlID="txtProdName">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        Model
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtModel" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="validation"
                                            ControlToValidate="txtModel" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" "
                                            Enabled="true" TargetControlID="txtModel">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Manufacturer
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtManufacturer" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="purchase"
                                            CssClass="validation" ControlToValidate="txtManufacturer" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtManufacturer"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" " Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        Serial No
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSerialNo" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSerialNo"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtSerialNo"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" " Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        Part No
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPartNo" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPartNo"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtPartNo"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" " Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                     <td>
                                        Location
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLoaction" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtLoaction"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="txtLoaction"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" " Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        State
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlState" runat="server" Width="138px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlState"
                                            InitialValue="0" ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                    </td>
                                      <td>
                                        Site
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlSite" runat="server" Width="138px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="ddlSite"
                                            InitialValue="0" ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                    </td>
                                
                                </tr>
                                <tr>
                                    <td>
                                        Vendor
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlVendor" runat="server" Width="138px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlVendor"
                                            InitialValue="0" ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        Agent
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAgent" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAgent"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtAgent"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" " Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        P.O 
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlPOs" runat="server" Width="138px"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlPOs"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                       
                                    </td>
                                   
                                </tr>
                                
                                <tr>
                                    
                                    <td>
                                        Acquisition Date
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAcquisitionDate" runat="server" MaxLength="10" Width="125px"></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" ControlToValidate="txtAcquisitionDate"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtAcquisitionDate"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtAcquisitionDate"
                                            Format="dd-MM-yyyy" CssClass="calender">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td>
                                        Warranty Exp Date
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWarrantyDaye" runat="server" MaxLength="10" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtWarrantyDaye"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="re1" runat="server" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" ControlToValidate="txtWarrantyDaye"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RegularExpressionValidator>
                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtWarrantyDaye"
                                            Format="dd-MM-yyyy" CssClass="calender">
                                        </asp:CalendarExtender>
                                    </td>
                                    
                                    <td>
                                        Expiry Date
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtExperyDate" runat="server" MaxLength="10" Width="125px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" ControlToValidate="txtExperyDate"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtExperyDate"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtExperyDate"
                                            Format="dd-MM-yyyy" CssClass="calender">
                                        </asp:CalendarExtender>
                                    </td>
                                   
                                </tr>
                                <tr>
                                  <td>
                                        Purchase Cost
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPurchaseCost" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPurchaseCost"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtPurchaseCost"
                                            FilterType="Custom, Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                  
                                <td>
                                        Current Asset Value
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCurrentAssetvalue" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtCurrentAssetvalue"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtCurrentAssetvalue"
                                            FilterType="Custom, Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        Business Impact
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlBusinessImpact" runat="server" Width="138px">
                                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="High" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Medium" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Low" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Utility" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Consumable" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="ddlBusinessImpact"
                                            InitialValue="0" ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                    </td>
                                    
                                    
                                </tr>
                                <tr>
                                    <td>
                                        Voucher No
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVocherNo" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtVocherNo"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtVocherNo"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" " Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                   
                                    <td>
                                        Invoice No
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtInvoiceNo" runat="server" Width="125px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtInvoiceNo"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtInvoiceNo"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" ValidChars=" " Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                  
                                        <td>
                                        Description
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="125px" Height="25px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDescription"
                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtDescription"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters, Custom" ValidChars=" ,.,," Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                               
                                </tr>
                                <tr>
                                   
                                    
                                    <td colspan="4">
                                    <asp:CompareValidator ID="compv1" runat="server" ControlToValidate="txtWarrantyDaye" ControlToCompare="txtAcquisitionDate" Operator="GreaterThan" Type="Date" CultureInvariantValues="false"
                                     ErrorMessage="Warranty Date Should be greater than Acquisition Date " ValidationGroup="purchase" CssClass="validation" Enabled="true" Display="Dynamic" ></asp:CompareValidator>
                                     <br />
                                     <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtExperyDate" ControlToCompare="txtWarrantyDaye" Operator="GreaterThanEqual" Type="Date" CultureInvariantValues="true"
                                     ErrorMessage="Expiry Date Should be greater than Warranty Date " ValidationGroup="purchase" CssClass="validation" Enabled="true" Display="Dynamic" ></asp:CompareValidator>
                                     <br />
                                     <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtExperyDate" ControlToCompare="txtAcquisitionDate" Operator="GreaterThan" Type="Date" CultureInvariantValues="true"
                                     ErrorMessage="Expiry Date Should be greater than Acquisition Date" ValidationGroup="purchase" CssClass="validation" Enabled="true" Display="Dynamic" ></asp:CompareValidator>
                                    </td>
                                   
                                </tr>
                                <tr>
                                <td colspan="6">
                                <asp:Label ID="lblResult" runat="server"></asp:Label>
                                </td>
                                </tr>
                                <tr>
                                 <td colspan="2"></td>
                                <td colspan="4">
                                 <asp:Button ID="btnProductSave" runat="server" Text="Save" CssClass="btn  btn-primary"
                                            ValidationGroup="purchase" onclick="btnProductSave_Click" />
                                        <asp:Button ID="btnProductClear" runat="server" Text="Clear" CssClass="btn "
                                            Style="margin-left: 10px" onclick="btnProductClear_Click"  />
                                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                        CssClass="btn btn-danger" onclick="btnCancel_Click" Style="margin-left: 10px"  />
                                </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            <br />
                            <asp:GridView ID="grid_prod_list" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                PageSize="15" OnPageIndexChanging="paging" Width="70%" Style="margin-left: 10%" DataKeyNames="prod_id, site, state"
                                CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnEditSite" Style="width: 20px; height: 20px;" class="btn btn-mini"
                                                runat="server" Text="#" OnClick="btnEditSite_Click" title="Asset Relocation" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                    <asp:Label ID="lblProdID" runat="server" Text='<%#Eval("prod_id") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                    <asp:Label ID="lblProdName" runat="server" Text='<%#Eval("prod_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type">
                                    <ItemTemplate>
                                    <asp:Label ID="lblProdType" runat="server" Text='<%#Eval("p_type_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Model">
                                    <ItemTemplate>
                                    <asp:Label ID="lblModel" runat="server" Text='<%#Eval("model") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Manufacturer">
                                    <ItemTemplate>
                                    <asp:Label ID="lblManufacturer" runat="server" Text='<%#Eval("manifacture") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Serial No">
                                    <ItemTemplate>
                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Eval("serial_no") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("location") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Expiry On">
                                    <ItemTemplate>
                                    <asp:Label ID="lblExpiryOn" runat="server" Text='<%#Eval("[DD-MM-YYYY]") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>                                    
                                </Columns>
                            </asp:GridView>
                            <br />
                            <asp:UpdatePanel ID="up2" runat="server">
                                                    <ContentTemplate>
                                                        <button id="btnDummy" style="width: 30px; height: 30px; display:none" class="btn btn-mini"
                                                             runat="server" title="dummy">
                                                            <i class="icon-list-ul"></i>
                                                        </button>
                                                        <asp:ModalPopupExtender ID="popupAsset" runat="server" TargetControlID="btnDummy"
                                                            PopupControlID="panelAssetTransfer" >
                                                        </asp:ModalPopupExtender>
                                                        <asp:Panel ID="panelAssetTransfer" runat="server" Width="600px">
                                                            <div class="floatingBox">
                                                                <div class="container-fluid">
                                                                    <div class="row-fluid" style="margin-bottom:0px !Important">
                                                                        <div class="span12">
                                                                            <div class="containerHeadline" id="Div1">
                                                                                <i class="icon-ok-sign"></i>
                                                                                <h2>
                                                                                    Assets Transfer - asset no(<asp:Label ID="lblAssetNo" runat="server"></asp:Label>)
                                                                                    </h2>
                                                                            </div>
                                                                            <div class="floatingBox" style="margin-bottom:0px !Important">
                                                                                <div class="container-fluid">
                                                                                    <div class="form-horizontal contentForm">
                                                                                        <table style="font-weight:bold; width:100%">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Name  : 
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:Label ID="lblAssetName" runat="server" style="font-weight:normal"></asp:Label>
                                                                                                </td>
                                                                                                <td>
                                                                                                    Model
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:Label ID="lblModel" runat="server" style="font-weight:normal"></asp:Label>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Manufacturer
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:Label ID="lblManufacturer" runat="server" style="font-weight:normal"></asp:Label>
                                                                                                </td>
                                                                                                <td>
                                                                                                    Serial No
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:Label ID="lblSerialNo" runat="server" style="font-weight:normal"></asp:Label>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Ticket ID
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtTicketID" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                                                                                                    <asp:FilteredTextBoxExtender ID="filter1" runat="server" TargetControlID="txtTicketID" FilterType="Numbers" Enabled="true"></asp:FilteredTextBoxExtender>
                                                                                                </td>
                                                                                                <td>
                                                                                                    State
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlNewState" runat="server" Width="100px">
                                                                                                    </asp:DropDownList>
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlNewState"
                                                                                                        InitialValue="0" ErrorMessage="**" CssClass="validation" ValidationGroup="transfer"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Site
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlNewSite" runat="server" Width="150px">
                                                                                                    </asp:DropDownList>
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="ddlNewSite"
                                                                                                        InitialValue="0" ErrorMessage="**" CssClass="validation" ValidationGroup="transfer"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    Location
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtNewLocation" runat="server"></asp:TextBox>
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtNewLocation"
                                                                                                        ErrorMessage="**" CssClass="validation" ValidationGroup="transfer"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Comments
                                                                                                </td>
                                                                                                <td colspan="3">
                                                                                                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                                                                    <asp:RequiredFieldValidator ID="rfvd1" runat="server" ControlToValidate="txtComments"
                                                                                                        ErrorMessage="**" CssClass="validation" ValidationGroup="transfer"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td colspan="2">
                                                                                                    <asp:Label ID="lblTransferResult" runat="server"></asp:Label>
                                                                                                </td>
                                                                                                <td>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                        <div style="margin-top:15px !Important">
                                                                                        <asp:Button ID="btnAssetSubmit" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                                            ValidationGroup="transfer" OnClick="btnAssetSubmit_Click" style="margin-left:70% !Important;" />
                                                                                        <asp:Button ID="btnAssetCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                                                            Style="margin-left: 10px" onclick="btnAssetCancel_Click"  />
                                                                                            </div>
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
                        </ContentTemplate>
                    </asp:UpdatePanel>
              </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

