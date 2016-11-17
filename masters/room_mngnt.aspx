<%@ Page Title="" Language="C#" MasterPageFile="~/sup_admn/sup_admn_master.master" AutoEventWireup="true" CodeFile="room_mngnt.aspx.cs" Inherits="masters_room_mngnt" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
   <link rel="stylesheet" href="../css/styles.css" />
 <style type="text/css">     
    .select-fleft tbody tr td label, .select-fleft tbody tr td input  { float: left !important; display: block !important; padding: 0 10px !important; }
    th
    {
        text-align:center !important;
     
        }
</style>

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

    function Confirm() {
        var e = document.getElementById("ddlPocketStatus");

        var strUser = e.options[e.selectedIndex].value;
        alert("sfgsfas");
        
        if (strUser.value = "0") {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Yes? or No?")) {
                confirm_value.value = "1";
            }
            else {
                confirm_value.value = "0";
            }
        }
    }
</script>



<style type="text/css">
        #ContentPlaceHolder1_Container_Rooms .ajax__tab_header span
        {
            color: #e9e9e9;
        }
        #ContentPlaceHolder1_Container_Rooms .ajax__tab_header span :hover
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
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                      ROOM MASTERS
                    </h2>
                </div>  
                                    <!-- ==================== END OF ALLWAY TAB HEADLINE ==================== -->

                                    <!-- ==================== ALLWAY BOTTOM TAB FLOATING BOX ==================== -->
                                        <!-- ==================== ALLWAY RIGHT TABS ==================== -->
                                        <%--<div class="mainmenu2">
                                            <div class="container-fluid">
                                             <div class="control-group" style="float:left; height:45px; width:100%">
                                             <div style="width:10%; float:left">
                                                <ul class="nav">
                                                  
                                                   
                                                    <li class="dropdown left-side"><a class="dropdown-toggle" data-toggle="dropdown" href="#" id="A1">
                                                        <i class="icon-list"></i>FlAT<span class="label label-pressed">3</span></a>
                                                        <ul class="dropdown-menu nav-tabs">
                                                            <li><a tabindex="-1" href="#toptab1">FLAT AMENITY</a></li>
                                                            <li><a tabindex="-1" href="#toptab7">FLAT TYPE AMENITY</a></li>
                                                             <li><a tabindex="-1" href="#toptab2">FLAT DESIG</a></li>
                                                              <li><a tabindex="-1" href="#toptab9">FLAT TYPE</a></li>
                                                               <li><a tabindex="-1" href="#toptab6">FLAT</a></li>
                                                        </ul>
                                                    </li>
                                                    </ul>
                                                    </div>
                                                    <div style="width:90%; float:left">
                                                    <ul class="nav  nav-tabs">
                                                    <li class="divider-vertical"></li>
                                                    <li class="left-side nav-tabs" id="dashboard"><a href="#toptab3"><i class="icon-dashboard"></i>FLOOR</a></li>
                                                    <li class="divider-vertical"></li>
                                                    <li class="left-side" id="Li2"><a href="#toptab4"><i class="icon-dashboard"></i>BLOCK</a></li>
                                                    <li class="divider-vertical"></li>
                                                    <li class="left-side" id="Li1"><a href="#toptab5"><i class="icon-dashboard"></i>POCKET</a></li>
                                                    <li class="divider-vertical"></li>
                                                    <li class="left-side" id="Li3"><a href="#toptab8"><i class="icon-dashboard"></i>DESIGNATION</a></li>
                                                    <li class="divider-vertical"></li>
                                                </ul>
                                                </div>
                                            </div>
                                            </div>
                                        </div>--%>
                                        <!-- ==================== TABS ==================== -->
                                        <br />
                                     <asp:TabContainer ID="Container_Rooms" runat="server" Width="100%" TabIndex="0" ActiveTabIndex="0"
                CssClass="MyTabStyle" OnActiveTabChanged="Tab_Index_Changed" AutoPostBack="true"> 
                                          
                                            <!-- ==================== SECOND TAB CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel1" runat="server">
                                             <HeaderTemplate>
                                                 FLAT DESIGNATION</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Button ID="btnCreateNewFlat_Desg" runat="server" Text="Add Flat Type Designation"
                                                     CssClass="btn btn-mini btn-primary" OnClick="btnCreateNewFlat_Desg_Click" Style="margin-left: 40px" />
                                                 <asp:Panel ID="Panel_FlatType_gesig" runat="server" DefaultButton="btnFlat_DesgSave"
                                                     Width="40%" Style="margin-left: 20%" Visible="False">
                                                     <table id="table0" runat="server">
                                                         <tr runat="server">
                                                             <td runat="server">
                                                                 Designation
                                                             </td>
                                                             <td runat="server">
                                                                 <asp:DropDownList ID="ddlDesignation" runat="server" Width="115px">
                                                                 </asp:DropDownList>
                                                                 <asp:Label ID="lblDesignationId" runat="server" Visible="False"></asp:Label>
                                                             </td>
                                                             <td align="left" runat="server">
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="**"
                                                                     ValidationGroup="ftd" ControlToValidate="ddlDesignation" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                                             </td>
                                                             <td runat="server">
                                                                 FlatType
                                                             </td>
                                                             <td runat="server">
                                                                 <asp:DropDownList ID="ddlFlat_Type" runat="server" Width="115px">
                                                                 </asp:DropDownList>
                                                                 <asp:Label ID="lblFlatType_Id" runat="server" Visible="False"></asp:Label>
                                                             </td>
                                                             <td align="left" runat="server">
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**"
                                                                     ValidationGroup="ftd" ControlToValidate="ddlFlat_Type" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                                             </td>
                                                         </tr>
                                                     </table>
                                                     <table>
                                                         <tr>
                                                             <td colspan="3">
                                                                 <asp:Label ID="lblFlat_DesgResult" runat="server"></asp:Label>
                                                             </td>
                                                         </tr>
                                                         <tr>
                                                             <td>
                                                             </td>
                                                             <td colspan="2">
                                                                 <asp:Button ID="btnFlat_DesgSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                     ValidationGroup="ftd" Style="margin-left: 130px" OnClick="btnFlat_DesgSave_Click" /><asp:ConfirmButtonExtender
                                                                         ID="ConfirmbtnFlat_DesgSave" runat="server" TargetControlID="btndummy2" ConfirmText="Are you sure you want to SAVE this?"
                                                                         Enabled="True">
                                                                     </asp:ConfirmButtonExtender>
                                                                 <asp:Button ID="btndummy2" runat="server" Visible="False" /><asp:Button ID="btnFlat_DesgClear"
                                                                     runat="server" Text="Clear" CssClass="btn btn-mini" Style="margin-left: 10px"
                                                                     OnClick="btnFlat_DesgClear_Click" /><asp:Button ID="btnFlat_DesgCancel" runat="server"
                                                                         Text="Cancel" CssClass="btn btn-mini btn-danger" Style="margin-left: 10px" OnClick="btnFlat_DesgCancel_Click" />
                                                             </td>
                                                         </tr>
                                                     </table>
                                                 </asp:Panel>
                                                 <br />
                                                 <br />
                                                 <asp:GridView ID="Grid_Flat_Designation" runat="server" AutoGenerateColumns="False"
                                                     Width="40%" AllowPaging="True" DataKeyNames="desg_id" PageSize="5" Style="margin-left: 20%;
                                                     margin-bottom: 50px" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                                     OnDataBound="Grid_Flat_Designation_DataBound" OnPageIndexChanging="Grid_Flat_Designation_PageIndexChanging">
                                                     <Columns>
                                                         <asp:TemplateField></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Designation">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblDesignation" runat="server" Text='<%#Eval("desg_name") %>'></asp:Label><asp:Label
                                                                     ID="lblDesignationId" runat="server" Text='<%#Eval("desg_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="FlatType">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlatType" runat="server" Text='<%#Eval("flat_type_name") %>'></asp:Label><asp:Label
                                                                     ID="lblFlatTypeId" runat="server" Text='<%#Eval("flat_type_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <asp:ImageButton ID="imgbtnFlat_DesgEdit" runat="server" Width="15px" Height="15px"
                                                                     ImageAlign="Middle" OnClick="imgbtnFlat_DesgEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /><asp:ConfirmButtonExtender
                                                                         ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnFlat_DesgEdit"
                                                                         ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Edit this?">
                                                                     </asp:ConfirmButtonExtender>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                         <!-- ==================== END OF SECOND TAB CONTENT ==================== -->  
                                            <!-- ==================== SIXTH CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel3" runat="server">
                                             <HeaderTemplate>
                                                 FLATS</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Button ID="btnCreateNewFlat" runat="server" Text="Add New Flat" CssClass="btn btn-mini btn-primary"
                                                     OnClick="btnCreateNewFlat_Click" Style="margin-left: 40px" /><asp:Panel ID="PanelFlat"
                                                         runat="server" DefaultButton="btnFlatSave" Visible="False" Width="60%" Style="margin-left: 20%">
                                                         <table>
                                                             <tr>
                                                                 <td style="width: 62px">
                                                                     Flat No
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtFlatName" runat="server" Width="102px"></asp:TextBox><asp:Label
                                                                         ID="lblFlatId_F" runat="server" Visible="False"></asp:Label><asp:RequiredFieldValidator
                                                                             ID="RequiredFieldValidator34" runat="server" ErrorMessage="**" ValidationGroup="flat"
                                                                             ControlToValidate="txtFlatName" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                                 ID="FilteredTextBoxExtender8" runat="server" FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                                                                                 Enabled="true" ValidChars=" ,/,-,_" TargetControlID="txtFlatName">
                                                                             </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                                 <td>
                                                                     Status
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddl_FlatStatus" runat="server" Width="115px">
                                                                         <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                         <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                         <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                     </asp:DropDownList>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flat" ControlToValidate="ddl_FlatStatus" InitialValue="-1" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                                 <td>
                                                                     Flat Type
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddl_flat_flat_type" runat="server" Width="115px">
                                                                     </asp:DropDownList>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flat" ControlToValidate="ddl_flat_flat_type" InitialValue="-1"
                                                                         CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 62px">
                                                                     Pocket
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddlPocket_Name_F" runat="server" Width="115px" AutoPostBack="true"
                                                                         OnSelectedIndexChanged="ddlPocket_Name_F_SelectedIndexChanged">
                                                                     </asp:DropDownList>
                                                                     <asp:Label ID="lblPocketName_F" runat="server" Visible="False"></asp:Label><asp:RequiredFieldValidator
                                                                         InitialValue="0" ID="RequiredFieldValidator37" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flat" ControlToValidate="ddlPocket_Name_F" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                                 <td>
                                                                     Block
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddlBlockName_F" runat="server" Width="115px" AutoPostBack="true"
                                                                         OnSelectedIndexChanged="ddlBlockName_F_SelectedIndexChanged">
                                                                     </asp:DropDownList>
                                                                     <asp:Label ID="lblBlockName_F" runat="server" Visible="False"></asp:Label><asp:RequiredFieldValidator
                                                                         InitialValue="0" ID="RequiredFieldValidator36" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flat" ControlToValidate="ddlBlockname_F" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                                 <td>
                                                                     Floor
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddlFloorName_F" runat="server" Width="115px">
                                                                     </asp:DropDownList>
                                                                     <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator40" runat="server"
                                                                         ErrorMessage="**" ValidationGroup="flat" ControlToValidate="ddlFloorName_F" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                         <table>
                                                             <tr>
                                                                 <td>
                                                                     Description
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtFlatDescription" TextMode="MultiLine" runat="server" Width="450px"
                                                                         Height="30px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator38"
                                                                             runat="server" ErrorMessage="**" ValidationGroup="flat" ControlToValidate="txtFlatDescription"
                                                                             CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td colspan="6">
                                                                     <asp:Label ID="lblFlatResult" runat="server"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td colspan="6" align="center">
                                                                     <asp:Button ID="btnFlatSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                         ValidationGroup="flat" OnClick="btnFlatSave_Click" /><asp:ConfirmButtonExtender ID="ConfirmbtnFlatSave"
                                                                             runat="server" TargetControlID="btndummy3" ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?">
                                                                         </asp:ConfirmButtonExtender>
                                                                     <asp:Button ID="btndummy3" runat="server" Visible="false" /><asp:Button ID="btnFlatClear"
                                                                         runat="server" Text="Clear" CssClass="btn btn-mini" Style="margin-left: 10px"
                                                                         OnClick="btnFlatClear_Click" /><asp:Button ID="btnFlatCancel" runat="server" Text="Cancel"
                                                                             CssClass="btn btn-mini btn-danger" Style="margin-left: 10px" OnClick="btnFlatCancel_Click" />
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </asp:Panel>
                                                 <br />
                                                 <br />
                                                 <asp:GridView ID="Grid_Flat" runat="server" AutoGenerateColumns="False" Width="80%"
                                                     AllowPaging="True" DataKeyNames="flat_id" PageSize="5" Style="margin-bottom: 50px;
                                                     margin-top: 10px; margin-left: 10%;" OnPageIndexChanging="Grid_Flat_PageIndexChanging"
                                                     OnDataBound="Grid_Flat_DataBound" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Flat ID">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlatID" runat="server" Text='<%#Eval("flat_id") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Flat No">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlatNumber" runat="server" Text='<%#Eval("flat_number") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Status">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlatStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label><div
                                                                     style="text-align: center">
                                                                     <asp:ImageButton ID="imgFlatStatus" runat="server" Width="15px" Height="15px" /></div>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="50px" />
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Flat Type">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlat_flattype_name" runat="server" Text='<%#Eval("flat_type_name") %>'></asp:Label><asp:Label
                                                                     ID="lblFlat_flattype_id" runat="server" Text='<%#Eval("flat_type_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Floor">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFloorName" runat="server" Text='<%#Eval("floor_name") %>'></asp:Label><asp:Label
                                                                     ID="lbl_floor_Id" runat="server" Text='<%#Eval("floor_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Block">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblBlockName" runat="server" Text='<%#Eval("block_name") %>'></asp:Label><asp:Label
                                                                     ID="lbl_Block_Id" runat="server" Text='<%#Eval("block_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Pocket">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblPocketName" runat="server" Text='<%#Eval("pocket_name") %>'></asp:Label><asp:Label
                                                                     ID="lbl_pocket_id" runat="server" Text='<%#Eval("pocket_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Description">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlatDescription" runat="server" Text='<%#Eval("flat_desc") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <asp:ImageButton ID="imgbtnFloatEdit" runat="server" Width="15px" Height="15px" ImageAlign="Middle"
                                                                     OnClick="imgbtnFlatEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /><asp:ConfirmButtonExtender
                                                                         ID="ConfirmButtonExtender6" runat="server" TargetControlID="imgbtnFloatEdit"
                                                                         ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Edit this?">
                                                                     </asp:ConfirmButtonExtender>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                         <!-- ==================== END OF SIXTH TAB CONTENT ==================== -->
                                            <!-- ==================== NINTH CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel4" runat="server">
                                             <HeaderTemplate>
                                                 FLAT TYPE</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Button ID="btnCreateNewFlatType" runat="server" Text="Add New FlatType" CssClass="btn btn-mini btn-primary"
                                                     OnClick="btnCreateNewFlatType_Click" Style="margin-left: 40px" /><asp:Panel ID="PanelFlatType"
                                                         runat="server" DefaultButton="btnFlatTypeSave" Visible="False" Width="40%" Style="margin-left: 20%">
                                                         <table>
                                                             <tr>
                                                                 <td style="width: 70px">
                                                                     Flat Type
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtFlatType" runat="server" Width="115px"></asp:TextBox><asp:Label
                                                                         ID="lbl_FlatType_Id" runat="server" Visible="False"></asp:Label>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flattype" ControlToValidate="txtFlatType" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                             ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                                                                             Enabled="true" ValidChars=" ,/,-,_" TargetControlID="txtFlatType">
                                                                         </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                                 <td>
                                                                     Status
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddlFlatTypeStatus" runat="server" Width="115px">
                                                                         <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                         <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                         <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                     </asp:DropDownList>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flattype" ControlToValidate="ddlFlatTypeStatus" InitialValue="-1"
                                                                         CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                         <table>
                                                             <tr>
                                                                 <td style="width: 70px">
                                                                     Description
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtFlatTypeDescription" TextMode="MultiLine" runat="server" Width="281px"
                                                                         Height="32px"></asp:TextBox>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flattype" ControlToValidate="txtFlatTypeDescription" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td colspan="3">
                                                                     <asp:Label ID="lblFlatTypeResult" runat="server"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td>
                                                                 </td>
                                                                 <td colspan="2" align="center">
                                                                     <asp:Button ID="btnFlatTypeSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                         ValidationGroup="flattype" OnClick="btnFlatTypeSave_Click" /><asp:ConfirmButtonExtender
                                                                             ID="ConfirmbtnFlatTypeSave" runat="server" TargetControlID="btndummy4" ConfirmOnFormSubmit="false"
                                                                             ConfirmText="Are you sure you want to SAVE this?">
                                                                         </asp:ConfirmButtonExtender>
                                                                     <asp:Button ID="btndummy4" runat="server" Visible="false" /><asp:Button ID="btnFlatTypeClear"
                                                                         runat="server" Text="Clear" CssClass="btn btn-mini" Style="margin-left: 10px"
                                                                         OnClick="btnFlatTypeClear_Click" /><asp:Button ID="btnFlatTypeCancel" runat="server"
                                                                             Text="Cancel" CssClass="btn btn-mini btn-danger" Style="margin-left: 10px" OnClick="btnFlatTypeCancel_Click" />
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </asp:Panel>
                                                 <br />
                                                 <br />
                                                 <asp:GridView ID="GridView_FlatType" runat="server" AutoGenerateColumns="False" Width="40%"
                                                     AllowPaging="True" DataKeyNames="flat_type_id" PageSize="5" Style="margin-left: 20%;
                                                     margin-bottom: 50px" OnPageIndexChanging="Grid_FlatType_PageIndexChanging" OnDataBound="Grid_FlatType_DataBound"
                                                     CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Flat Type">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlatType" runat="server" Text='<%#Eval("flat_type_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Status">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlatTypeStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label><div
                                                                     style="text-align: center">
                                                                     <asp:ImageButton ID="imgFlatTypeStatus" runat="server" Width="15px" Height="15px" /></div>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="50px" />
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Description">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFlatTypeDescription" runat="server" Text='<%#Eval("flat_type_desc") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <asp:ImageButton ID="imgbtnFlatTypeEdit" runat="server" Width="15px" Height="15px"
                                                                     ImageAlign="Middle" OnClick="imgbtnFlatTypeEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /><asp:ConfirmButtonExtender
                                                                         ID="ConfirmButtonExtender5" runat="server" TargetControlID="imgbtnFlatTypeEdit"
                                                                         ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Edit this?">
                                                                     </asp:ConfirmButtonExtender>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                                      
                                            <!-- ==================== END OF NINTH TAB CONTENT ==================== -->
                                             <!-- ==================== THIRD CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel5" runat="server">
                                             <HeaderTemplate>
                                                 FLOOR</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Button ID="btnCreateFloor" runat="server" Text="Add New Floor" CssClass="btn btn-mini btn-primary"
                                                     OnClick="btnCreateNewFloor_Click" Style="margin-left: 40px" /><asp:Panel ID="panelFloor"
                                                         runat="server" DefaultButton="btnFloorSave" Visible="False" Width="40%" Style="margin-left: 20%">
                                                         <table width="100%">
                                                             <tr>
                                                                 <td>
                                                                     Floor Name
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtFloorName" runat="server" Width="102px"></asp:TextBox><asp:Label
                                                                         ID="lblFloorIdF" runat="server" Visible="False"></asp:Label>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flr" ControlToValidate="txtFloorName" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                             ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                                                                             Enabled="true" ValidChars=" ,/,-,_" TargetControlID="txtFloorName">
                                                                         </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                                 <td>
                                                                     Status
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddlFloorStatus" runat="server" Width="115px">
                                                                         <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                         <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                         <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                     </asp:DropDownList>
                                                                     <asp:Label ID="lblFloor_Status_Comp" runat="server" Visible="false"></asp:Label>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flr" ControlToValidate="ddlFloorStatus" InitialValue="-1" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                                 <tr>
                                                                     <td>
                                                                         Pocket
                                                                     </td>
                                                                     <td>
                                                                         <asp:DropDownList ID="ddlPocket_Name" runat="server" Width="115px" OnSelectedIndexChanged="pocketFlrSelectedIndexChanged"
                                                                             AutoPostBack="true">
                                                                         </asp:DropDownList>
                                                                         <asp:Label ID="lblPocketIdF" runat="server" Visible="False"></asp:Label>
                                                                     </td>
                                                                     <td>
                                                                         <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator19" runat="server"
                                                                             ErrorMessage="**" ValidationGroup="flr" ControlToValidate="ddlPocket_Name" CssClass="validation"></asp:RequiredFieldValidator>
                                                                     </td>
                                                                     <td>
                                                                         Block
                                                                     </td>
                                                                     <td>
                                                                         <asp:DropDownList ID="ddlBlockname" runat="server" Width="115px" AutoPostBack="true">
                                                                         </asp:DropDownList>
                                                                         <asp:Label ID="lblBlockIdF" runat="server" Visible="False"></asp:Label>
                                                                     </td>
                                                                     <td>
                                                                         <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator18" runat="server"
                                                                             ErrorMessage="**" ValidationGroup="flr" ControlToValidate="ddlBlockname" CssClass="validation"></asp:RequiredFieldValidator>
                                                                     </td>
                                                                 </tr>
                                                         </table>
                                                         <table>
                                                             <tr>
                                                                 <td style="width: 91px">
                                                                     Description
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtDescriptionF" TextMode="MultiLine" runat="server" Width="338px"
                                                                         Height="32px"></asp:TextBox>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="flr" ControlToValidate="txtDescriptionF" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td colspan="3">
                                                                     <asp:Label ID="lblFloorResult" runat="server"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td>
                                                                 </td>
                                                                 <td colspan="2" align="center">
                                                                     <asp:Button ID="btnFloorSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                         ValidationGroup="flr" OnClick="btnFloorSave_Click" /><asp:ConfirmButtonExtender ID="ConfirmbtnFloorSave"
                                                                             runat="server" TargetControlID="btndummy5" ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to SAVE this?">
                                                                         </asp:ConfirmButtonExtender>
                                                                     <asp:Button ID="btndummy5" runat="server" Visible="false" /><asp:Button ID="btnFloorClear"
                                                                         runat="server" Text="Clear" CssClass="btn btn-mini" Style="margin-left: 10px"
                                                                         OnClick="btnFloorClear_Click" /><asp:Button ID="btnFloorCancel" runat="server" Text="Cancel"
                                                                             CssClass="btn btn-mini btn-danger" Style="margin-left: 10px" OnClick="btnFloorCancel_Click" />
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </asp:Panel>
                                                 <br />
                                                 <br />
                                                 <asp:GridView ID="grid_Floor" runat="server" AutoGenerateColumns="False" Width="40%"
                                                     AllowPaging="True" DataKeyNames="floor_id" PageSize="5" Style="margin-left: 20%;
                                                     margin-bottom: 50px" OnPageIndexChanging="grid_Floor_PageIndexChanging" OnDataBound="grid_Floor_DataBound"
                                                     CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFloorName" runat="server" Text='<%#Eval("floor_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Status">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFloorStatus" runat="server" Text='<%#Eval("floor_status") %>' Visible="false"></asp:Label><div
                                                                     style="text-align: center">
                                                                     <asp:ImageButton ID="imgFloorStatus" runat="server" Width="15px" Height="15px" /></div>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="50px" />
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Block">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblBlockName" runat="server" Text='<%#Eval("block_name") %>'></asp:Label><asp:Label
                                                                     ID="lbl_BlockId" runat="server" Text='<%#Eval("block_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Pocket">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblPocketName" runat="server" Text='<%#Eval("pocket_name") %>'></asp:Label><asp:Label
                                                                     ID="lbl_pocketId" runat="server" Text='<%#Eval("pocket_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Description">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblFloorDescription" runat="server" Text='<%#Eval("flloor_desc") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <asp:ImageButton ID="imgbtnFloorEdit" runat="server" Width="15px" Height="15px" ImageAlign="Middle"
                                                                     OnClick="imgbtnFloorEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /><asp:ConfirmButtonExtender
                                                                         ID="ConfirmButtonExtender3" runat="server" TargetControlID="imgbtnFloorEdit"
                                                                         ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Edit this?">
                                                                     </asp:ConfirmButtonExtender>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                            
                                            <!-- ==================== END OF THIRD TAB CONTENT ==================== -->
                                              <!-- ==================== FOURTH CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel6" runat="server">
                                             <HeaderTemplate>
                                                 BLOCK</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Button ID="btnCreateNewBlock" runat="server" Text="Add New Block" CssClass="btn btn-mini btn-primary"
                                                     OnClick="btnCreateNewBlock_Click" Style="margin-left: 40px" /><asp:Panel ID="panelBlock"
                                                         runat="server" DefaultButton="btnBlockSave" Visible="False" Width="60%" Style="margin-left: 20%">
                                                         <table>
                                                             <tr>
                                                                 <td>
                                                                     Block Name
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txt_BlockName" runat="server" Width="102px"></asp:TextBox><asp:Label
                                                                         ID="lbl_BlockId" runat="server" Visible="False"></asp:Label>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="block" ControlToValidate="txt_BlockName" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                             ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                                                                             Enabled="true" ValidChars=" ,/,-,_" TargetControlID="txt_BlockName">
                                                                         </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                                 <td>
                                                                     Status
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddlBlockStatus" runat="server" Width="115px">
                                                                         <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                         <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                         <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                     </asp:DropDownList>
                                                                     <asp:Label ID="lbl_BlockStatus_comp" runat="server" Visible="false"></asp:Label>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="block" ControlToValidate="ddlBlockStatus" InitialValue="-1"
                                                                         CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                                 <td>
                                                                     Pocket
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddl_Pocketname" runat="server" Width="115px" OnSelectedIndexChanged="ddl_Pocketname_SelectedIndexChanged"
                                                                         AutoPostBack="True">
                                                                     </asp:DropDownList>
                                                                     <asp:Label ID="lbl_PocketId" runat="server" Visible="False"></asp:Label>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator24" runat="server"
                                                                         ErrorMessage="**" ValidationGroup="block" ControlToValidate="ddl_Pocketname"
                                                                         CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                         <table>
                                                             <tr>
                                                                 <td>
                                                                     Description
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtBlockDescription" TextMode="MultiLine" runat="server" Width="440px"
                                                                         Height="30px"></asp:TextBox>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="block" ControlToValidate="txtBlockDescription" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td colspan="3">
                                                                     <asp:Label ID="lblBlockDisplay" runat="server"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td>
                                                                 </td>
                                                                 <td colspan="2" align="center">
                                                                     <asp:Button ID="btnBlockSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                         ValidationGroup="block" OnClick="btnBlockSave_Click" /><asp:ConfirmButtonExtender
                                                                             ID="ConfirmbtnBlockSave" runat="server" TargetControlID="btndummy6" ConfirmOnFormSubmit="false"
                                                                             ConfirmText="Are you sure you want to SAVE this?">
                                                                         </asp:ConfirmButtonExtender>
                                                                     <asp:Button ID="btndummy6" runat="server" Visible="false" /><asp:Button ID="btnBlockClear"
                                                                         runat="server" Text="Clear" CssClass="btn btn-mini" Style="margin-left: 10px"
                                                                         OnClick="btnBlockClear_Click" /><asp:Button ID="btnBlockCancel" runat="server" Text="Cancel"
                                                                             CssClass="btn btn-mini btn-danger" Style="margin-left: 10px" OnClick="btnBlockCancel_Click" />
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </asp:Panel>
                                                 <br />
                                                 <br />
                                                 <asp:GridView ID="Grid_Block" runat="server" AutoGenerateColumns="False" Width="40%"
                                                     AllowPaging="True" DataKeyNames="block_id" PageSize="5" Style="margin-left: 20%;
                                                     margin-bottom: 50px" OnPageIndexChanging="Grid_Block_PageIndexChanging" OnDataBound="Grid_Block_DataBound"
                                                     CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblBlockName" runat="server" Text='<%#Eval("block_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Status">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblBlockStatus" runat="server" Text='<%#Eval("block_status") %>' Visible="false"></asp:Label><div
                                                                     style="text-align: center">
                                                                     <asp:ImageButton ID="imgBlockStatus" runat="server" Width="15px" Height="15px" /></div>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="50px" />
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Pocket">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblPocketName2" runat="server" Text='<%#Eval("pocket_name") %>'></asp:Label><asp:Label
                                                                     ID="lblPocketid2" runat="server" Text='<%#Eval("pocket_id") %>' Visible="False"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Description">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblBlockDescription" runat="server" Text='<%#Eval("block_desc") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <asp:ImageButton ID="imgbtnBlockEdit" runat="server" Width="15px" Height="15px" ImageAlign="Middle"
                                                                     OnClick="imgbtnBlockEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /><asp:ConfirmButtonExtender
                                                                         ID="ConfirmButtonExtender4" runat="server" TargetControlID="imgbtnBlockEdit"
                                                                         ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Edit this?">
                                                                     </asp:ConfirmButtonExtender>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                            <!-- ==================== END OF FOURH TAB CONTENT ==================== --> 
                                             <!-- ==================== FIFTH CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel7" runat="server">
                                             <HeaderTemplate>
                                                 POCKET</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Button ID="btnCreateNewPocket" runat="server" Text="Add New Pocket" CssClass="btn btn-mini btn-primary"
                                                     OnClick="btnCreateNewPocket_Click" Style="margin-left: 40px" /><asp:Panel ID="panelPocket"
                                                         runat="server" DefaultButton="btnPocketSave" Visible="False" Width="60%" Style="margin-left: 20%">
                                                         <table>
                                                             <tr>
                                                                 <td>
                                                                     Name
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txt_PocketName" runat="server" Width="115px"></asp:TextBox><asp:Label
                                                                         ID="lblPocketIdP" runat="server" Visible="False"></asp:Label><asp:RequiredFieldValidator
                                                                             ID="RequiredFieldValidator23" runat="server" ErrorMessage="**" ValidationGroup="pocket"
                                                                             ControlToValidate="txt_PocketName" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                                 ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                                                                                 Enabled="true" ValidChars=" ,/,-,_" TargetControlID="txt_PocketName">
                                                                             </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                                 <td>
                                                                     Status
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddlPocketStatus" runat="server" Width="130px">
                                                                         <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                         <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                         <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                     </asp:DropDownList>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="pocket" ControlToValidate="ddlPocketStatus" InitialValue="-1"
                                                                         CssClass="validation"></asp:RequiredFieldValidator><asp:Label ID="lblPocket_Status_Comp"
                                                                             runat="server" Visible="false"></asp:Label>
                                                                 </td>
                                                                 <td>
                                                                     Pincode
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtPincode" runat="server" Width="115px" MaxLength="6"></asp:TextBox><asp:RequiredFieldValidator
                                                                         ID="RequiredFieldValidator33" runat="server" ErrorMessage="**" ValidationGroup="pocket"
                                                                         ControlToValidate="txtPincode" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                             ID="ftbepincode" runat="server" FilterType="Numbers" Enabled="true" ValidChars=""
                                                                             TargetControlID="txtPincode">
                                                                         </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td>
                                                                     City
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtCity" runat="server" Width="115px"></asp:TextBox><asp:RequiredFieldValidator
                                                                         ID="RequiredFieldValidator30" runat="server" ErrorMessage="**" ValidationGroup="pocket"
                                                                         ControlToValidate="txtCity" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                             ID="ftbecity" runat="server" FilterType="LowercaseLetters,UppercaseLetters" Enabled="true"
                                                                             ValidChars="" TargetControlID="txtCity">
                                                                         </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                                 <td>
                                                                     State
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtState" runat="server" Width="115px"></asp:TextBox><asp:RequiredFieldValidator
                                                                         ID="RequiredFieldValidator31" runat="server" ErrorMessage="**" ValidationGroup="pocket"
                                                                         ControlToValidate="txtState" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                             ID="ftbeState" runat="server" FilterType="LowercaseLetters,UppercaseLetters"
                                                                             Enabled="true" ValidChars="" TargetControlID="txtState">
                                                                         </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                                 <td>
                                                                     Country
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtCountry" runat="server" Width="115px"></asp:TextBox><asp:RequiredFieldValidator
                                                                         ID="RequiredFieldValidator32" runat="server" ErrorMessage="**" ValidationGroup="pocket"
                                                                         ControlToValidate="txtCountry" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                             ID="ftbeCountry" runat="server" FilterType="LowercaseLetters,UppercaseLetters"
                                                                             Enabled="true" ValidChars="" TargetControlID="txtCountry">
                                                                         </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td>
                                                                     Address1
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtAddress1" TextMode="MultiLine" runat="server" Width="115px"></asp:TextBox><asp:RequiredFieldValidator
                                                                         ID="RequiredFieldValidator27" runat="server" ErrorMessage="**" ValidationGroup="pocket"
                                                                         ControlToValidate="txtAddress1" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                                 <td>
                                                                     Address2
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtAddress2" TextMode="MultiLine" runat="server" Width="115px"></asp:TextBox><asp:RequiredFieldValidator
                                                                         ID="RequiredFieldValidator29" runat="server" ErrorMessage="**" ValidationGroup="pocket"
                                                                         ControlToValidate="txtAddress2" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                                 <td>
                                                                     Description
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtPocketDescription" TextMode="MultiLine" runat="server" Width="115px"></asp:TextBox><asp:RequiredFieldValidator
                                                                         ID="RequiredFieldValidator28" runat="server" ErrorMessage="**" ValidationGroup="pocket"
                                                                         ControlToValidate="txtPocketDescription" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                         <table>
                                                             <tr>
                                                                 <td colspan="4">
                                                                     <asp:Label ID="lblPocketResult" runat="server"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td colspan="3" align="center">
                                                                     <asp:Button ID="btnPocketSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                         ValidationGroup="pocket" Style="margin-left: 242px" OnClick="btnPocketSave_Click" /><asp:ConfirmButtonExtender
                                                                             ID="ConfirmbtnPocketSave" runat="server" TargetControlID="btndummy7" ConfirmOnFormSubmit="false"
                                                                             ConfirmText="Are you sure you want to SAVE this?">
                                                                         </asp:ConfirmButtonExtender>
                                                                     <asp:Button ID="btndummy7" runat="server" Visible="false" /><asp:Button ID="btnPocketClear"
                                                                         runat="server" Text="Clear" CssClass="btn btn-mini" Style="margin-left: 10px"
                                                                         OnClick="btnPocketClear_Click" /><asp:Button ID="btnPocketCancel" runat="server"
                                                                             Text="Cancel" CssClass="btn btn-mini btn-danger" Style="margin-left: 10px" OnClick="btnPocketCancel_Click" />
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </asp:Panel>
                                                 <br />
                                                 <br />
                                                 <br />
                                                 <br />
                                                 <asp:GridView ID="Grid_Pocket" runat="server" AutoGenerateColumns="False" Width="80%"
                                                     AllowPaging="True" DataKeyNames="pocket_id" PageSize="5" Style="margin-left: 10%;
                                                     margin-bottom: 50px" OnPageIndexChanging="Grid_Pocket_PageIndexChanging" OnDataBound="Grid_Pocket_DataBound"
                                                     CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblPocketName" runat="server" Text='<%#Eval("pocket_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Status">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblPocketStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label><div
                                                                     style="text-align: center">
                                                                     <asp:ImageButton ID="imgPocketStatus" runat="server" Width="15px" Height="15px" /></div>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="50px" />
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Address1">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblAddress1" runat="server" Text='<%#Eval("address_1") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Address2">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblAddress2" runat="server" Text='<%#Eval("address_2") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="City">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblCity" runat="server" Text='<%#Eval("city") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="State">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblState" runat="server" Text='<%#Eval("state") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Country">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblCountry" runat="server" Text='<%#Eval("country") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Pincode">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblPincode" runat="server" Text='<%#Eval("pincode") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Description">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblPocketDescription" runat="server" Text='<%#Eval("pocket_desc") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <div style="text-align: center">
                                                                     <asp:ImageButton ID="imgbtnPocketEdit" runat="server" Width="15px" Height="15px"
                                                                         ImageAlign="Middle" OnClick="imgbtnPocketEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /></div>
                                                                 <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnPocketEdit"
                                                                     ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Edit this?">
                                                                 </asp:ConfirmButtonExtender>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                            <!-- ==================== END OF FIFTH TAB CONTENT ==================== -->   
                                             <!-- ==================== SEVENTH CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel8" runat="server">
                                             <HeaderTemplate>
                                                 FLAT TYPE AMENITY</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Button ID="btnCreateNewAmenityType" runat="server" Text="Add New Amenity Type"
                                                     CssClass="btn btn-mini btn-primary" OnClick="btnCreateNewAmenityType_Click" Style="margin-left: 40px" /><br />
                                                 <br />
                                                 <p style="margin-left: 400px; margin-top: -20px">
                                                     Flat Type Name
                                                     <asp:DropDownList ID="ddl_flat_types" runat="server" Width="115px" AutoPostBack="true"
                                                         OnSelectedIndexChanged="ddl_flat_types_SelectedIndexChanged">
                                                     </asp:DropDownList>
                                                     <asp:Label ID="lbl_flat_Type_id" runat="server" Visible="False"></asp:Label><asp:ImageButton
                                                         ID="img_btn_AmenityEdit" Title="Edit" runat="server" Width="15px" Height="15px"
                                                         ImageAlign="Middle" OnClick="img_btn_AmenityEdit_Click" ImageUrl="~/Icons/1386333731_14_Add.png"
                                                         Visible="false" /><asp:ConfirmButtonExtender ID="ConfirmButtonExtender08" runat="server"
                                                             TargetControlID="img_btn_AmenityEdit" ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Edit this?">
                                                         </asp:ConfirmButtonExtender>
                                                     <br />
                                                     <br />
                                                     <asp:Panel ID="Panel1" runat="server" Width="40%" Style="margin-left: 20%" DefaultButton="btnAmenityTypeSave">
                                                         <table>
                                                             <td>
                                                             </td>
                                                             <td colspan="2">
                                                                 <b>Amenity Type :</b>
                                                             </td>
                                                             </tr><tr>
                                                                 <td>
                                                                 </td>
                                                                 <td>
                                                                     <div style="width: 100%; height: 250px; overflow: scroll">
                                                                         <asp:GridView ID="grid_Amenity_Type_list" runat="server" AutoGenerateColumns="false"
                                                                             OnRowDataBound="grid_Amenity_Type_list_RowDataBound" CssClass="table table-striped"
                                                                             Style="width: 100%">
                                                                             <Columns>
                                                                                 <asp:TemplateField HeaderStyle-Width="20px">
                                                                                     <ItemTemplate>
                                                                                         <asp:CheckBox ID="chk_Amenity_Type" runat="server" AutoPostBack="true" OnCheckedChanged="chk_Amenity_Type_checkedChanged" /></ItemTemplate>
                                                                                 </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Amenity Type" HeaderStyle-Width="300px">
                                                                                     <ItemTemplate>
                                                                                         <asp:Label ID="lbl_Amenity_Type_list" runat="server" Text='<%#Eval("p_type_name") %>'></asp:Label><asp:Label
                                                                                             ID="lblProdId" runat="server" Text='<%#Eval("p_type_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                                                 </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="No.of Amenities">
                                                                                     <ItemTemplate>
                                                                                         <asp:Label ID="lbl_Amenity_Type_total_list" runat="server" Text='<%# string.Format("{0}",string.IsNullOrEmpty(Eval("no_of_amenities").ToString())?"0":Eval("no_of_amenities")) %>'></asp:Label><asp:TextBox
                                                                                             ID="txt_total_aminities" runat="server" Width="50%" Text='<%# string.Format("{0}",string.IsNullOrEmpty(Eval("no_of_amenities").ToString())?"0":Eval("no_of_amenities")) %>'
                                                                                             Visible="false" BorderStyle="NotSet" BorderColor="#009933"></asp:TextBox></ItemTemplate>
                                                                                 </asp:TemplateField>
                                                                             </Columns>
                                                                         </asp:GridView>
                                                                     </div>
                                                                 </td>
                                                                 <td>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td colspan="3" align="center">
                                                                     <asp:Button ID="btnAmenityTypeSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                         ValidationGroup="dft" OnClick="btnAmenityTypeSave_Click" /><asp:ConfirmButtonExtender
                                                                             ID="ConfirmOnF_P_Type" runat="server" TargetControlID="btndummyFPType" ConfirmOnFormSubmit="false"
                                                                             ConfirmText="Are you sure you want to SAVE this?">
                                                                         </asp:ConfirmButtonExtender>
                                                                     <asp:Button ID="btndummyFPType" runat="server" Visible="false" /><asp:Button ID="btnAmenityTypeCancel"
                                                                         runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger" Style="margin-left: 10px"
                                                                         OnClick="btnAmenityTypeCancel_Click" />
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </asp:Panel>
                                                     <br />
                                                     <br />
                                                     <p align="center">
                                                         <asp:Label ID="lbl_grid_result" runat="server"></asp:Label></p>
                                                 </p>
                                                 <asp:GridView ID="Grid_flatType_AmenityType" runat="server" AutoGenerateColumns="False"
                                                     Width="40%" AllowPaging="True" DataKeyNames="flat_type_id,amenity_type_id" PageSize="5"
                                                     Style="margin-left: 20%; margin-bottom: 50px" OnPageIndexChanging="Grid_Amemity_type_PageIndexChanging"
                                                     CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Amenity Type Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblPTypeName" runat="server" Text='<%#Eval("p_type_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Total no.of Poducts">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_no_of_amenities" runat="server" Text='<%#Eval("no_of_amenities") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <asp:ImageButton ID="imgbtnAmenityEdit" runat="server" Width="15px" Height="15px"
                                                                     ImageAlign="Middle" OnClick="imgbtnAmenityEdit_Click" ImageUrl="~/Icons/1385390972_write.png" />
                                                                     
                                                                     <asp:ConfirmButtonExtender
                                                                         ID="ConfirmButtonExtender8" runat="server" TargetControlID="imgbtnAmenityEdit"
                                                                         ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Edit this?">
                                                                     </asp:ConfirmButtonExtender>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                            <!-- ==================== END OF SEVENTH TAB CONTENT ==================== -->  
                                              <!-- ==================== THIRD CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel9" runat="server">
                                             <HeaderTemplate>
                                                 DESIGNATION</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Button ID="btnCreateNewDesig" runat="server" Text="Add New Designation" CssClass="btn btn-mini btn-primary"
                                                     OnClick="btnCreateNewDesig_Click" Style="margin-left: 40px" /><asp:Panel ID="panelDesignation"
                                                         runat="server" DefaultButton="btnDesigSave" Visible="False" Width="40%" Style="margin-left: 20%">
                                                         <table>
                                                             <tr>
                                                                 <td>
                                                                     Designation
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtDesig" runat="server" Width="102px"></asp:TextBox><asp:Label
                                                                         ID="lblDesigId" runat="server" Visible="False"></asp:Label>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="desig" ControlToValidate="txtDesig" CssClass="validation"></asp:RequiredFieldValidator><asp:FilteredTextBoxExtender
                                                                             ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtDesig" FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                                                             ValidChars=" ">
                                                                         </asp:FilteredTextBoxExtender>
                                                                 </td>
                                                                 <td>
                                                                     Status
                                                                 </td>
                                                                 <td>
                                                                     <asp:DropDownList ID="ddlDesigStatus" runat="server" Width="115px">
                                                                         <asp:ListItem Text="--select--" Value="-1" Selected="True"></asp:ListItem>
                                                                         <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                         <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                                                     </asp:DropDownList>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="desig" ControlToValidate="ddlDesigStatus" InitialValue="-1"
                                                                         CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                         <table>
                                                             <tr>
                                                                 <td>
                                                                     Description
                                                                 </td>
                                                                 <td>
                                                                     <asp:TextBox ID="txtDesigDescription" TextMode="MultiLine" runat="server" Width="274px"
                                                                         Height="32px"></asp:TextBox>
                                                                 </td>
                                                                 <td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ErrorMessage="**"
                                                                         ValidationGroup="desig" ControlToValidate="txtDesigDescription" CssClass="validation"></asp:RequiredFieldValidator>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td colspan="3">
                                                                     <asp:Label ID="lblDesgDisplay" runat="server"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td>
                                                                 </td>
                                                                 <td colspan="2" align="center">
                                                                     <asp:Button ID="btnDesigSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                         ValidationGroup="desig" OnClick="btnDesigSave_Click" /><asp:ConfirmButtonExtender
                                                                             ID="ConfirmbtnDesigSave" runat="server" TargetControlID="btndummy9" ConfirmOnFormSubmit="false"
                                                                             ConfirmText="Are you sure you want to SAVE this?">
                                                                         </asp:ConfirmButtonExtender>
                                                                     <asp:Button ID="btndummy9" runat="server" Visible="false" /><asp:Button ID="btnDesigClear"
                                                                         runat="server" Text="Clear" CssClass="btn btn-mini" Style="margin-left: 10px"
                                                                         OnClick="btnDesigClear_Click" /><asp:Button ID="btnDesigCancel" runat="server" Text="Cancel"
                                                                             CssClass="btn btn-mini btn-danger" Style="margin-left: 10px" OnClick="btnDesigCancel_Click" />
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </asp:Panel>
                                                 <br />
                                                 <br />
                                                 <asp:GridView ID="Grid_Desig" runat="server" AutoGenerateColumns="False" Width="40%"
                                                     AllowPaging="True" DataKeyNames="desg_id" PageSize="5" Style="margin-left: 20%;
                                                     margin-bottom: 50px" OnPageIndexChanging="Grid_Desig_PageIndexChanging" OnDataBound="Grid_Desig_DataBound"
                                                     CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblDesigName" runat="server" Text='<%#Eval("desg_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Status">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblDesigStatus" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label><div
                                                                     style="text-align: center">
                                                                     <asp:ImageButton ID="imgDesigStatus" runat="server" Width="15px" Height="15px" /></div>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="50px" />
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Description">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblDesigDescription" runat="server" Text='<%#Eval("desg_desc") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <div style="text-align: center">
                                                                     <asp:ImageButton ID="imgbtnDesigEdit" runat="server" Width="15px" Height="15px" ImageAlign="Middle"
                                                                         OnClick="imgbtnDesigEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /></div>
                                                                 <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtnDesigEdit"
                                                                     ConfirmOnFormSubmit="false" ConfirmText="Are you sure you want to Update this?">
                                                                 </asp:ConfirmButtonExtender>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                            <!-- ==================== END OF THIRD TAB CONTENT ==================== -->
                                              
                                                <!-- ==================== FIRST TAB CONTENT ==================== -->
                                         <asp:TabPanel ID="tabpanel2" runat="server">
                                             <HeaderTemplate>
                                                 FLAT AMENITIES</HeaderTemplate>
                                             <ContentTemplate>
                                                 <asp:Panel ID="panelFlatAmenity" runat="server" Width="80%" Style="margin-left: 20%">
                                                     <table>
                                                         <tr>
                                                             <td>
                                                                 Pocket
                                                             </td>
                                                             <td>
                                                                 <asp:DropDownList ID="ddl_Flat_Aminity_Pocket" runat="server" Width="115px" AutoPostBack="true"
                                                                     OnSelectedIndexChanged="ddl_Flat_Aminity_Pocket_SelectedIndexChanged">
                                                                 </asp:DropDownList>
                                                                 <asp:Label ID="lbl_Flat_Aminity_Pocket" runat="server" Visible="False"></asp:Label><asp:RequiredFieldValidator
                                                                     ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ValidationGroup="af"
                                                                     ControlToValidate="ddl_Flat_Aminity_Pocket" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                                             </td>
                                                             <td>
                                                                 Block
                                                             </td>
                                                             <td>
                                                                 <asp:DropDownList ID="ddl_Flat_Aminity_Block" runat="server" Width="115px" AutoPostBack="true"
                                                                     OnSelectedIndexChanged="ddl_Flat_Aminity_Block_SelectedIndexChanged">
                                                                 </asp:DropDownList>
                                                                 <asp:Label ID="lbl_Flat_Aminity_Block" runat="server" Visible="False"></asp:Label><asp:RequiredFieldValidator
                                                                     ID="RequiredFieldValidator4" runat="server" ErrorMessage="**" ValidationGroup="af"
                                                                     ControlToValidate="ddl_Flat_Aminity_Block" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                                             </td>
                                                             <td>
                                                                 Floor
                                                             </td>
                                                             <td>
                                                                 <asp:DropDownList ID="ddl_Flat_Aminity_Floor" runat="server" Width="115px" AutoPostBack="true"
                                                                     OnSelectedIndexChanged="ddl_Flat_Aminity_Floor_SelectedIndexChanged">
                                                                 </asp:DropDownList>
                                                                 <asp:Label ID="lbl_Flat_Aminity_Floor" runat="server" Visible="False"></asp:Label><asp:RequiredFieldValidator
                                                                     ID="RequiredFieldValidator5" runat="server" ErrorMessage="**" ValidationGroup="af"
                                                                     ControlToValidate="ddl_Flat_Aminity_Floor" InitialValue="0" CssClass="validation"></asp:RequiredFieldValidator>
                                                             </td>
                                                             <td>
                                                                 Flat Type
                                                             </td>
                                                             <td>
                                                                 <asp:DropDownList ID="ddl_Flat_Aminity_FlatType" runat="server" Width="115px" AutoPostBack="true"
                                                                     OnSelectedIndexChanged="ddl_Flat_Aminity_Flat_type_SelectedIndexChanged">
                                                                 </asp:DropDownList>
                                                                 <asp:Label ID="lblFlatId" runat="server" Visible="False"></asp:Label><div style="width: 100%;
                                                                     height: 75%; ">
                                                                     <asp:CheckBoxList ID="chkAmenityType" runat="server" Width="115px" AutoPostBack="false"
                                                                         OnTextChanged="chkAmenityType_TextChanged" RepeatColumns="6" CellPadding="2"
                                                                         CellSpacing="3" RepeatDirection="Horizontal" RepeatLayout="Table" TextAlign="Right">
                                                                     </asp:CheckBoxList>
                                                                     <asp:Label ID="lblAmenityId" runat="server" Visible="False"></asp:Label></div>
                                                             </td>
                                                         </tr>
                                                         </Table>
                                                         <table>
                                                         <tr>
                                                             <td>
                                                             </td>
                                                             <td colspan="2" align="center">
                                                                 <asp:Button ID="btnFlatNoSave" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                     OnClick="btnFlatNoSave_Click" Style="margin-left:260px" />
                                                                     
                                                                     <asp:Button ID="btnFlatNoClear" runat="server" Text="Clear"
                                                                         CssClass="btn btn-mini" Style="margin-left: 10px" OnClick="btnFlatNoClear_Click" />
                                                                         <asp:Button
                                                                             ID="btnFlatNoCancel" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                                             Style="margin-left: 10px" OnClick="btnFlatNoCancel_Click" />
                                                             </td>
                                                         </tr>
                                                     </table>
                                                     <asp:Panel ID="panelFlatAmenity2" runat="server" Width="100%">
                                                         <table width="100%">
                                                             <tr>
                                                                 <td class="span2" colspan="3" style="border-color: WindowFrame; border-style: solid">
                                                                     FLAT No:<b><u><asp:Label ID="lbl_flat_number_display" runat="server"></asp:Label></u></b>Products
                                                                     <hr />
                                                                     <hr />
                                                                     <div style="width: 100%; height: 75%; overflow: scroll">
                                                                         <asp:CheckBoxList ID="CheckBoxList1" runat="server" Width="115px" AutoPostBack="false"
                                                                             OnTextChanged="chkAmenityType_TextChanged" RepeatColumns="6" CellPadding="2"
                                                                             CellSpacing="3" RepeatDirection="Horizontal" RepeatLayout="Table" TextAlign="Right">
                                                                         </asp:CheckBoxList>
                                                                         <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label></div>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td>
                                                                 </td>
                                                                 <td colspan="2" align="center">
                                                                     <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-mini btn-primary"
                                                                         OnClick="btnFlatNoSave_Click" /><asp:Button ID="Button2" runat="server" Text="Clear"
                                                                             CssClass="btn btn-mini" Style="margin-left: 10px" OnClick="btnFlatNoClear_Click" /><asp:Button
                                                                                 ID="Button3" runat="server" Text="Cancel" CssClass="btn btn-mini btn-danger"
                                                                                 Style="margin-left: 10px" OnClick="btnFlatNoCancel_Click" />
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </asp:Panel>
                                                     <asp:Label ID="FLATAmenityResults" runat="server"></asp:Label></asp:Panel>
                                                 <br />
                                                 <br />
                                                 <asp:GridView ID="grid_Flat_Amenity" runat="server" AutoGenerateColumns="False" Width="80%"
                                                     AllowPaging="True" DataKeyNames="flat_id,flat_type_id" PageSize="5" Style="margin-left: 5%;
                                                     margin-bottom: 50px" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                                     OnDataBound="grid_Flat_Amenity_DataBound" OnPageIndexChanging="grid_Flat_Amenity_PageIndexChanging">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Flat Number">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_flat_flat_number" runat="server" Text='<%#Eval("flat_number") %>'></asp:Label><asp:Label
                                                                     ID="lbl_flat_flat_id" runat="server" Text='<%#Eval("flat_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Flat Type Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_flat_flat_Type_name" runat="server" Text='<%#Eval("flat_type_name") %>'></asp:Label><asp:Label
                                                                     ID="lbl_flat_type_id" runat="server" Text='<%#Eval("flat_type_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Floor Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_flat_floor_name" runat="server" Text='<%#Eval("floor_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Block Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_flat_Block_name" runat="server" Text='<%#Eval("Block_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Pocket Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_flat_Pocket_name" runat="server" Text='<%#Eval("Pocket_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Total Aminities">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_flat_Total_aminity" runat="server" Text='<%#Eval("total_amenity") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Needed Aminities">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_flat_needed_aminity" runat="server" Text='<%#Eval("needed_amenity") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="View">
                                                             <ItemTemplate>
                                                                 <div style="text-align: center">
                                                                     <asp:ImageButton ID="imgbtnFlatNoview" runat="server" Width="15px" Height="15px"
                                                                         ImageAlign="Middle" OnClick="imgbtnFlatNoview_Click" ImageUrl="~/Icons/1385729255_View_Details.png" /></div>
                                                             </ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <asp:ImageButton ID="imgbtnFlatNoEdit" runat="server" Width="15px" Height="15px"
                                                                     ImageAlign="Middle" OnClick="imgbtnFlatNoEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /></ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                                 <asp:Label ID="lblFlat_id" runat="server" Visible="false"></asp:Label><asp:Button
                                                     ID="btndummy1" runat="server" Style="display: none" /><asp:ModalPopupExtender ID="popUpView"
                                                         runat="server" TargetControlID="btndummy1" PopupControlID="panelView">
                                                     </asp:ModalPopupExtender>
                                                 <asp:Panel runat="server" ID="panelView" Style="min-width: 400px">
                                                     <div class="floatingBox">
                                                         <div class="container-fluid">
                                                             <div class="row-fluid" style="margin-bottom: 0px">
                                                                 <div class="span12">
                                                                     <div class="containerHeadline" id="Div1">
                                                                         <h2>
                                                                             Amenity List</h2>
                                                                     </div>
                                                                     <div class="floatingBox" style="margin-bottom: 0px">
                                                                         <div class="container-fluid" style="margin-bottom: 0px">
                                                                             <div class="form-horizontal contentForm">
                                                                                 <asp:Label ID="lbl_pop_result" runat="server" Visible="false"></asp:Label><asp:GridView
                                                                                     ID="Grid_Popup" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="false"
                                                                                     DataKeyNames="flat_id" Style="margin-left: 0%; margin-bottom: 0px" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped">
                                                                                     <Columns>
                                                                                         <asp:TemplateField>
                                                                                             <ItemTemplate>
                                                                                             </ItemTemplate>
                                                                                         </asp:TemplateField>
                                                                                         <asp:TemplateField HeaderText="Product Name">
                                                                                             <ItemTemplate>
                                                                                                 <asp:Label ID="lbl_prod_name" runat="server" Text='<%#Eval("prod_name") %>'></asp:Label><asp:Label
                                                                                                     ID="lbl_prod_id" runat="server" Text='<%#Eval("prod_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                                                         </asp:TemplateField>
                                                                                         <asp:TemplateField HeaderText="Product Type Name">
                                                                                             <ItemTemplate>
                                                                                                 <asp:Label ID="lbl_p_type_name" runat="server" Text='<%#Eval("p_type_name") %>'></asp:Label></ItemTemplate>
                                                                                         </asp:TemplateField>
                                                                                         <asp:TemplateField HeaderText="Serial No">
                                                                                             <ItemTemplate>
                                                                                                 <asp:Label ID="lbl_Serial_no" runat="server" Text='<%#Eval("serial_no") %>'></asp:Label></ItemTemplate>
                                                                                         </asp:TemplateField>
                                                                                     </Columns>
                                                                                 </asp:GridView>
                                                                                 <div align="right">
                                                                                     <asp:Button ID="imgview" runat="server" Text="Close" CssClass="btn btn-mini btn-danger"
                                                                                         OnClick="icon_minimise_click" /></div>
                                                                             </div>
                                                                         </div>
                                                                     </div>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                     </div>
                                                 </asp:Panel>
                                                 <asp:GridView ID="Grid_flatsdx" runat="server" AutoGenerateColumns="False" Width="40%"
                                                     AllowPaging="True" DataKeyNames="prod_id" PageSize="5" Style="margin-left: 20%;
                                                     margin-bottom: 50px" CssClass="table tablesorter centerFirstLast tablesorter-default hasFilters table-striped"
                                                     Visible="false">
                                                     <Columns>
                                                         <asp:TemplateField>
                                                             <ItemTemplate>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Product Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_prod_name" runat="server" Text='<%#Eval("prod_name") %>'></asp:Label><asp:Label
                                                                     ID="lbl_prod_id" runat="server" Text='<%#Eval("prod_id") %>' Visible="false"></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Product Type Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_p_type_name" runat="server" Text='<%#Eval("p_type_name") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Status">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_flat_prod_Status" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label><asp:ImageButton
                                                                     ID="imgFlat_prod_Status" runat="server" Width="15px" Height="15px" /></ItemTemplate>
                                                             <HeaderStyle Width="50px" />
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Flat No">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lbl_fm_Flat_no" runat="server" Text='<%#Eval("flat_number") %>'></asp:Label></ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Edit">
                                                             <ItemTemplate>
                                                                 <asp:ImageButton ID="imgbtnFlatNoEdit" runat="server" Width="15px" Height="15px"
                                                                     ImageAlign="Middle" OnClick="imgbtnFlatNoEdit_Click" ImageUrl="~/Icons/1385390972_write.png" /></ItemTemplate>
                                                             <HeaderStyle Width="40px" />
                                                         </asp:TemplateField>
                                                     </Columns>
                                                 </asp:GridView>
                                             </ContentTemplate>
                                         </asp:TabPanel>
                                         <!-- ==================== END OF FIRST TAB CONTENT ==================== -->   
                                              </asp:TabContainer>
                                        <!-- ==================== END OF ALLWAY RIGHT TABS ==================== -->
                                        </ContentTemplate>
                                        </asp:UpdatePanel>
                                </div>
                                </div>
                                </div>
                                </div>
            </div>
            </asp:Content>
            