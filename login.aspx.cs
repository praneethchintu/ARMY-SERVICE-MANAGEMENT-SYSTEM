using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    helper_class hcls = new helper_class();
   public static DataTable dtroles;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select login_id,login_password,dm.designation_name from  emp_login_details eld,designation_master dm where eld.designation_id=dm.designation_id";
            cmd.CommandType = CommandType.Text;
            dtroles = hcls.ExecuteQueryDT(cmd);
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Clear();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "login_check";
        cmd.Parameters.AddWithValue("@login_id", txtUserId.Text.Trim());
        cmd.Parameters.AddWithValue("@login_password", txtPassword.Text.Trim());

        string design = "";
        DataTable dt = hcls.ExecuteQueryDS(cmd).Tables[0];

        cmd.Dispose();

        if (dt.Rows.Count > 0)
        {
            string emp_id = dt.Rows[0]["emp_id"].ToString();
            design = dt.Rows[0]["designation_id"].ToString();

            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, emp_id, DateTime.Now, DateTime.Now.AddMinutes(30), true, design, FormsAuthentication.FormsCookiePath);
            string hash = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);
            if (ticket.IsPersistent)
                cookie.Expires = ticket.Expiration;

            Response.Cookies.Add(cookie);

            string returnUrl = null;
            if (design == "1")     // 1 - SuperAdmin
            {
                returnUrl = "~/sup_admn/default.aspx";
            }
            if (design == "4")     // 4 - Admin
            {
                returnUrl = "~/admn/default.aspx";
            }

            else if (design=="13")//13 help desk 
            {
                returnUrl = "~/incident_creation/incident.aspx";
            }
            else if (design == "8")     // 8 - Service Manager
            {
                returnUrl = "~/service_mngr/Default.aspx";
            }
         
            else if (design == "10")     // 10 - Store Manager
            {
                returnUrl = "~/store_mngr/default.aspx";
            }
         
         
            else if (design == "14")     // 13 - Technician
            {
                //returnUrl = "~/technician/default.aspx";
                returnUrl = "~/technician/incidents_of_technis.aspx";
            }
            else
            {
                lblinvalid.Text = "Invalid UserID or Password";
            }

          
            if (returnUrl == null)
                returnUrl = "login.aspx";

            Response.Redirect(returnUrl);
        }
        else
                {
                    lblinvalid.Text = "Invalid User Name or Password";
                }
            }
    }
    
