<%@ Page Title="" Language="C#" MasterPageFile="~/store_mngr/store_mngr_master.master" AutoEventWireup="true" CodeFile="po.aspx.cs" Inherits="store_mngr_po" Culture="en-GB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
      th
            {
                text-align: center !important;
            }
.tect_right
{
    text-align:right !important;
    }
    .tect_center
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
                  <div class="containerHeadline">
                    <i class="icon-tag"></i>
                    <h2>
                      PURCHASE ORDER
                    </h2>
                </div>
                <div class="floatingBox">
                    
                    <asp:UpdatePanel ID="updatePanel1" runat="server">
                        <ContentTemplate>

                        <br />
                        <asp:Button ID="btnAddNewPO" runat="server" Text="New PO" 
                                CssClass="btn btn-mini btn-primary" style="margin-left:30px" 
                                onclick="btnAddNewPO_Click" />
                        <br />
                        <asp:Panel ID="panel_purchase_order" runat="server" Visible="false" DefaultButton="btnProductSave">
                            <table style="margin-left:20px; width:95%">
                                <tr style="margin-top:30px !important">
                                    <td>
                                        PO Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPOname" runat="server" style="height:15px !important"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" CssClass="validation"
                                            ControlToValidate="txtPOname" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" FilterType="UppercaseLetters,Numbers,LowercaseLetters,Custom" ValidChars=" "
                                            Enabled="true" TargetControlID="txtPOname">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                       Required By
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRequiredBy" runat="server" MaxLength="10" style="height:15px !important; width:80px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validation"
                                            ControlToValidate="txtRequiredBy" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="fte1" runat="server" FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars="-"
                                            Enabled="true" TargetControlID="txtRequiredBy">
                                        </asp:FilteredTextBoxExtender>
                                         <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtRequiredBy" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td>
                                     Vendor
                                    </td>
                                    <td>
                                      <asp:DropDownList ID="ddlVendor" runat="server"  style="height:25px !important"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="validation"
                                            ControlToValidate="ddlVendor" InitialValue="0" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                      
                                    </td>
                                </tr>
                                <tr>
                                 <td>
                                       Product Type
                                    </td>
                                    <td>
                                       <asp:DropDownList ID="ddlProductType" runat="server" AutoPostBack="true" 
                                            style="height:25px !important; width:140px" 
                                            onselectedindexchanged="ddlProductType_SelectedIndexChanged">
                                       </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="validation"
                                            ControlToValidate="ddlProductType" InitialValue="0" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                     
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        Shipping Address
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtShippingAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="purchase"
                                            CssClass="validation" ControlToValidate="txtShippingAddress" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtShippingAddress"
                                            FilterType="UppercaseLetters,Numbers, LowercaseLetters,Custom" FilterMode="ValidChars" ValidChars=" " Enabled="true">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                   
                                </tr>
                            <tr>
                            <td align="left" valign="top"><h4>Product list</h4></td>
                            <td align="right" colspan="5">
                            
                                <asp:GridView ID="grid_products" runat="server" AutoGenerateColumns="false" Width="100%"
                                    Style="margin-left: 0%" OnDataBound="grid_products_DataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S No" HeaderStyle-Width="4%">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Name" HeaderStyle-Width="20%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("product_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Part No." HeaderStyle-Width="20%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPartNo" runat="server" Text='<%#Eval("part_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtPrice" runat="server" Text='<%#Eval("price") %>' OnTextChanged="product_details_changed"
                                                    AutoPostBack="true" Style="text-align: right !important; width: 100px"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="fte1" runat="server" TargetControlID="txtPrice"
                                                    FilterType="Custom, Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true">
                                                </asp:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tax Rate" HeaderStyle-Width="6%">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtTaxRate" runat="server" Text='<%#Eval("tax_rate") %>' OnTextChanged="product_details_changed"
                                                    AutoPostBack="true" Width="50px" Style="text-align: right !important;"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="fte2" runat="server" TargetControlID="txtTaxRate"
                                                    FilterType="Custom, Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true">
                                                </asp:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity" HeaderStyle-Width="6%">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%#Eval("quantity") %>' OnTextChanged="product_details_changed"
                                                    AutoPostBack="true" Width="40px" Style="text-align: right !important;"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="fte3" runat="server" TargetControlID="txtQuantity"
                                                    FilterType="Numbers" Enabled="true">
                                                </asp:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("amount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                            </tr>
                            <tr>
                            <td></td>
                            <td></td>
                            <td colspan="2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlDeparment" CssClass="validation" ValidationGroup="purchase" ErrorMessage="Sub Total should not be Zero..."></asp:RequiredFieldValidator>
                            </td>
                            <td colspan="2" align="right">
                            
                            Sub Total <asp:TextBox ID="txtSubTotal" runat="server" Width="150px" Enabled="false" OnTextChanged="bill_details_changed" AutoPostBack="true" style="text-align:right; height:15px !important"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="ftExte1" runat="server" TargetControlID="txtSubTotal" FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true"></asp:FilteredTextBoxExtender>
                            <br />
                            Shipping Cost <asp:TextBox ID="txtShippingCost" runat="server" Width="150px" OnTextChanged="bill_details_changed" AutoPostBack="true" style="text-align:right; height:15px !important"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtShippingCost" FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true"></asp:FilteredTextBoxExtender>
                            <br />
                            Sales Tax Rate<asp:TextBox ID="txtSalesTaxRate" runat="server" Width="50px" OnTextChanged="bill_details_changed" AutoPostBack="true" style="text-align:right; height:15px !important"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtSalesTaxRate" FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true"></asp:FilteredTextBoxExtender>
                            <asp:TextBox ID="txtSalesTaxCost" runat="server" Width="100px" OnTextChanged="bill_details_changed" AutoPostBack="true" style="text-align:right; height:15px !important"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtSalesTaxRate" FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true"></asp:FilteredTextBoxExtender>
                            <br />
                            Additional Tax Rate<asp:TextBox ID="txtAdditionalTaxRate" runat="server" Width="50px" OnTextChanged="bill_details_changed" AutoPostBack="true" style="text-align:right; height:15px !important"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtAdditionalTaxRate" FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true"></asp:FilteredTextBoxExtender>
                            <asp:TextBox ID="txtAddditionalCost" runat="server" Width="100px" OnTextChanged="bill_details_changed" AutoPostBack="true" style="text-align:right; height:15px !important"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtAdditionalTaxRate" FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true"></asp:FilteredTextBoxExtender>
                            <br />
                            Total <asp:TextBox ID="txtTotalAmount" runat="server" Width="150px" ReadOnly="true" style="text-align:right; height:15px !important"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtTotalAmount" FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="." Enabled="true"></asp:FilteredTextBoxExtender>
                            </td>
                            </tr>
                            <tr>
                            <td>
                            Remarks
                            </td>
                            <td>
                             <asp:TextBox Width="200px" ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                            Terms 
                            </td>
                            <td>
                            <asp:TextBox Width="200px" ID="txtTerms" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                             <td>Approaved Date</td>
                            <td><asp:TextBox ID="txtApproavedDate" runat="server" style="height:15px !important"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtApproavedDate" CssClass="validation" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                            <asp:CalendarExtender ID="cal45" runat="server" TargetControlID="txtApproavedDate" Format="dd-MM-yyyy"></asp:CalendarExtender>

                             </td>
                            </tr>
                            <tr>
                            <td>Department</td>

                            <td>
                            
                            <asp:DropDownList ID="ddlDeparment" runat="server" 
                                    style="height:25px !important" 
                                    onselectedindexchanged="ddlDeparment_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv879" runat="server" ControlToValidate="ddlDeparment" InitialValue="0" CssClass="validation" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                          
                             </td>
                            <td>Person</td>
                            <td><asp:DropDownList ID="ddlPerson" runat="server" style="height:25px !important"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlPerson" InitialValue="0" CssClass="validation" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                             </td>
                         
                               <td>Attachment file</td>
                            <td>
                            <asp:FileUpload ID="fileUpload1" runat="server" Width="210px" style="margin-left:40px" />
                                                            <br />
                                 <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="always">
                <ContentTemplate>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnProductSave" />
                </Triggers>
            </asp:UpdatePanel>         
                                                            <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="fileUpload1"
                                                                ErrorMessage="Only .doc(Word), .docx, .txt, .pdf and  .xls(Excel) files" CssClass="validation" ValidationGroup="purchase" 
                                                                ValidationExpression="(.*\.([Dd][Oo][Cc])|.*\.([Pp][Dd][Ff])|.*\.([Tt][Xx][Tt])|.*\.([Xx][Ll][Ss][Xx])|.*\.([Xx][Ll][Ss])|.*\.([Dc][Oo][Cc][Xx])$)">
                                                                </asp:RegularExpressionValidator></td>
                            </tr>
                                <tr>
                                <td colspan="3">
                                <asp:Label ID="lblResult" runat="server"></asp:Label>
                                </td>
                                <td colspan="3">
                                 <asp:Button ID="btnProductSave" runat="server" Text="Save" CssClass="btn  btn-primary"
                                            ValidationGroup="purchase" onclick="btnProductSave_Click" />
                                        <asp:Button ID="btnProductClear" runat="server" Text="Clear" CssClass="btn "
                                            Style="margin-left: 10px" onclick="btnProductClear_Click"  />
                                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                        CssClass="btn btn-danger" Style="margin-left: 10px" 
                                        onclick="btnCancel_Click"  />
                                </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            <br />
                            <asp:Label ID="lblResult2" runat="server"></asp:Label>
                            <asp:GridView ID="grid_po_list" runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            PageSize="15" Width="50%" style="margin-left:20%" DataKeyNames="po_no"
                            CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                            <Columns>
                            <asp:BoundField HeaderText="PO No." DataField="po_no" />
                            <asp:BoundField HeaderText="PO Name" DataField="po_name" />
                            <asp:BoundField HeaderText="Vendor" DataField="vendor_name" />
                              <asp:TemplateField HeaderText="Required By" ItemStyle-CssClass="tect_center">
                                    <ItemTemplate>
                                    <asp:Label ID="lblRequiredBy" runat="server" Text='<%#Eval("[DD-MM-YYYY]") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>                           
                            <asp:BoundField HeaderText="Total Cost" DataField="total_amount" ItemStyle-CssClass="tect_right" />
                            <asp:BoundField HeaderText="Status" DataField="status" ItemStyle-CssClass="tect_center"/>
                            <asp:TemplateField>
                            <ItemTemplate>
                            <asp:ImageButton ID="imgbtnDelete" runat="server" Height="20px" Width="20px" ImageAlign="Middle" ToolTip="Delete"
                            OnClick="imgbtnDelete_Click" ImageUrl="~/Icons/1385391089_delete-outline.png" AlternateText="Delete" />
                              <asp:ConfirmButtonExtender ID="comfrm11" runat="server" TargetControlID="imgbtnDelete"
                       ConfirmText="Are you sure, You want to Delete this Purchase Order..."></asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            </asp:TemplateField>
                            </Columns>
                            </asp:GridView>
                            <br />

                              <asp:Button ID="btndummy1" runat="server" style="display:none" />
                                          <asp:ModalPopupExtender ID="popUpProdSelection" runat="server" TargetControlID="btndummy1"
                                                            PopupControlID="panelProducts" >
                                                        </asp:ModalPopupExtender>
                            <asp:Panel ID="panelProducts" runat="server" Width="450px" Height="500px">
                                <div class="floatingBox">
                                    <div class="container-fluid">
                                        <div class="row-fluid" style="margin-bottom: 0px !Important">
                                            <div class="span12">
                                                <div class="containerHeadline">
                                                    <i class="icon-ok-sign"></i>
                                                    <h2>
                                                        Add Products</h2>
                                                </div>
                                                <div class="floatingBox" style="margin-bottom: 0px !Important">
                                                    <div class="container-fluid">
                                                        <div class="form-horizontal contentForm">

                                                        <asp:GridView ID="grid_products_selection" runat="server" AutoGenerateColumns="false" Width="100%">
                                                        <Columns>
                                                        <asp:TemplateField>
                                                        <ItemTemplate>
                                                        <asp:CheckBox ID="chkProd" runat="server" />
                                                        </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                        <asp:Label ID="lblProdName" runat="server" Text='<%#Eval("product_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Part No">
                                                        <ItemTemplate>
                                                        <asp:Label ID="lblPartNo" runat="server" Text='<%#Eval("part_no") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Cost">
                                                        <ItemTemplate>
                                                        <asp:Label ID="lblCost" runat="server" Text='<%#Eval("cost") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        </asp:TemplateField>
                                                        
                                                        </Columns>
                                                        </asp:GridView>
                                                        <br />
                                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-mini btn-primary" style="margin-left:70%" />
                                                        <asp:Button ID="Button1" runat="server" Text="Cancel" 
                                                                CssClass="btn btn-mini btn-danger" onclick="Button1_Click" />

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

</asp:Content>

