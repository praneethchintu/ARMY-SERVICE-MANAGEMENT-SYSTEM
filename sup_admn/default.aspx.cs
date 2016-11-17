using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



public partial class sup_admn_Default : System.Web.UI.Page
{
    helper_class hcls = new helper_class();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_today_calls_details();
            load_weekly_calls_details();
            load_monthly_calls_details();
        }
    }

    

    private void load_today_calls_details()
    {
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.CommandText = "sp_dushboard_details";
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.Parameters.AddWithValue("@op_type", 1);
        DataSet dsDetails= hcls.ExecuteQueryDS(cmd1);
        if (dsDetails.Tables.Count > 0)
        {
            if (dsDetails.Tables[0].Rows.Count > 0)
            {
                lblTotalCalls.Text = dsDetails.Tables[0].Rows[0]["todaytotalcalls"].ToString();
                lblAssignedCalls.Text = dsDetails.Tables[0].Rows[0]["assinged_calls"].ToString();
                lblClosedCalls.Text = dsDetails.Tables[0].Rows[0]["closed_calls"].ToString();
            }
            else
            {
                lblTotalCalls.Text = "0";
                lblAssignedCalls.Text = "0";
                lblClosedCalls.Text = "0";
            }

            if (dsDetails.Tables[1].Rows.Count > 0)
            {
                grid_asscalls.DataSource = dsDetails.Tables[1];
                grid_asscalls.DataBind();
            }
            else
            {
                grid_asscalls.DataSource = null;
                grid_asscalls.DataBind();
            }

            if (dsDetails.Tables[2].Rows.Count > 0)
            {
                grid_close_calls.DataSource = dsDetails.Tables[2];
                grid_close_calls.DataBind();
            }
            else
            {
                grid_close_calls.DataSource = null;
                grid_close_calls.DataBind();
            }
        }
        dsDetails.Dispose();
        cmd1.Dispose();
    }

    private void load_weekly_calls_details()
    {
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.CommandText = "sp_dushboard_details";
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.Parameters.AddWithValue("@op_type", 2);
        DataSet dsDetails = hcls.ExecuteQueryDS(cmd1);
        if (dsDetails.Tables.Count > 0)
        {
            if (dsDetails.Tables[0].Rows.Count > 0)
            {
                lblTotalCalls2.Text = dsDetails.Tables[0].Rows[0]["week_calls"].ToString();
                lblAssignedCalls2.Text = dsDetails.Tables[0].Rows[0]["week_assign_calls"].ToString();
                lblClosedCalls2.Text = dsDetails.Tables[0].Rows[0]["week_pending_calls"].ToString(); 
            }
            else
            {
                lblTotalCalls2.Text = "0";
                lblAssignedCalls2.Text = "0";
                lblClosedCalls2.Text = "0";
            }
        }
        if (dsDetails.Tables[1].Rows.Count > 0)
        {
            grid_asscalls2.DataSource = dsDetails.Tables[1];
            grid_asscalls2.DataBind();
        }
        else
        {
            grid_asscalls2.DataSource = null;
            grid_asscalls2.DataBind();
        }

        if (dsDetails.Tables[2].Rows.Count > 0)
        {
            grid_close_calls2.DataSource = dsDetails.Tables[2];
            grid_close_calls2.DataBind();
        }
        else
        {
            grid_close_calls2.DataSource = null;
            grid_close_calls2.DataBind();
        }

        dsDetails.Dispose();
        cmd1.Dispose();
    }
    private void load_monthly_calls_details()
    {
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.CommandText = "sp_dushboard_details";
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.Parameters.AddWithValue("@op_type", 3);
        DataSet dsDetails = hcls.ExecuteQueryDS(cmd1);
        if (dsDetails.Tables.Count > 0)
        {
            if (dsDetails.Tables[0].Rows.Count > 0)
            {
                lblTotalCalls3.Text = dsDetails.Tables[0].Rows[0]["month_calls"].ToString();
                lblAssignedCalls3.Text = dsDetails.Tables[0].Rows[0]["month_assign_calls"].ToString();
                lblClosedCalls3.Text = dsDetails.Tables[0].Rows[0]["month_pending_calls"].ToString();
            }
            else
            {
                lblTotalCalls3.Text = "0";
                lblAssignedCalls3.Text = "0";
                lblClosedCalls3.Text = "0";
            }
        }
        if (dsDetails.Tables[1].Rows.Count > 0)
        {
            grid_asscalls3.DataSource = dsDetails.Tables[1];
            grid_asscalls3.DataBind();
        }
        else
        {
            grid_asscalls3.DataSource = null;
            grid_asscalls3.DataBind();
        }

        if (dsDetails.Tables[2].Rows.Count > 0)
        {
            grid_close_calls3.DataSource = dsDetails.Tables[2];
            grid_close_calls3.DataBind();
        }
        else
        {
            grid_close_calls3.DataSource = null;
            grid_close_calls3.DataBind();
        }

        dsDetails.Dispose();
        cmd1.Dispose();
    }
    protected void grid_asscalls_PageIndexChanging(object sender,GridViewPageEventArgs e)
    {
        grid_asscalls.PageIndex = e.NewPageIndex;      
        load_today_calls_details();
    }
    protected void grid_close_calls_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_close_calls.PageIndex = e.NewPageIndex;
        load_today_calls_details();
    }
    protected void grid_asscalls2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_asscalls2.PageIndex = e.NewPageIndex;
        load_weekly_calls_details();
    }
    protected void grid_close_calls2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_close_calls2.PageIndex = e.NewPageIndex;
        load_weekly_calls_details();
    }
    protected void grid_asscalls3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_asscalls3.PageIndex = e.NewPageIndex;
        load_monthly_calls_details();
    }
    protected void grid_close_calls3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_close_calls3.PageIndex = e.NewPageIndex;
        load_monthly_calls_details();
    }
}