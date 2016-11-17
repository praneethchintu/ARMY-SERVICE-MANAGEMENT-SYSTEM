using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class store_mngr_po : System.Web.UI.Page
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
    public static DataTable temp_assets_table;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblResult2.Text = "";
        if (!IsPostBack)
        {
            load_pos();
            load_vendors();
            load_Product_Types();
            Session.Remove("temp_assets_table");
            Load_grid();

            initialize_all_values();
            load_departments();
            panel_purchase_order.Visible = false;

            
        }
    }

    private void load_pos()
    {
        SqlCommand cmdPOList = new SqlCommand();
        cmdPOList.CommandType = CommandType.StoredProcedure;
        cmdPOList.CommandText = "sp_purchase_order_selections";
        cmdPOList.Parameters.AddWithValue("@op_type",1);
        cmdPOList.Parameters.AddWithValue("@po_no",0);

        hcls.Load_gridview(cmdPOList, grid_po_list);
        cmdPOList.Dispose();       
    }

    #region Product and Money Calculations

    private void initialize_all_values()
    {
        txtShippingCost.Text = "0.00";
        txtSalesTaxRate.Text = "0.00";
        txtSalesTaxCost.Text = "0.00";
        txtAdditionalTaxRate.Text = "0.00";
        txtAddditionalCost.Text = "0.00";
        txtTotalAmount.Text = "0.00";
    }

    private void Load_grid()                         //add empty colums to datatable for empty row in gridview
    {
        if (Session["temp_assets_table"] == null || ((DataTable)Session["temp_assets_table"]).Rows.Count == 0)
        {
            temp_assets_table = new DataTable();
            temp_assets_table.Columns.Add("product_name", typeof(String));
            temp_assets_table.Columns.Add("part_no", typeof(String));
            temp_assets_table.Columns.Add("price", typeof(Decimal));
            temp_assets_table.Columns.Add("tax_rate", typeof(Decimal));
            temp_assets_table.Columns.Add("quantity", typeof(Int32));
            temp_assets_table.Columns.Add("amount", typeof(Decimal));

            if (temp_assets_table.Rows.Count == 0)
            {
                DataRow dr = temp_assets_table.NewRow();
                Decimal zero = 0;
                dr["product_name"] = "";
                dr["part_no"] = "";
                dr["price"] = zero.ToString("0.00");
                dr["tax_rate"] = zero.ToString("0.00");
                dr["quantity"] = 0;  
                dr["amount"] = zero.ToString("0.00");

                temp_assets_table.Rows.Add(dr);
                Session["temp_assets_table"] = temp_assets_table;
                grid_products.DataSource = temp_assets_table;
                grid_products.DataBind();
            }
        }
        else
        {
            //copying Session Data into Datatable
            temp_assets_table = ((DataTable)Session["temp_assets_table"]).Copy();
            grid_products.DataSource = temp_assets_table;                          //Add Datatable to GridView
            grid_products.DataBind();
        }

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
        cmdProdList.Parameters.AddWithValue("@sms_code","");
        cmdProdList.Parameters.AddWithValue("@comments", "");
        cmdProdList.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_DropDown(cmdProdList, ddlProductType);
        cmdProdList.Dispose();
    }
   
    protected void ddlProductType_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmdProducts = new SqlCommand();
        cmdProducts.CommandType = CommandType.StoredProcedure;
        cmdProducts.CommandText = "sp_product_list_names";
        cmdProducts.Parameters.AddWithValue("@product_type",ddlProductType.SelectedValue);
        DataTable dtProducts = hcls.ExecuteQueryDT(cmdProducts);
        if (dtProducts.Rows.Count > 0)
        {
            popUpProdSelection.Show();

            grid_products_selection.DataSource = dtProducts;
            grid_products_selection.DataBind();
        }
        else
        {
            popUpProdSelection.Hide();

            grid_products_selection.DataSource = null;
            grid_products_selection.DataBind();
        }
        cmdProducts.Dispose();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in grid_products_selection.Rows)
        {
            ((CheckBox)gr.FindControl("chkProd")).Checked = false;
        }
        popUpProdSelection.Hide();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in grid_products_selection.Rows)
        {            
            if (((CheckBox)gr.FindControl("chkProd")).Checked == true)
            {
             DataRow dr = temp_assets_table.NewRow();

            dr["product_name"] = ((Label)gr.FindControl("lblProdName")).Text;
            dr["part_no"] = ((Label)gr.FindControl("lblPartNo")).Text;
            dr["price"] = Convert.ToDouble(((Label)gr.FindControl("lblCost")).Text).ToString("0.00");
                dr["tax_rate"] = (0).ToString("0.00");
                dr["quantity"] = 1;
                dr["amount"] = Convert.ToDouble(((Label)gr.FindControl("lblCost")).Text).ToString("0.00");
                

                if (temp_assets_table.Rows[0][1].ToString() == "")     //Deleting a record in DataTable (GridView)
                    temp_assets_table.Rows.RemoveAt(0);

                temp_assets_table.Rows.InsertAt(dr, temp_assets_table.Rows.Count);        //Insert a Record into DataTable
            }
            if (Session["temp_assets_table"] != null)
            {
                Session.Remove("temp_assets_table");
            }
            Session["temp_assets_table"] = temp_assets_table;

            grid_products.DataSource = Session["temp_assets_table"];
            grid_products.DataBind();  
            }
       bill_details_changed(null, null);  
        calculate_total_amount();   // cal for calculate the changed

        }

    protected void grid_products_DataBound(object sender, EventArgs e)
    {
        Decimal SubTotal = 0;
        foreach (GridViewRow gr in grid_products.Rows)
        {
            if (((Label)gr.FindControl("lblAmount")).Text != "" && ((Label)gr.FindControl("lblAmount")).Text != null)
            {
                SubTotal += Convert.ToDecimal(((Label)gr.FindControl("lblAmount")).Text);
            }
        }

        txtSubTotal.Text = SubTotal.ToString();
    }

    protected void product_details_changed(object sender, EventArgs e)
    {
        GridViewRow gr = (GridViewRow)((TextBox)sender).Parent.Parent;

        if (((TextBox)gr.FindControl("txtPrice")).Text == "" || Convert.ToDecimal(((TextBox)gr.FindControl("txtPrice")).Text) == 0)
        {
            ((TextBox)gr.FindControl("txtPrice")).BorderColor = Color.Red;
            return;
        }
        else
        {
            ((TextBox)gr.FindControl("txtPrice")).BorderColor = Color.Gray;
        }

        if (((TextBox)gr.FindControl("txtQuantity")).Text == "" || Convert.ToInt32(((TextBox)gr.FindControl("txtQuantity")).Text) == 0)
        {
            ((TextBox)gr.FindControl("txtQuantity")).BorderColor = Color.Red;
            return;
        }
        else
        {
            ((TextBox)gr.FindControl("txtQuantity")).BorderColor = Color.Gray;
        }

        Decimal unit_cost = Convert.ToDecimal(((TextBox)gr.FindControl("txtPrice")).Text);
        Decimal tax = 0;
        if (((TextBox)gr.FindControl("txtTaxRate")).Text != "" || Convert.ToDecimal(((TextBox)gr.FindControl("txtTaxRate")).Text) != 0)
        {            
            tax = (unit_cost / 100) * Convert.ToDecimal(((TextBox)gr.FindControl("txtTaxRate")).Text);            
        }

        ((Label)gr.FindControl("lblAmount")).Text = ((unit_cost + tax) * Convert.ToInt32(((TextBox)gr.FindControl("txtQuantity")).Text)).ToString("0.00");
        grid_products_DataBound(null, null);  // call to bind sub total
        calculate_total_amount();   // cal for calculate the changed
    }

    protected void bill_details_changed(object sender, EventArgs e)
    {
        if (sender != null)
        {
            TextBox txt1 = (TextBox)sender;
            String client_id = txt1.ClientID;
            String control_id = client_id.Substring(client_id.LastIndexOf('_') + 1);

            if (control_id.ToString() == "txtSalesTaxRate") // if Sales Tax Rate is Changed
            {
                if (txtSalesTaxRate.Text != "")
                { txtSalesTaxCost.Text = ((Convert.ToDecimal(txtSubTotal.Text) / 100) * Convert.ToDecimal(txtSalesTaxRate.Text)).ToString("0.00"); }
                else
                { txtSalesTaxCost.Text = "0.00"; }
            }
            else if (control_id.ToString() == "txtSalesTaxCost") // if Sales Tax Cost is Changed
            {
                if (txtSalesTaxCost.Text != "")
                { txtSalesTaxRate.Text = ((Convert.ToDecimal(txtSalesTaxRate.Text) * 100) / Convert.ToDecimal(txtSubTotal.Text)).ToString("0.00"); }
                else
                { txtSalesTaxRate.Text = "0.00"; }
            }

            else if (control_id.ToString() == "txtAdditionalTaxRate") // if Additional Tax Rate is Changed
            {
                if (txtAdditionalTaxRate.Text != "")
                { txtAddditionalCost.Text = ((Convert.ToDecimal(txtSubTotal.Text) / 100) * Convert.ToDecimal(txtAdditionalTaxRate.Text)).ToString("0.00");
                lblResult.ForeColor = Color.Red;
                lblResult.Text = "";
               // lblResult.Text = "Please specify the Details about Additional Tax";
                }
                else
                { txtAddditionalCost.Text = "0.00"; }
            }
            else if (control_id.ToString() == "txtAddditionalCost") // if Additional Tax Cost is Changed
            {
                if (txtAddditionalCost.Text != "")
                { txtAdditionalTaxRate.Text = ((Convert.ToDecimal(txtAddditionalCost.Text) * 100) / Convert.ToDecimal(txtSubTotal.Text)).ToString("0.00");
                lblResult.ForeColor = Color.Red;
                lblResult.Text = "";
               // lblResult.Text = "Please specify the Details about Additional Tax";
                }
                else
                { txtAdditionalTaxRate.Text = "0.00"; }
            }
            else
            {
               
            }
        }
        else
        {
            if (txtSalesTaxRate.Text != "")
            { txtSalesTaxCost.Text = ((Convert.ToDecimal(txtSubTotal.Text) / 100) * Convert.ToDecimal(txtSalesTaxRate.Text)).ToString("0.00"); }
            else
            { txtSalesTaxCost.Text = "0.00"; }
            if (txtAdditionalTaxRate.Text != "")
            { txtAddditionalCost.Text = ((Convert.ToDecimal(txtSubTotal.Text) / 100) * Convert.ToDecimal(txtAdditionalTaxRate.Text)).ToString("0.00"); }
            else
            { txtAddditionalCost.Text = "0.00"; }
        }
        if (txtSubTotal.Text == "" || Convert.ToDecimal(txtSubTotal.Text) == 0)
        {
            initialize_all_values();
        }
        calculate_total_amount();   // cal for calculate the changed

    }

    private void calculate_total_amount()
    {
        Decimal shipping_cost = 0;
        Decimal sales_tax_cost = 0;
        Decimal additional_tax_cost = 0;
        if (txtShippingCost.Text != "" && Convert.ToDecimal(txtShippingCost.Text) != 0)
        {
            shipping_cost = Convert.ToDecimal(txtShippingCost.Text);
        }
        if (txtSalesTaxCost.Text != "" && Convert.ToDecimal(txtSalesTaxCost.Text) != 0)
        {
            sales_tax_cost = Convert.ToDecimal(txtSalesTaxCost.Text);
        }
        if (txtAddditionalCost.Text != "" && Convert.ToDecimal(txtAddditionalCost.Text) != 0)
        {
            additional_tax_cost = Convert.ToDecimal(txtAddditionalCost.Text);
        }
        txtTotalAmount.Text = (Convert.ToDecimal(txtSubTotal.Text) + shipping_cost + sales_tax_cost + additional_tax_cost).ToString("0.00");
    }

    #endregion

    private void load_vendors()
    {
        SqlCommand cmd_ven = new SqlCommand();
        cmd_ven.CommandType = CommandType.StoredProcedure;
        cmd_ven.CommandText = "sp_vendor_master_selections";
        cmd_ven.Parameters.AddWithValue("@op_type", 2);
        cmd_ven.Parameters.AddWithValue("@vendor_id", 0);
        hcls.Load_DropDown(cmd_ven, ddlVendor);
        cmd_ven.Dispose();
    }

    private void load_departments()
    {
        SqlCommand cmd_dept = new SqlCommand();
        cmd_dept.CommandType = CommandType.StoredProcedure;
        cmd_dept.CommandText = "sp_dept_and_persons_selection";
        cmd_dept.Parameters.AddWithValue("@op_type",1);
        cmd_dept.Parameters.AddWithValue("@dept_id",0);
        hcls.Load_DropDown(cmd_dept, ddlDeparment);
        cmd_dept.Dispose();
    }

    protected void ddlDeparment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlPerson.Items.Clear();
        SqlCommand cmd_dept = new SqlCommand();
        cmd_dept.CommandType = CommandType.StoredProcedure;
        cmd_dept.CommandText = "sp_dept_and_persons_selection";
        cmd_dept.Parameters.AddWithValue("@op_type", 2);
        cmd_dept.Parameters.AddWithValue("@dept_id", ddlDeparment.SelectedValue);
        hcls.Load_DropDown(cmd_dept, ddlPerson);
        cmd_dept.Dispose();
    }

    protected void btnProductSave_Click(object sender, EventArgs e)
    {
        Byte[] attachmentFile = null;
        if (fileUpload1.HasFile && fileUpload1.PostedFile != null)
        {
            //To create a PostedFile
            HttpPostedFile File = fileUpload1.PostedFile;
            //Create byte Array with file len
            attachmentFile = new Byte[File.ContentLength];
            //force the control to load data in array
            File.InputStream.Read(attachmentFile, 0, File.ContentLength);

            int filesize = File.ContentLength;
            if (filesize > 1000000) // 1mb
            {
                lblResult.ForeColor = Color.Red;
                lblResult.Text = "Upload file size should not exceed 1 MB..";
                return;
            }
        }
        else
        {
            lblResult.ForeColor = Color.Red;
            lblResult.Text = "Upload file..";
            return;
        }
         DataTable dtProducts = new DataTable();
        dtProducts.Columns.Add("sl_no", typeof(int));
        dtProducts.Columns.Add("product_name", typeof(string));
        dtProducts.Columns.Add("part_no", typeof(string));
        dtProducts.Columns.Add("price", typeof(decimal));
        dtProducts.Columns.Add("tax_rate", typeof(decimal));
        dtProducts.Columns.Add("quantity", typeof(int));
        dtProducts.Columns.Add("amount", typeof(decimal));
        int i = 0;
        foreach (GridViewRow gr in grid_products.Rows)
        {
            DataRow drD = dtProducts.NewRow();
            drD["sl_no"] = i + 1;
            drD["product_name"] = ((Label)gr.FindControl("lblProductName")).Text;
            drD["part_no"] = ((Label)gr.FindControl("lblPartNo")).Text;
            drD["price"] = ((TextBox)gr.FindControl("txtPrice")).Text;
            drD["tax_rate"] = ((TextBox)gr.FindControl("txtTaxRate")).Text;
            drD["quantity"] = ((TextBox)gr.FindControl("txtQuantity")).Text;
            drD["amount"] = ((Label)gr.FindControl("lblAmount")).Text;
            dtProducts.Rows.InsertAt(drD, dtProducts.Rows.Count);
            i++;
        }

        if (dtProducts.Rows.Count == 0)
        {
            lblResult.ForeColor = Color.Red;
            lblResult.Text = "Select Products..";
            return;
        }
        SqlCommand cmdSave = new SqlCommand();
        cmdSave.CommandType = CommandType.StoredProcedure;
        cmdSave.CommandText = "sp_purchase_order_operations";
        cmdSave.Parameters.AddWithValue("@op_type",1);
        cmdSave.Parameters.AddWithValue("@po_no",0);
        cmdSave.Parameters.AddWithValue("@po_name",txtPOname.Text);
        cmdSave.Parameters.AddWithValue("@required_by", Convert.ToDateTime(txtRequiredBy.Text).ToString("yyyy-MM-dd"));
        cmdSave.Parameters.AddWithValue("@status",1);
        cmdSave.Parameters.AddWithValue("@vendor_id",ddlVendor.SelectedValue);
        cmdSave.Parameters.AddWithValue("@shipping_address",txtShippingAddress.Text);
        cmdSave.Parameters.AddWithValue("@sub_total",txtSubTotal.Text);
        cmdSave.Parameters.AddWithValue("@shipping_cost",txtShippingCost.Text);
        cmdSave.Parameters.AddWithValue("@sales_tax_rate",txtSalesTaxRate.Text);
        cmdSave.Parameters.AddWithValue("@sales_tax_amount",txtSalesTaxCost.Text);
        cmdSave.Parameters.AddWithValue("@additional_tax_rate", txtAdditionalTaxRate.Text);
        cmdSave.Parameters.AddWithValue("@additional_tax_amount", txtAddditionalCost.Text);
        cmdSave.Parameters.AddWithValue("@total_amount",txtTotalAmount.Text);
        cmdSave.Parameters.AddWithValue("@remarks",txtRemarks.Text);
        cmdSave.Parameters.AddWithValue("@terms",txtTerms.Text);
        cmdSave.Parameters.AddWithValue("@attachment_file", attachmentFile);
        cmdSave.Parameters.AddWithValue("@approaved_dept",ddlDeparment.SelectedValue);
        cmdSave.Parameters.AddWithValue("@approaved_person",ddlPerson.SelectedValue);
        cmdSave.Parameters.AddWithValue("@approaved_date", Convert.ToDateTime(txtApproavedDate.Text).ToString("yyyy-MM-dd"));
        cmdSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
        cmdSave.Parameters.AddWithValue("@products_table", dtProducts);

        if (hcls.ExecuteNonQuery(cmdSave) > 1)
        {
            helper_class.ClearTotalFields(panel_purchase_order.Controls);
            lblResult.ForeColor = Color.Green;
            lblResult.Text = "Purchase Order Saved....";
            Session.Remove("temp_assets_table");
            initialize_all_values();
            Load_grid();
            load_pos();
        }
        else
        {
            lblResult.ForeColor = Color.Red;
            lblResult.Text = "Saving failed...";
        }
        cmdSave.Dispose();
        dtProducts.Dispose();
    }

    protected void btnProductClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panel_purchase_order.Controls);
        initialize_all_values();
        Load_grid();
    }
    protected void btnAddNewPO_Click(object sender, EventArgs e)
    {
        panel_purchase_order.Visible = true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panel_purchase_order.Visible = false;
    }

    protected void imgbtnDelete_Click(object sender, EventArgs e)
    {
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;
        SqlCommand cmdCheck = new SqlCommand();
        cmdCheck.CommandType = CommandType.StoredProcedure;
        cmdCheck.CommandText = "sp_purchase_order_selections";
        cmdCheck.Parameters.AddWithValue("@op_type", 3);
        cmdCheck.Parameters.AddWithValue("@po_no", Convert.ToInt32(grid_po_list.DataKeys[gr.RowIndex].Value));
        DataSet dsCheck = hcls.ExecuteQueryDS(cmdCheck);
        cmdCheck.Dispose();

        if (dsCheck.Tables[0].Rows.Count > 0)
        {
            lblResult2.ForeColor = Color.Red;
            lblResult2.Text = "This PO was used in Purchase of Product --  " + dsCheck.Tables[0].Rows[0]["prod_name"].ToString() + ",  Serial No -- " + dsCheck.Tables[0].Rows[0]["serial_no"].ToString() + "";
            return;
        }

        if (dsCheck.Tables[1].Rows.Count > 0)
        {
            lblResult2.ForeColor = Color.Red;
            lblResult2.Text = "This PO was used in Contract -- " + dsCheck.Tables[1].Rows[0]["contract_name"].ToString() + ", Number -- " + dsCheck.Tables[1].Rows[0]["contract_number"].ToString() + "";
            return;
        }

        dsCheck.Dispose();


        SqlCommand cmdDelete = new SqlCommand();
        cmdDelete.CommandType = CommandType.StoredProcedure;
        cmdDelete.CommandText = "sp_purchase_order_selections";
        cmdDelete.Parameters.AddWithValue("@op_type", 4);
        cmdDelete.Parameters.AddWithValue("@po_no", Convert.ToInt32(grid_po_list.DataKeys[gr.RowIndex].Value));
        if (hcls.ExecuteNonQuery(cmdDelete) > 0)
        {

            lblResult2.ForeColor = Color.Green;
            lblResult2.Text = "Purchase Order Deleted....";
            load_pos();
        }
        else
        {

            lblResult2.ForeColor = Color.Red;
            lblResult2.Text = "Purchase Order not Deleted....";
        }
        cmdDelete.Dispose();
    }
}