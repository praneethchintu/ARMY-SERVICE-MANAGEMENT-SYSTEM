using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class admn_admn_master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (HttpContext.Current.User.IsInRole("4") && HttpContext.Current.User.Identity.IsAuthenticated)
        //{
        //    helper_class hcls = new helper_class();
        //    SqlCommand cmdUser = new SqlCommand();
        //    cmdUser.Parameters.Clear();
        //    cmdUser.CommandType = CommandType.StoredProcedure;
        //    cmdUser.CommandText = "login_user_name";
        //    cmdUser.Parameters.AddWithValue("@emp_id", HttpContext.Current.User.Identity.Name);
        //    DataTable dtUser = hcls.ExecuteQueryDT(cmdUser);
        //    if (dtUser.Rows.Count > 0)
        //    {
        //        lblUserName.Text = dtUser.Rows[0]["emp_name"].ToString();
        //        lblDesignation.Text = dtUser.Rows[0]["designation_name"].ToString();
        //        lblEmpId.Text = dtUser.Rows[0]["emp_id"].ToString();
        //        lblDepartment.Text = dtUser.Rows[0]["designation_name"].ToString();
        //    }
        //    dtUser.Dispose();
        //    cmdUser.Dispose();
        //}
        //else
        //{
        //    FormsAuthentication.SignOut();
        //    FormsAuthentication.RedirectToLoginPage();

        //}
    }
    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}
