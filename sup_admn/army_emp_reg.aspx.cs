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

   
    private void DesigName_List()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_army_designation_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 6);  // 1 for select dept_name for dropdownlist
        cmdTypeGet.Parameters.AddWithValue("@desg_id", "");
        cmdTypeGet.Parameters.AddWithValue("@desg_name", "");
        cmdTypeGet.Parameters.AddWithValue("@desg_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
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
            lblResults.Text = "Upload file..";
            return;
        }

        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_insert_army_emp";

        if (lbl_Emp_id_edit.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }

        else
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 1 for insertion
        }

        cmdTypeSave.Parameters.AddWithValue("@emp_id", lbl_Emp_id_edit.Text);
        cmdTypeSave.Parameters.AddWithValue("@emp_name", txtfullname.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@father_name", txtFathername.Text.Trim());
        if (rbtMale.Checked)
            cmdTypeSave.Parameters.AddWithValue("@gender", 1);
        else
            cmdTypeSave.Parameters.AddWithValue("@gender", 0);
        cmdTypeSave.Parameters.AddWithValue("@dateofbirth", txtDateOfBirth.Text.Trim());        
        cmdTypeSave.Parameters.AddWithValue("@present_address", txtpresentaddress.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@permanent_address", txtPermanetaddress.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@pocket_id",ddl_pk.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@block_id", ddl_bk.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@floor_id", ddl_fr.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@flat_id", ddl_flat.SelectedValue);
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
    }

    protected void grid_employees_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_army_employees.PageIndex = e.NewPageIndex;
        get_employee_details();
    }

    private void get_employee_details()
    {
        try
        {
            SqlCommand cmdTypeGet = new SqlCommand();
            cmdTypeGet.Parameters.Clear();
           // cmdTypeGet.CommandText = "select * from employee";
            cmdTypeGet.CommandText = "select adm.desg_name,fm.flat_number,e.* from employee e,tbl_flat_master fm,tbl_army_designations_master adm where e.flat_id=fm.flat_id and adm.desg_id=e.Design_id";
            hcls.Load_gridview(cmdTypeGet, grid_army_employees);
           
            cmdTypeGet.Dispose();
        }
        catch
        {

        }
    }
    protected void grid_employees_DataBound(object sender, EventArgs e)
    {
        if (grid_army_employees.Rows.Count > 0)
        {
            foreach (GridViewRow gr in grid_army_employees.Rows)
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
        string lbl_emp_id = grid_army_employees.DataKeys[gr.RowIndex].Value.ToString();

        SqlCommand cmdEmpDetails = new SqlCommand();
      //  cmdEmpDetails.CommandType = CommandType.StoredProcedure;
      //  cmdEmpDetails.CommandText = "ep_personal_info";
       // cmdEmpDetails.Parameters.AddWithValue("@emp_id", lbl_emp_id);
        cmdEmpDetails.CommandText = "select e.emp_id, e.photo, e.emp_name, e.gender,CONVERT(VARCHAR(30),e.dateofbirth,106) dateofbirth, adm.desg_name, e.contact_no1, e.alt_contact_no, e.email_id, e.present_address, e.permanent_address from employee e,employee_army_design_mapping ead,tbl_army_designations_master adm where e.emp_id=ead.emp_id and adm.desg_id=ead.design_id and e.emp_id='" + lbl_emp_id + "'";
        DataTable dtDetails = hcls.ExecuteQueryDT(cmdEmpDetails);


        if (dtDetails.Rows.Count > 0)
        {
            lblEmpName.Text = dtDetails.Rows[0]["emp_name"].ToString().ToUpper();

            lblGender.Text = Convert.ToInt32(dtDetails.Rows[0]["gender"].ToString()) == 1 ? "Male" : "Female";
            lblDOB.Text = dtDetails.Rows[0]["dateofbirth"].ToString();
            lbldesignation.Text = dtDetails.Rows[0]["desg_name"].ToString();           
            lblContact1.Text = dtDetails.Rows[0]["contact_no1"].ToString();
            lblContact2.Text = dtDetails.Rows[0]["alt_contact_no"].ToString();
            lblEmail.Text = dtDetails.Rows[0]["email_id"].ToString();
            lblDepartment.Text = dtDetails.Rows[0]["desg_name"].ToString();


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
    protected void btnclose_Click(object sender, EventArgs e)
    {
        popUpView.Hide();
    }


    protected void ddlDesiName_SelectedIndexChanged(object sender, EventArgs e)
    {
        load_pockets();
    }

    private void load_pockets()
    {
        ddl_pk.Items.Clear();
        ddl_bk.Items.Clear();
        ddl_fr.Items.Clear();
        ddl_flat.Items.Clear();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select distinct(pm.pocket_name),pm.pocket_id  from tbl_flat_master fm,tbl_pocket_master pm where fm.pocket_id=pm.pocket_id and pm.status=1 and fm.flat_type_id=(select flat_type_id from tbl_designation_flat_type_mapping where desg_id=" + ddlDesiName.SelectedValue + ")";
        hcls.Load_DropDown(cmd, ddl_pk);
        cmd.Dispose();
        
    }

    private void load_blocks()
    {
        ddl_bk.Items.Clear();
        ddl_fr.Items.Clear();
        ddl_flat.Items.Clear();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select distinct(bm.block_name),bm.block_id  from tbl_flat_master fm,tbl_block_master bm where fm.block_id=bm.block_id and bm.block_status=1 and fm.flat_type_id=(select flat_type_id from tbl_designation_flat_type_mapping where desg_id=" + ddlDesiName.SelectedValue + ")";

        hcls.Load_DropDown(cmd, ddl_bk);
        cmd.Dispose();
    }

    private void load_floors()
    {
        ddl_fr.Items.Clear();
        ddl_flat.Items.Clear();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select distinct(frm.floor_name),frm.floor_id from tbl_flat_master fm,tbl_floor_master frm where fm.floor_id=frm.floor_id and frm.floor_status=1 and fm.flat_type_id=(select flat_type_id from tbl_designation_flat_type_mapping where desg_id=" + ddlDesiName.SelectedValue + ")";

        hcls.Load_DropDown(cmd, ddl_fr);
        cmd.Dispose();
    }

    private void load_flats()
    {
        ddl_flat.Items.Clear();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select distinct(frm.flat_number),frm.flat_id from tbl_flat_master frm where frm.status=1 and frm.flat_type_id=(select flat_type_id from tbl_designation_flat_type_mapping where desg_id=" + ddlDesiName.SelectedValue + ")";

        hcls.Load_DropDown(cmd, ddl_flat);
        cmd.Dispose();
    }
    protected void ddl_pk_SelectedIndexChanged(object sender, EventArgs e)
    {

        load_blocks();
       
    }
    protected void ddl_bk_SelectedIndexChanged(object sender, EventArgs e)
    {
        load_floors();
    }
    protected void ddl_fr_SelectedIndexChanged(object sender, EventArgs e)
    {
        load_flats();
      
    }
    protected void ddl_flat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_pk.SelectedIndex != 0 && ddl_bk.SelectedIndex != 0 && ddl_fr.SelectedIndex != 0)
        {
            txtpresentaddress.Text = "Flat No:-" + ddl_flat.SelectedItem + "/ " + ddl_fr.SelectedItem + "/ " + ddl_bk.SelectedItem + "/ " + ddl_pk.SelectedItem;
        }
        else
            txtpresentaddress.Text = "";
    }

    private void get_flat_Amenity_details()
    {
        try
        {
            SqlCommand cmdTypeGet = new SqlCommand();
            cmdTypeGet.Parameters.Clear();            
            cmdTypeGet.CommandType = CommandType.StoredProcedure;
            cmdTypeGet.CommandText = "sp_flat_selection_reg_list";
            cmdTypeGet.Parameters.AddWithValue("@pocket_id", ddl_pk.SelectedValue == "" ? 0 : Convert.ToInt32(ddl_pk.SelectedValue));  // 1 for select all type values
            cmdTypeGet.Parameters.AddWithValue("@block_id", ddl_bk.SelectedValue == "" ? 0 : Convert.ToInt32(ddl_bk.SelectedValue));
            cmdTypeGet.Parameters.AddWithValue("@floor_id", ddl_fr.SelectedValue == "" ? 0 : Convert.ToInt32(ddl_fr.SelectedValue));
            cmdTypeGet.Parameters.AddWithValue("@desg_id", ddlDesiName.SelectedValue == "" ? 0 : Convert.ToInt32(ddlDesiName.SelectedValue));
            hcls.Load_DropDown(cmdTypeGet, ddl_flat);            
            cmdTypeGet.Dispose();
        }
        catch
        {

        }
    }

    protected void imgbtn_Army_EditDetails_Click(object sender, EventArgs e)
     {
         tabContainer1.ActiveTab = tabpanel2;

         load_pockets();
         load_blocks();
         load_floors();
         load_flats();

        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;
        string lbl_emp_id = grid_army_employees.DataKeys[gr.RowIndex].Value.ToString();
        lbl_Emp_id_edit.Text = grid_army_employees.DataKeys[gr.RowIndex].Value.ToString();
        SqlCommand cmdEmpDetails = new SqlCommand();
       // cmdEmpDetails.CommandType = CommandType.StoredProcedure;
      //  cmdEmpDetails.CommandText = "select e.emp_id, e.photo, e.emp_name,e.father_name,e.identity_type,e.id_no,adm.desg_id, e.gender,CONVERT(VARCHAR(30),e.dateofbirth,106) dateofbirth, adm.desg_name, e.contact_no1, e.alt_contact_no, e.email_id, e.present_address, e.permanent_address from employee e,employee_army_design_mapping ead,tbl_army_designations_master adm where e.emp_id=ead.emp_id and adm.desg_id=ead.design_id and e.emp_id='" + lbl_emp_id + "'"; 
        cmdEmpDetails.CommandText = "select * from employee where emp_id='" + lbl_emp_id+"'";
        cmdEmpDetails.Parameters.AddWithValue("@emp_id", lbl_emp_id);

        DataTable dtDetails = hcls.ExecuteQueryDT(cmdEmpDetails);

        if (dtDetails.Rows.Count > 0)
        {

            try
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

                // Byte[] bytes = (byte[])dtDetails.Rows[0]["photo"];

                //string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                //ImageFileUpload.ID = "data:image/png;base64," + base64String;
                //ImageFileUpload.Visible = true;

                ddlIdentityType.SelectedValue = dtDetails.Rows[0]["identity_type"].ToString();
                txtIDNum.Text = dtDetails.Rows[0]["id_no"].ToString().ToUpper();
                ddlDesiName.SelectedValue = dtDetails.Rows[0]["design_id"].ToString();
                ddlDesiName.Enabled = true;

                ddl_pk.SelectedValue = dtDetails.Rows[0]["pocket_id"].ToString().ToUpper();
                ddl_bk.SelectedValue = dtDetails.Rows[0]["block_id"].ToString().ToUpper();
                ddl_fr.SelectedValue = dtDetails.Rows[0]["floor_id"].ToString().ToUpper();
                ddl_flat.SelectedValue = dtDetails.Rows[0]["flat_id"].ToString().ToUpper();
            }
            catch (Exception ex)
            {
                ddl_flat.SelectedValue = "0";
            }

        
        }
            dtDetails.Dispose();
            cmdEmpDetails.Dispose();
        
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