using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class store_mngr_product_masters : System.Web.UI.Page
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
            panelType.Visible = false;
            get_type_details();

            panelCategory.Visible = false;
            load_type_list();
            get_Cat_details();

            panelProductType.Visible = false;
            load_Cat_list(7);
            get_p_type_details();

            //panelProduct.Visible = false;
            //load_ProdType_list();
            //get_prod_details();

            panelContractType.Visible = false;
            get_Contract_details();

            if (HttpContext.Current.User.IsInRole("1"))
            {
                tabpanelContractType.Visible = false;
            }
        }
    }

    #region Type Master

    protected void btnCreateNewType_Click(object sender, EventArgs e)
    {
        panelType.Visible = true;
        ddlTypeStatus.SelectedIndex = 0;

    }
    protected void btnTypeClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelType.Controls);

        ddlTypeStatus.SelectedIndex = 0;
    }
    protected void btnTypeCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelType.Controls);
        ddlTypeStatus.SelectedIndex = 0;

        panelType.Visible = false;
    }
    protected void btnTypeSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_type_master_operations";
        if (lblTypeId.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblTypeId.Text != "" && txtTypeName.Text.Trim() != "" && ddlTypeStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation

            if (ddlTypeStatus.SelectedValue == "0")
            {
                if (lblTypeResult.Text == null || lblTypeResult.Text == "")
                {
                    if (ddlTypeStatus.SelectedValue != lblProdType_Status_Comp.Text && ddlTypeStatus.SelectedValue == "0")
                    {
                        lblTypeResult.ForeColor = Color.Red;
                        lblTypeResult.Text = "If you Inactivate this <b>" + txtTypeName.Text.ToUpper() + "</b> TYPE...,<br>All PRODUCTS which are of this TYPE will inactivated...<br> if You want to proceed, press SAVE.";
                        return;
                    }
                }

            }
        }
        cmdTypeSave.Parameters.AddWithValue("@type_id", lblTypeId.Text.Trim() == "" ? "" : lblTypeId.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@type_name",txtTypeName.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@status",ddlTypeStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@comments", txtComments.Text.Trim() == "" ? "" : txtComments.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
         

        int k = hcls.master_save(cmdTypeSave);
        ConfirmbtnTypeSave.TargetControlID = "btndummyType";
        if (k == 1)
        {
            helper_class.ClearTotalFields(panelType.Controls);
            lblTypeResult.ForeColor = Color.Green;
            lblTypeResult.Text = "ProductType saved..";
            ddlTypeStatus.SelectedIndex = 0;
            get_type_details();  // to load data into gridview of types
            load_type_list();   // to load types into dropdown
            lblTypeId.Text = "";
            get_p_type_details();
           
        }
        else if (k == 3)
        {
            lblTypeResult.ForeColor = Color.Red;
            lblTypeResult.Text = "<b>"+txtTypeName.Text+"</b> is Duplicate Type entry..";
        }
        else
        {
            lblTypeResult.ForeColor = Color.Red;
            lblTypeResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }

    private void get_type_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_type_master_operations";

        cmdTypeGet.Parameters.AddWithValue("@op_type", 4);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@type_id", "");
        cmdTypeGet.Parameters.AddWithValue("@type_name", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@comments", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_gridview(cmdTypeGet, grid_type);
        cmdTypeGet.Dispose();
    }

    protected void grid_type_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_type.PageIndex = e.NewPageIndex;
        get_type_details();
    }

    protected void grid_type_DataBound(object sender, EventArgs e)
    {        
        foreach (GridViewRow gr in grid_type.Rows)
        {           
                if ((gr.FindControl("lblStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgTypeStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgTypeStatus")).ImageUrl = "~/img/red.gif";
                }
           
        }
    }

    protected void imgbtnTypeEdit_Click(object sender, EventArgs e)  // to edit
    { 
        panelType.Visible = true;
        lblTypeResult.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

        lblTypeId.Text = grid_type.DataKeys[gr.RowIndex].Value.ToString();
        txtTypeName.Text = (gr.FindControl("lblTypeName") as Label).Text;  //type name
        ddlTypeStatus.SelectedValue = (gr.FindControl("lblStatus") as Label).Text; //status
        lblProdType_Status_Comp.Text = (gr.FindControl("lblStatus") as Label).Text;  //type id
        txtComments.Text = (gr.FindControl("lblTypeComments") as Label).Text;  //comments

        ConfirmbtnTypeSave.TargetControlID = "btnTypeSave";

    }

    #endregion

    #region Category Master

    private void load_type_list()
    {
        ddlTypeListProdType.SelectedValue = null;
        ddlTypeListProdType.Items.Clear();

        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_type_master_operations";

        cmdTypeGet.Parameters.AddWithValue("@op_type", 6);  // 6 for select dropdowns values
        cmdTypeGet.Parameters.AddWithValue("@type_id", "");
        cmdTypeGet.Parameters.AddWithValue("@type_name", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@comments", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
       
        hcls.Load_DropDown(cmdTypeGet, ddlTypeListProdType);  // Type List in Product Type master
        cmdTypeGet.Dispose();
    }  
    protected void btnAddNewCategory_Click(object sender, EventArgs e)
    {
        panelCategory.Visible = true;
        ddlCatStatus.SelectedIndex = 0;
    }
    protected void btnCatClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelCategory.Controls);
        ddlCatStatus.SelectedIndex = 0;
    }
    protected void btnCatCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelCategory.Controls);
        ddlCatStatus.SelectedIndex = 0;
        panelCategory.Visible = false;
    }
    protected void btnCatSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdCatSave = new SqlCommand();
        cmdCatSave.Parameters.Clear();
        cmdCatSave.CommandType = CommandType.StoredProcedure;
        cmdCatSave.CommandText = "sp_category_master_operations";
        if (lblCatId.Text == "")
        {
            cmdCatSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblCatId.Text != "" && txtCatName.Text.Trim() != "" && ddlCatStatus.SelectedValue != "-1")
        {
            cmdCatSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation

            if (ddlCatStatus.SelectedValue == "0")
            {
                if (lblCatResult.Text == null || lblCatResult.Text == "")
                {
                    if (ddlCatStatus.SelectedValue != lblProdCategory_Status_comp.Text && ddlCatStatus.SelectedValue == "0")
                    {

                        lblCatResult.ForeColor = Color.Red;
                        lblCatResult.Text = "If you Inactivate this <b>" + txtCatName.Text.ToUpper() + "</b> CATEGORY...,<br>All PRODUCTS which are of this CATEGORY will inactivated...<br> if You want to proceed, press SAVE.";
                        return;
                    }
                }

            }
        }
        cmdCatSave.Parameters.AddWithValue("@cat_id", lblCatId.Text.Trim() == "" ? "" : lblCatId.Text.Trim());
        cmdCatSave.Parameters.AddWithValue("@cat_name", txtCatName.Text.Trim());
        cmdCatSave.Parameters.AddWithValue("@status", ddlCatStatus.SelectedValue);      
        cmdCatSave.Parameters.AddWithValue("@comments", txtCatComments.Text.Trim() == "" ? "" : txtCatComments.Text.Trim());
        cmdCatSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
        int k = hcls.master_save(cmdCatSave);
        ConfirmbtnCatSave.TargetControlID = "btndummyCat";
        if (k == 1)
        {
            helper_class.ClearTotalFields(panelCategory.Controls);
            lblCatResult.ForeColor = Color.Green;
            lblCatResult.Text = " Category saved..";
            ddlCatStatus.SelectedIndex = 0;
            get_Cat_details();  // to load saved data into grid view
            load_Cat_list(7);   // load categories into dropdown in  productType
            lblCatId.Text = "";

            get_p_type_details(); //from product type grid
            load_Cat_list(7);//from product type CATEGORY_dropdownlist
          
        }
        else if (k == 3)
        {
            lblCatResult.ForeColor = Color.Red;
            lblCatResult.Text = "<b>" + txtCatName.Text+ "</b> is Duplicate Category entry..";
        }
        else
        {
            lblCatResult.ForeColor = Color.Red;
            lblCatResult.Text = "not saved.. try again..";
        }
        cmdCatSave.Dispose();
    }

    private void get_Cat_details()
    {
        SqlCommand cmdCatGet = new SqlCommand();
        cmdCatGet.Parameters.Clear();
        cmdCatGet.CommandType = CommandType.StoredProcedure;
        cmdCatGet.CommandText = "sp_category_master_operations";

        cmdCatGet.Parameters.AddWithValue("@op_type", 4);  // 6 for select dropdowns values
        cmdCatGet.Parameters.AddWithValue("@cat_id", "");
        cmdCatGet.Parameters.AddWithValue("@cat_name", "");
        cmdCatGet.Parameters.AddWithValue("@status", "");       
        cmdCatGet.Parameters.AddWithValue("@comments", "");
        cmdCatGet.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
        hcls.Load_gridview(cmdCatGet, grid_category);
        cmdCatGet.Dispose();
    }

    protected void grid_category_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_category.PageIndex = e.NewPageIndex;
        get_Cat_details();
    }

    protected void grid_category_DataBound(object sender, EventArgs e)
    {
        if (grid_category.Rows.Count > 0)
        {
            foreach (GridViewRow gr in grid_category.Rows)
            {
                if ((gr.FindControl("lblCatStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgCatStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgCatStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }

    protected void imgbtnCatEdit_Click(object sender, EventArgs e)  // to edit
    {
        panelCategory.Visible = true;
        lblCatResult.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

        lblCatId.Text = grid_category.DataKeys[gr.RowIndex].Value.ToString();
        txtCatName.Text = (gr.FindControl("lblCatName") as Label).Text;  //type name        
        ddlCatStatus.SelectedValue = (gr.FindControl("lblCatStatus") as Label).Text; //status
        lblProdCategory_Status_comp.Text = (gr.FindControl("lblCatStatus") as Label).Text;  //type id
        txtCatComments.Text = (gr.FindControl("lblCatComments") as Label).Text;  //comments
        ConfirmbtnCatSave.TargetControlID = "btnCatSave";
    }

    #endregion



    #region Product Type Master

    private void load_Cat_list(int op_type)
    {
        ddlCategoryListInProdType.SelectedValue = null;
        ddlCategoryListInProdType.Items.Clear();

        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_category_master_operations";

        cmdTypeGet.Parameters.AddWithValue("@op_type", op_type);  // 7 for select active values, 8 for all values
        cmdTypeGet.Parameters.AddWithValue("@cat_id", "");
        cmdTypeGet.Parameters.AddWithValue("@cat_name", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");     
        cmdTypeGet.Parameters.AddWithValue("@comments", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
        hcls.Load_DropDown(cmdTypeGet, ddlCategoryListInProdType);
        cmdTypeGet.Dispose();
    }

    protected void btnAddNewProductType_Click(object sender, EventArgs e)
    {
        panelProductType.Visible = true;
        ddlProductTypeStatus.SelectedIndex = 0;
    }
    protected void btnProductTypeClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelProductType.Controls);
        ddlProductTypeStatus.SelectedIndex = 0;
      
    }
    protected void btnProductTypeCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelCategory.Controls);
        load_Cat_list(7);
        ddlProductTypeStatus.SelectedIndex = 0;
        panelProductType.Visible = false;
    }
    protected void btnProductTypeSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdProdTypeSave = new SqlCommand();
        cmdProdTypeSave.Parameters.Clear();
        cmdProdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdProdTypeSave.CommandText = "sp_product_type_master_operations";
        if (lblProductTypeId.Text == "")
        {
            cmdProdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblProductTypeId.Text != "" && txtProductTypeName.Text.Trim() != "" && ddlProductTypeStatus.SelectedValue != "-1")
        {
            cmdProdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation
        }
        cmdProdTypeSave.Parameters.AddWithValue("@p_type_id", lblProductTypeId.Text.Trim() == "" ? "" : lblProductTypeId.Text.Trim());
        cmdProdTypeSave.Parameters.AddWithValue("@p_type_name", txtProductTypeName.Text.Trim());
        cmdProdTypeSave.Parameters.AddWithValue("@status", ddlProductTypeStatus.SelectedValue);
        cmdProdTypeSave.Parameters.AddWithValue("@type_id", ddlTypeListProdType.SelectedValue);
        cmdProdTypeSave.Parameters.AddWithValue("@cat_id", ddlCategoryListInProdType.SelectedValue);
        cmdProdTypeSave.Parameters.AddWithValue("@sms_code", txt_smscode.Text.Trim());
        cmdProdTypeSave.Parameters.AddWithValue("@comments", txtProductTypeCommnets.Text.Trim() == "" ? "" : txtProductTypeCommnets.Text.Trim());
        cmdProdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
        int k = hcls.master_save(cmdProdTypeSave);
        ConfirmbtnProductSave.TargetControlID = "btndummyProd";
        if (k == 1)
        {
            helper_class.ClearTotalFields(panelProductType.Controls);
            lblProductTypeResult.ForeColor = Color.Green;
            lblProductTypeResult.Text = "Product Type saved..";
            
            get_p_type_details();
            lblProductTypeId.Text = "";
            ddlProductTypeStatus.SelectedIndex = 0;
        }
        else if (k == 3)
        {
            lblProductTypeResult.ForeColor = Color.Red;
            lblProductTypeResult.Text = "<b>" + txtProductTypeName.Text+ "</b> is Duplicate Product Type entry..";
        }
        else
        {
            lblProductTypeResult.ForeColor = Color.Red;
            lblProductTypeResult.Text = "not saved.. try again..";
        }
        cmdProdTypeSave.Dispose();
       
        load_Cat_list(7);
        load_type_list();
    }

    private void get_p_type_details()
    {
        SqlCommand cmdProdtypeGet = new SqlCommand();
        cmdProdtypeGet.Parameters.Clear();
        cmdProdtypeGet.CommandType = CommandType.StoredProcedure;
        cmdProdtypeGet.CommandText = "sp_product_type_master_operations";

        cmdProdtypeGet.Parameters.AddWithValue("@op_type", 4);  // 6 for select dropdowns values
        cmdProdtypeGet.Parameters.AddWithValue("@p_type_id", "");
        cmdProdtypeGet.Parameters.AddWithValue("@p_type_name", "");
        cmdProdtypeGet.Parameters.AddWithValue("@status", "");
        cmdProdtypeGet.Parameters.AddWithValue("@type_id", "");
        cmdProdtypeGet.Parameters.AddWithValue("@cat_id", "");
        cmdProdtypeGet.Parameters.AddWithValue("@sms_code", "");
        cmdProdtypeGet.Parameters.AddWithValue("@comments", "");
        cmdProdtypeGet.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
        hcls.Load_gridview(cmdProdtypeGet, grid_productType);
        cmdProdtypeGet.Dispose();
    }

    protected void grid_productType_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_productType.PageIndex = e.NewPageIndex;
        get_p_type_details();
    }

    protected void grid_productType_DataBound(object sender, EventArgs e)
    {
        if (grid_productType.Rows.Count > 0)
        {
            foreach (GridViewRow gr in grid_productType.Rows)
            {
                if ((gr.FindControl("lblProdTypeStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgProdTypeStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgProdTypeStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }

    protected void imgbtnProdTypeEdit_Click(object sender, EventArgs e)  // to edit
    {
        try
        {
            panelProductType.Visible = true;
            lblProductTypeResult.Text = "";
            GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

            lblProductTypeId.Text = grid_productType.DataKeys[gr.RowIndex].Value.ToString();
            txtProductTypeName.Text = (gr.FindControl("lblProdTypeName") as Label).Text;  //type name
            ddlTypeListProdType.SelectedValue = (gr.FindControl("lblTypeId") as Label).Text;  //type id
            ddlCategoryListInProdType.SelectedValue = (gr.FindControl("lblCatId") as Label).Text;  //category id
            ddlProductTypeStatus.SelectedValue = (gr.FindControl("lblProdTypeStatus") as Label).Text; //status
            txtProductTypeCommnets.Text = (gr.FindControl("lblProdTypeComments") as Label).Text;  //comments
            txt_smscode.Text = (gr.FindControl("lbl_sms_code") as Label).Text;

            ConfirmbtnProductSave.TargetControlID = "btnProductTypeSave";
        }
        catch(Exception ex)
        {
            string strconfirm = "<script LANGUAGE='JavaScript' >alert('This PRODUCT status is InActive by its type/category...unable to Edit')</script>";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", strconfirm, false);
            btnProductTypeClear_Click(sender, e);
        }
    }

    #endregion


    #region Contract Type Master

    protected void btnAddNewContractType_Click(object sender, EventArgs e)
    {
        panelContractType.Visible = true;
        ddlContractTypeStatus.SelectedIndex = 0;
    }
    protected void btnContractTypeClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelContractType.Controls);
        ddlContractTypeStatus.SelectedIndex = 0;

    }
    protected void btnContractTypeCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelContractType.Controls);
        panelContractType.Visible = false;
        ddlContractTypeStatus.SelectedIndex = 0;
    }
    protected void btnContractTypeSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdontractSave = new SqlCommand();
        cmdontractSave.Parameters.Clear();
        cmdontractSave.CommandType = CommandType.StoredProcedure;
        cmdontractSave.CommandText = "sp_contract_type_master_operations";
        if (lblContractTypeId.Text == "")
        {
            cmdontractSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblContractTypeId.Text != "" && txtContractTypeName.Text.Trim() != "")
        {
            cmdontractSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation
        }
        cmdontractSave.Parameters.AddWithValue("@contract_type_id", lblContractTypeId.Text == "" ? "" : lblContractTypeId.Text);
        cmdontractSave.Parameters.AddWithValue("@contract_type_name", txtContractTypeName.Text);
        cmdontractSave.Parameters.AddWithValue("@contract_type_desc", txtContractTypeDesc.Text);
        cmdontractSave.Parameters.AddWithValue("@status", ddlContractTypeStatus.SelectedValue);
        int k = hcls.master_save(cmdontractSave);
        Confirm_ContractSave.TargetControlID = "btndummyContract";
        if (k == 1)
        {
            helper_class.ClearTotalFields(panelContractType.Controls);
            lblContractTypeResult.ForeColor = Color.Green;
            lblContractTypeResult.Text = " Contract Type saved..";
            get_Contract_details();
            lblContractTypeId.Text = "";
            ddlContractTypeStatus.SelectedIndex = 0;
        }
        else if (k == 3)
        {
            lblContractTypeResult.ForeColor = Color.Red;
            lblContractTypeResult.Text = "<b>" + txtContractTypeName.Text+ "</b> is Duplicate Contract Type Name entry..";
        }
        else
        {
            lblContractTypeResult.ForeColor = Color.Red;
            lblContractTypeResult.Text = "not saved.. try again..";
        }
        cmdontractSave.Dispose();
    }

    private void get_Contract_details()
    {
        SqlCommand cmdContractTypeDet = new SqlCommand();
        cmdContractTypeDet.Parameters.Clear();
        cmdContractTypeDet.CommandType = CommandType.StoredProcedure;
        cmdContractTypeDet.CommandText = "sp_contract_type_master_operations";

        cmdContractTypeDet.Parameters.AddWithValue("@op_type", 5);  // 5 for select all
        cmdContractTypeDet.Parameters.AddWithValue("@contract_type_id", "");
        cmdContractTypeDet.Parameters.AddWithValue("@contract_type_name", "");
        cmdContractTypeDet.Parameters.AddWithValue("@contract_type_desc", "");
        cmdContractTypeDet.Parameters.AddWithValue("@status", "");
        hcls.Load_gridview(cmdContractTypeDet, grid_ContractType);
        cmdContractTypeDet.Dispose();
    }

    protected void grid_ContractType_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_ContractType.PageIndex = e.NewPageIndex;
        get_Contract_details();
    }



    protected void imgbtnContarctTypeEdit_Click(object sender, EventArgs e)  // to edit
    {
        panelContractType.Visible = true;
        lblContractTypeResult.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

        lblContractTypeId.Text = grid_ContractType.DataKeys[gr.RowIndex].Value.ToString();
        txtContractTypeName.Text = (gr.FindControl("lblContractTypeName") as Label).Text;  //Contract name
        txtContractTypeDesc.Text = (gr.FindControl("lblContractTypeDesc") as Label).Text;  //comments
        ddlContractTypeStatus.SelectedValue = (gr.FindControl("lblStatus") as Label).Text;
        Confirm_ContractSave.TargetControlID = "btnContractTypeSave";
    }

   
    protected void grid_ContractType_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in grid_ContractType.Rows)
        {
            if ((gr.FindControl("lblStatus") as Label).Text == "1")
            {
                ((System.Web.UI.WebControls.Image)gr.FindControl("imgContractType")).ImageUrl = "~/img/green.gif";
            }
            else
            {
                ((System.Web.UI.WebControls.Image)gr.FindControl("imgContractType")).ImageUrl = "~/img/red.gif";
            }

        }
    }

    #endregion
}   