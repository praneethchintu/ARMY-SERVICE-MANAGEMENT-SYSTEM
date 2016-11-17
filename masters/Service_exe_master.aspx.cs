using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;


public partial class masters_Service_exe_master : System.Web.UI.Page
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
            panelService.Visible = false;
            get_Service_details();

            panelExecutive.Visible = false;
            get_Executives_details();


            load_Executive_list();
            load_Service_list();
        }
    }

    private void load_Executive_list()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
       // cmdTypeGet.CommandText = "select n.emp_name,e.emp_id from emp_reg_design e,emp_reg n where e.emp_id=n.emp_id and e.design_id=14";
        cmdTypeGet.CommandText = "sp_service_executives_operations";
       cmdTypeGet.Parameters.AddWithValue("@op_type", 4);  // 1 for select all type values
       cmdTypeGet.Parameters.AddWithValue("@emp_id", "");
       cmdTypeGet.Parameters.AddWithValue("@serv_id", "");
       cmdTypeGet.Parameters.AddWithValue("@status", "");
       cmdTypeGet.Parameters.AddWithValue("@serv_exe_desc", "");
       cmdTypeGet.Parameters.AddWithValue("@cruser", "");
        hcls.Load_DropDown(cmdTypeGet, ddlExecutive);
        cmdTypeGet.Dispose();
    }

    private void load_Service_list()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        //cmdTypeGet.CommandText = "select cat_name,cat_id from tbl_prod_category_master";
        cmdTypeGet.CommandText = "sp_flat_services";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 4);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@service_id", "");
        cmdTypeGet.Parameters.AddWithValue("@service_name", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@serv_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_DropDown(cmdTypeGet, ddlServices);
        cmdTypeGet.Dispose();
    }

    #region Executives Master
    protected void btnCreateNewExecutive_Click(object sender, EventArgs e)
    {
        ddlExecutive.Enabled = true;
        panelExecutive.Visible = true;
        ddlExecutiveStatus.SelectedIndex = 0;
    }
    protected void btnExecutiveSave_Click(object sender, EventArgs e)
    {


        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_service_executives_operations";
        if (lblExecutive_ID.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
            cmdTypeSave.Parameters.AddWithValue("@emp_id", ddlExecutive.SelectedValue.Trim());        
        }
        if (lblExecutive_ID.Text != "" && ddlExecutive.SelectedValue.Trim() != "" && ddlExecutiveStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation
            cmdTypeSave.Parameters.AddWithValue("@emp_id", lblExecutive_ID.Text.Trim() == "" ? "" : lblExecutive_ID.Text.Trim());        
        }
        cmdTypeSave.Parameters.AddWithValue("@status", ddlExecutiveStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@serv_id", ddlServices.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@serv_exe_desc", txtExecutiveDescription.Text.Trim() == "" ? "" : txtExecutiveDescription.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@cruser", HttpContext.Current.User.Identity.Name);

        ConfirmonEXE.TargetControlID = "btndummyEXE";

        int k = hcls.master_save(cmdTypeSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(panelExecutive.Controls);
            lblExecutiveResult.ForeColor = Color.Green;
            lblExecutiveResult.Text = "Technician saved..";
            ddlExecutiveStatus.SelectedIndex = 0;
            get_Executives_details();
            lblExecutive_ID.Text = "";
        }
        else if (k == 3)
        {
            
            lblExecutiveResult.ForeColor = Color.Red;
            lblExecutiveResult.Text = "<b>" + ddlExecutive.SelectedItem.Text.ToUpper() + "</b> have already One service";
        }
        else
        {
            lblExecutiveResult.ForeColor = Color.Red;
            lblExecutiveResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    private void get_Executives_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        // cmdTypeGet.CommandText = "select P.p_type_id,P.p_type_name,P.status,T.type_id,T.type_name,C.cat_id,C.cat_name,P.comments from tbl_product_type_master P,tbl_type_master T,tbl_prod_category_master C where P.cat_id=C.cat_id and P.type_id=T.type_id";
        cmdTypeGet.CommandText = "sp_service_executives_operations";

        cmdTypeGet.Parameters.AddWithValue("@op_type", 3);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@emp_id", "");
       // cmdTypeGet.Parameters.AddWithValue("@p_type_name", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@serv_id", "");
        cmdTypeGet.Parameters.AddWithValue("@serv_exe_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@cruser", "");
        hcls.Load_gridview(cmdTypeGet, Grid_Executive);
        cmdTypeGet.Dispose();
    }
    protected void btnExecutiveClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelExecutive.Controls);
        ddlExecutiveStatus.SelectedIndex = 0;
    }
    protected void btnExecutiveCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelExecutive.Controls);
        panelExecutive.Visible = false;
    }

    protected void Grid_Executive_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Executive.PageIndex = e.NewPageIndex;
        get_Executives_details();

    }
    protected void Grid_Executive_DataBound(object sender, EventArgs e)
    {
        if (Grid_Executive.Rows.Count > 0)
        {
            foreach (GridViewRow gr in Grid_Executive.Rows)
            {
                if ((gr.FindControl("lblExecutiveStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgExecutiveStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgExecutiveStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void imgbtnExecutive_Click(object sender, EventArgs e)  // to edit
    {
        ddlExecutive.Enabled = false;
        try
        {
            panelExecutive.Visible = true;
            lblExecutiveResult.Text = "";
            GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

            lblExecutive_ID.Text = Grid_Executive.DataKeys[gr.RowIndex].Value.ToString();
            ddlExecutive.SelectedValue = Grid_Executive.DataKeys[gr.RowIndex].Value.ToString();
            ddlExecutiveStatus.SelectedValue = (gr.FindControl("lblExecutiveStatus") as Label).Text;  //type id
            ddlServices.SelectedValue = Convert.ToString((gr.FindControl("lblServiceId") as Label).Text);
            txtExecutiveDescription.Text = (gr.FindControl("lblExecutiveDescription") as Label).Text;  //comments

            ConfirmonEXE.TargetControlID = "btnExecutiveSave";
        }
        catch (Exception ex)
        {

            string strconfirm = "<script LANGUAGE='JavaScript' >alert('This TECHNICIAN status is InActive by its SERVICE...unable to Edit')</script>";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", strconfirm, false);
            btnExecutiveClear_Click(sender, e);

        }
    }
    #endregion

    #region Service Master
    protected void btnCreateNewService_Click(object sender, EventArgs e)
    {
        panelService.Visible = true;
        ddlServiceStatus.SelectedIndex = 0;

    }
    protected void btnServiceSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_flat_services";
        if (lblServiceId.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblServiceId.Text != "" && txtService.Text.Trim() != "" && ddlServiceStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation

            if (ddlServiceStatus.SelectedValue == "0")
            {
                if (lblServiceResult.Text == null || lblServiceResult.Text == "")
                {
                    if (ddlServiceStatus.SelectedValue != lblService_Status_Comp.Text && ddlServiceStatus.SelectedValue == "0")
                    {
                        lblServiceResult.ForeColor = Color.Red;
                        lblServiceResult.Text = "If you Inactivate this <b>" + txtService.Text.ToUpper() + "</b> SERVICE...,All TECHNICIANS which are of this SERVICE will inactivated... if You want to proceed, press SAVE.";
                        return;
                    }
                }

            }
        }
        cmdTypeSave.Parameters.AddWithValue("@service_id", lblServiceId.Text.Trim() == "" ? "" : lblServiceId.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@service_name", txtService.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@status", ddlServiceStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@serv_desc", txtServiceDescription.Text.Trim() == "" ? "" : txtServiceDescription.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        ConfirmbtnServiceSave.TargetControlID = "btndummySVC";

        int k = hcls.master_save(cmdTypeSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(panelService.Controls);
            lblServiceResult.ForeColor = Color.Green;
            lblServiceResult.Text = "Service saved..";
            ddlServiceStatus.SelectedIndex = 0;
            get_Service_details();
            load_Service_list();
            get_Executives_details();
            lblServiceId.Text = "";
        }
        else if (k == 3)
        {
            lblServiceResult.ForeColor = Color.Red;
            lblServiceResult.Text = "<b>" + txtService.Text.ToUpper() + "</b> is Duplicate Type entry..";
        }
        else
        {
            lblServiceResult.ForeColor = Color.Red;
            lblServiceResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    private void get_Service_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        //cmdTypeGet.CommandText = "select * from tbl_type_master";
        cmdTypeGet.CommandText = "sp_flat_services";

        cmdTypeGet.Parameters.AddWithValue("@op_type", 3);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@service_id", "");
        cmdTypeGet.Parameters.AddWithValue("@service_name", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@serv_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_gridview(cmdTypeGet, Grid_Service);
        cmdTypeGet.Dispose();
    }
    protected void btnServiceClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelService.Controls);
        ddlServiceStatus.SelectedIndex = 0;
    }
    protected void btnServiceCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelService.Controls);
        panelService.Visible = false;
    }

    protected void Grid_Service_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Service.PageIndex = e.NewPageIndex;
        get_Service_details();

    }
    protected void Grid_Service_DataBound(object sender, EventArgs e)
    {
        if (Grid_Service.Rows.Count > 0)
        {
            foreach (GridViewRow gr in Grid_Service.Rows)
            {
                if ((gr.FindControl("lblServiceStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgServiceStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgServiceStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }

    protected void imgbtnServiceEdit_Click(object sender, EventArgs e)  // to edit
    {

        panelService.Visible = true;
        lblServiceResult.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

        lblServiceId.Text = Grid_Service.DataKeys[gr.RowIndex].Value.ToString();
        txtService.Text = (gr.FindControl("lblServiceName") as Label).Text;  //type name
        ddlServiceStatus.SelectedValue = (gr.FindControl("lblServiceStatus") as Label).Text;  //type id
        lblService_Status_Comp.Text = (gr.FindControl("lblServiceStatus") as Label).Text;  //type id
        txtServiceDescription.Text = (gr.FindControl("lblServiceDescription") as Label).Text;  //comments

        ConfirmbtnServiceSave.TargetControlID = "btnServiceSave";
    }
    #endregion
}