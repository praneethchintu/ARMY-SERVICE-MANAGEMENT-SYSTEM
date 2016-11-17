using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class sup_admn_emp_reg : System.Web.UI.Page
{
    helper_class hcls = new helper_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            DesigName_List();
            get_employee_details();
        }
    }

    private void DeptName_List()
    {
        SqlCommand cmdTypeGet = new SqlCommand();  
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_dept_and_persons_selection";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 1);  // 1 for select dept_name for dropdownlist
        cmdTypeGet.Parameters.AddWithValue("@dept_id", "");     
       // hcls.Load_DropDown(cmdTypeGet, ddldeptname);
        cmdTypeGet.Dispose();
    }
    private void DesigName_List()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_designation_based_emp_id";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 2);  // 1 for select dept_name for dropdownlist
        cmdTypeGet.Parameters.AddWithValue("@dedignation_id", "");
        hcls.Load_DropDown(cmdTypeGet, ddlDesiName);
        cmdTypeGet.Dispose();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        Byte[] attachmentFile = null;
        if (ImageFileUpload.HasFile && ImageFileUpload.PostedFile != null)
        {
            //To create a PostedFile
            HttpPostedFile File = ImageFileUpload.PostedFile;
            //Create byte Array with file len
            attachmentFile = new Byte[File.ContentLength];
            //force the control to load data in array
            File.InputStream.Read(attachmentFile, 0, File.ContentLength);

            int filesize = File.ContentLength;
            if (filesize >51200) // 1kb
            {
                lblResults.ForeColor = Color.Red;
                lblResults.Text = "Upload file size should not exceed 50kb..";
                return;
            }
        }
        else
        {
            lblResults.ForeColor = Color.Red;
            lblResults.Text = "NO file Choosen..";
            return;
        }

        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "insert_emp";

        if (lbl_Emp_id_edit.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }

        else
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 1 for insertion
        }

        cmdTypeSave.Parameters.AddWithValue("@emp_id",lbl_Emp_id_edit.Text);
        cmdTypeSave.Parameters.AddWithValue("@emp_name", txtfullname.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@father_name", txtFathername.Text.Trim());
        if (rbtMale.Checked)
            cmdTypeSave.Parameters.AddWithValue("@gender", 1);
        else
            cmdTypeSave.Parameters.AddWithValue("@gender", 0);
        cmdTypeSave.Parameters.AddWithValue("@dateofbirth", txtDateOfBirth.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@present_address", txtpresentaddress.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@permanent_address", txtPermanetaddress.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@contact_no1", txtMobileNum.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@alt_contact_no", txtMobileNum2.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@email_id", txtemail.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@identity_type", ddlIdentityType.SelectedItem.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@id_no", txtIDNum.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@photo", attachmentFile);
        
        string lbl1=HttpContext.Current.User.Identity.Name;
        cmdTypeSave.Parameters.AddWithValue("@cr_id", lbl1);
        cmdTypeSave.Parameters.AddWithValue("@design_id", ddlDesiName.SelectedValue);       
       
        int k = hcls.master_save(cmdTypeSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(emptable.Controls);
            lblResults.ForeColor = Color.Green;
            lblResults.Text = "Employee saved..";
          
            ddlDesiName.SelectedIndex = 0;            
            ddlIdentityType.SelectedIndex = 0;
            get_employee_details();
            
        }
        else if (k == 3)
        {
            lblResults.ForeColor = Color.Red;
            lblResults.Text = "<b>" + lbl_Emp_id_edit + "</b> employee already exists..";
        }
        else
        {
            lblResults.ForeColor = Color.Red;
           lblResults.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(emptable.Controls);
        txtDateOfBirth.Text = "";
        CalendarExtender1.SelectedDate = DateTime.Today;
    }

    protected void grid_employees_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_employees.PageIndex = e.NewPageIndex;
        get_employee_details();
    }

    private void get_employee_details()
    {
        try
        {
            SqlCommand cmdTypeGet = new SqlCommand();
            cmdTypeGet.Parameters.Clear();
            cmdTypeGet.CommandText = "select * from emp_reg";

            hcls.Load_gridview(cmdTypeGet, grid_employees);
           
            cmdTypeGet.Dispose();
        }
        catch
        {

        }
    }
    protected void grid_employees_DataBound(object sender, EventArgs e)
    {
        if (grid_employees.Rows.Count > 0)
        {
            foreach (GridViewRow gr in grid_employees.Rows)
            {
                if ((gr.FindControl("lbl_gender") as Label).Text.Trim() == "1")
                {
                    (gr.FindControl("lbl_gender")as Label).Text = "Male";
                }
                else
                {
                    (gr.FindControl("lbl_gender") as Label).Text = "Female";
                }
            }
        }
    }
    protected void imgbtnviewDetails_Click(object sender, EventArgs e)
    {
        POPUP.Visible = true;
        popUpView.Show();

        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;
        string lbl_emp_id = grid_employees.DataKeys[gr.RowIndex].Value.ToString();

        SqlCommand cmdEmpDetails = new SqlCommand();
        cmdEmpDetails.CommandType = CommandType.StoredProcedure;
        cmdEmpDetails.CommandText = "ep_personal_info";
        cmdEmpDetails.Parameters.AddWithValue("@emp_id", lbl_emp_id);

        DataTable dtDetails = hcls.ExecuteQueryDT(cmdEmpDetails);


        if (dtDetails.Rows.Count > 0)
        {
            lblEmpName.Text = dtDetails.Rows[0]["emp_name"].ToString().ToUpper();

            lblGender.Text = Convert.ToInt32(dtDetails.Rows[0]["gender"].ToString()) == 1 ? "Male" : "Female";
            lblDOB.Text = dtDetails.Rows[0]["dateofbirth"].ToString();
            lbldesignation.Text = dtDetails.Rows[0]["designation_name"].ToString();
            // lblBooldGroup.Text = dtDetails.Rows[0]["blood_group"].ToString();
            lblContact1.Text = dtDetails.Rows[0]["contact_no1"].ToString();
            lblContact2.Text = dtDetails.Rows[0]["alt_contact_no"].ToString();
            lblEmail.Text = dtDetails.Rows[0]["email_id"].ToString();
            lblDepartment.Text = dtDetails.Rows[0]["designation_name"].ToString();


            string[] lines = (dtDetails.Rows[0]["permanent_address"].ToString()).Split(',');
            string add1 = "";
            for (int i = 0; i < lines.Length; i++)
            {
                add1 += lines[i];
                add1 += "<br/>";
            }

            lblPermanentAddress.Text = add1;

            string[] words = (dtDetails.Rows[0]["present_address"].ToString()).Split(',');
            string add2 = "";
            for (int j = 0; j < words.Length; j++)
            {
                add2 += words[j];
                add2 += "<br/>";
            }

            lblPresentAddress.Text = add2;

            Byte[] bytes = (byte[])dtDetails.Rows[0]["photo"];

            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            imgEmp.ImageUrl = "data:image/png;base64," + base64String;
            imgEmp.Visible = true;

        }
        else
        {

        }
        dtDetails.Dispose();
        cmdEmpDetails.Dispose();
    }

    protected void imgbtn_EditDetails_Click(object sender, EventArgs e)
    {

        tabContainer1.ActiveTab = tabpanel2;

        try
        {
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;
        string lbl_emp_id = grid_employees.DataKeys[gr.RowIndex].Value.ToString();
        lbl_Emp_id_edit.Text = grid_employees.DataKeys[gr.RowIndex].Value.ToString();
        SqlCommand cmdEmpDetails = new SqlCommand();
        cmdEmpDetails.CommandType = CommandType.StoredProcedure;
        cmdEmpDetails.CommandText = "ep_personal_info";
        cmdEmpDetails.Parameters.AddWithValue("@emp_id", lbl_emp_id);

        DataTable dtDetails = hcls.ExecuteQueryDT(cmdEmpDetails);

        if (dtDetails.Rows.Count > 0)
        {
            txtfullname.Text = dtDetails.Rows[0]["emp_name"].ToString().ToUpper();
            txtFathername.Text = dtDetails.Rows[0]["father_name"].ToString().ToUpper();
            txtDateOfBirth.Text = dtDetails.Rows[0]["dateofbirth"].ToString();
            CalendarExtender1.SelectedDate = Convert.ToDateTime(dtDetails.Rows[0]["dateofbirth"]);
            txtpresentaddress.Text = dtDetails.Rows[0]["present_address"].ToString().ToUpper();
            txtPermanetaddress.Text = dtDetails.Rows[0]["permanent_address"].ToString().ToUpper();
            txtMobileNum.Text = dtDetails.Rows[0]["contact_no1"].ToString().ToUpper();
            txtMobileNum2.Text = dtDetails.Rows[0]["alt_contact_no"].ToString().ToUpper();
            txtemail.Text = dtDetails.Rows[0]["email_id"].ToString().ToUpper();

            //Byte[] bytes = (byte[])dtDetails.Rows[0]["photo"];

            //  string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            //ImageFileUpload.ID = "data:image/png;base64," + base64String;
            //  ImageFileUpload.Visible = true;

            ddlIdentityType.SelectedValue = dtDetails.Rows[0]["identity_type"].ToString();
            txtIDNum.Text = dtDetails.Rows[0]["id_no"].ToString().ToUpper();
            ddlDesiName.SelectedValue = dtDetails.Rows[0]["design_id"].ToString();
            if (lbl_Emp_id_edit.Text == "")
            {

                ddlDesiName.Enabled = false;
            }
            else
                ddlDesiName.Enabled = true;

            dtDetails.Dispose();
            cmdEmpDetails.Dispose();

        }
        }
            catch(Exception ex)
        {
           ddlIdentityType.SelectedValue="0";
            
            }
    
      
       
    }
    protected void btnclose_Click(object sender, EventArgs e)
    {
        popUpView.Hide();
    }

    protected void Tab_Index_Changed(object sender, EventArgs e)
    {
        try
        {
            helper_class.ClearTotalFields(tabContainer1.ActiveTab.Controls);
        }
        catch (Exception ex)
        { }
    }
}