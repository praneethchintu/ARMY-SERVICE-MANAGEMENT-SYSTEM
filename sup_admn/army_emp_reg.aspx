<%@ Page Title="" Language="C#" MasterPageFile="~/sup_admn/sup_admn_master.master"
    AutoEventWireup="true" CodeFile="army_emp_reg.aspx.cs" Inherits="sup_admn_emp_reg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
<style type="text/css">
  th
    {
        text-align:center !important;
     
        }

div.mainmenu2 {
    margin: 0;
    margin-top: -1px;
    padding: 0;
}

div.mainmenu2 .container-fluid {
    padding: 0;
}

}
</style>
 <script>
     function readURL(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader();
             reader.onload = function (e) {
                 $('#blah').attr('src', e.target.result);
             }

             reader.readAsDataURL(input.files[0]);
         }
     }
     $("#ImageFileUpload").change(function () {
         readURL(this);
     });
   </script>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content" align="center">
        <!-- ==================== WIDGETS CONTAINER ==================== -->
        <div class="container-fluid">
            <!-- ==================== COMMON ELEMENTS ROW ==================== -->
            <div class="row-fluid">
                <div class="span12 ">
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row-fluid" style="margin-top: 0px !important">
                            <div class="containerHeadline">
                    <i class="icon-tag"></i>
                    <h2>
                      Employee Registration
                    </h2>
                </div>
                                <div class="span10 allwayTab allwayTab-bottom" style="margin-left: 0px !important">
                                  
                                        <div class="floatingBox" style="min-height: 30px">
                                            <!-- ==================== ALLWAY RIGHT TABS ==================== -->
                                             <%--<div class="mainmenu2">
                                            <div class="container-fluid">
                                                <div class="control-group" style="float: left; height: 45px; width: 100%">
                                                    <div style="width: 100%; float: left">
                                                        <ul class="nav nav-tabs">
                                                            <li class="left-side nav-tabs" id="Li2"><a href="#panel_army_employees">
                                                            <i class="icon-dashboard"></i>EMPLOYEES</a></li>
                                                            <li class="divider-vertical"></li>
                                                            <li class="left-side" id="dashboard"><a href="#toptabService" ><i class="icon-dashboard">
                                                            </i>REGISTRATION</a></li>
                                                            <li class="divider-vertical"></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>--%>
                                        
                                            <!-- ==================== TABS ==================== -->
                                            <div class="container-fluid" style="height: 100% !Important">
                                              <asp:UpdatePanel ID="updatePanel3" runat="server" >
        <ContentTemplate>

         
                
                <asp:TabContainer runat="server" Width="101.7%" ID="tabContainer1" Style="margin-left:-10px; margin-top:-10px" TabIndex="0" ActiveTabIndex="0"
                CssClass="MyTabStyle" OnActiveTabChanged="Tab_Index_Changed" AutoPostBack="true"> 
                                                <asp:TabPanel ID="tabpanel2" runat="server">
                    <HeaderTemplate>
                        Registration
                                                  </HeaderTemplate>                                                  
                                                            <ContentTemplate>
                                                            <asp:UpdatePanel ID="updatePanel2" runat="server">
                                                              <Triggers>
                                                              <asp:PostBackTrigger ControlID="btnsubmit" />                                                            
                                                              </Triggers>
                                                                <ContentTemplate>
                                                                    <table width="80%" style="margin-left: 10%;margin-top:10px" id="emptable" runat="server" >
                                                                    
                                                                        <tr>
                                                                            <td class="span2">
                                                                                Full Name
                                                                            </td>
                                                                            <td class="span3">
                                                                                <asp:TextBox ID="txtfullname" class="span9" runat="server" />
                                                                                <asp:Label ID="lbl_Emp_id_edit" runat="server" Visible="false"></asp:Label> 
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtfullname"
                                                                                    FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ">
                                                                                </asp:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rqrdfildname" runat="server" ErrorMessage="**" ControlToValidate="txtfullname"
                                                                                    CssClass="validation" ValidationGroup="emp_reg">
                                                                                </asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td class="span2">
                                                                                Father Name
                                                                            </td>
                                                                            <td class="span3">
                                                                                <asp:TextBox ID="txtFathername" class="span9" runat="server" />
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtFathername"
                                                                                    FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ">
                                                                                </asp:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtFathername" CssClass="validation" ValidationGroup="emp_reg">
                                                                                </asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Gender
                                                                            </td>
                                                                            <td>
                                                                                <asp:RadioButton ID="rbtMale" runat="server" Text="Male" Width="70px" GroupName="grpGendar"
                                                                                    Checked="true"></asp:RadioButton>
                                                                                <asp:RadioButton ID="rbtFemale" runat="server" Text="Female" Width="90px" GroupName="grpGendar">
                                                                                </asp:RadioButton>
                                                                            </td>
                                                                            <td>
                                                                                Date of Birth
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtDateOfBirth" runat="server" Class="span9" MaxLength="10"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtDateOfBirth" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Invalid"
                                                                                    ControlToValidate="txtDateOfBirth" ValidationGroup="emp_reg" ValidationExpression="^\d{4}-((0[1-9])|(1[012]))-((0[1-9]|[12]\d)|3[01])$"
                                                                                    CssClass="validation"></asp:RegularExpressionValidator>
                                                                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOfBirth"
                                                                                    Format="yyyy-MM-dd">
                                                                                </asp:CalendarExtender>
                                                                                <asp:FilteredTextBoxExtender ID="ftdob" runat="server" TargetControlID="txtDateOfBirth"
                                                                                    FilterType="Numbers, Custom" ValidChars="-">
                                                                                </asp:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                      
                                                                        <tr>
                                                                            <td>
                                                                                Mobile Number
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtMobileNum" runat="server" class="span9" MaxLength="10" />
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtMobileNum" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtMobileNum"
                                                                                    FilterType="Numbers">
                                                                                </asp:FilteredTextBoxExtender>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="**"
                                                                                    CssClass="validation" ValidationGroup="emp_reg" ValidationExpression="^[6789]\d{9}$"
                                                                                    ControlToValidate="txtMobileNum"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td>
                                                                                Alternate Number
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtMobileNum2" runat="server" MaxLength="10" class="span9" />
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtMobileNum2" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtMobileNum2"
                                                                                    FilterType="Numbers">
                                                                                </asp:FilteredTextBoxExtender>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="**"
                                                                                    ValidationExpression="^[6789]\d{9}$" ControlToValidate="txtMobileNum2" CssClass="validation"
                                                                                    ValidationGroup="emp_reg"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Email
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtemail" class="span9" runat="server" />
                                                                                <asp:RegularExpressionValidator ID="email1" runat="server" ControlToValidate="txtemail"
                                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid mail id"
                                                                                    CssClass="validation" ValidationGroup="emp_reg"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td rowspan="4">
                                                                                Photo
                                                                            </td>
                                                                            <td rowspan="4">
                                                                         
                                                                            <img id="blah" src="#" alt="Preview" width="100" height="100" style="margin:10px;border:2px;border-style:solid" />
                                                                              
                                                                                <asp:RequiredFieldValidator ID="req1" ControlToValidate="ImageFileUpload" runat="server"
                                                                                    ErrorMessage="Upload Photo" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator><br />
                                                                                      <asp:FileUpload ID="ImageFileUpload" class="span9" runat="server" onchange="readURL(this)" />
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ForeColor="Red" runat="server" ErrorMessage="Only .gif, .jpg, .png" 
                                                                                ValidationGroup="emp_reg" ControlToValidate="ImageFileUpload"
                                                                                ValidationExpression=".*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])">
                                                                                </asp:RegularExpressionValidator>
                                                                         
                                                                              
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Identity type
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlIdentityType" class="span9" runat="server">
                                                                                    <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="Aadhar Card" Value="Aadhar Card"></asp:ListItem>
                                                                                    <asp:ListItem Text="Voter Id" Value=""></asp:ListItem>
                                                                                    <asp:ListItem Text="PAN card" Value=""></asp:ListItem>
                                                                                    <asp:ListItem Text="Driving Licence" Value=""></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="ddlIdentityType"
                                                                                    InitialValue="0" runat="server" ErrorMessage="**" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            
                                                                        </tr>
                                                                        <tr>
                                                                        <td>
                                                                                Identity Number
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtIDNum" class="span9" runat="server" />
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtIDNum"
                                                                                    runat="server" ErrorMessage="**" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                             <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server" TargetControlID="txtIDNum"
                                                                                    FilterType="Numbers,LowercaseLetters,UpperCaseLetters">
                                                                                    </asp:FilteredTextBoxExtender>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                               Army Designation Name
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlDesiName" class="span9" runat="server"  onselectedindexchanged="ddlDesiName_SelectedIndexChanged" AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ddlDesiName"
                                                                                    InitialValue="0" runat="server" ErrorMessage="**" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                           
                                                                        </tr>
                                                                        <tr>
                                                                    <td colspan="4">
                                                                    <h4><b>Address Info</b></h4>
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td>Pocket</td>
                                                                    <td>
                                                                    
                                                                     <asp:DropDownList ID="ddl_pk" class="span9" runat="server" AutoPostBack="true"
                                                                            onselectedindexchanged="ddl_pk_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ddl_pk"
                                                                                    InitialValue="0" runat="server" ErrorMessage="**" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                     <td>Block</td>
                                                                    <td>
                                                                      <asp:DropDownList ID="ddl_bk" class="span9" runat="server" AutoPostBack="true"
                                                                            onselectedindexchanged="ddl_bk_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="ddl_bk"
                                                                                    InitialValue="0" runat="server" ErrorMessage="**" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    
                                                                    </tr>
                                                                    <tr>
                                                                    
                                                                    <td>Floor</td>
                                                                    <td>
                                                                      <asp:DropDownList ID="ddl_fr" class="span9" runat="server" AutoPostBack="true"
                                                                            onselectedindexchanged="ddl_fr_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="ddl_fr"
                                                                                    InitialValue="0" runat="server" ErrorMessage="**" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                    Vacant Flat
                                                                    </td>
                                                                    <td>
                                                                    <asp:DropDownList ID="ddl_flat" class="span9" runat="server" AutoPostBack="true"
                                                                            onselectedindexchanged="ddl_flat_SelectedIndexChanged" >
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="ddl_flat"
                                                                                    InitialValue="0" runat="server" ErrorMessage="**" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator> 
                                                                    </td>
                                                                    </tr>
                                                                    
                                                                    
                                                                      <tr style="min-height:150px">
                                                                            <td>
                                                                                Address
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtpresentaddress" runat="server" TextMode="MultiLine" class="span9"
                                                                                    placeholder=" Present Address..." />
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtpresentaddress" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                Address
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPermanetaddress" runat="server" TextMode="MultiLine" class="span9"
                                                                                    placeholder=" Permanet Address..." />
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="**"
                                                                                    ControlToValidate="txtPermanetaddress" CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <asp:Label ID="lblResults" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn  btn-primary"
                                                                                    ValidationGroup="emp_reg" OnClick="btnsubmit_Click" />
                                                                                <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn  btn-dark" OnClick="btnreset_Click" />
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                    </table>
                                                                </ContentTemplate>
                                                              
                                                            </asp:UpdatePanel>
                                                            </ContentTemplate>
                                                       </asp:TabPanel>
                                                <asp:TabPanel ID="tabpanel1" runat="server">
                    <HeaderTemplate>
                    Employee(s)</HeaderTemplate>
                    <ContentTemplate>


                                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:GridView ID="grid_army_employees" runat="server" AutoGenerateColumns="False" Width="80%"
                                                                        AllowPaging="True" DataKeyNames="emp_id" PageSize="8" Style="margin-left: 5%;
                                                                        margin-bottom: 50px; margin-top:10px" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                                                        OnPageIndexChanging="grid_employees_PageIndexChanging" OnDataBound="grid_employees_DataBound">
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <%#Container.DataItemIndex+1 %>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Flat NO">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_flatno" runat="server" Text='<%#Eval("flat_number") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Emp Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_emp_name" runat="server" Text='<%#Eval("emp_name") %>'></asp:Label>
                                                                                    <asp:Label ID="lbl_emp_id" runat="server" Text='<%#Eval("emp_id") %>' Visible="false"></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Father Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_father_name" runat="server" Text='<%#Eval("father_name") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Gender">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_gender" runat="server" Text='<%#Eval("gender") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="DOB">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_DOB" runat="server" Text='<%# Convert.ToDateTime(Eval("dateofbirth")).ToString("dd MMMM yyyy") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Designation">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_Present_Add" runat="server" Text='<%#Eval("desg_name") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Address">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_Permanent_Add" runat="server" Text='<%#Eval("present_address") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Contact Number">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_Contact_no" runat="server" Text='<%#Eval("contact_no1") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                             <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <div style="text-align:center">
                                                                                 <asp:ImageButton ID="imgbtn_EditDetails" runat="server" Width="15px" Height="15px" autopostback="true"
                                                                                    ImageAlign="Middle" OnClick="imgbtn_Army_EditDetails_Click" ImageUrl="~/Icons/1385390972_write.png" /></div>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="40px" />
                                                                        </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="View">
                                                                            <ItemTemplate>
                                                                                <div style="text-align:center">
                                                                                 <asp:ImageButton ID="imgbtnviewDetails" runat="server" Width="15px" Height="15px"
                                                                                    ImageAlign="Middle" OnClick="imgbtnviewDetails_Click" ImageUrl="~/Icons/1385729255_View_Details.png" /></div>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="40px" />
                                                                        </asp:TemplateField>                                                                     
                                                                       <%--  <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imgbtnFlatNoEdit" runat="server" Width="15px" Height="15px"
                                                                                    ImageAlign="Middle" OnClick="imgbtnFlatNoEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="40px" />
                                                                        </asp:TemplateField>--%>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                                              <!-- EMPLOYEE PROFILE POPUP -->
                            <asp:Button ID="btndummy1" runat="server" Style="display: none" />
                            <asp:ModalPopupExtender ID="popUpView" runat="server" TargetControlID="btndummy1"
                                PopupControlID="UpdatePanel1">
                            </asp:ModalPopupExtender>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                <ContentTemplate>
                                       
                                                <asp:Panel ID="POPUP" runat="server">
                                <div id="div1" class="span8"  style="margin:50px">
                                <div class="containerHeadline">
                                        <i class="icon-camera"></i>
                                        <h2>
                                            Profile</h2>
                                        <div class="controlButton pull-right">
                                          
                                          <asp:Button ID="btnclose" runat="server" Text="X" class="btn btn-label" OnClick="btnclose_Click" />

                                        </div>                                       
                                    </div>
                                    <div class="floatingBox table">
                                        <div class="container-fluid">
                                            <table width="100%" style="height: 90%">
                                                <tr>
                                                    <td style="width: 20%">
                                                        <asp:Image ID="imgEmp" runat="server" Height="130px" Width="130px" ImageAlign="Middle"
                                                            AlternateText="No Image" />
                                                            <div style="text-align:center">
                                                        <h4>
                                                           <asp:Label ID="lblEmpName" runat="server"></asp:Label></h4>
                                                            </div>
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 50%">
                                                                    Gender&nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblGender" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 50%">
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    Date of Birth
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 50%">
                                                                    Designation
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lbldesignation" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Department
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <h5>
                                                            Contact Information</h5>
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 50%">
                                                                    Phone No
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContact1" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 50%">
                                                                    Alternate No
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContact2" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    e-mail id
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <h5>
                                                                        Permanent Address</h5>
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="width: 10%">
                                                                            </td>
                                                                            <td style="width: 90%">
                                                                                <asp:Label ID="lblPermanentAddress" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td>
                                                                    <h5>
                                                                        Present Address</h5>
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="width: 10%">
                                                                            </td>
                                                                            <td style="width: 90%">
                                                                                <asp:Label ID="lblPresentAddress" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                        </table>
                                                        <div style="float:right">
                                                            </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                </div>
            </div>
            <!-- ==================== END OF COMMON ELEMENTS ROW ==================== -->
        </div>
        <!-- ==================== END OF WIDGETS CONTAINER ==================== -->
    </div>
                                            </div>

</asp:Content>
