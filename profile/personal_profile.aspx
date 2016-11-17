<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personal_profile.aspx.cs" MasterPageFile="~/profile/MasterPage.master" Inherits="sales_personal_profile" Culture="en-GB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
    <title></title>

     <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
      
        <link rel="stylesheet" href="../css/styles.css" />
       <style type="text/css">  
        .HeaderCSS  
        {  
            color:Black;
            background-color:linear-gradient(to bottom, rgba(254,254,254,1) 0%,rgba(243,243,243,1) 100%);
            font-size:medium;  
            
            font-family:Verdana; 
               border-style:groove;
           border-width:1px;
           border-color:Black;     
            }  
           
        .HeaderSelectedCSS  
        {  
            color:Black;
             background-color:linear-gradient(to bottom, rgba(254,254,254,1) 0%,rgba(243,243,243,1) 100%);
           border-width:0px;
            font-size:medium;  
            font-family:Verdana;
                  border-style:groove;
           border-width:1px;
           border-color:Black;     
            }              
    </style>

</asp:Content>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <div class="content">
            <div class="container-fluid">
                <asp:UpdatePanel ID="updatepanel1" runat="server">
                    <ContentTemplate>
                        <div class="row-fluid">
                            <div class="span12">
                                <div class="containerHeadline">
                                    <i class="icon-tag"></i>
                                    <h2>
                                      Personal Profile
                                    </h2>
                                </div>
                                <div class="floatingBox examples">
                                    <div class="container-fluid" >


                                        <div class="span6" >
                                            <div class="floatingBox table" style="margin-left:50%">
                                                <div class="container-fluid">
                                              

                                                    <table width="100%" style="height:90%" align="center">
                                                        <tr>
                                                            <td style="width: 20%">
                                                                <asp:Image ID="imgEmp" runat="server" Height="200px" Width="170px" ImageAlign="Middle"
                                                                    AlternateText="No Image" />
                                                                   <h5>
                                                                    <asp:Label ID="lblEmpName" runat="server"></asp:Label></h5>   
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
                                                                    <td>Date of Birth </td>
                                                                    <td><asp:Label ID="lblDOB" runat="server"></asp:Label></td>
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
                                                        <td></td>
                                                            <td>
                                                            <table>
                                                            <tr>
                                                            <td> <h5>
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
                                                            <td>     <h5>
                                                                    Present Address</h5>
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td style="width: 10%">
                                                                        </td>
                                                                        <td style="width: 90%">
                                                                            <asp:Label ID="lblPresentAddress" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table></td>
                                                            </tr>
                                                            </table>
                                                               
                                                           
                                                            </td>
                                                            
                                                        </tr>
                                                    </table>
                                                      
                                                  
                                                
                                                </div>
                                            </div>
                                        </div>
                                         
                                    </div>
                                </div>
                            </div>
                          
                        </div>
                    </ContentTemplate>
                   
                </asp:UpdatePanel>
            </div>
        </div>
  

</asp:Content>
