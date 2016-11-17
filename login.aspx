<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">    
    <meta charset="utf-8" />
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
        <title>CannyBee Solutions</title>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" href="css/styles.css" />
    
    <script>        window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
    <script src="js/vendor/bootstrap.min.js"></script>

    <script type="text/javascript">
        window.history.forward();
        function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
    <form id="form1" runat="server">
    <div>
     <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
        <asp:Panel ID="panel1" runat="server" DefaultButton="btnLogin">
        <div class="container-fluid">

            <div class="form-signin">
                <h2 class="form-signin-heading"><strong>CANNY</strong>BEE</h2>
                <div class="input-prepend">
                  <span class="add-on"><i class="icon-user"></i></span>
               
                  <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Required1" runat="server" ErrorMessage="Enter User Id" ControlToValidate="txtUserId"
                                     CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>                 
                </div>
                <div class="input-prepend">
                  <span class="add-on"><i class="icon-lock"></i></span>
                  <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

                   <asp:Button ID="btnLogin" runat="server" BackColor="SkyBlue" ForeColor="White" 
                        Font-Bold="true" Height="30px" Text="Go" onclick="btnLogin_Click" ValidationGroup="emp_reg"/><br />

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword"
                      CssClass="validation" ValidationGroup="emp_reg"></asp:RequiredFieldValidator>
    
                </div>
                  <asp:Label id="lblinvalid" runat="server" ForeColor="Red"></asp:Label>
            </div>
             
            <div class="signInRow">
                <div><h1>Sign in</h1></div>
                <div><a href="#">Lost your password?</a></div>
            </div>

        </div> 
        </asp:Panel>    
    </div>
    </form>
</body>
</html>
