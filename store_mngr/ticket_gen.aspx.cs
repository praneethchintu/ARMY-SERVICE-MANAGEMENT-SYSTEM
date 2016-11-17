using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class store_mngr_ticket_gen : System.Web.UI.Page
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
            load_incident_list();
            load_vendors();
            load_ticket_list();
            load_technicians();
        }
    }

    private void load_incident_list()
    {
        SqlCommand cmdList = new SqlCommand();
        cmdList.Parameters.Clear();
        cmdList.CommandType = CommandType.StoredProcedure;
        cmdList.CommandText = "sp_incident_master_selections";
        cmdList.Parameters.AddWithValue("@op_type", 4);  // required selection
        cmdList.Parameters.AddWithValue("@incident_id", "");
        cmdList.Parameters.AddWithValue("@emp_id", HttpContext.Current.User.Identity.Name);
        hcls.Load_gridview(cmdList, grid_incident_list_sm);
        cmdList.Dispose();
    }

    private void load_ticket_list()
    {
        SqlCommand cmdList = new SqlCommand();
        cmdList.Parameters.Clear();
        cmdList.CommandType = CommandType.StoredProcedure;
        cmdList.CommandText = "sp_incident_master_selections";
        cmdList.Parameters.AddWithValue("@op_type", 5);  // required selection
        cmdList.Parameters.AddWithValue("@incident_id", "");
        cmdList.Parameters.AddWithValue("@emp_id", "STORMA000001");
        hcls.Load_gridview(cmdList, grid_tiket_list);
        cmdList.Dispose();
    }
    private void load_vendors()
    {
        SqlCommand cmdVendors = new SqlCommand();
        cmdVendors.CommandType = CommandType.StoredProcedure;
        cmdVendors.CommandText = "sp_vendor_master_selections";
        cmdVendors.Parameters.AddWithValue("@op_type", 2);
        cmdVendors.Parameters.AddWithValue("@vendor_id", 0);

        hcls.Load_DropDown(cmdVendors, ddlEmployee);
        cmdVendors.Dispose();
    }

    private void load_technicians()
    {
        SqlCommand cmdtech = new SqlCommand();
        cmdtech.CommandType = CommandType.StoredProcedure;
        cmdtech.CommandText = "sp_emp_list_designation_wise";
        cmdtech.Parameters.AddWithValue("@op_type", 1);
        cmdtech.Parameters.AddWithValue("@design_id", 14);  // 14 for technicians
        hcls.Load_DropDown(cmdtech, ddlTechnician);
        cmdtech.Dispose();
    }

    protected void btnAddDescription_Click(object sender, EventArgs e)
    {
        popUpGenTicket.Show();
        GridViewRow gr=(GridViewRow)((Button)sender).Parent.Parent;
        lblIncidentId.Text = grid_incident_list_sm.DataKeys[gr.RowIndex].Value.ToString();
        lblEmpDescription.Text = ((Label)gr.FindControl("lblDesc")).Text;
    }
  
    protected void btnGenTicketSave_Click(object sender, EventArgs e)
    {
        if (lblIncidentId.Text != "")
        {
            popUpGenTicket.Show();
            SqlCommand cmdGenTick = new SqlCommand();
            cmdGenTick.Parameters.Clear();
            cmdGenTick.CommandType = CommandType.StoredProcedure;
            cmdGenTick.CommandText = "sp_incident_ticket_generation";

            cmdGenTick.Parameters.AddWithValue("@op_type", 1);
            cmdGenTick.Parameters.AddWithValue("@incident_id", lblIncidentId.Text);
            cmdGenTick.Parameters.AddWithValue("@respect_emp_id", ddlEmployee.SelectedValue);
            cmdGenTick.Parameters.AddWithValue("@mngr_comments", txtEditDesc.Text);
            cmdGenTick.Parameters.AddWithValue("@technician_id", ddlTechnician.SelectedValue);
            cmdGenTick.Parameters.AddWithValue("@mngr_cr_id", HttpContext.Current.User.Identity.Name);

            if (hcls.ExecuteNonQuery(cmdGenTick) > 0)
            {
                lblDescResult.ForeColor = Color.Green;
                lblDescResult.Text = "Done...";
                load_incident_list();
                load_ticket_list();
                lblIncidentId.Text = "";
                lblEmpDescription.Text = "";
                ddlEmployee.SelectedIndex = 0;
                txtEditDesc.Text = "";
            }
            else
            {
                lblDescResult.ForeColor = Color.Red;
                lblDescResult.Text = "failed...";
            }
            cmdGenTick.Dispose();
            
        }
    }

    protected void btnGenTicketCancel_Click(object sender, EventArgs e)
    {
        lblDescResult.Text = "";
        lblEmpDescription.Text = "";
        lblIncidentId.Text = "";
        txtEditDesc.Text = "";
        popUpGenTicket.Hide();
    }

    protected void btnEditDescription_Click(object sender, EventArgs e)
    {
        popUpGenTicket.Show();
        GridViewRow gr = (GridViewRow)((Button)sender).Parent.Parent;
        lblIncidentId.Text = grid_tiket_list.DataKeys[gr.RowIndex].Value.ToString();
        ddlEmployee.SelectedValue = ((Label)gr.FindControl("lblVendor")).Text;
        lblEmpDescription.Text = ((Label)gr.FindControl("lblEmpDesc")).Text;
        txtEditDesc.Text = ((Label)gr.FindControl("lblMngrDesc")).Text;
    }
}