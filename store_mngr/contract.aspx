<%@ Page Title="" Language="C#" MasterPageFile="~/store_mngr/store_mngr_master.master" AutoEventWireup="true" CodeFile="contract.aspx.cs" Inherits="store_mngr_contract" Culture="en-GB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
     
    .select-fleft tbody tr td label, .select-fleft tbody tr td input  { float: left !important; display: block !important; padding: 0 10px !important; }
</style>
    <style type="text/css">
          th
    {
        text-align:center !important;
     
        }
        #wizHeader li .prevStep
        {
            background-color: #545a5f;
            color:White;
        }
        #wizHeader li .prevStep:after
        {
            border-left-color: #545a5f !important;
            color:White !important;            
        }
        #wizHeader li .currentStep
        {
            background-color: #545a5f;
            color:#33B5E5;
        }
        #wizHeader li .currentStep:after
        {
            border-left-color: #545a5f !important;
            color:#33B5E5 !important;
        }
        #wizHeader li .nextStep
        {
            background-color: #f2f2f2;
        }
        #wizHeader li .nextStep:after
        {
            border-left-color: #f2f2f2 !important;
        }
        #wizHeader
        {
            list-style: none;
            overflow: hidden;
            font: 11px Helvetica, Arial, Sans-Serif;
            margin: 0px;
            padding: 0px;
        }
        #wizHeader li
        {
            float: left;
        }
        #wizHeader li a
        {
            color: Gray;
            text-decoration: none;
            padding: 4px 0 4px 55px;
            background: brown; /* fallback color */
            background: hsla(34,85%,35%,1);
            position: relative;
            display: block;
            float: left;
        }
        #wizHeader li a:after
        {
            content: " ";
            display: block;
            width: 0;
            height: 0;
            border-top: 50px solid transparent; /* Go big on the size, and let overflow hide */
            border-bottom: 50px solid transparent;
            border-left: 30px solid hsla(34,85%,35%,1);
            position: absolute;
            top: 50%;
            margin-top: -50px;
            left: 100%;
            z-index: 2;
        }
        #wizHeader li a:before
        {
            content: " ";
            display: block;
            width: 0;
            height: 0;
            border-top: 50px solid transparent;
            border-bottom: 50px solid transparent;
            border-left: 30px solid white;
            position: absolute;
            top: 50%;
            margin-top: -50px;
            margin-left: 1px;
            left: 100%;
            z-index: 1;
        }
        #wizHeader li:first-child a
        {
            padding-left: 10px;
        }
        #wizHeader li:last-child
        {
            padding-right: 50px;
        }
        #wizHeader li a:hover
        {
            <%--background: #FE9400;--%>
        }
        #wizHeader li a:hover:after
        {
           <%-- border-left-color: #FE9400 !important;--%>
        }
        .content
        {
            height: 150px;
            padding-top: 5px;
            text-align: center;
            background-color: #F9F9F9;
            font-size: 48px;
        }
        .hidden { display:none; }
        .show { display:inline; }
        
        
    </style>
    <style type="text/css">
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
                <div class="containerHeadline">
                    <i class="icon-tag"></i>
                    <h2>
                        CONTRACT
                    </h2>
                    </div>
                <div class="floatingBox examples">
                    <div class="container-fluid">
                        <div class="span12">
                            <div class="span12">
                                <div class="floatingBox">
                                    <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="false" Width="100%" ActiveStepIndex="0"
                                                OnFinishButtonClick="Finish_button_click" OnActiveStepChanged="Index_Changed">
                                                <StartNavigationTemplate>
                                                    <asp:Button ID="StepNextButton" runat="server" CausesValidation="true" ValidationGroup="purchase"
                                                        CommandName="MoveNext" Text="Next >>" CssClass="btn btn-mini btn-primary" style="margin-right:10px" />
                                                </StartNavigationTemplate>
                                                <StepNavigationTemplate>
                                                  <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="false" CommandName="MovePrevious"
                                                        Text="<< Prev" CssClass="btn btn-mini btn-primary"  style="margin-right:10px" />
                                                    <asp:Button ID="StepNextButton" runat="server" CausesValidation="true" ValidationGroup="purchase"
                                                        CommandName="MoveNext" Text="Next >>" CssClass="btn btn-mini btn-primary"  style="margin-right:10px" />                                                  
                                                </StepNavigationTemplate>
                                                <FinishNavigationTemplate>
                                                    <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="false" CommandName="MovePrevious"
                                                        Text="<< Prev" CssClass="btn btn-mini btn-primary" style="margin-right:10px" />
                                                  
                                                </FinishNavigationTemplate>
                                                <WizardSteps>
                                                    <asp:WizardStep ID="WizardStep1" runat="server" Title="DETAILS">
                                                        <div class="content floatingBox" style="height: 200px !Important">
                                                            <table style="margin-left: 10%; width: 80%">
                                                                <tr>
                                                                    <td>
                                                                        Contract Name
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtContractName" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfv1" runat="server" CssClass="validation" ControlToValidate="txtContractName"
                                                                            ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" FilterType="LowercaseLetters,UppercaseLetters" Enabled="true" TargetControlID="txtContractName"></asp:FilteredTextBoxExtender>

                                                                    </td>
                                                                    <td>
                                                                        Contract Number
                                                                    </td>
                                                                    <td>
                                                                  <asp:TextBox ID="txtContractNumber" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="Ror1" runat="server" CssClass="validation" ControlToValidate="txtContractNumber"
                                                                            ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                            <asp:FilteredTextBoxExtender ID="fte3454" runat="server" 
                                                                            FilterType="Numbers,LowercaseLetters,UppercaseLetters" Enabled="true" TargetControlID="txtContractNumber">
                                                                            </asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                    <td>
                                                                        Contract Type
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlContractType" runat="server" Width="128px">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldVator2" runat="server" CssClass="validation"
                                                                            ControlToValidate="ddlContractType" InitialValue="0" ValidationGroup="purchase"
                                                                            ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Parental Contract
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtParentalContact" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="purchase"
                                                                            CssClass="validation" ControlToValidate="txtParentalContact" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtParentalContact"
                                                                            FilterType="Custom, UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                            Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                    <td>
                                                                        Active Period
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtfromDate" runat="server" Width="90px" MaxLength="10" placeholder="from..."></asp:TextBox>
                                                                        
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtfromDate"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtfromDate"
                                                                            FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="-" Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                        <asp:CalendarExtender ID="cal1" runat="server" TargetControlID="txtfromDate" Format="dd-MM-yyyy" 
                                                                       CssClass="calender" ></asp:CalendarExtender>
                                                                        
                                                                        <asp:TextBox ID="txtToDate" runat="server" Width="90px" MaxLength="10" placeholder="to..."></asp:TextBox>
                                                                        
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtToDate"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtToDate"
                                                                            FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="-" Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                        <asp:CompareValidator ID="comp1" runat="server" ControlToValidate="txtToDate"
                                                                           ControlToCompare="txtfromDate" Type="Date" Operator="GreaterThanEqual" ErrorMessage="Date Invalid"
                                                                            CssClass="validation" ValidationGroup="purchase"></asp:CompareValidator>
                                                                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="calender" TargetControlID="txtToDate" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                                                    </td>
                                                                      <td>
                                                                        Created By
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCreatedBy" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCreatedBy"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtCreatedBy"
                                                                            FilterType="Custom, UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                            Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                  
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Support Details
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSupportdetails" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtSupportdetails"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" TargetControlID="txtSupportdetails"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                            Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                         </tr>
                                                            </table>
                                                        </div>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep2" runat="server" Title="CONDITIONS">
                                                        <div class="content floatingBox" style="height: 200px !Important">
                                                             <table style="margin-left: 10%; width: 80%">
                                                                <tr>
                                                                    <td>
                                                                        SLA Details
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSLADetails" runat="server" TextMode="MultiLine" Width="115px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSLADetails"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" TargetControlID="txtSLADetails"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                            Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                    <td>
                                                                        Description
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="115px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtDescription"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtDescription"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                            Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                    <td>
                                                                        PO No
                                                                    </td>
                                                                    <td>
                                                                    <asp:DropDownList ID="ddlPOno" runat="server" Width="128px"></asp:DropDownList>
                                                                        
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlPOno"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Cost
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCost" runat="server" style="text-align:right" width="115px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCost"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtCost"
                                                                            FilterType="Numbers" Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                    </td>
                                                                    <td>
                                                                        Payment Terms
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlPaymentTerms" runat="server" Width="128px">
                                                                            <asp:ListItem Text="--select--" Value="0" Selected="True"></asp:ListItem>
                                                                            <asp:ListItem Text="Annual" Value="Annual"></asp:ListItem>
                                                                            <asp:ListItem Text="Half-Yearly" Value="Half-Yearly"></asp:ListItem>
                                                                            <asp:ListItem Text="Quarterly" Value="Quarterly"></asp:ListItem>
                                                                            <asp:ListItem Text="Monthly" Value="Monthly"></asp:ListItem>
                                                                            <asp:ListItem Text="Pay on Visit" Value="Pay on Visit"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlPaymentTerms"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**" InitialValue="0"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep3" runat="server" Title="VENDOR">
                                                        <div class="content floatingBox" style="height: 200px !Important">
                                                          <table style="margin-left: 10%; width: 80%">
                                                                <tr>
                                                                    <td>
                                                                        Vendor
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlVendor" runat="server" AutoPostBack="false" Width="165px"></asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlVendor" InitialValue="0"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                    
                                                                    </td>
                                                                    <td>
                                                                        Contact Number
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtContactNo" runat="server" MaxLength="10"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtContactNo"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtContactNo"
                                                                            FilterType="Numbers" Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="**"
                                                            ValidationExpression="^[6789]\d{9}$" ControlToValidate="txtContactNo" CssClass="validation"
                                                            ValidationGroup="emp_reg"></asp:RegularExpressionValidator>
                                                                    </td>
                                                                    <td>
                                                                        alternate Number
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtAlternateNo" runat="server" MaxLength="10"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtAlternateNo"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtAlternateNo"
                                                                            FilterType="Numbers" Enabled="True">
                                                                        </asp:FilteredTextBoxExtender>
                                                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="**"
                                                            ValidationExpression="^[6789]\d{9}$" ControlToValidate="txtAlternateNo" CssClass="validation"
                                                            ValidationGroup="emp_reg"></asp:RegularExpressionValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Email Id
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtEmailId" runat="server"></asp:TextBox><br />
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtEmailId"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailId"
                                                                            ErrorMessage="not a valid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                            ValidationGroup="purchase" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                                                    </td>
                                                                    <td>
                                                                        Address
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtAddress"
                                                                            ValidationGroup="purchase" CssClass="validation" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                                      
                                                                    </td>
                                                                    <td colspan="3">
                                                                      
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep4" runat="server" Title="ASSETS">
                                                        <div class="content floatingBox" style="height: 300px !Important; overflow: scroll">
                                                            <h4>
                                                                Select Assets</h4>
                                                            <asp:GridView ID="grid_assets" runat="server" AutoGenerateColumns="false" OnDataBound="grid_assets_dataBinding"
                                                                CssClass="table table-striped" Style="width: 70%; margin-left: 10%;">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderStyle-Width="20px">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkAsset" runat="server" AutoPostBack="true" OnCheckedChanged="chkAsset_checkedChanged" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Asset" HeaderStyle-Width="300px">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAsset" runat="server" Text='<%#Eval("asset") %>'></asp:Label>
                                                                            <asp:Label ID="lblProdId" runat="server" Text='<%#Eval("prod_id") %>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Serial No" HeaderStyle-Width="100px">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSite" runat="server" Text='<%#Eval("serial_no") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Tier">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBoxList ID="chkTierList" runat="server" RepeatDirection="Horizontal" Visible="false">
                                                                            </asp:CheckBoxList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </asp:WizardStep>
                                                    <asp:WizardStep ID="WizardStep5" runat="server" Title="ATTATCHMENTS">
                                                        <div class="content floatingBox" style="height: 200px !Important">
                                                            <table style="margin-left: 10%; width: 80%">
                                                                <tr>
                                                                    <td>
                                                                        Department
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDepartment" runat="server" Style="height: 30px !important;
                                                                            width: 165px" OnSelectedIndexChanged="ddlDeparment_SelectedIndexChanged" AutoPostBack="true">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="ddlDepartment"
                                                                            InitialValue="0" CssClass="validation" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        Person
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlPerson" runat="server" Style="height: 30px !important; width: 165px">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="ddlPerson"
                                                                            InitialValue="0" CssClass="validation" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        Approaved Date
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtApproavedDate" runat="server"  MaxLength="10" style="width:165;"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtApproavedDate"
                                                                            CssClass="validation" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtApproavedDate"
                                                                            Format="dd-MM-yyyy">
                                                                        </asp:CalendarExtender>
                                                                        <asp:FilteredTextBoxExtender ID="fte45645" runat="server" FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars="-" Enabled="true" TargetControlID="txtApproavedDate"></asp:FilteredTextBoxExtender>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Comments :
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtComments" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtComments"
                                                                            CssClass="validation" ValidationGroup="purchase" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        Attach File
                                                                    </td>
                                                                    <td>
                                                                        <asp:FileUpload ID="fileUpload1" runat="server" Width="210px" Style="margin-left: 40px" />
                                                                    </td>
                                                                    <td colspan="2">
                                                                        <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="fileUpload1"
                                                                            ErrorMessage="Only .doc(Word), .docx, .txt, .pdf and  .xls(Excel) files" CssClass="validation"
                                                                            ValidationGroup="purchase" ValidationExpression="(.*\.([Dd][Oo][Cc])|.*\.([Pp][Dd][Ff])|.*\.([Tt][Xx][Tt])|.*\.([Xx][Ll][Ss][Xx])|.*\.([Xx][Ll][Ss])|.*\.([Dc][Oo][Cc][Xx])$)">
                                                                        </asp:RegularExpressionValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" valign="bottom" colspan="6" style="height:100px">
                                                                     
                                                                                <asp:Button ID="btnContractSave" runat="server" Text="Save" CssClass="btn  btn-primary"
                                                                                    ValidationGroup="purchase" OnClick="btnContractSave_Click" />
                                                                            
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                    </asp:WizardStep>
                                                </WizardSteps>
                                                <HeaderTemplate>
                                                    <ul id="wizHeader">
                                                        <asp:Repeater ID="SideBarList" runat="server">
                                                            <ItemTemplate>
                                                                <li><a class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Name")%>">
                                                                    <%# Eval("Name")%></a> </li>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ul>
                                                </HeaderTemplate>
                                            </asp:Wizard>
                                              <asp:Label ID="lblResult" runat="server"></asp:Label>
                                          
                                           
                                            <asp:GridView ID="grid_contract_list" runat="server" AutoGenerateColumns="False"
                                                AllowPaging="True" PageSize="15" OnPageIndexChanging="paging" Width="80%" Style="margin-left: 10%"
                                                DataKeyNames="contract_id,status_indication" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                              <Columns>
                                                    <asp:TemplateField HeaderText="ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblContractID" runat="server" Text='<%#Eval("contract_id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblContractNumber" runat="server" Text='<%#Eval("contract_number") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblContractName" runat="server" Text='<%#Eval("contract_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblContractTypeName" runat="server" Text='<%#Eval("contract_type_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Vendor">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblVendor" runat="server" Text='<%#Eval("vendor_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Parent Contract">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblParentalContract" runat="server" Text='<%#Eval("parental_contract") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Payment Terms">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPaymentTerms" runat="server" Text='<%#Eval("payment_terms") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="From">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFromDate" runat="server" Text='<%#Eval("from_date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="To">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblToDate" runat="server" Text='<%#Eval("from_date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgbtnContractRenewal" runat="server" Height="20px" Width="20px"
                                                                ImageAlign="Middle" ImageUrl="~/Icons/1386776643_18.png" ToolTip="Renewal" OnClick="imgbtnContractRenewal_Click" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </columns>
                                            </asp:GridView>
                                            <br />
                                            
                                          <asp:Button ID="btndummy1" runat="server" style="display:none" />
                                          <asp:ModalPopupExtender ID="popUpContractRenewal" runat="server" TargetControlID="btndummy1"
                                                            PopupControlID="panelRenewal" >
                                                        </asp:ModalPopupExtender>

                                            <asp:Panel runat="server" ID="panelRenewal">
                                                <div class="floatingBox">
                                                    <div class="container-fluid">
                                                        <div class="row-fluid" style="margin-bottom:0px">
                                                            <div class="span12">
                                                                <div class="containerHeadline" id="Div1">
                                                                    <i class="icon-ok-sign"></i>
                                                                    <h2>
                                                                        Contract Renewal (Contract No.<asp:Label ID="lblContractNumber" runat="server"></asp:Label> )
                                                                </div>
                                                                <div class="floatingBox" style="margin-bottom:0px">
                                                                    <div class="container-fluid" style="margin-bottom:0px">
                                                                        <div class="form-horizontal contentForm">

                                                                        <asp:Label ID="lblRenewalPossibility" runat="server" Visible="false" style="font-weight:bold; font-size:large"></asp:Label>
                                                                        <asp:Panel ID="panelContractDetails" runat="server" width="100%" style="font-weight:bold">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td>
                                                                                        Name :
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContractName" runat="server" Style="font-weight: normal"></asp:Label>
                                                                                        <asp:Label ID="lblContractID" runat="server" Visible="false"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        Contract Type
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContractType" runat="server" Style="font-weight: normal"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Vendor :
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblVendorName" runat="server" Style="font-weight: normal"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        Parental Company
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblParentalContract" runat="server" Style="font-weight: normal"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        From :
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtFromDateRenewal" runat="server" Width="90px"></asp:TextBox>
                                                                                        <asp:CalendarExtender ID="calRenewal1" runat="server" TargetControlID="txtFromDateRenewal"
                                                                                            Format="dd-MM-yyyy">
                                                                                        </asp:CalendarExtender>
                                                                                        <asp:RequiredFieldValidator ID="ReFiVal1" runat="server" ControlToValidate="txtFromDateRenewal"
                                                                                            ErrorMessage="**" CssClass="validation" ValidationGroup="renewal"></asp:RequiredFieldValidator>
                                                                                        <asp:FilteredTextBoxExtender ID="flter1" runat="server" TargetControlID="txtFromDateRenewal"
                                                                                            FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars="-" Enabled="true">
                                                                                        </asp:FilteredTextBoxExtender>
                                                                                    </td>
                                                                                    <td>
                                                                                        To :
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtToDateRenewal" runat="server"></asp:TextBox>
                                                                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtToDateRenewal"
                                                                                            Format="dd-MM-yyyy">
                                                                                        </asp:CalendarExtender>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtToDateRenewal"
                                                                                            ErrorMessage="**" CssClass="validation" ValidationGroup="renewal"></asp:RequiredFieldValidator>
                                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtToDateRenewal"
                                                                                            FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars="-" Enabled="true">
                                                                                        </asp:FilteredTextBoxExtender>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Cost :
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtCostRenewal" runat="server" Style="width: 150px; text-align: right"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCostRenewal"
                                                                                            ErrorMessage="**" CssClass="validation" ValidationGroup="renewal"></asp:RequiredFieldValidator>
                                                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtCostRenewal"
                                                                                            FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars="." Enabled="true">
                                                                                        </asp:FilteredTextBoxExtender>
                                                                                    </td>
                                                                                    <td>
                                                                                        Payment Terms :
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlPaymentTermsRenewal" runat="server" Width="150px">
                                                                                            <asp:ListItem Text="--select--" Value="0" Selected="True"></asp:ListItem>
                                                                                            <asp:ListItem Text="Annual" Value="Annual"></asp:ListItem>
                                                                                            <asp:ListItem Text="Half-Yearly" Value="Half-Yearly"></asp:ListItem>
                                                                                            <asp:ListItem Text="Quarterly" Value="Quarterly"></asp:ListItem>
                                                                                            <asp:ListItem Text="Monthly" Value="Monthly"></asp:ListItem>
                                                                                            <asp:ListItem Text="Pay on Visit" Value="Pay on Visit"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlPaymentTermsRenewal"
                                                                                            InitialValue="0" ErrorMessage="**" CssClass="validation" ValidationGroup="renewal"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Department
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlDeparmentRenewal" runat="server" Style="height: 25px !important;
                                                                                            width: 150px" OnSelectedIndexChanged="ddlDeparmentRenewal_SelectedIndexChanged" AutoPostBack="true">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfv879" runat="server" ControlToValidate="ddlDeparmentRenewal"
                                                                                            InitialValue="0" CssClass="validation" ValidationGroup="renewal" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        Person
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlPersonRenewal" runat="server" Style="height: 25px !important;
                                                                                            width: 150px">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlPersonRenewal"
                                                                                            InitialValue="0" CssClass="validation" ValidationGroup="renewal" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Approaved Date
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtApproavedDateRenewal" runat="server" MaxLength="10" Style="height: 15px !important"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtApproavedDateRenewal"
                                                                                            CssClass="validation" ValidationGroup="renewal" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                                        <asp:CalendarExtender ID="cal45" runat="server" TargetControlID="txtApproavedDateRenewal"
                                                                                            Format="dd-MM-yyyy">
                                                                                        </asp:CalendarExtender>
                                                                                        <asp:FilteredTextBoxExtender ID="fte345" runat="server" FilterType="Custom,Numbers" FilterMode="ValidChars" ValidChars="-" Enabled="true" TargetControlID="txtApproavedDateRenewal"></asp:FilteredTextBoxExtender>

                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Comments :
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtCommentsRenewal" runat="server"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtCommentsRenewal"
                                                                                            CssClass="validation" ValidationGroup="renewal" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        Attachments :
                                                                                    </td>
                                                                                    <td align="left">
                                                                                        <asp:FileUpload ID="fileUploadRenewal" runat="server" Width="210px" Style="margin-left: 10px" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <asp:Label ID="lblResultRenewal" runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td colspan="2">
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="fileUploadRenewal"
                                                                                            ErrorMessage="Only .doc(Word), .docx, .txt, .pdf and  .xls(Excel) files" CssClass="validation"
                                                                                            ValidationGroup="renewal" ValidationExpression="(.*\.([Dd][Oo][Cc])|.*\.([Pp][Dd][Ff])|.*\.([Tt][Xx][Tt])|.*\.([Xx][Ll][Ss][Xx])|.*\.([Xx][Ll][Ss])|.*\.([Dc][Oo][Cc][Xx])$)">
                                                                                        </asp:RegularExpressionValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                     <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtToDateRenewal"
                                                                           ControlToCompare="txtFromDateRenewal" Type="Date" Operator="GreaterThanEqual" ErrorMessage="Date Invalid" Display="Dynamic"
                                                                            CssClass="validation" ValidationGroup="renewal"></asp:CompareValidator>
                                                                                    </td>
                                                                                    <td colspan="3" align="right">
                                                                                      
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </asp:Panel>
                                                                        <div style="float:right">
                                                                          <asp:Button ID="btnRenewal" runat="server" Text="Done" CssClass="btn btn-mini btn-primary"
                                                                                            ValidationGroup="renewal" onclick="btnRenewal_Click" />
                                                                                        <asp:Button ID="btnCancelRenewal" runat="server" Text="cancel" CssClass="btn btn-mini btn-danger"
                                                                                            Style="margin-left: 30px" />
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
                                          <Triggers>
                                        <asp:PostBackTrigger ControlID="btnRenewal" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
         
</asp:Content>

