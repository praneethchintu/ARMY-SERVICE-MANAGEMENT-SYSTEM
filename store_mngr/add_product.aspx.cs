using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using AjaxControlToolkit;
using System.Web.UI.HtmlControls;

public partial class store_mngr_purchase_order : System.Web.UI.Page
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
            //CalendarExtender1.StartDate = DateTime.Today;
            //CalendarExtender2.StartDate = DateTime.Today;
            //CalendarExtender3.StartDate = DateTime.Today;

            load_vendors();
            load_Product_Types();
            load_products();
            LOAD_STATES();
            load_site();
            panel_add_product.Visible = false;
            load_po_numbers();
        }
    }

    private void LOAD_STATES()
    { 
        SqlCommand  cmdState=new SqlCommand();
        cmdState.CommandType=CommandType.StoredProcedure;
        cmdState.CommandText="sp_product_state_selections";
        cmdState.Parameters.AddWithValue("@op_type", 1);
        cmdState.Parameters.AddWithValue("@state_id", "");
        hcls.Load_DropDown(cmdState, ddlState);
        hcls.Load_DropDown(cmdState, ddlNewState);
        cmdState.Dispose();
    }

    private void load_site()
    {
        SqlCommand cmdSite = new SqlCommand();
        cmdSite.CommandType = CommandType.StoredProcedure;
        cmdSite.CommandText = "sp_product_site_selections";
        cmdSite.Parameters.AddWithValue("@op_type", 1);
        cmdSite.Parameters.AddWithValue("@site_id", "");
        hcls.Load_DropDown(cmdSite, ddlSite);
        hcls.Load_DropDown(cmdSite, ddlNewSite);
        cmdSite.Dispose();
    }

    private void load_po_numbers()
    {
        SqlCommand cmdPO = new SqlCommand();
        cmdPO.CommandType = CommandType.StoredProcedure;
        cmdPO.CommandText = "sp_purchase_order_selections";
        cmdPO.Parameters.AddWithValue("@op_type", 2);
        cmdPO.Parameters.AddWithValue("@po_no", 0);
        hcls.Load_DropDown(cmdPO, ddlPOs);
        cmdPO.Dispose();

    }

    private void load_Product_Types()
    {
        SqlCommand cmdProdList = new SqlCommand();
        cmdProdList.CommandType = CommandType.StoredProcedure;
        cmdProdList.CommandText = "sp_product_type_master_operations";
        cmdProdList.Parameters.AddWithValue("@op_type", 7);
        cmdProdList.Parameters.AddWithValue("@p_type_id", "");
        cmdProdList.Parameters.AddWithValue("@p_type_name", "");
        cmdProdList.Parameters.AddWithValue("@status", "");
        cmdProdList.Parameters.AddWithValue("@type_id", "");
        cmdProdList.Parameters.AddWithValue("@cat_id", "");
        cmdProdList.Parameters.AddWithValue("@sms_code", "");
        cmdProdList.Parameters.AddWithValue("@comments", "");
        cmdProdList.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_DropDown(cmdProdList, ddlProdType);        
        cmdProdList.Dispose();
    }
    private void load_vendors()
    {
        SqlCommand cmdVendors = new SqlCommand();
        cmdVendors.CommandType = CommandType.StoredProcedure;
        cmdVendors.CommandText = "sp_vendor_master_selections";
        cmdVendors.Parameters.AddWithValue("@op_type", 2);
        cmdVendors.Parameters.AddWithValue("@vendor_id", 0);

        hcls.Load_DropDown(cmdVendors, ddlVendor);
        cmdVendors.Dispose();
    }

    private void load_menu()
    {
        SqlCommand cmdLoadMenu = new SqlCommand();
        cmdLoadMenu.CommandType = CommandType.StoredProcedure;
        cmdLoadMenu.CommandText = "";
        cmdLoadMenu.Parameters.AddWithValue("", "");
        cmdLoadMenu.Parameters.AddWithValue("", "");
        cmdLoadMenu.Parameters.AddWithValue("", "");
        cmdLoadMenu.Parameters.AddWithValue("", "");
        cmdLoadMenu.Parameters.AddWithValue("", "");
        cmdLoadMenu.Parameters.AddWithValue("", "");
        cmdLoadMenu.Parameters.AddWithValue("", "");
        cmdLoadMenu.Parameters.AddWithValue("", "");

        //if (dsServices.Tables.Count > 0)
        //{
        //    Accordion1.Panes.Clear();
        //    for (int i = 0; i < dsServices.Tables[0].Rows.Count; i++)
        //    {
        //        AccordionPane pane1 = new AccordionPane();
        //        pane1.ID = "pane" + dsServices.Tables[0].Rows[i]["cat_id"].ToString();
        //        Label lblHeaderName = new Label();
        //        lblHeaderName.Text = dsServices.Tables[0].Rows[i]["cat_name"].ToString();

        //        pane1.HeaderContainer.Controls.Add(lblHeaderName);

        //        for (int j = 0; j < dsServices.Tables[1].Rows.Count; j++)
        //        {
        //            HtmlGenericControl myDiv = new HtmlGenericControl("div");
        //        }
        //    }
        //}
    }

    private void load_products()
    {
        SqlCommand cmdprod = new SqlCommand();
        cmdprod.CommandType = CommandType.StoredProcedure;
        cmdprod.CommandText = "sp_product_list_selection";
        cmdprod.Parameters.AddWithValue("@op_type",1);
        cmdprod.Parameters.AddWithValue("@prod_id", "");
        hcls.Load_gridview(cmdprod, grid_prod_list);
        cmdprod.Dispose();
    }

    protected void btnProductSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdPO = new SqlCommand();
        cmdPO.CommandType = CommandType.StoredProcedure;
        cmdPO.CommandText = "sp_product_list_operations";
        cmdPO.Parameters.AddWithValue("@op_type", 1);
        cmdPO.Parameters.AddWithValue("@prod_id", 0);
        cmdPO.Parameters.AddWithValue("@prod_name", txtProdName.Text);
        cmdPO.Parameters.AddWithValue("@prod_type_id",ddlProdType.SelectedValue);
        cmdPO.Parameters.AddWithValue("@model",txtModel.Text);
        cmdPO.Parameters.AddWithValue("@manifacture",txtManufacturer.Text);
        cmdPO.Parameters.AddWithValue("@serial_no",txtSerialNo.Text);
        cmdPO.Parameters.AddWithValue("@part_no",txtPartNo.Text);
        cmdPO.Parameters.AddWithValue("@description",txtDescription.Text);
        cmdPO.Parameters.AddWithValue("@state",ddlState.SelectedValue);
        cmdPO.Parameters.AddWithValue("@vendor",ddlVendor.SelectedValue);
        cmdPO.Parameters.AddWithValue("@agent",txtAgent.Text);
        cmdPO.Parameters.AddWithValue("@po_no", ddlPOs.SelectedValue);
        cmdPO.Parameters.AddWithValue("@vocher_no",txtVocherNo.Text);
        cmdPO.Parameters.AddWithValue("@invoice_no", txtInvoiceNo.Text);      
        cmdPO.Parameters.AddWithValue("@purchase_cost",txtPurchaseCost.Text);
        cmdPO.Parameters.AddWithValue("@current_asset_value",txtCurrentAssetvalue.Text);
        cmdPO.Parameters.AddWithValue("@acquisition_date", Convert.ToDateTime(txtAcquisitionDate.Text).ToString("yyyy-MM-dd"));
        cmdPO.Parameters.AddWithValue("@warranty_exp_date", Convert.ToDateTime(txtWarrantyDaye.Text).ToString("yyyy-MM-dd"));
        cmdPO.Parameters.AddWithValue("@exp_date", Convert.ToDateTime(txtExperyDate.Text).ToString("yyyy-MM-dd"));
        cmdPO.Parameters.AddWithValue("@business_impact",ddlBusinessImpact.SelectedValue);
        cmdPO.Parameters.AddWithValue("@site",ddlSite.SelectedValue);
        cmdPO.Parameters.AddWithValue("@location",txtLoaction.Text);
        cmdPO.Parameters.AddWithValue("@cr_id",HttpContext.Current.User.Identity.Name);
        cmdPO.Parameters.AddWithValue("@ticket_id", 0);
        cmdPO.Parameters.AddWithValue("@comments", "");

        int k=hcls.ExecuteNonQuery(cmdPO);
        if (k > 0)
        {
            lblResult.ForeColor = Color.Green;
            lblResult.Text = "Product Saved...";
            load_products();
            helper_class.ClearTotalFields(panel_add_product.Controls);
            

        }
        else
        {
            lblResult.ForeColor = Color.Red;
            lblResult.Text = "Process failed...";
        }
        cmdPO.Dispose();
    }
   
    protected void btnAddNewProduct_Click(object sender, EventArgs e)
    {
        panel_add_product.Visible = true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panel_add_product.Visible = false;
    }
    protected void paging(object sender, GridViewPageEventArgs e)
    {
        grid_prod_list.PageIndex = e.NewPageIndex;
        load_products();
    }

    protected void btnEditSite_Click(object sender, EventArgs e)
    {
        popupAsset.Show();

        GridViewRow gr=(GridViewRow)((Button)sender).Parent.Parent;

        lblAssetNo.Text = grid_prod_list.DataKeys[gr.RowIndex]["prod_id"].ToString();
        lblAssetName.Text = ((Label)gr.FindControl("lblProdName")).Text;
        lblModel.Text = ((Label)gr.FindControl("lblModel")).Text;
        lblManufacturer.Text = ((Label)gr.FindControl("lblManufacturer")).Text;
        lblSerialNo.Text = ((Label)gr.FindControl("lblSerialNo")).Text;

        ddlNewSite.SelectedValue = grid_prod_list.DataKeys[gr.RowIndex]["site"].ToString();
        ddlNewState.SelectedValue = grid_prod_list.DataKeys[gr.RowIndex]["state"].ToString();
        txtNewLocation.Text = ((Label)gr.FindControl("lblLocation")).Text;
    }
    protected void btnAssetCancel_Click(object sender, EventArgs e)
    {
        popupAsset.Hide();
        helper_class.ClearTotalFields(panelAssetTransfer.Controls);
    }
    protected void btnAssetSubmit_Click(object sender, EventArgs e)
    {
        popupAsset.Show();

        if (txtTicketID.Text.Trim() != "")
        {
            SqlCommand cmdTicketCheck = new SqlCommand();
            cmdTicketCheck.CommandType = CommandType.StoredProcedure;
            cmdTicketCheck.CommandText = "sp_incident_master_selections";
            cmdTicketCheck.Parameters.AddWithValue("@op_type", 7);
            cmdTicketCheck.Parameters.AddWithValue("@incident_id", txtTicketID.Text);
            cmdTicketCheck.Parameters.AddWithValue("@emp_id", "");
            
            object obj=hcls.ExecuteScalar(cmdTicketCheck);

            if (!DBNull.Value.Equals(obj)&& Convert.ToInt32(obj)==0)
            {
                lblTransferResult.ForeColor = Color.Red;
                lblTransferResult.Text="No Incident On this Ticket ID ( "+txtTicketID.Text+" )..";
                return;
            }
            cmdTicketCheck.Dispose();
        }

        SqlCommand cmdSiteTrans = new SqlCommand();

        cmdSiteTrans.CommandType = CommandType.StoredProcedure;
        cmdSiteTrans.CommandText = "sp_product_list_operations";
        cmdSiteTrans.Parameters.AddWithValue("@op_type", 2);
        cmdSiteTrans.Parameters.AddWithValue("@prod_id", lblAssetNo.Text);
        cmdSiteTrans.Parameters.AddWithValue("@prod_name", "");
        cmdSiteTrans.Parameters.AddWithValue("@prod_type_id", "");
        cmdSiteTrans.Parameters.AddWithValue("@model", "");
        cmdSiteTrans.Parameters.AddWithValue("@manifacture", "");
        cmdSiteTrans.Parameters.AddWithValue("@serial_no", "");
        cmdSiteTrans.Parameters.AddWithValue("@part_no", "");
        cmdSiteTrans.Parameters.AddWithValue("@description", "");
        cmdSiteTrans.Parameters.AddWithValue("@state", ddlNewState.SelectedValue);
        cmdSiteTrans.Parameters.AddWithValue("@vendor", "");
        cmdSiteTrans.Parameters.AddWithValue("@agent", "");
        cmdSiteTrans.Parameters.AddWithValue("@po_no", "");
        cmdSiteTrans.Parameters.AddWithValue("@vocher_no", "");
        cmdSiteTrans.Parameters.AddWithValue("@invoice_no", "");
        cmdSiteTrans.Parameters.AddWithValue("@purchase_cost", 0.00);
        cmdSiteTrans.Parameters.AddWithValue("@current_asset_value", 0.00);
        cmdSiteTrans.Parameters.AddWithValue("@acquisition_date", Convert.ToDateTime(System.DateTime.Now.ToString()).ToString("yyyy-MM-dd"));
        cmdSiteTrans.Parameters.AddWithValue("@warranty_exp_date", Convert.ToDateTime(System.DateTime.Now.ToString()).ToString("yyyy-MM-dd"));
        cmdSiteTrans.Parameters.AddWithValue("@exp_date", "");
        cmdSiteTrans.Parameters.AddWithValue("@business_impact", "");
        cmdSiteTrans.Parameters.AddWithValue("@site", ddlNewSite.SelectedValue);
        cmdSiteTrans.Parameters.AddWithValue("@location", txtNewLocation.Text);
        cmdSiteTrans.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
        cmdSiteTrans.Parameters.AddWithValue("@ticket_id", txtTicketID.Text.Trim() == "" ? "+0+" : txtTicketID.Text.Trim());
        cmdSiteTrans.Parameters.AddWithValue("@comments", txtComments.Text);

        int k = hcls.ExecuteNonQuery(cmdSiteTrans);
        if (k > 0)
        {
            lblTransferResult.ForeColor = Color.Green;
            lblTransferResult.Text = "Product Transfered...";
            load_products();
        }
        else
        {
            lblTransferResult.ForeColor = Color.Red;
            lblTransferResult.Text = "Process failed...";
        }
        cmdSiteTrans.Dispose();
    }

    protected void btnNewProduct_Click(object sender, EventArgs e)
    {
        panel_add_product.Visible = true;
    }
    protected void btnProductClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panel_add_product.Controls);
    }
}