using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class store_mngr_contract : System.Web.UI.Page
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
        Wizard1.PreRender += new EventHandler(Wizard1_PreRender);
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        AjaxControlToolkit.ToolkitScriptManager.GetCurrent(this.Page).RegisterPostBackControl(btnContractSave);
        if (!IsPostBack)
        {
           //panelContract.Visible = false;
             load_ContractType_list();
             load_contract_details();
             load_assets();
             load_po_numbers();
             load_departments();
             load_vendors();

             //cal1.StartDate = System.DateTime.Today;
             //cal45.StartDate = System.DateTime.Today;
             //calRenewal1.StartDate = System.DateTime.Today;
             //CalendarExtender1.StartDate = System.DateTime.Today; 
             //CalendarExtender2.StartDate = System.DateTime.Today; 
        }
        lblRenewalPossibility.Visible = false;
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

    private void load_po_numbers()
    {
        SqlCommand cmdPO = new SqlCommand();
        cmdPO.CommandType = CommandType.StoredProcedure;
        cmdPO.CommandText = "sp_purchase_order_selections";
        cmdPO.Parameters.AddWithValue("@op_type",2);
        cmdPO.Parameters.AddWithValue("@po_no",0);
        hcls.Load_DropDown(cmdPO, ddlPOno);
        cmdPO.Dispose();
    
    }

    //Wizard Events
    protected void Index_Changed(object sender, EventArgs e)
    {
        //if (Wizard1.ActiveStepIndex == 0)
        //{
        //   // Wizard1.StepNextButtonStyle.
        //    ((Button)Wizard1.FindControl("StepPreviousButton")).Visible = false;
        //}
        //if (Wizard1.ActiveStepIndex == 1)
        //{
        //    ((Button)Wizard1.FindControl("StepPreviousButton")).Visible = true;
        //}
        //if (Wizard1.ActiveStepIndex == 2)
        //{
        //    ((Button)Wizard1.FindControl("StepNextButton")).Visible = false;
        //}
    }      
    protected void Wizard1_PreRender(object sender, EventArgs e)
    {
        Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
        SideBarList.DataSource = Wizard1.WizardSteps;
        SideBarList.DataBind();

    }
    protected string GetClassForWizardStep(object wizardStep)
    {
        WizardStep step = wizardStep as WizardStep;

        if (step == null)
        {
            return "";
        }
        int stepIndex = Wizard1.WizardSteps.IndexOf(step);

        if (stepIndex < Wizard1.ActiveStepIndex)
        {
            return "prevStep";
        }
        else if (stepIndex > Wizard1.ActiveStepIndex)
        {
            return "nextStep";
        }
        else
        {
            return "currentStep";
        }
    }
    //Wizard Events


    private void load_assets()
    {
        SqlCommand cmdAsset = new SqlCommand();
        cmdAsset.CommandType = CommandType.StoredProcedure;
        cmdAsset.CommandText = "sp_product_list_selection";
        cmdAsset.Parameters.AddWithValue("@op_type", 5);
        cmdAsset.Parameters.AddWithValue("@prod_id", "");
        hcls.Load_gridview(cmdAsset, grid_assets);
        cmdAsset.Dispose();        
    }

    protected void Finish_button_click(object sender, EventArgs e)
    {
      
        //int  k = 1;
        //DataTable tableAssets = new DataTable();
        //tableAssets.Columns.Add("s_no", typeof(int));
        //tableAssets.Columns.Add("prod_id", typeof(int));
        //tableAssets.Columns.Add("tier_id", typeof(int));

        //foreach (GridViewRow gr in grid_assets.Rows)
        //{
        //    if (((CheckBox)gr.FindControl("chkAsset")).Checked == true)
        //    {
        //        DataRow dr = tableAssets.NewRow();
        //        CheckBoxList chkList = (CheckBoxList)gr.FindControl("chkTierList");

        //        for (int i = 0; i < chkList.Items.Count; i++)
        //        {
        //            if (chkList.Items[i].Selected)
        //            {
        //                dr["s_no"] = k++;
        //               dr["prod_id"]= Convert.ToInt32(((Label)gr.FindControl("lblProdId")).Text);
        //               dr["tier_id"] = Convert.ToInt32(chkList.Items[i].Value);
        //               tableAssets.Rows.Add(dr);
        //               tableAssets.AcceptChanges();
        //            }
        //        }
        //    }
        //}
    }

    protected void chkAsset_checkedChanged(object sender, EventArgs e)
    {
         GridViewRow gr = (GridViewRow)(((CheckBox)sender).Parent.Parent);
         if (((CheckBox)gr.FindControl("chkAsset")).Checked == true)
         {
             ((CheckBoxList)gr.FindControl("chkTierList")).Visible = true;
         }
         else
         {
             ((CheckBoxList)gr.FindControl("chkTierList")).Visible = false;
         }
    }

    protected void grid_assets_dataBinding(object sender, EventArgs e)
    {
        SqlCommand cmdtiers = new SqlCommand();
        cmdtiers.CommandType = CommandType.StoredProcedure;
        cmdtiers.CommandText = "sp_contract_tiers_selection";
        cmdtiers.Parameters.AddWithValue("@op_type",1);
        cmdtiers.Parameters.AddWithValue("@tier_id", "");

         DataTable dttiers= hcls.ExecuteQueryDT(cmdtiers);

         if (dttiers.Rows.Count > 0 && grid_assets.Rows.Count>0)
         {
             foreach (GridViewRow gr in ((GridView)sender).Rows)
             {
                 CheckBoxList chkList = (CheckBoxList)gr.FindControl("chkTierList");
                 chkList.DataTextField = "tier_name";
                 chkList.DataValueField = "tier_id";
                 chkList.DataSource = dttiers;
                 chkList.DataBind();
             }
         }
         cmdtiers.Dispose();
         dttiers.Dispose();
    }

    private void load_ContractType_list()
    {
        SqlCommand cmdProdTypeGet = new SqlCommand();
        cmdProdTypeGet.Parameters.Clear();
        cmdProdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdProdTypeGet.CommandText = "sp_contract_type_master_operations";

        cmdProdTypeGet.Parameters.AddWithValue("@op_type", 6);  // 
        cmdProdTypeGet.Parameters.AddWithValue("@contract_type_id", "");
        cmdProdTypeGet.Parameters.AddWithValue("@contract_type_name", "");
        cmdProdTypeGet.Parameters.AddWithValue("@contract_type_desc", "");
        cmdProdTypeGet.Parameters.AddWithValue("@status", 1);
        hcls.Load_DropDown(cmdProdTypeGet, ddlContractType);
        cmdProdTypeGet.Dispose();
    }  

    protected void btnContractSave_Click(object sender, EventArgs e)
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
        int r = 1;
        DataTable tableAssets = new DataTable();
        tableAssets.Columns.Add("s_no", typeof(int));
        tableAssets.Columns.Add("prod_id", typeof(int));
        tableAssets.Columns.Add("tier_id", typeof(int));

        foreach (GridViewRow gr in grid_assets.Rows)
        {
            if (((CheckBox)gr.FindControl("chkAsset")).Checked == true)
            {
                DataRow dr = tableAssets.NewRow();
                CheckBoxList chkList = (CheckBoxList)gr.FindControl("chkTierList");
                int z = 0;
                for (int i = 0; i < chkList.Items.Count; i++)
                {                   
                    if (chkList.Items[i].Selected)
                    {
                        z++;
                        dr["s_no"] = r++;
                        dr["prod_id"] = Convert.ToInt32(((Label)gr.FindControl("lblProdId")).Text);
                        dr["tier_id"] = Convert.ToInt32(chkList.Items[i].Value);
                        tableAssets.Rows.Add(dr);
                        tableAssets.AcceptChanges();
                    }                    
                }
                if (z == 0)
                {
                    lblResult.ForeColor = Color.Red;
                    lblResult.Text = "Please Add the Tier value to Asset -- " + ((CheckBox)gr.FindControl("chkAsset")).Text + "";
                    return;
                }
            }
        }
        SqlCommand cmdContract = new SqlCommand();
        cmdContract.Parameters.Clear();
        cmdContract.CommandType = CommandType.StoredProcedure;
        cmdContract.CommandText = "sp_contract_master_operations";
         cmdContract.Parameters.AddWithValue("@op_type",1);
         cmdContract.Parameters.AddWithValue("@contract_id", "");
        cmdContract.Parameters.AddWithValue("@contract_name", txtContractName.Text);
        cmdContract.Parameters.AddWithValue("@contract_number", txtContractNumber.Text);
        cmdContract.Parameters.AddWithValue("@contract_type", ddlContractType.SelectedValue);
        cmdContract.Parameters.AddWithValue("@parental_contract", txtParentalContact.Text);
        cmdContract.Parameters.AddWithValue("@from_date", Convert.ToDateTime(txtfromDate.Text).ToString("yyyy-MM-dd"));
        cmdContract.Parameters.AddWithValue("@to_date", Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd"));        
        cmdContract.Parameters.AddWithValue("@created_by", txtCreatedBy.Text);
        cmdContract.Parameters.AddWithValue("@support_details", txtSupportdetails.Text);
        cmdContract.Parameters.AddWithValue("@sla_details", txtSLADetails.Text);
        cmdContract.Parameters.AddWithValue("@description", txtDescription.Text);
        cmdContract.Parameters.AddWithValue("@po_no", ddlPOno.SelectedValue);       

        cmdContract.Parameters.AddWithValue("@attachment_file",attachmentFile);
        cmdContract.Parameters.AddWithValue("@cost", txtCost.Text);
        cmdContract.Parameters.AddWithValue("@payment_terms", ddlPaymentTerms.SelectedValue);
        cmdContract.Parameters.AddWithValue("@vendor_name", ddlVendor.SelectedValue);
        cmdContract.Parameters.AddWithValue("@contact_number", txtContactNo.Text);
        cmdContract.Parameters.AddWithValue("@alt_contact_number", txtAlternateNo.Text);
        cmdContract.Parameters.AddWithValue("@email_id", txtEmailId.Text);
        cmdContract.Parameters.AddWithValue("@address", txtAddress.Text);
        cmdContract.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
        cmdContract.Parameters.AddWithValue("@assets", tableAssets);
        cmdContract.Parameters.AddWithValue("@approaved_dept", ddlDepartment.SelectedValue);
        cmdContract.Parameters.AddWithValue("@approaved_by", ddlPerson.SelectedValue);
        cmdContract.Parameters.AddWithValue("@approaved_date", Convert.ToDateTime(txtApproavedDate.Text).ToString("yyyy-MM-dd"));
        cmdContract.Parameters.AddWithValue("@comments", txtComments.Text);

       int k= hcls.master_save(cmdContract);
        
        if (k == 1)
        {
            helper_class.ClearTotalFields(Wizard1.Controls);
            lblResult.ForeColor = Color.Green;
            lblResult.Text = "Contract saved..";
            Wizard1.ActiveStepIndex = 0;
            fileUpload1.Dispose();
            load_contract_details();
           
        }
        else if (k == 3)
        {
            lblResult.ForeColor = Color.Red;
            lblResult.Text = "Duplicate Contract Name entry..";
        }
        else
        {
            lblResult.ForeColor = Color.Red;
            lblResult.Text = "not saved.. try again..";
        }
        load_assets();
    }

    private void load_contract_details()
    {
        SqlCommand cmdContractDetails = new SqlCommand();
        cmdContractDetails.CommandType = CommandType.StoredProcedure;
        cmdContractDetails.CommandText = "sp_contract_master_select";
        cmdContractDetails.Parameters.AddWithValue("@op_type",2);
        cmdContractDetails.Parameters.AddWithValue("@contract_id","");

        hcls.Load_gridview(cmdContractDetails, grid_contract_list);
        cmdContractDetails.Dispose();
    }

    protected void paging(object sender, GridViewPageEventArgs e)
    {
        grid_contract_list.PageIndex = e.NewPageIndex;
        load_contract_details();
    }

    protected void btnContractCancel_Click(object sender, EventArgs e)
    {
      //  panelContract.Visible = false;
    }

    protected void imgbtnContractRenewal_Click(object sender, EventArgs e)
    {
        popUpContractRenewal.Show();
        helper_class.ClearTotalFields(panelContractDetails.Controls);
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;
        lblContractNumber.Text=  ((Label)gr.FindControl("lblContractNumber")).Text;
        if (Convert.ToInt32(grid_contract_list.DataKeys[gr.RowIndex]["status_indication"]) == 1)
        {
            lblRenewalPossibility.Visible = true;
            lblRenewalPossibility.ForeColor = Color.Red;
            lblRenewalPossibility.Text = "This Contract is in Active Period...";
            panelContractDetails.Visible = false;
            btnRenewal.Visible = false;
            return;
        }
        else
        {
            btnRenewal.Visible = true;
            panelContractDetails.Visible = true;
            SqlCommand cmdSearch = new SqlCommand();
            cmdSearch.CommandType = CommandType.StoredProcedure;
            cmdSearch.CommandText = "sp_contract_master_select";
            cmdSearch.Parameters.AddWithValue("@op_type", 5);
            cmdSearch.Parameters.AddWithValue("@contract_id", grid_contract_list.DataKeys[gr.RowIndex]["contract_id"].ToString());
            DataTable dtResult = hcls.ExecuteQueryDT(cmdSearch);
            cmdSearch.Dispose();
            if (dtResult.Rows.Count > 0)
            {
                lblContractID.Text = grid_contract_list.DataKeys[gr.RowIndex]["contract_id"].ToString();
                lblContractNumber.Text = dtResult.Rows[0]["contract_number"].ToString();
                lblContractName.Text = dtResult.Rows[0]["contract_name"].ToString();
                lblContractType.Text = dtResult.Rows[0]["contract_type"].ToString();
                lblParentalContract.Text = dtResult.Rows[0]["parental_contract"].ToString();
                lblVendorName.Text = dtResult.Rows[0]["vendor_name"].ToString();
                txtFromDateRenewal.Text = Convert.ToDateTime(dtResult.Rows[0]["from_date"]).ToString("dd-MM-yyyy");
                txtToDateRenewal.Text = Convert.ToDateTime(dtResult.Rows[0]["to_date"]).ToString("dd-MM-yyyy");
                txtCostRenewal.Text = dtResult.Rows[0]["cost"].ToString();
                ddlPaymentTermsRenewal.SelectedValue = dtResult.Rows[0]["payment_terms"].ToString();
                ddlDeparmentRenewal.SelectedValue = dtResult.Rows[0]["approaved_dept"].ToString();
                ddlPersonRenewal.Items.Clear();
                //calling to load Employees
                load_Employees(Convert.ToInt32(dtResult.Rows[0]["approaved_dept"].ToString()));

                ddlPersonRenewal.SelectedValue = dtResult.Rows[0]["approaved_by"].ToString();
                txtApproavedDateRenewal.Text = Convert.ToDateTime(dtResult.Rows[0]["approaved_date"]).ToString("dd-MM-yyyy");
                txtCommentsRenewal.Text = dtResult.Rows[0]["comments"].ToString();
            }
            else
            {
                helper_class.ClearTotalFields(panelContractDetails.Controls);
            }
            dtResult.Dispose();
        }
    }

    private void load_departments()
    {
        SqlCommand cmd_dept = new SqlCommand();
        cmd_dept.CommandType = CommandType.StoredProcedure;
        cmd_dept.CommandText = "sp_dept_and_persons_selection";
        cmd_dept.Parameters.AddWithValue("@op_type", 1);
        cmd_dept.Parameters.AddWithValue("@dept_id", 0);
        hcls.Load_DropDown(cmd_dept, ddlDeparmentRenewal);
        hcls.Load_DropDown(cmd_dept, ddlDepartment);
        cmd_dept.Dispose();
    }

    protected void ddlDeparment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlPerson.Items.Clear();
        load_Employees(Convert.ToInt32(ddlDepartment.SelectedValue));
    }
    protected void ddlDeparmentRenewal_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlPersonRenewal.Items.Clear();
        load_Employees(Convert.ToInt32(ddlDeparmentRenewal.SelectedValue));
        popUpContractRenewal.Show();
    }
    private void load_Employees(int dept_id)
    {
        //if (type == 1)
        //{
        //    popUpContractRenewal.Show();
        //}

        ddlPersonRenewal.SelectedValue = null;
        ddlPerson.SelectedValue = null;
        SqlCommand cmd_dept = new SqlCommand();
        cmd_dept.CommandType = CommandType.StoredProcedure;
        cmd_dept.CommandText = "sp_dept_and_persons_selection";
        cmd_dept.Parameters.AddWithValue("@op_type", 2);
        cmd_dept.Parameters.AddWithValue("@dept_id", dept_id);
        hcls.Load_DropDown(cmd_dept, ddlPersonRenewal);
        hcls.Load_DropDown(cmd_dept, ddlPerson);
        cmd_dept.Dispose();
    }

    protected void btnRenewal_Click(object sender, EventArgs e)
    {
        popUpContractRenewal.Show();
        Byte[] attachmentReneal = null;
        if (fileUploadRenewal.HasFile && fileUploadRenewal.PostedFile != null)
        {
            //To create a PostedFile
            HttpPostedFile File = fileUploadRenewal.PostedFile;
            //Create byte Array with file len
            attachmentReneal = new Byte[File.ContentLength];
            //force the control to load data in array
            File.InputStream.Read(attachmentReneal, 0, File.ContentLength);
            int filesize = File.ContentLength;
            if (filesize > 1000000) // 1mb
            {
                lblResultRenewal.ForeColor = Color.Red;
                lblResultRenewal.Text = "Upload file size should not exceed 1 MB..";
                return;
            }
        }
        else
        {
            lblResultRenewal.ForeColor = Color.Red;
            lblResultRenewal.Text = "Upload file..";
            return;
        }

        SqlCommand cmdContractRn = new SqlCommand();
        cmdContractRn.Parameters.Clear();
        cmdContractRn.CommandType = CommandType.StoredProcedure;
        cmdContractRn.CommandText = "sp_contract_master_operations";
        cmdContractRn.Parameters.AddWithValue("@op_type", 3);
        cmdContractRn.Parameters.AddWithValue("@contract_id", lblContractID.Text);
        cmdContractRn.Parameters.AddWithValue("@contract_name", lblContractNumber.Text);
        cmdContractRn.Parameters.AddWithValue("@contract_number", "");
        cmdContractRn.Parameters.AddWithValue("@contract_type", "");
        cmdContractRn.Parameters.AddWithValue("@parental_contract", "");
        cmdContractRn.Parameters.AddWithValue("@from_date", Convert.ToDateTime(txtFromDateRenewal.Text).ToString("yyyy-MM-dd"));
        cmdContractRn.Parameters.AddWithValue("@to_date", Convert.ToDateTime(txtToDateRenewal.Text).ToString("yyyy-MM-dd"));
        cmdContractRn.Parameters.AddWithValue("@created_by", "");
        cmdContractRn.Parameters.AddWithValue("@support_details", "");
        cmdContractRn.Parameters.AddWithValue("@sla_details", "");
        cmdContractRn.Parameters.AddWithValue("@description", "");
        cmdContractRn.Parameters.AddWithValue("@po_no", "");

        cmdContractRn.Parameters.AddWithValue("@attachment_file", attachmentReneal);
        cmdContractRn.Parameters.AddWithValue("@cost", txtCostRenewal.Text);
        cmdContractRn.Parameters.AddWithValue("@payment_terms", ddlPaymentTermsRenewal.SelectedValue);
        cmdContractRn.Parameters.AddWithValue("@vendor_name", "");
        cmdContractRn.Parameters.AddWithValue("@contact_number", 0);
        cmdContractRn.Parameters.AddWithValue("@alt_contact_number", 0);
        cmdContractRn.Parameters.AddWithValue("@email_id", "");
        cmdContractRn.Parameters.AddWithValue("@address", "");
        cmdContractRn.Parameters.AddWithValue("@approaved_dept", ddlDeparmentRenewal.SelectedValue);
        cmdContractRn.Parameters.AddWithValue("@approaved_by", ddlPersonRenewal.SelectedValue);
        cmdContractRn.Parameters.AddWithValue("@approaved_date", Convert.ToDateTime(txtApproavedDateRenewal.Text).ToString("yyyy-MM-dd"));
        cmdContractRn.Parameters.AddWithValue("@comments", txtCommentsRenewal.Text);
        cmdContractRn.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
       
        DataTable tableAssets = new DataTable();
         tableAssets.Columns.Add("s_no", typeof(int));
        tableAssets.Columns.Add("prod_id", typeof(int));
        tableAssets.Columns.Add("tier_id", typeof(int));

        DataRow dr = tableAssets.NewRow();
        dr["s_no"] = 1;
        dr["prod_id"] = 1;
        dr["tier_id"] = 1;
        tableAssets.Rows.Add(dr);
        tableAssets.AcceptChanges();
        cmdContractRn.Parameters.AddWithValue("@assets", tableAssets);

        int k = hcls.master_save(cmdContractRn);

        if (k == 1)
        {
            helper_class.ClearTotalFields(panelContractDetails.Controls);
            lblResultRenewal.ForeColor = Color.Green;
            lblResultRenewal.Text = "Contract saved..";
           
            Wizard1.ActiveStepIndex = 0;
            fileUploadRenewal.Dispose();
            load_contract_details();
        }
        else if (k == 3)
        {
            lblResultRenewal.ForeColor = Color.Red;
            lblResultRenewal.Text = "Duplicate Contract Name entry..";
        }
        else
        {
            lblResultRenewal.ForeColor = Color.Red;
            lblResultRenewal.Text = "not saved.. try again..";
        }

    }
}