using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class profile_change_pass : System.Web.UI.Page
{
    helper_class hcls = new helper_class();
    protected override void OnPreInit(EventArgs e)
    {
        //if (HttpContext.Current.User.IsInRole("12"))
        //{ Page.MasterPageFile = "~/accountant/accountant_master.master"; }

        //if (HttpContext.Current.User.IsInRole("4"))
        //{ Page.MasterPageFile = "~/admn/admn_master.master"; }

        //if (HttpContext.Current.User.IsInRole("6"))
        //{ Page.MasterPageFile = "~/floor_mngr/floor_mngr_master.master"; }

        //if (HttpContext.Current.User.IsInRole("5"))
        //{ Page.MasterPageFile = "~/frnt_dsk_mngr/frnt_dsk_master.master"; }

        //if (HttpContext.Current.User.IsInRole("9"))
        //{ Page.MasterPageFile = "~/hr_mngr/hr_master_page.master"; }


        if (HttpContext.Current.User.IsInRole("13"))
        { Page.MasterPageFile = "~/incident_creation/MasterIncident.master"; }

        if (HttpContext.Current.User.IsInRole("14"))
        { Page.MasterPageFile = "~/incident_creation/MasterIncident.master"; }

        if (HttpContext.Current.User.IsInRole("10"))
        { Page.MasterPageFile = "~/store_mngr/store_mngr_master.master"; }

        if (HttpContext.Current.User.IsInRole("1"))
        { Page.MasterPageFile = "~/sup_admn/sup_admn_master.master"; }
    }   // loading respective master page as per Employee Login

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblUserId.Text = HttpContext.Current.User.Identity.Name;
        }
    }
    protected void btnDone_Click(object sender, EventArgs e)
    {
        SqlCommand cmdChange = new SqlCommand();
        cmdChange.CommandType = CommandType.StoredProcedure;
        cmdChange.CommandText = "sp_change_password";

        cmdChange.Parameters.AddWithValue("@emp_id", HttpContext.Current.User.Identity.Name);
        cmdChange.Parameters.AddWithValue("@old_password", txtOldPass.Text);
        cmdChange.Parameters.AddWithValue("@new_password", txtNewPass.Text);

        if (hcls.ExecuteNonQuery(cmdChange) == 1)
        {
            clear_feilds();
            lblPasswordResult.ForeColor = Color.Green;
            lblPasswordResult.Text = "Password Changed...";
        }
        else
        {
            clear_feilds();
            lblPasswordResult.ForeColor = Color.Red;
            lblPasswordResult.Text = "Password Changing failed...";
        }
        cmdChange.Dispose();
    }

    private void clear_feilds()
    {
        txtOldPass.Text = "";
        txtNewPass.Text = "";
        txtConfirmPass.Text = "";
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        clear_feilds();
        lblPasswordResult.Text = "";
    }
}