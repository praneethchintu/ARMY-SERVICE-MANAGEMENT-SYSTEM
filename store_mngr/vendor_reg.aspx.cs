using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class store_mngr_vendor_reg : System.Web.UI.Page
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
            panelVendorReg.Visible = false;
            load_vendors();
        }
    }


    private void load_vendors()
    { 
        SqlCommand cmdList=new SqlCommand();
        cmdList.CommandType=CommandType.StoredProcedure;
        cmdList.CommandText = "sp_vendor_master_selections";
        cmdList.Parameters.AddWithValue("@op_type", 1);
        cmdList.Parameters.AddWithValue("@vendor_id", "");
        hcls.Load_gridview(cmdList, grid_vendor_list);
        cmdList.Dispose();
    }

    protected void btnShowReg_Click(object sender, EventArgs e)
    {
        panelVendorReg.Visible = true;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdSave = new SqlCommand();
        cmdSave.CommandType = CommandType.StoredProcedure;
        cmdSave.CommandText = "sp_vendor_master_operations";

        cmdSave.Parameters.AddWithValue("@op_type", 1);
        cmdSave.Parameters.AddWithValue("@vendor_id", "");
        cmdSave.Parameters.AddWithValue("@vendor_name", txtVendorName.Text);
        cmdSave.Parameters.AddWithValue("@vendor_desc", txtDesc.Text);
        cmdSave.Parameters.AddWithValue("@contact_person", txtContactPerson.Text);
        cmdSave.Parameters.AddWithValue("@address", txtAddress.Text);
        cmdSave.Parameters.AddWithValue("@city", txtCity.Text);
        cmdSave.Parameters.AddWithValue("@state", txtState.Text);
        cmdSave.Parameters.AddWithValue("@county", txtCountry.Text);
        cmdSave.Parameters.AddWithValue("@pin_code", txtPinCode.Text);
        cmdSave.Parameters.AddWithValue("@email", txtEmailID.Text == "" ? "" : txtEmailID.Text);
        cmdSave.Parameters.AddWithValue("@phone_no_1", txtPhone1.Text);
        cmdSave.Parameters.AddWithValue("@phone_no_2", txtPhone2.Text == "" ? "" : txtPhone2.Text);
        cmdSave.Parameters.AddWithValue("@status", 1);
        cmdSave.Parameters.AddWithValue("@web_url", txtWebURL.Text == "" ? "" : txtWebURL.Text);
        cmdSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        int k=hcls.master_save(cmdSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(panelVendorReg.Controls);
            lblVendorResult.ForeColor = Color.Green;
            lblVendorResult.Text = "Vendor Registered...";
            load_vendors();
        }
        else if (k == 3)
        {
            lblVendorResult.ForeColor = Color.Red;
            lblVendorResult.Text = "Registration failed...Duplicate entry of unique values";
        }
        else
        {
            lblVendorResult.ForeColor = Color.Red;
            lblVendorResult.Text = "Registration failed...";
        }
        cmdSave.Dispose();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelVendorReg.Controls);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panelVendorReg.Visible = false;
    }

    protected void grid_vendor_list_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_vendor_list.PageIndex = e.NewPageIndex;
        load_vendors();
    }
    
}