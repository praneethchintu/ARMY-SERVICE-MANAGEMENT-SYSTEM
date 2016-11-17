using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class store_mngr_Default : System.Web.UI.Page
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
            load_summary();
            load_ticket_list();
        }
    }

    private void load_summary()
    {
        SqlCommand cmdSummary = new SqlCommand();
        cmdSummary.CommandType = CommandType.StoredProcedure;
        cmdSummary.CommandText = "sp_store_summary_details";
        cmdSummary.Parameters.AddWithValue("@op_type", 1);

        DataSet dsSummary = hcls.ExecuteQueryDS(cmdSummary);

        if (dsSummary.Tables.Count > 0)
        {
            if (dsSummary.Tables[0].Columns[0].ColumnName == "total_products")
            {
                lblTotalProducts.Text = dsSummary.Tables[0].Rows[0]["total_products"].ToString();
                lblProductStore.Text = dsSummary.Tables[0].Rows[0]["products_in_store"].ToString();
                lblProductUse.Text = dsSummary.Tables[0].Rows[0]["products_in_use"].ToString();
                lblProductRepair.Text = dsSummary.Tables[0].Rows[0]["products_in_repair"].ToString();
                lblProductsExpDisp.Text = dsSummary.Tables[0].Rows[0]["products_exp_disp"].ToString();
            }
            if (dsSummary.Tables[1].Columns[0].ColumnName == "total_tickets")
            {
                lblTicketsTotal.Text = dsSummary.Tables[1].Rows[0]["total_tickets"].ToString();
                lblTicketsOpen.Text = dsSummary.Tables[1].Rows[0]["open_tickets"].ToString();
                lblTicketsClose.Text = dsSummary.Tables[1].Rows[0]["close_tickets"].ToString();
                lblTicketsHold.Text = dsSummary.Tables[1].Rows[0]["hold_tickets"].ToString();
            }
            if (dsSummary.Tables[2].Columns[0].ColumnName == "total_contracts")
            {
                lblContractsTotal.Text = dsSummary.Tables[2].Rows[0]["total_contracts"].ToString();
                lblContractsActive.Text = dsSummary.Tables[2].Rows[0]["active_contact"].ToString();
                lblContractsCloseToExp.Text = dsSummary.Tables[2].Rows[0]["close_to_exp"].ToString();
                lblContractsInActive.Text = dsSummary.Tables[2].Rows[0]["Inactive_contact"].ToString();
            }

            if (dsSummary.Tables[3].Columns[0].ColumnName == "total_pos")
            {
                lblTotalPOs.Text = dsSummary.Tables[3].Rows[0]["total_pos"].ToString();
            }
        }
    }

    private void load_ticket_list()
    {
        SqlCommand cmdList = new SqlCommand();
        cmdList.Parameters.Clear();
        cmdList.CommandType = CommandType.StoredProcedure;
        cmdList.CommandText = "sp_incident_master_selections";
        cmdList.Parameters.AddWithValue("@op_type", 6);  // for datetime with late time
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

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        load_ticket_list();
    }
}