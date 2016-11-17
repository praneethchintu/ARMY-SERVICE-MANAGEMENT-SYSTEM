<%@ Page Title="" Language="C#" MasterPageFile="~/store_mngr/store_mngr_master.master"
    AutoEventWireup="true" CodeFile="vendor_reg.aspx.cs" Inherits="store_mngr_vendor_reg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        th
        {
            text-align: center !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="span10" style="margin-left: 0%; margin-top: 0px">
                        <div class="containerHeadline">
                            <i class="icon-tag"></i>
                            <h2>
                                Vendor Registration
                            </h2>
                        </div>
                        <div class="floatingBox examples">
                            <div class="container-fluid">
                                <asp:UpdatePanel ID="updatepanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnShowReg" runat="server" Text="Add Vendor" CssClass="btn btn-mini btn-primary"
                                            OnClick="btnShowReg_Click" />
                                        <asp:Panel ID="panelVendorReg" runat="server" Visible="false">
                                            <table width="60%" style="margin-left: 15%">
                                                <tr>
                                                    <td>
                                                        Name
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtVendorName" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtVendorName"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="f1" runat="server" TargetControlID="txtVendorName"
                                                            FilterType="Custom,UppercaseLetters, LowercaseLetters" FilterMode="ValidChars"
                                                            ValidChars=" " Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        Description
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="150px" Height="25px"></asp:TextBox>
                                                    </td>

                                                     <td>
                                                        Address
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="150px" Height="25px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        City
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCity"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtCity"
                                                            FilterType="UppercaseLetters, LowercaseLetters" FilterMode="ValidChars" ValidChars=" "
                                                            Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        State
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtState"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtState"
                                                            FilterType="UppercaseLetters, LowercaseLetters" FilterMode="ValidChars" ValidChars=" "
                                                            Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        Country
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCountry"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtCountry"
                                                            FilterType="UppercaseLetters, LowercaseLetters" FilterMode="ValidChars" ValidChars=" "
                                                            Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        PinCode
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPinCode" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPinCode"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtPinCode"
                                                            FilterType="Numbers" Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        e-mail
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPinCode"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtPinCode"
                                                            FilterType="Numbers,Custom,LowercaseLetters" FilterMode="ValidChars" ValidChars=".,@"
                                                            Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                        <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txtEmailID"
                                                            ErrorMessage="Invalid" ValidationGroup="vendor" Display="Dynamic" CssClass="validation"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>
                                                        Web URL
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtWebURL" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtWebURL"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtWebURL"
                                                            FilterType="LowercaseLetters,Numbers,Custom" FilterMode="ValidChars" ValidChars=".,/,:"
                                                            Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtWebURL"
                                                            ErrorMessage="**" ValidationGroup="vendor" Display="Dynamic" CssClass="validation"
                                                            ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?">
                                                        </asp:RegularExpressionValidator>
                                                    </td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Phone 1
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPhone1" runat="server" MaxLength="10"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPhone1"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtPhone1"
                                                            FilterType="Numbers" FilterMode="ValidChars" ValidChars=".,@" Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="**"
                                                            CssClass="validation" ValidationGroup="vendor" ValidationExpression="^[6789]\d{9}$"
                                                            ControlToValidate="txtPhone1"></asp:RegularExpressionValidator>
                                                    <td>
                                                        Phone 2
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPhone2" runat="server" MaxLength="10"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPhone2"
                                                            ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtPhone2"
                                                            FilterType="Numbers" FilterMode="ValidChars" ValidChars=".,@" Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="**"
                                                            CssClass="validation" ValidationGroup="vendor" ValidationExpression="^[6789]\d{9}$"
                                                            ControlToValidate="txtPhone2"></asp:RegularExpressionValidator>
                                                            </td>
                                                             <td>
                                                         Contact Person
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="txtContactPerson" runat="server"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtContactPerson"
                                                             ErrorMessage="**" ValidationGroup="vendor" CssClass="validation"></asp:RequiredFieldValidator>
                                                         <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtContactPerson"
                                                             FilterType="Custom, UppercaseLetters, LowercaseLetters" FilterMode="ValidChars" ValidChars=" "
                                                             Enabled="true">
                                                         </asp:FilteredTextBoxExtender>
                                                     </td>
                                                   
                                                </tr>
                                                <tr style="border-top: 1px ! important; border-top-color: Black">
                                                   
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <asp:Label ID="lblVendorResult" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="8" align="center">
                                                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                            OnClick="btnSave_Click" ValidationGroup="vendor" />
                                                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-mini" Style="margin-left: 30px"
                                                            OnClick="btnClear_Click" />
                                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                            Style="margin-left: 30px" OnClick="btnCancel_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="span8" style="margin-left: 10%; margin-top: 30px">
                                    <asp:Panel ID="panelVendorList" runat="server">
                                        <asp:UpdatePanel ID="updatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grid_vendor_list" runat="server" DataKeyNames="vendor_id" AutoGenerateColumns="false"
                                                    CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="grid_vendor_list_OnPageIndexChanging">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex+1 %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Vendor">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVendorName" runat="server" Text='<%#Eval("vendor_name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Person">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblContatctPersonName" runat="server" Text='<%#Eval("contact_person") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Address">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="State">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblState" runat="server" Text='<%#Eval("state") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Phone">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("phone_no_1") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
