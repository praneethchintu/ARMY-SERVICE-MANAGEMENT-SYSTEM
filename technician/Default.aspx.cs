using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class technician_Default : System.Web.UI.Page
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
            load_ticket_list();
        }
    }


    private void load_ticket_list()
    {
        SqlCommand cmdList = new SqlCommand();
        cmdList.Parameters.Clear();
        cmdList.CommandType = CommandType.StoredProcedure;
        cmdList.CommandText = "sp_incident_master_selections";
        cmdList.Parameters.AddWithValue("@op_type", 5);  // required selection
        cmdList.Parameters.AddWithValue("@incident_id", "");
        cmdList.Parameters.AddWithValue("@emp_id", HttpContext.Current.User.Identity.Name);
        hcls.Load_gridview(cmdList, grid_tiket_list);
        cmdList.Dispose();
    }

    protected void paging(object sender, GridViewPageEventArgs e)
    {
        grid_tiket_list.PageIndex = e.NewPageIndex;
        load_ticket_list();
    }

    protected void btnEditDescription_Click(object sender, EventArgs e)
    {
        popUpGenTicket.Show();
        lblDescResult.Text = "";
        GridViewRow gr = (GridViewRow)((Button)sender).Parent.Parent;
        lblIncidentId.Text = grid_tiket_list.DataKeys[gr.RowIndex].Value.ToString();      
        lblEmpDescription.Text = ((Label)gr.FindControl("lblEmpDesc")).Text;
       lblMngrDesc.Text = ((Label)gr.FindControl("lblMngrDesc")).Text;
       ddlStatus.SelectedValue = ((Label)gr.FindControl("lblStatusId")).Text;
             
    }
    protected void btnGenTicketSave_Click(object sender, EventArgs e)
    {
        if (lblIncidentId.Text != "")
        {
            SqlCommand cmdSave = new SqlCommand();
            cmdSave.CommandType = CommandType.StoredProcedure;
            cmdSave.CommandText = "sp_incident_tech_update";
            cmdSave.Parameters.AddWithValue("@op_type", 1);
            cmdSave.Parameters.AddWithValue("@incident_id", lblIncidentId.Text);
            cmdSave.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
            cmdSave.Parameters.AddWithValue("@tech_id", HttpContext.Current.User.Identity.Name);
            cmdSave.Parameters.AddWithValue("@tech_comments", txtEditDesc.Text);

            if (hcls.ExecuteNonQuery(cmdSave) > 0)
            {
                clear();
                lblDescResult.ForeColor = Color.Green;
                lblDescResult.Text = "Done..";
                load_ticket_list();
            }
            else
            {
                lblDescResult.ForeColor = Color.Red;
                lblDescResult.Text = "not saved..";
            }
        }
        else
        {
            lblDescResult.ForeColor = Color.Red;
            lblDescResult.Text = "Please select ticket...";
            clear();
        }
    }
    protected void btnGenTicketCancel_Click(object sender, EventArgs e)
    {
        clear();
        popUpGenTicket.Hide();
    }

    private void clear()
    {
        lblIncidentId.Text = "";
        lblEmpDescription.Text = "";
        lblMngrDesc.Text = "";
        ddlStatus.SelectedValue = "0";
        lblDescResult.Text = "";
    }
}