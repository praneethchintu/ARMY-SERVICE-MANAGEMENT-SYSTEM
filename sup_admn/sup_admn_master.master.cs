using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class sup_admn_sup_admn_master : System.Web.UI.MasterPage
{
    helper_class hcls = new helper_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sliderdivfix.Attributes.Add("class", "hiddenContent");
            if (HttpContext.Current.User.IsInRole("1") && HttpContext.Current.User.Identity.IsAuthenticated)
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
                    lblUserName.Text = dtUser.Rows[0]["emp_name"].ToString().ToUpper();
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

           // get_directory_category();
        }

       
    }
    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void get_directory_category()
    {
        SqlCommand cmdCat = new SqlCommand();
        cmdCat.CommandType = CommandType.StoredProcedure;
        cmdCat.CommandText = "sp_get_directory_masters";
        hcls.Load_DropDown(cmdCat, ddlCat);
        cmdCat.Dispose();
    }

    protected void changed(object sender, EventArgs e)
    {       
        if (ddlCat.SelectedIndex != 0)
        {
            SqlCommand cmdGet = new SqlCommand();
            cmdGet.CommandType = CommandType.StoredProcedure;
            cmdGet.CommandText = "sp_get_directory_employees";
            cmdGet.Parameters.AddWithValue("@directory_id", ddlCat.SelectedValue);
            hcls.Load_gridview(cmdGet, gv_directory);
            cmdGet.Dispose();
        }
        else
        {
            gv_directory.DataSource = null;
            gv_directory.DataBind();
        }
    }

    protected void ButtonClick(object sender, EventArgs e)
    {
       // sliderdivfix.Attributes.Add("class", "hiddenContent");
       // messagesContent.Attributes.Remove("class");
      //  settingsContent.Attributes.Remove("class");
      //  profileContent.Attributes.Remove("class");
    }
}
