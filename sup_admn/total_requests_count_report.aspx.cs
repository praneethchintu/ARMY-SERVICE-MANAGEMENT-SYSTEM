using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.DataVisualization.Charting;


public partial class reports_total_requests_count_report : System.Web.UI.Page
{
    helper_class hcls = new helper_class();
    public static DataSet ds_incident;

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
        if (!Page.IsPostBack)
        {
            hcls.emp_attend_load_monthYear(ddlMonth, ddlYear);
            //load_Services();
            ddlReportType_SelectedIndexChanged(sender, EventArgs.Empty);
            //txtDay.Text = DateTime.Now.ToString("yyyy-MM-dd");
          
        }
    }

    protected void ddlReportType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (sender.GetType() == typeof(DropDownList))
        {
            DropDownList ddl = (DropDownList)sender;
            string str = ddl.ID;
            if (str == "ddlReportType")
            {
                txtDay.Text = ""; txtStartDate.Text = ""; txtEndDate.Text = "";
                ddlMonth.SelectedValue = "0"; ddlYear.SelectedValue = "0";                
            }
            else if (str == "ddlMonth")
            {
                ddlYear.SelectedValue = "0";                
            }

        }

        if (sender.GetType() == typeof(TextBox))
        {
            TextBox txtb = (TextBox)sender;
            string str = txtb.ID;
            
            if (str == "txtStartDate")
            {               
                txtEndDate.Text = "";
            }            
        }

        int report_type = Convert.ToInt32(ddlReportType.SelectedValue);
        int mon = DateTime.Now.Month;
        int yea = DateTime.Now.Year;
        string start_date = "";
        string end_date = "";

        if (ddlReportType.SelectedValue == "0")
        {
            pnlDay.Visible = false;
            pnlMonth.Visible = false;
            pnlPeriodic.Visible = false;
            report_type = 0;
        }
        else if (ddlReportType.SelectedValue == "1")
        {
            pnlDay.Visible = true;
            pnlMonth.Visible = false;
            pnlPeriodic.Visible = false;

            if (txtDay.Text == "")
            {
                lbl_err.Text = "";
                //default is current day's Data                
                start_date = DateTime.Now.ToString("yyyy-MM-dd");
                end_date = start_date;
                txtDay.Text = start_date;

            }

            else
            {
                try
                {
                    lbl_err.Text = "";
                    start_date = Convert.ToDateTime(txtDay.Text.Trim()).ToString("yyyy-MM-dd");
                    end_date = start_date;
                    txtDay.Text = start_date;
                }
                catch
                {
                    lbl_err.ForeColor = Color.Red;
                    lbl_err.Text = "Incurrect date format";

                }

            }


        }
        if (ddlReportType.SelectedValue == "2")
        {
            pnlDay.Visible = false;
            pnlMonth.Visible = true;
            pnlPeriodic.Visible = false;

            if (ddlMonth.SelectedValue == "0" || ddlYear.SelectedValue == "0")
            {
                //default is current month data                              
                start_date = GetFirstDayOfMonth(mon, yea).ToString("yyyy-MM-dd");
                end_date = GetLastDayOfMonth(mon, yea).ToString("yyyy-MM-dd");
                ddlMonth.SelectedIndex = DateTime.Now.Month-1;
                ddlYear.SelectedIndex = DateTime.Now.Year-2013;
            }

            if (ddlMonth.SelectedValue != "0" && ddlYear.SelectedValue != "0")
            {
                int monthnumber = ddlMonth.SelectedIndex;
                int yearnumber = Convert.ToInt32(ddlYear.SelectedItem.Text);
                start_date = GetFirstDayOfMonth(monthnumber, yearnumber).ToString("yyyy-MM-dd");
                // set last day
                end_date = GetLastDayOfMonth(monthnumber, yearnumber).ToString("yyyy-MM-dd");
            }

        }

        if (ddlReportType.SelectedValue == "3")
        {
            pnlDay.Visible = false;
            pnlMonth.Visible = false;
            pnlPeriodic.Visible = true;


            if (txtStartDate.Text.Trim() == "" || txtEndDate.Text.Trim() == "")
            {
                lbl_err.Text = "";
                start_date = new DateTime(yea, 1, 1).ToString("yyyy-MM-dd");
                end_date = new DateTime(yea, 12, 31).ToString("yyyy-MM-dd");
                txtStartDate.Text = start_date;
                txtEndDate.Text = end_date;
            }

            else
            {
                try
                {
                    lbl_err.Text = "";
                    start_date = Convert.ToDateTime(txtStartDate.Text.Trim()).ToString("yyyy-MM-dd");
                    end_date = Convert.ToDateTime(txtEndDate.Text.Trim()).ToString("yyyy-MM-dd");
                }
                catch
                {
                    lbl_err.ForeColor = Color.Red;
                    lbl_err.Text = "Incurrect date format";

                }
            }

        }

        Bind_Incident_Details(new SqlCommand("sp_report_total_requests"), report_type, start_date, end_date);
        ds_incident.Dispose();
        

    }


    private void Bind_Incident_Details(SqlCommand cmd_Incident, int Reporttype, string startdate, string enddate)
    {
        cmd_Incident.CommandType = CommandType.StoredProcedure;
        //cmd_Incident.Parameters.AddWithValue("type",type);
        cmd_Incident.Parameters.AddWithValue("@ReportType", Reporttype);        
        cmd_Incident.Parameters.AddWithValue("@startdate", startdate);
        cmd_Incident.Parameters.AddWithValue("@enddate", enddate);
        ds_incident = hcls.ExecuteQueryDS(cmd_Incident);
        if (ds_incident.Tables[0].Rows.Count > 0)
        {
            grid_incident.DataSource = ds_incident.Tables[0];
            grid_incident.DataBind();

            //method call for chart load
            incident_chart_load();
        }
        else
        {
            grid_incident.DataSource = null;
            grid_incident.DataBind();
            incident_chart.Visible = false;
            secondPieChart1.Visible = false;
        }
        // ds_incident.Dispose();
        cmd_Incident.Dispose();
    }

    protected void grid_incident_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_incident.PageIndex = e.NewPageIndex;
        grid_incident.DataSource = ds_incident.Tables[0];
        grid_incident.DataBind();
        incident_chart_load();
        //ds_incident.Dispose();       
    }
    void incident_chart_load()
    {
        secondPieChart1.Visible = true;
        incident_chart.Visible = true;
        DataTable dt_incident = ds_incident.Tables[1];
        if (dt_incident.Rows.Count < 0)
        {
            incident_chart.Visible = false;
            secondPieChart1.Visible = false;
            return;
        }

        ListBox01.DataSource = dt_incident;
        ListBox01.DataTextField = "status";
        ListBox01.DataValueField = "TotalRequests";
        ListBox01.DataBind();


        string[] x = new String[dt_incident.Rows.Count];
        int[] y = new int[dt_incident.Rows.Count];
        for (int i = 0; i < dt_incident.Rows.Count; i++)
        {
            x[i] = dt_incident.Rows[i]["status"].ToString();
            y[i] = Convert.ToInt32(dt_incident.Rows[i]["TotalRequests"]);
        }

        incident_chart.Series[0].Points.DataBindXY(x, y);
        incident_chart.Legends[0].Enabled = true;
        incident_chart.Series[0].ChartType = SeriesChartType.Pie;
        incident_chart.Series[0].Label = "#VALY";
        incident_chart.Series[0].LegendText = "#AXISLABEL";
        incident_chart.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
        incident_chart.Series[0].Points[0].Color = Color.Gold;        
        
        dt_incident.Dispose();
    }


    //method for getting firstday of particular month
    private DateTime GetFirstDayOfMonth(int iMonth, int iyear)
    {
        // set return value to the last day of the month      

        // create a datetime variable set to the passed in date
        DateTime firstdate = new DateTime(iyear, iMonth, 1);

        // remove all of the days in the month
        // except the first day and set the        
        firstdate = firstdate.AddDays(-(firstdate.Day - 1));

        // return the first day of the month
        return firstdate;
    }

    //method for getting lastday of particular month
    private DateTime GetLastDayOfMonth(int iMonth, int iyear)
    {

        // set return value to the last day of the month
        // for any date passed in to the method

        // create a datetime variable set to the passed in date
        DateTime lastdate = new DateTime(iyear, iMonth, 1);

        // overshoot the date by a month
        lastdate = lastdate.AddMonths(1);

        // remove all of the days in the next month
        // to get bumped down to the last day of the
        // previous month
        lastdate = lastdate.AddDays(-(lastdate.Day));

        // return the last day of the month
        return lastdate;

    }

    protected void grid_incident_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in grid_incident.Rows)
        {
            if ((gr.RowIndex % 2) == 1)
            {
                gr.Attributes.Add("class", "odd");
            }
            else
            {
                gr.Attributes.Add("class", "even");
            }
            if (((Label)gr.FindControl("lblStatus")).Text == "OnHold")
            {
                ((Label)gr.FindControl("lblStatus")).ForeColor = Color.Red;
            }
            if (((Label)gr.FindControl("lblStatus")).Text == "Open")
            {
                ((Label)gr.FindControl("lblStatus")).ForeColor = Color.BlueViolet;
            }
            if (((Label)gr.FindControl("lblStatus")).Text == "Resolve")
            {
                ((Label)gr.FindControl("lblStatus")).ForeColor = Color.Green;
            }

            if (((Label)gr.FindControl("lblPriority")).Text == "1")
            {
                ((Label)gr.FindControl("lblPriority")).Text = "High";
                ((Label)gr.FindControl("lblPriority")).ForeColor = Color.Red;
            }
            if (((Label)gr.FindControl("lblPriority")).Text == "2")
            {
                ((Label)gr.FindControl("lblPriority")).Text = "Medium";
                ((Label)gr.FindControl("lblPriority")).ForeColor = Color.Purple;
            }
            if (((Label)gr.FindControl("lblPriority")).Text == "3")
            {
                ((Label)gr.FindControl("lblPriority")).Text = "Low";
                ((Label)gr.FindControl("lblPriority")).ForeColor = Color.Orange;
            }

            if (((Label)gr.FindControl("lblPriority")).Text == "4")
            {
                ((Label)gr.FindControl("lblPriority")).Text = "Normal";
                ((Label)gr.FindControl("lblPriority")).ForeColor = Color.Orange;
            }
            //Convert.ToDateTime(((Label)gr.FindControl("lblclosetime")).Text).ToString("yyyy-MM-dd-hh-mm-ss");
        }
    }
}