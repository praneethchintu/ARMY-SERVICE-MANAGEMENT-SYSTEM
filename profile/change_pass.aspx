<%@ Page Title="" Language="C#" MasterPageFile="~/profile/MasterPage.master" AutoEventWireup="true" CodeFile="change_pass.aspx.cs" Inherits="profile_change_pass" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link rel="stylesheet" href="../css/styles.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css">     
   .span12 {
width: 100% !important;
}
</style>
    <div class="content">
        <asp:Panel runat="server" ID="panelPasswordChange" class="span12">
            <div class="floatingBox">
                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="span4" style="margin-left:30%; margin-top: 30px">
                            <div class="containerHeadline">
                                <i class="icon-tag"></i>
                                <h2>
                                    Change Password
                                </h2>
                            </div>
                            <div class="floatingBox examples">
                                <div class="container-fluid">
                                    <asp:UpdatePanel ID="updatepanel1" runat="server">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td style="width: 150px">
                                                        User ID
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblUserId" runat="server"></asp:Label>
                                                    </td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Old Password
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender ID="f1" runat="server" TargetControlID="txtOldPass"
                                                            FilterType="Numbers,UppercaseLetters, LowercaseLetters" Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                    
                                                    
                                                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtOldPass"
                                                            ErrorMessage="***" ValidationGroup="pass" CssClass="validation"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        New Password
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtNewPass"
                                                            FilterType="Numbers, UppercaseLetters, LowercaseLetters" Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                    
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPass"
                                                            ErrorMessage="***" ValidationGroup="pass" CssClass="validation"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtNewPass"
                                                            Display="Dynamic" ValidationExpression="^[a-zA-Z0-9]*$" ErrorMessage="password should be in alphanumeric format"
                                                            CssClass="validation" ValidationGroup="pass"></asp:RegularExpressionValidator><br />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPass"
                                                            Display="Dynamic" ValidationExpression="^[a-zA-Z0-9]{6,15}$" ErrorMessage="min. 6 & max. 15 characters"
                                                            CssClass="validation" ValidationGroup="pass"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Confirm Password
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers,UppercaseLetters, LowercaseLetters"
                                                            TargetControlID="txtConfirmPass" Enabled="true">
                                                        </asp:FilteredTextBoxExtender>
                                                   
                                                        <asp:CompareValidator ID="cn1" runat="server" ControlToValidate="txtConfirmPass"
                                                            ControlToCompare="txtNewPass" ErrorMessage="not matching.." Type="String" CssClass="validation"
                                                            Operator="Equal" ValidationGroup="pass"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:Label ID="lblPasswordResult" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    
                                                    <td colspan="2" align="center">
                                                        <asp:Button ID="btnDone" runat="server" Text="Done" CssClass="btn btn-primary btn-mini"
                                                            ValidationGroup="pass" OnClick="btnDone_Click" />
                                                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-mini" OnClick="btnClear_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

