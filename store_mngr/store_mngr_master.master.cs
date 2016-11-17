using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class store_mngr_store_mngr_master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (HttpContext.Current.User.IsInRole("10") && HttpContext.Current.User.Identity.IsAuthenticated)
        {
            helper_class hcls = new helper_class();
            SqlCommand cmdUser = new SqlCommand();
            cmdUser.Parameters.Clear();
            cmdUser.CommandType = CommandType.StoredProcedure;
            cmdUser.CommandText = "login_user_name";
            cmdUser.Parameters.AddWithValue("@emp_id", HttpContext.Current.User.Identity.Name);
            DataTable dtUser = hcls.ExecuteQueryDT(cmdUser);
            if (dtUser.Rows.Count > 0)
            {
                lbl_head_username.Text = dtUser.Rows[0]["emp_name"].ToString().ToUpper();
                lblUserName.Text = dtUser.Rows[0]["emp_name"].ToString();
                lblDesignation.Text = dtUser.Rows[0]["designation_name"].ToString();
                lblEmpId.Text = dtUser.Rows[0]["emp_id"].ToString();
                lblDepartment.Text = dtUser.Rows[0]["designation_name"].ToString();
            }
            dtUser.Dispose();
            cmdUser.Dispose();
        }
        else
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();

        }
    }
    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}
