using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Web.UI.HtmlControls;

public partial class sup_admn_service_management : System.Web.UI.Page
{
    helper_class hcls = new helper_class();

    MyClass my = new MyClass();

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
        lblMsg1.Text = string.Empty; lblMsg2.Text = string.Empty;
        lbltaxmsg.Text = string.Empty;
        if (!IsPostBack)
        {
            btnAddServicePanel.Visible = true;
            btnUpdate.Visible = false;
            // BtnClear.Visible = false;
        //    Services_load();

       //     bind_tax();
       //     ddlService_load();
       //     get_categories();
       //     get_menu_list1();
       //     load_service_exe();
       //     my.FillDropDownTwo("select er.emp_name,er.emp_id from emp_reg er left join emp_reg_design erd on er.emp_id=erd.emp_id where erd.design_id=8 order by er.emp_name", ddlsermngrname);
       //     load_service_manager();
       //     checkboxservices();
       //     SqlCommand cmd;
          
     //       cmd = new SqlCommand("select er.emp_name,er.emp_id from emp_reg er left join emp_reg_design erd on er.emp_id=erd.emp_id where erd.design_id=11 order by er.emp_name");
     //       my.FillDropDownTwocmd(cmd, ddlserviceexe);

      //      bind_tax_chbxlst();

      //      cmd.Dispose();


            btnAddServicePanel.Visible = true;
            btnUpdate.Visible = false;
            btnexeupdate.Visible = false;
            btnupdatetax.Visible = false;
            btnupdateCategory.Visible = false;
        }



    }

   
    private void checkboxservices()
    {
        SqlCommand cmd = new SqlCommand("select service_name,service_id from room_services where status=1 order by service_name");
        my.fillchbxcmd(cmd, chbxtypeservices);
        my.fillchbxcmd(cmd, chbxlistexeservice);
      
    }

    private void load_service_manager()
    {
        SqlCommand cmd = new SqlCommand("sp_get_service_mngr");
        cmd.Parameters.AddWithValue("@id", 0);
        cmd.CommandType = CommandType.StoredProcedure;
        DataTable dt = my.Select(cmd).Tables[0];
        if (dt.Rows.Count > 0)
        {
            gridservicemngr.DataSource = dt;
            gridservicemngr.DataBind();
        }


    }
        
    #region SERVICE


    protected void btnservicedelete_click(object sender, EventArgs e)
    {
        int index = (((ImageButton)sender).Parent.Parent as GridViewRow).RowIndex;
        int sid = Convert.ToInt32(gridServices.DataKeys[index]["service_id"].ToString());
        SqlCommand cmd = new SqlCommand("sp_delete_roomservice_withid");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@id", sid);
        int i = my.insertCmd(cmd);
        if (i == 1)
        {
            my.successful(lblMsg1);
            lblMsg1.Text = "Sercive Deleted Successfully";
            Services_load();
        }
        else
        {
            my.error(lblMsg1);
            lblMsg1.Text = "Sorry Deletion Failed";
        }

    }


    protected void Services_load()
    {
        lblMsg.Text = null;
        SqlCommand cmdcat = new SqlCommand();
        cmdcat.CommandType = CommandType.Text;
        //   cmdcat.CommandText = "service_details";
        cmdcat.CommandText = "select * from room_services";
        DataTable dt = hcls.ExecuteQueryDT(cmdcat);
        gridServices.DataSource = dt;
        gridServices.DataBind();
        dt.Dispose();
        cmdcat.Dispose();
    }

    private void bind_tax_chbxlst()
    {
        SqlCommand cmd = new SqlCommand("sp_bind_tax_chebx");
        my.fillchbxcmd(cmd, chbxtaxlst);
    }

    protected void btnAddServicePanel_Click(object sender, EventArgs e)
    {
        

        SqlCommand cmdaddcat = new SqlCommand();
        cmdaddcat.CommandType = CommandType.StoredProcedure;
        cmdaddcat.CommandText = "[insert_service1]";
        cmdaddcat.Parameters.AddWithValue("@service_name", txtServiceName.Text);
        cmdaddcat.Parameters.AddWithValue("@status",  1);
        cmdaddcat.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);
       int i=1;
        DataTable dttemp = new DataTable();
        dttemp.Columns.Add("sl.No", typeof(int));
        
        dttemp.Columns.Add("option_id", typeof(int));

            
            foreach (ListItem item in chbxtaxlst.Items)
            {
                dttemp.NewRow();
              
                if (item.Selected == true)
                {
                    
                    dttemp.Rows.Add(i, item.Value);
                    i++;
                   
                }
            }
            cmdaddcat.Parameters.AddWithValue("@dtOptions", dttemp);

            int t =  hcls.master_save(cmdaddcat);
            cmdaddcat.Dispose();
        


            lblMsg1.Text = "Service Inserted Succesfully";
            lblMsg1.ForeColor = Color.Green;
            checkboxservices();
            ddlService_load();

            //save
            // Accordion1.SelectedIndex = 1;
            if (t==1)
            {
                lblMsg1.Text = "Service inserted succefully";
                lblMsg1.ForeColor = Color.Green;
                MyClass.ClearTotalFields(Page.Controls);
            }
        else if (t == 3)
        {
            //duplicate
            lblMsg1.Text = "Service Name Already Exsist";
            lblMsg1.ForeColor = Color.Red;
        }
        else
        {
            //error
            lblMsg1.Text = "Service Insertion Failed";
            lblMsg1.ForeColor = Color.Red;
        }
        Services_load();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        lblMsg1.Text = string.Empty;
        
        if (lblHiddenValue.Text == "")
            return;
        SqlCommand cmdupdate = new SqlCommand();
        cmdupdate.CommandType = CommandType.Text;
        cmdupdate.CommandText = "update room_services set service_name=@service_name where service_id=@service_id";
        cmdupdate.Parameters.Clear();
        cmdupdate.Parameters.AddWithValue("@service_name", txtServiceName.Text);
        cmdupdate.Parameters.AddWithValue("@service_id", lblHiddenValue.Text);
        if (hcls.ExecuteNonQuery(cmdupdate) > 0)
        {
        cmdupdate.Dispose();
            cmdupdate.Parameters.Clear();
            
            cmdupdate = new SqlCommand();
            cmdupdate.CommandText = "sp_tbl_services_taxation_mst_delete_with_service_id";
            cmdupdate.Parameters.Add("@service_id", SqlDbType.BigInt).Value = lblHiddenValue.Text;
            cmdupdate.CommandType = CommandType.StoredProcedure;
            my.insertCmd(cmdupdate);
            foreach (ListItem item in chbxtaxlst.Items)
            {
                cmdupdate.Dispose();
                cmdupdate.Parameters.Clear();
                cmdupdate = new SqlCommand();
                if (item.Selected == true)
                {
                    cmdupdate.CommandText = "sp_insert_tbl_services_taxation_mst";
                    cmdupdate.CommandType = CommandType.StoredProcedure;
                    cmdupdate.Parameters.AddWithValue("@service_id", lblHiddenValue.Text);
                    cmdupdate.Parameters.AddWithValue("@tax_id", item.Value);

                    my.insertCmd(cmdupdate);
                }
            }

            
            lblMsg1.Text = "Updated Successfully ";
            lblMsg1.ForeColor = Color.Green;
            checkboxservices();
            ddlService_load();
            Services_load();
            btnClear_Click(null, null);
        }
        else
        {
            lblMsg1.ForeColor = System.Drawing.Color.Red;
            lblMsg1.Text = "Sorry updation failed";
        }
        cmdupdate.Dispose();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
       
        txtServiceName.Text = string.Empty;
        lblHiddenValue.Text = "";
        btnAddServicePanel.Visible = true;
        btnUpdate.Visible = false;
        foreach (ListItem item in chbxtaxlst.Items)
        {
            item.Selected = false;
        }
        //BtnClear.Visible = false;
    }

    protected void gridServices_RowBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //foreach (GridViewRow row in gridservicemngr.Rows)
            //{
            string idd = gridServices.DataKeys[e.Row.RowIndex]["status"].ToString();

            if (Convert.ToInt32(gridServices.DataKeys[e.Row.RowIndex]["status"].ToString()) == 1)
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgStatus1")).ImageUrl = "~/Img/green.gif";
            }
            else
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgStatus1")).ImageUrl = "~/Img/red.gif";
            }



            string service_id= gridServices.DataKeys[e.Row.RowIndex]["service_id"].ToString();
            string str = "sp_tax_group_concat";
            SqlCommand cmd = new SqlCommand(str);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@service_id", service_id);
            DataTable dt = my.Select(cmd).Tables[0];
            string taxes = "Empty";
            
            foreach (DataRow item in dt.Rows)
            {
                taxes = item["taxnames"].ToString();
            }

            ((System.Web.UI.WebControls.Label)e.Row.FindControl("lbltaxesName")).Text = taxes;

        }


        

    }
    protected void gridServices_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "changestatus")
        { 
        int index = Convert.ToInt32(e.CommandArgument);
            string status = gridServices.DataKeys[index]["status"].ToString();
             
            SqlCommand cmdupdate = new SqlCommand();
            cmdupdate.CommandType = CommandType.Text;
            cmdupdate.CommandText = "update room_services set status=@status where service_id=@service_id";
            cmdupdate.CommandType = CommandType.Text;
            cmdupdate.Parameters.Add("@status", SqlDbType.Int).Value = gridServices.DataKeys[index]["status"].ToString() == "1" ? "0" : "1";
            cmdupdate.Parameters.Add("@service_id", SqlDbType.BigInt).Value = gridServices.DataKeys[index]["service_id"].ToString();
            my.insertCmd(cmdupdate);
            cmdupdate.Dispose();
            cmdupdate.Parameters.Clear();
            Services_load();
            ddlService_load();
            if (status == "1")
            {
                cmdupdate.CommandText = "update items_menu set status=0 where item_cat_id=@serviceid";
                cmdupdate.CommandType = CommandType.Text;
                cmdupdate.Parameters.Add("@service_id", SqlDbType.BigInt).Value = gridServices.DataKeys[index]["service_id"].ToString();
                my.insertCmd(cmdupdate);

            
            }
        }
    }

    protected void gridServices_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string status = gridServices.DataKeys[e.NewEditIndex]["status"].ToString();
        lblHiddenValue.Text = gridServices.DataKeys[e.NewEditIndex]["service_id"].ToString();

        Label lblServiceName = (Label)(gridServices.Rows[e.NewEditIndex].FindControl("lblServiceName"));
        txtServiceName.Text = lblServiceName.Text;
        btnAddServicePanel.Visible = false;
        btnUpdate.Visible = true;
        //chbxtaxlst.Items.Clear();
       // chbxtaxlst.DataBind();
        SqlCommand cmd = new SqlCommand("sp_get_tax_id_by_service_id");
        cmd.Parameters.Add("@service_id ", SqlDbType.BigInt).Value=lblHiddenValue.Text;
        cmd.CommandType = CommandType.StoredProcedure;
        DataTable dt = my.Select(cmd).Tables[0];
        
            foreach (ListItem item in chbxtaxlst.Items)
            {
                item.Selected = false;
            }
            foreach (DataRow row in dt.Rows)
            {

                foreach (ListItem item in chbxtaxlst.Items)
                {
                    if (item.Value == row["tax_id"].ToString())
                    {
                        item.Selected = true;
                        break;
                    }
                }


            }
       
    }
    #endregion

    #region Category
    private void ddlService_load()
    {
        lblMsg.Text = null;
        SqlCommand cmdcat = new SqlCommand();
        cmdcat.CommandType = CommandType.Text;
        cmdcat.CommandText = "select service_name,service_id from room_services where status=1 order by service_name";

        my.FillDropDownTwocmd(cmdcat, ddlServices);
             cmdcat.Dispose();
    }

    protected void ddlServices_SelectedIndexChanged(object sender, EventArgs e)
    {
        Category_load();
    }

    private void Category_load()
    {
        if (ddlServices.SelectedValue == "0")
        {
            return;
        }
        else
        {
            SqlCommand cmdcat = new SqlCommand();
            cmdcat.CommandType = CommandType.Text;
            cmdcat.CommandText = "select  cat_id,cat_name ,status from service_category where service_id=" + ddlServices.SelectedValue + "";
            DataTable dt = hcls.ExecuteQueryDT(cmdcat);
            if (dt.Rows.Count > 0)
            {
                gridCategory.DataSource = dt;
                gridCategory.DataBind();
            }
            else
            {
                gridCategory.DataSource = null;
                gridCategory.DataBind();
            }
        }
    }

    protected void btnAddCategoryPanel_Click(object sender, EventArgs e)
    {
        SqlCommand cmdaddcat = new SqlCommand();
        cmdaddcat.CommandType = CommandType.StoredProcedure;
        cmdaddcat.CommandText = "insert_category";
        cmdaddcat.Parameters.Clear();
        cmdaddcat.Parameters.AddWithValue("@cat_name", txtCatName.Text);
        cmdaddcat.Parameters.AddWithValue("@service_id", ddlServices.SelectedValue);
        int t = hcls.master_save(cmdaddcat);
        cmdaddcat.Dispose();
        if (t == 1)
        {
            lblMsg2.Text = "Category Inserted Succesfully";
            lblMsg2.ForeColor = Color.Green;
            //save
            // Accordion1.SelectedIndex = 2;
        }
        else if (t == 3)
        {
            //duplicate
            lblMsg2.Text = "Category Name Already Exsist";
            lblMsg2.ForeColor = Color.Red;
        }
        else
        {
            //error
            lblMsg2.Text = "Category Insertion Failed";
            lblMsg2.ForeColor = Color.Red;
        }
        Category_load();
        get_menu_list1();
    }
    protected void gridCategory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "changecatstatus")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            gridCategory.DataKeys[index]["status"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_service_category_status_update";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@status", SqlDbType.Int).Value = gridCategory.DataKeys[index]["status"].ToString() == "1" ? "0" : "1";
            cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = gridCategory.DataKeys[index]["cat_id"].ToString();
            int i= my.insertCmd(cmd);
            if (i == 1)
            {
                Category_load();
            }
            else if (i==2)
            {
                //normal error
            }
            else if(i==3)
            {
                //dublicate

            }
        }
    }
    protected void gridCategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
       txtCatName.Text=((Label)gridCategory.Rows[e.NewEditIndex].FindControl("lblCategoryName")).Text;

       lblhidcat_id.Text = gridCategory.DataKeys[e.NewEditIndex]["cat_id"].ToString();
       btnAddCategory.Visible = false;
       btnupdateCategory.Visible = true;
    }
    protected void btncatclear_Click(object sender, EventArgs e)
    {
        txtCatName.Text = string.Empty;
        btnAddCategory.Visible = true;
        btnupdateCategory.Visible = false;
    }
    protected void btnupdateCategory_Click(object sender, EventArgs e)
    {
        if (ddlServices.SelectedValue == "" || ddlServices.SelectedValue == "0")
            return;
        SqlCommand cmdupdate = new SqlCommand();
        cmdupdate.CommandType = CommandType.Text;
        cmdupdate.CommandText = "update service_category set cat_name=@cat_name where cat_id=@cat_id and service_id=@service_id";
        //string id = gridCategory.DataKeys[e.RowIndex].Value.ToString();
     //   string cat_name = ((TextBox)gridCategory.Rows[e.RowIndex].FindControl("txtCategoryNameEdit")).Text;
       // cmdupdate.Parameters.AddWithValue("@compo_status", ((CheckBox)gridCategory.Rows[e.RowIndex].FindControl("chkStatusCategory")).Checked == true ? 1 : 0);
        cmdupdate.Parameters.AddWithValue("@cat_id", lblhidcat_id.Text);
        cmdupdate.Parameters.AddWithValue("@cat_name", txtCatName.Text);
        cmdupdate.Parameters.AddWithValue("@service_id", ddlServices.SelectedValue);
        if (hcls.ExecuteNonQuery(cmdupdate) > 0)
        {
           lblMsg2.ForeColor = System.Drawing.Color.Green;
           lblMsg2.Text = "Updated Successfully";
           // gridCategory.EditIndex = -1;
            Category_load();
            btncatclear_Click(null, null);
        }
        else
        {
            lblMsg2.ForeColor = System.Drawing.Color.Red;
            lblMsg2.Text = "Not Update";
        }
        cmdupdate.Dispose();
        get_menu_list1();

    }
    protected void gridCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
     
    }

    protected void gridCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridCategory.EditIndex = -1;
        Category_load();
    }

    protected void gridCategory_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gridCategory.Rows)
        {

            //if (gr.RowState == DataControlRowState.Normal || gr.RowState == DataControlRowState.Alternate)
            //{
                if (Convert.ToInt32(gridCategory.DataKeys[gr.RowIndex]["status"].ToString()) == 1)
                {
                    ((System.Web.UI.WebControls.ImageButton)gr.FindControl("imgStatusCategory")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.ImageButton)gr.FindControl("imgStatusCategory")).ImageUrl = "~/img/red.gif";
                }
           // }
     
        }
    }

    protected void gridCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gridCategory.DataKeys[e.RowIndex]["cat_id"].ToString());
        SqlCommand cmd = new SqlCommand("sp_delete_service_category_withid");
        cmd.Parameters.AddWithValue("@id", id);
        cmd.CommandType = CommandType.StoredProcedure;
        int i = my.insertCmd(cmd);
        if (i == 1)
        {
            my.successful(lblMsg2);
            lblMsg2.Text = "Category Deleted Successfully";
            Category_load();
        }
        else
        {
            my.error(lblMsg2);
            lblMsg2.Text = "Sorry Deletion Failed";
        }

    }


    #endregion

    #region Items
    private void get_categories()
    {
        SqlCommand cmdCategory = new SqlCommand();
        cmdCategory.CommandType = CommandType.Text;
        cmdCategory.CommandText = "select  cat_name, cat_id from service_category where status=1";
        my.FillDropDownTwocmd(cmdCategory, ddlCategory);
        my.FillDropDownTwocmd(cmdCategory, ddlCategoryList);

        
    }

    private void get_menu_list1()
    {
        SqlCommand cmdMenu = new SqlCommand();
        cmdMenu.CommandType = CommandType.Text;
        cmdMenu.CommandText = "select * from items_menu";
        DataTable dtMenu = hcls.ExecuteQueryDT(cmdMenu);
        if (dtMenu.Rows.Count > 0)
        {

            gv_Items.DataSource = dtMenu;
            gv_Items.DataBind();
        }
        else
        {
            gv_Items.DataSource = null;
            gv_Items.DataBind();
        }
        dtMenu.Dispose();
        cmdMenu.Dispose();

    }

    private void get_menu_list()
    {
        SqlCommand cmdMenu = new SqlCommand();
        cmdMenu.CommandType = CommandType.Text;

        if (ddlCategoryList.SelectedValue == "0")

            cmdMenu.CommandText = "select * from items_menu";
        else

            cmdMenu.CommandText = "select * from items_menu where item_cat_id=" + ddlCategoryList.SelectedValue + " ";

        DataTable dtMenu = hcls.ExecuteQueryDT(cmdMenu);

        if (dtMenu.Rows.Count > 0)
        {
            gv_Items.DataSource = dtMenu;
            gv_Items.DataBind();
        }
        else
        {
            gv_Items.DataSource = null;
            gv_Items.DataBind();
        }
        dtMenu.Dispose();
        cmdMenu.Dispose();
    }

    protected void ddlCategoryList_selectIndexChanged(object sender, EventArgs e)
    {

        SqlCommand cmdMenu = new SqlCommand();
        cmdMenu.CommandType = CommandType.Text;
        cmdMenu.CommandText = "select * from items_menu where item_cat_id=@item_cat_id";
        cmdMenu.Parameters.AddWithValue("@item_cat_id", ddlCategoryList.SelectedValue);
        DataTable dtMenu = hcls.ExecuteQueryDT(cmdMenu);
        if (dtMenu.Rows.Count > 0)
        {
            //ViewState["cattab"] = dtMenu;
            //DataTable dtmy = (DataTable)ViewState["cattab"];
            gv_Items.DataSource = dtMenu;
            gv_Items.DataBind();
        }
        else
        {
            gv_Items.DataSource = null;
            gv_Items.DataBind();
        }
        dtMenu.Dispose();
        cmdMenu.Dispose();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMessage.Text = null;

        if (fileuploadimg.HasFile == false && fileuploadimg.FileContent.Length == 0)
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "Select Photo..";
            return;
        }
        SqlCommand cmdAdd = new SqlCommand();
        cmdAdd.Parameters.Clear();
        cmdAdd.CommandType = CommandType.Text;
        cmdAdd.CommandText = "insert into items_menu(item_name,item_cost,item_cat_id,item_image,description) values(@item_name,@item_cost,@item_cat_id,@photo,@description)";
        cmdAdd.Parameters.AddWithValue("@item_name", txtItemName.Text.Trim());
        cmdAdd.Parameters.AddWithValue("@item_cost", txtCost.Text.Trim());
        cmdAdd.Parameters.AddWithValue("@item_cat_id", ddlCategory.SelectedValue);
        cmdAdd.Parameters.AddWithValue("@description", txtDescrption.Text.Trim());
        Byte[] imgByte = null;
        if (fileuploadimg.HasFile && fileuploadimg.PostedFile != null)
        {
            //To create a PostedFile
            HttpPostedFile File = fileuploadimg.PostedFile;
            //Create byte Array with file len
            imgByte = new Byte[File.ContentLength];
            //force the control to load data in array
            File.InputStream.Read(imgByte, 0, File.ContentLength);
        }

        cmdAdd.Parameters.AddWithValue("@photo", imgByte);

        int k = hcls.master_save(cmdAdd);
        if (k == 1)
        {
            lblMsg.ForeColor = Color.Green;
            lblMsg.Text = "Added Succesfully";
            get_menu_list();
        }
        else if (k == 3)        // 3 for duplicate entry
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "Duplicate Entry...";
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "Entry failed...";
        }
        cmdAdd.Dispose();

    }

    protected void btnCreateMenuItem_Click(object sender, EventArgs e)
    {
        panel_category_list.Visible = false;
        panelCreateItem.Visible = true;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelCreateItem.Controls);
        panel_category_list.Visible = true;
        panelCreateItem.Visible = false;
    }
    protected void gv_Items_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "changestatus")
        {
            try
            {

            
            SqlCommand cmd = new SqlCommand("sp_change_items_menu_status");
            cmd.Parameters.Add("@item_id", SqlDbType.BigInt).Value = gv_Items.DataKeys[Convert.ToInt32(e.CommandArgument)]["item_id"].ToString();
            cmd.Parameters.Add("@status", SqlDbType.Int).Value =  gv_Items.DataKeys[Convert.ToInt32(e.CommandArgument)]["status"].ToString()== "1" ? "0":"1";
            cmd.CommandType = CommandType.StoredProcedure;
            my.insertCmd(cmd);
            get_menu_list();       
            }
            catch (Exception)
            {

             
            }
        }

    }
    protected void gv_Items_RowEditing(object sender, GridViewEditEventArgs e)
    {
        panel_category_list.Visible = false;
        panelCreateItem.Visible = true;
        btnSubmit.Visible = false;
        btnitem_update.Visible = true;

        int id= Convert.ToInt32 (gv_Items.DataKeys[e.NewEditIndex]["item_id"].ToString());

        SqlCommand cmditemmenu = new SqlCommand("select * from items_menu where item_id=@id");

        cmditemmenu.Parameters.Add("@id", SqlDbType.BigInt).Value=id;
        cmditemmenu.CommandType = CommandType.Text;
        DataTable dt= my.Select(cmditemmenu).Tables[0];
        foreach (DataRow item in dt.Rows)
        {
            SqlCommand cmdCategory = new SqlCommand();
            cmdCategory.CommandType = CommandType.Text;
            cmdCategory.CommandText = "select  cat_name, cat_id from service_category";
            my.FillDropDownTwocmd(cmdCategory, ddlCategory);
            lblhiditem_id.Text = id.ToString();
            ddlCategory.SelectedValue = item["item_cat_id"].ToString();
            txtItemName.Text = item["item_name"].ToString();
            txtCost.Text = item["item_cost"].ToString();

           byte[] bytes =(byte[])item["item_image"];
           imgitem.ImageUrl = FetchImage(bytes);
            txtDescrption.Text = item["description"].ToString();
        }
        //get_menu_list();
    }

    protected string  FetchImage(byte[] bytes)
    {
            //byte[] bytes = (byte[])GetData("SELECT Data FROM tblFiles WHERE Id =" + id).Rows[0]["Data"];
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
             return "data:image/png;base64," + base64String;
    }
    protected void btnitem_update_Click(object sender, EventArgs e)
    {
        SqlCommand cmdupdate = new SqlCommand();
        cmdupdate.CommandType = CommandType.Text;

        string ItemCost = txtCost.Text ;
        string Description =txtDescrption.Text ;
       // cmdupdate.Parameters.AddWithValue("@compo_status", ((CheckBox)gv_Items.Rows[e.RowIndex].FindControl("chkStatus")).Checked == true ? 1 : 0);
        cmdupdate.Parameters.AddWithValue("@item_id", lblhiditem_id.Text);
        cmdupdate.Parameters.AddWithValue("@item_name",txtItemName.Text);
        cmdupdate.Parameters.AddWithValue("@item_cost", ItemCost);
        cmdupdate.Parameters.AddWithValue("@description", Description);
        cmdupdate.Parameters.AddWithValue("@item_cat_id", ddlCategory.SelectedValue);
        if (fileuploadimg.HasFile &&  fileuploadimg.FileContent.Length != 0)
        {
            Byte[] imgByte = null;
            if (fileuploadimg.HasFile && fileuploadimg.PostedFile != null)
            {
                //To create a PostedFile
                HttpPostedFile File = fileuploadimg.PostedFile;
                //Create byte Array with file len
                imgByte = new Byte[File.ContentLength];
                //force the control to load data in array
                File.InputStream.Read(imgByte, 0, File.ContentLength);
            }
            cmdupdate.CommandText = "update items_menu set item_name=@item_name ,item_cost=@item_cost,description=@description,item_image=@photo,item_cat_id=@item_cat_id where item_id=@item_id";
            cmdupdate.Parameters.AddWithValue("@photo", imgByte);

        }
        else
        {
            cmdupdate.CommandText = "update items_menu set item_name=@item_name ,item_cost=@item_cost,description=@description,item_cat_id=@item_cat_id where item_id=@item_id";
        }
        if (hcls.master_save(cmdupdate) == 1)
        {
            btnCancel_Click(null, null);
            imgitem.ImageUrl = "";
            my.successful(lblMessage2);
            get_menu_list1();
            ddlCategory.SelectedIndex = 0;
            lblMessage2.Text = "updated successfully";
        }
        else if (hcls.master_save(cmdupdate) == 2)
        {
            lblMessage2.ForeColor = System.Drawing.Color.Red;
            lblMessage2.Text = "Sorry Not Update";
        }
        else if (hcls.master_save(cmdupdate) == 3)
        {
            lblMessage2.ForeColor = System.Drawing.Color.Red;
            lblMessage2.Text = "Duplicate entry";
        }
        cmdupdate.Dispose();
    }
    protected void gv_Items_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
     
    }

    protected void gv_Items_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gv_Items.EditIndex = -1;
        get_menu_list();
        lblMessage2.Text = "";
    }
    protected void gv_Items_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {


        int item_id = Convert.ToInt32(gv_Items.DataKeys[e.RowIndex]["item_id"].ToString());
        SqlCommand cmd = new SqlCommand("sp_delete_items_menu_withid");
        cmd.Parameters.AddWithValue("@id", item_id);
        cmd.CommandType = CommandType.StoredProcedure;


        int i = my.insertCmd(cmd);
        if (i == 1)
        {
            my.successful(lblMsg);
            lblMsg.Text = "Category Deleted Successfully";
            get_menu_list();
        }
        else
        {
            my.error(lblMsg);
            lblMsg.Text = "Sorry Deletion Failed";
        }

    }



    protected void gv_Items_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gv_Items.Rows)
        {

            if (gr.RowState == DataControlRowState.Normal || gr.RowState == DataControlRowState.Alternate)
            {
                if (Convert.ToInt32(gv_Items.DataKeys[gr.RowIndex]["status"].ToString()) == 1)
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgStatus1")).ImageUrl = "~/Img/green.gif";
                }
                else
                {

                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgStatus1")).ImageUrl = "~/Img/red.gif";
                }
            }
            //if (gr.RowState != DataControlRowState.Normal && gr.RowState != DataControlRowState.Alternate)
            //    gr.RowState = DataControlRowState.Edit;
            ////if (gr.RowState == DataControlRowState.Edit)
            //{
            //    if (Convert.ToInt32(gv_Items.DataKeys[gr.RowIndex]["status"].ToString()) == 1)
            //    {
            //        ((CheckBox)gv_Items.Rows[gr.RowIndex].FindControl("chkStatus")).Checked = true;
            //    }
            //    else
            //    {
            //        ((CheckBox)gv_Items.Rows[gr.RowIndex].FindControl("chkStatus")).Checked = false;
            //    }

            //}
        }
    }
    #endregion

    #region service manager mngt
    protected void gridservicemngr_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        if (e.CommandName == "serviceview")
        {
            lblMsg.Text = "";
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            string id = gridservicemngr.DataKeys[index]["id"].ToString();
            string emp_id = gridservicemngr.DataKeys[index]["emp_id"].ToString().Trim();
            ddlsermngrname.SelectedValue = emp_id;
            hid.Value = id;

            SqlCommand cmd = new SqlCommand("select service_id,tbl_ser_id from service_mngr_servicelist where tbl_ser_id=@trid"); ;
            cmd.Parameters.AddWithValue("@trid", id);

            DataTable dt = my.Select(cmd).Tables[0];
            for (int j = 0; j <= dt.Rows.Count - 1; j++)
            {
                for (int I = 0; I <= chbxtypeservices.Items.Count - 1; I++)
                {
                    if (chbxtypeservices.Items[I].Value == dt.Rows[j]["service_id"].ToString())
                    {
                        chbxtypeservices.Items[I].Selected = true;
                    }

                }
            }
            btnaddservicemngr.Visible = false;
            btnserviceupdate.Visible = true;
            //servicepopup.Show();

        }
        else if (e.CommandName == "status")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            string status = gridservicemngr.DataKeys[index]["status"].ToString();
            string emp_id = gridservicemngr.DataKeys[index]["emp_id"].ToString();
            SqlCommand cmd = new SqlCommand();
            if (status == "0")
            {
                cmd.CommandText = "update tbl_servie_mngr_mngt set status=1 where emp_id=@id";

            }
            else if (status == "1")
            {
                cmd.CommandText = "update tbl_servie_mngr_mngt set status=0 where emp_id=@id";
            }
            cmd.Parameters.AddWithValue("@id", emp_id.Trim());
            my.insertCmd(cmd);
            cmd.Dispose();

        }

        load_service_manager();

    }
    protected void gridservicemngr_RowBound(object sender, GridViewRowEventArgs e)
    {
        // && e.Row.RowState == DataControlRowState.Normal

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //foreach (GridViewRow row in gridservicemngr.Rows)
            //{
            string idd = gridservicemngr.DataKeys[e.Row.RowIndex]["id"].ToString();
            if (Convert.ToInt32(gridservicemngr.DataKeys[e.Row.RowIndex]["status"].ToString()) == 1)
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgStatus1")).ImageUrl = "~/Img/green.gif";
            }
            else
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgStatus1")).ImageUrl = "~/Img/red.gif";
            }


            string str = "sp_service_concat";
            SqlCommand cmd = new SqlCommand(str);
            cmd.CommandType = CommandType.StoredProcedure;
            int iiid = Convert.ToInt32(gridservicemngr.DataKeys[e.Row.RowIndex]["id"].ToString());
            cmd.Parameters.AddWithValue("@id", iiid);

            DataTable dt = my.Select(cmd).Tables[0];
            LinkButton lknbtn = (LinkButton)e.Row.FindControl("lnkbtnservicename");
            if (dt.Rows.Count > 0)
            {

                lknbtn.Text = dt.Rows[0]["servicelist"].ToString();

            }
            else
            {
                lknbtn.Text = "Empty";

            }
            lknbtn.ToolTip = lknbtn.Text;

        }
        //else  if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Edit)
        //  {
        //      DropDownList ddlempname = ((DropDownList)e.Row.FindControl("ddlempname"));
        //      my.FillDropDownTwo("select er.emp_name,er.emp_id from emp_reg er left join emp_reg_design erd on er.emp_id=erd.emp_id where erd.design_id=8 order by er.emp_name", ddlempname);


        //      ddlempname.SelectedValue = gridservicemngr.DataKeys[e.Row.RowIndex]["emp_id"].ToString();

        //  }
        // }
    }

    protected void btnaddservicemngr_Click(object sender, EventArgs e)
    {
        Label3.Text = string.Empty;

        try
        {
            string str = "sp_inser_tbl_servie_mngr_mngt";

            SqlCommand cmd1 = new SqlCommand(str);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@emp_id", ddlsermngrname.SelectedValue);
            cmd1.Parameters.AddWithValue("@status", 1);
            cmd1.Parameters.AddWithValue("@truser", HttpContext.Current.User.Identity.Name);
            int id = 0;
            if (ddlsermngrname.SelectedValue == "0")
            {
                //my.error(Label3);
                //Label3.Text = "Please select alteat one";
                return;

            }

            try
            {
                id = Convert.ToInt32(my.GetScalarValue(cmd1));
            }
            catch (Exception ex)
            {
                my.error(Label3);
                Label3.Text = "sorry operation failed";
                return;
            }


            SqlCommand cmd;

            int k = 0;




            foreach (ListItem item in chbxtypeservices.Items)
            {
                if (item.Selected)
                {

                    k = 1;

                    cmd = new SqlCommand("insert into service_mngr_servicelist(service_id,tbl_ser_id) values(@ser_id,@tbl_ser_id)");
                    cmd.Parameters.AddWithValue("@tbl_ser_id", id);
                    cmd.Parameters.AddWithValue("@ser_id", item.Value);
                    int j = my.insertCmd(cmd);
                    cmd.Dispose();
                }

            }


            btnserviceupdate.Visible = false;
            ddlsermngrname.SelectedIndex = 0;
            btnaddservicemngr.Visible = true;
            foreach (ListItem item in chbxtypeservices.Items)
            {
                item.Selected = false;
            }
            if (k == 0)
            {

                my.error(Label3);
                Label3.Text = "Please select alteat one";
                return;

            }
            load_service_manager();

            my.successful(Label3);
            Label3.Text = "Manager Added Successfully";




            //SqlCommand cmdaddcat = new SqlCommand();
            //cmdaddcat.CommandType = CommandType.StoredProcedure;

        }

        catch (Exception ex)
        {

        }

    }


    protected void gridservicemngr_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridservicemngr.EditIndex = e.NewEditIndex;
        load_service_manager();

    }
    protected void gridservicemngr_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridservicemngr.EditIndex = -1;
        load_service_manager();
    }
    protected void gridservicemngr_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }


    protected void gridservicemngr_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlCommand cmd = new SqlCommand("sp_tbl_servie_mngr_mngt_delete_withid");

        int id = Convert.ToInt32(gridservicemngr.DataKeys[e.RowIndex]["id"].ToString());
        cmd.Parameters.AddWithValue("@id", id);
        cmd.CommandType = CommandType.StoredProcedure;
        int i = my.insertCmd(cmd);
        if (i == 1)
        {
            my.successful(Label3);
            Label3.Text = "Manager Deleted Successfully";
            load_service_manager();

        }
        else
        {
            my.error(Label3);
            Label3.Text = "Sorry Deletion Failed";
        }
    }

    protected void btnserviceupdate_Click(object sender, EventArgs e)
    {


        try
        {

            if (ddlsermngrname.SelectedValue == "0")
            {

                return;
            }
            int k = 0;
            foreach (ListItem item in chbxtypeservices.Items)
            {
                if (item.Selected)
                {
                    k = 1;
                }
            }
            if (k == 0)
            {
                Label3.Text = "Select at Least One Employee";
                Label3.ForeColor = Color.Red;
                return;
            }

            SqlCommand cmd1 = new SqlCommand("delete from service_mngr_servicelist where tbl_ser_id=" + hid.Value);
            my.insertCmd(cmd1);
            SqlCommand cmd;

            foreach (ListItem item in chbxtypeservices.Items)
            {
                if (item.Selected)
                {
                    k = 1;

                    cmd = new SqlCommand("insert into service_mngr_servicelist(service_id,tbl_ser_id) values(@ser_id,@tbl_ser_id)");
                    cmd.Parameters.AddWithValue("@tbl_ser_id", hid.Value);
                    cmd.Parameters.AddWithValue("@ser_id", item.Value);
                    int j = my.insertCmd(cmd);

                }

            }



            load_service_manager();
            Label3.Text = "Manager Updated Successfully";
            Label3.ForeColor = Color.Green;
            btnserviceupdate.Visible = false;
            ddlsermngrname.SelectedIndex = 0;
            btnaddservicemngr.Visible = true;
            foreach (ListItem item in chbxtypeservices.Items)
            {
                item.Selected = false;
            }
        }
        catch (Exception ex)
        {
            Label3.Text = "Sorry Operation Failed";
            Label3.ForeColor = Color.Red;

        }
    }
    protected void btncancel1_Click(object sender, EventArgs e)
    {
        btnserviceupdate.Visible = false;
        ddlsermngrname.SelectedIndex = 0;
        btnaddservicemngr.Visible = true;
        foreach (ListItem item in chbxtypeservices.Items)
        {
            item.Selected = false;
        }

    }
    #endregion


    #region service executive
    private void load_service_exe()
    {
        SqlCommand cmd = new SqlCommand("sp_get_service_exe");
        cmd.Parameters.AddWithValue("@id", 0);
        cmd.CommandType = CommandType.StoredProcedure;
        DataTable dt = my.Select(cmd).Tables[0];
        if (dt.Rows.Count > 0)
        {
            gridserviceexe.DataSource = dt;
            gridserviceexe.DataBind();
        }

    }
    protected void gridserviceexe_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "serviceview")
        {
            lblMsg.Text = "";
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            string id = gridserviceexe.DataKeys[index]["id"].ToString();
            string emp_id = gridserviceexe.DataKeys[index]["emp_id"].ToString().Trim();
            ddlserviceexe.SelectedValue = emp_id;
            hid.Value = id;

            SqlCommand cmd = new SqlCommand("select service_id,tbl_exe_id from service_exe_servicelist where tbl_exe_id=@trid"); ;
            cmd.Parameters.AddWithValue("@trid", id);

            DataTable dt = my.Select(cmd).Tables[0];
            for (int j = 0; j <= dt.Rows.Count - 1; j++)
            {
                for (int I = 0; I <= chbxtypeservices.Items.Count - 1; I++)
                {
                    if (chbxlistexeservice.Items[I].Value == dt.Rows[j]["service_id"].ToString())
                    {
                        chbxlistexeservice.Items[I].Selected = true;
                    }

                }
            }
            btnexeadd.Visible = false;
            btnexeupdate.Visible = true;
            //servicepopup.Show();

        }
        else if (e.CommandName == "status")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            string status = gridserviceexe.DataKeys[index]["status"].ToString();
            string emp_id = gridserviceexe.DataKeys[index]["emp_id"].ToString();
            SqlCommand cmd = new SqlCommand();
            if (status == "0")
            {
                cmd.CommandText = "update tbl_servie_exe_mngt set status=1 where emp_id=@id";

            }
            else if (status == "1")
            {
                cmd.CommandText = "update tbl_servie_exe_mngt set status=0 where emp_id=@id";
            }
            cmd.Parameters.AddWithValue("@id", emp_id.Trim());
            my.insertCmd(cmd);
            cmd.Dispose();
            load_service_exe();

        }


    }
    protected void gridserviceexe_RowBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //foreach (GridViewRow row in gridservicemngr.Rows)
            //{
            string idd = gridserviceexe.DataKeys[e.Row.RowIndex]["id"].ToString();
            if (Convert.ToInt32(gridserviceexe.DataKeys[e.Row.RowIndex]["status"].ToString()) == 1)
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgexeStatus")).ImageUrl = "~/Img/green.gif";
            }
            else
            {
                ((System.Web.UI.WebControls.Image)e.Row.FindControl("imgexeStatus")).ImageUrl = "~/Img/red.gif";
            }


            string str = "[sp_exe_concat]";
            SqlCommand cmd = new SqlCommand(str);
            cmd.CommandType = CommandType.StoredProcedure;
            int iiid = Convert.ToInt32(gridserviceexe.DataKeys[e.Row.RowIndex]["id"].ToString());
            cmd.Parameters.AddWithValue("@id", iiid);

            DataTable dt = my.Select(cmd).Tables[0];
            LinkButton lknbtn = (LinkButton)e.Row.FindControl("lnkbtnserviceexeservicename");
            if (dt.Rows.Count > 0)
            {

                lknbtn.Text = dt.Rows[0]["servicelist"].ToString();

            }
            else
            {
                lknbtn.Text = "Empty";

            }
            lknbtn.ToolTip = lknbtn.Text;

        }

    }
    protected void gridserviceexe_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlCommand cmd = new SqlCommand("sp_tbl_servie_exe_mngt_delete_withid");

        int id = Convert.ToInt32(gridserviceexe.DataKeys[e.RowIndex]["id"].ToString());
        cmd.Parameters.AddWithValue("@id", id);
        cmd.CommandType = CommandType.StoredProcedure;
        int i = my.insertCmd(cmd);
        if (i == 1)
        {
            my.successful(lblexemsg);
            lblexemsg.Text = "Exeecutive Deleted Successfully";
            load_service_exe();

        }
        else
        {
            my.error(lblexemsg);
            lblexemsg.Text = "Sorry Deletion Failed";
        }




    }

    protected void btnexeadd_Click(object sender, EventArgs e)
    {
        lblexemsg.Text = string.Empty;
        try
        {
            int k = 0;
            foreach (ListItem item in chbxlistexeservice.Items)
            {
                if (item.Selected)
                {
                    k = 1;

                }
            }
            if (k == 0)
            {

                my.error(lblexemsg);
                lblexemsg.Text = "Please select alteat one";
                return;

            }
            if (ddlserviceexe.SelectedValue == "0")
            {
                return;
            }

            string str = "sp_insert_tbl_servie_exe_mngt";

            SqlCommand cmd1 = new SqlCommand(str);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@emp_id", ddlserviceexe.SelectedValue);
            cmd1.Parameters.AddWithValue("@status", 1);
            cmd1.Parameters.AddWithValue("@truser", HttpContext.Current.User.Identity.Name);
            int id = 0;


            try
            {
                id = Convert.ToInt32(my.GetScalarValue(cmd1));
            }

            catch (Exception ex)
            {
                lblexemsg.Text = "Sorry Operation Failed";
                my.error(lblexemsg);

            }

            SqlCommand cmd;



            foreach (ListItem item in chbxlistexeservice.Items)
            {
                if (item.Selected)
                {
                    cmd = new SqlCommand("insert into service_exe_servicelist(service_id,tbl_exe_id) values(@ser_id,@tbl_ser_id)");
                    cmd.Parameters.AddWithValue("@tbl_ser_id", id);
                    cmd.Parameters.AddWithValue("@ser_id", item.Value);
                    int j = my.insertCmd(cmd);
                    cmd.Dispose();
                }

            }



            btnexeupdate.Visible = false;
            ddlserviceexe.SelectedIndex = 0;
            btnexeadd.Visible = true;
            foreach (ListItem item in chbxlistexeservice.Items)
            {
                item.Selected = false;
            }
            lblexemsg.Text = "Executive Added Successfully";
            my.successful(lblexemsg);
            load_service_exe();//  load_service_manager();
        }
        catch (Exception ex)
        {
            lblexemsg.Text = "Sorry Operation Failed";
            my.error(lblexemsg);

        }
    }
    protected void btnexecancel_Click(object sender, EventArgs e)
    {

        btnexeupdate.Visible = false;
        ddlserviceexe.SelectedIndex = 0;
        btnexeadd.Visible = true;
        foreach (ListItem item in chbxlistexeservice.Items)
        {
            item.Selected = false;
        }

    }

    protected void btnexeupdate_Click(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        try
        {
            int k = 0;


            if (ddlserviceexe.SelectedValue == "0")
            {
                return;
            }

            foreach (ListItem item in chbxlistexeservice.Items)
            {
                if (item.Selected)
                { k = 1; }
            }
            if (k == 0)
            {
                lblexemsg.Text = "Select at Least One Employee";
                lblexemsg.ForeColor = Color.Red;
                return;
            }
            SqlCommand cmd1 = new SqlCommand("delete from service_exe_servicelist where tbl_exe_id=" + hid.Value);
            my.insertCmd(cmd1);
            SqlCommand cmd;



            foreach (ListItem item in chbxlistexeservice.Items)
            {
                if (item.Selected)
                {
                    k = 1;

                    cmd = new SqlCommand("insert into service_exe_servicelist(service_id,tbl_exe_id) values(@ser_id,@tbl_ser_id)");
                    cmd.Parameters.AddWithValue("@tbl_ser_id", hid.Value);
                    cmd.Parameters.AddWithValue("@ser_id", item.Value);
                    int j = my.insertCmd(cmd);
                }
            }

            load_service_exe();
            btnexeupdate.Visible = false;
            ddlserviceexe.SelectedIndex = 0;
            btnexeadd.Visible = true;
            foreach (ListItem item in chbxlistexeservice.Items)
            {
                item.Selected = false;
            }

        }
        catch (Exception)
        {
            lblexemsg.ForeColor = Color.Red;
            lblexemsg.Text = "Sorry Operation Failed";

        }
    }
    #endregion

    #region TaxMaster

    SqlCommand cmdtax = new SqlCommand();
    private void bind_tax()
    {
        try
        {
            lbltaxmsg.Text = string.Empty;
            cmdtax.CommandText = "sp_get_taxdata";
            cmdtax.CommandType = CommandType.StoredProcedure;
            DataTable dttax = my.Select(cmdtax).Tables[0];
            cmdtax.Dispose();
            if (dttax.Rows.Count > 0)
            {
                membersTable.DataSource = dttax;
                membersTable.DataBind();
            }
            else
            {

            }
            dttax.Dispose();
        }
        catch (Exception ex)
        {
            my.error(lbltaxmsg);
            lbltaxmsg.Text = ex.Message;
        
        }
    }
    protected void membersTable_ItemDataBound(object sender, DataListItemEventArgs e)
    {
      

       if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType==ListItemType.AlternatingItem)
       {
           string id = membersTable.DataKeys[e.Item.ItemIndex].ToString();
           ImageButton imgstatus = (ImageButton)e.Item.FindControl("imgstatus");
           Label lblstatus = (Label)e.Item.FindControl("lblstatus");
           
           imgstatus.ImageUrl =lblstatus.Text =="1" ?"~/Img/green.gif" : "~/Img/red.gif";

       }

    }
    protected void membersTable_UpdateCommand(object source, DataListCommandEventArgs e)
    {
    }
    protected void membersTable_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "changestatus")
        {
            try
            {

            
            string id = membersTable.DataKeys[e.Item.ItemIndex].ToString();
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");
            string status = lblstatus.Text == "1" ? "0" : "1";
            cmdtax.CommandText = "sp_update_status_ taxdata";
            cmdtax.CommandType = CommandType.StoredProcedure;
            cmdtax.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
            cmdtax.Parameters.Add("@status", SqlDbType.Int).Value = status;
            int i = my.insertCmd(cmdtax);
            cmdtax.Dispose();
            cmdtax.Parameters.Clear();
            }
            catch (Exception ex)
            {
                my.error(lbltaxmsg);
                lbltaxmsg.Text = ex.Message;
            }

            bind_tax();
            bind_tax_chbxlst();
        }

    }

    
    protected void edit_click(object sender, EventArgs e)
    {
        try
        {
            ImageButton a = sender as ImageButton;
            DataListItem dtlist = (DataListItem)a.Parent;
            int index = ((DataListItem)a.Parent).ItemIndex;
            int id = Convert.ToInt32(membersTable.DataKeys[index].ToString());
            txttaxname.Text= ((Label)membersTable.Items[index].FindControl("lbltaxname")).Text.Trim();
            txtper.Text = ((Label)membersTable.Items[index].FindControl("lbltaxper")).Text.Trim();
            btnaddtax.Visible = false;
            btnupdatetax.Visible = true;
            lit_tax_id.Text = id.ToString();
        }
        catch (Exception ex)
        {

            my.error(lbltaxmsg);
            lbltaxmsg.Text = ex.Message;
        }
        
        
    }

    protected void btnupdatetax_Click(object sender, EventArgs e)
    {
        try
        {//tax updation done
            lbltaxmsg.Text = string.Empty;
            cmdtax.CommandType = CommandType.StoredProcedure;
            cmdtax.CommandText = "[sp_update_taxdata]";
            cmdtax.Parameters.Add("@id", SqlDbType.BigInt).Value =lit_tax_id.Text;
            cmdtax.Parameters.Add("@taxname", SqlDbType.NChar,50).Value = txttaxname.Text.Trim();
            cmdtax.Parameters.Add("@taxper", SqlDbType.Decimal,10).Value = txtper.Text.Trim();

            int i = my.insertCmd(cmdtax);
            if (i == 1)
            {
                my.successful(lbltaxmsg);
                lbltaxmsg.Text = "Tax Updated Successfully";
                MyClass.ClearTotalFields(Page.Controls);
                btnupdatetax.Visible = false;
                btnaddtax.Visible = true;
            }
            else
            {
                throw new Exception("Sorry Operation Failed");
            }
            cmdtax.Dispose();
            cmdtax.Parameters.Clear();
            bind_tax();
           
        }
        catch (Exception ex)
        {

            my.error(lbltaxmsg);
            lbltaxmsg.Text = ex.Message;
        }
        
 
    }
    protected void btncanceltax_Click(object sender, EventArgs e)
    {
        MyClass.ClearTotalFields(Page.Controls);
    }
    protected void btnaddtax_Click(object sender, EventArgs e)
    {
        try
        {
            cmdtax.CommandType = CommandType.StoredProcedure;
            cmdtax.CommandText = "sp_insert_taxdata";
            cmdtax.Parameters.Add("@taxname", SqlDbType.NChar, 50).Value = txttaxname.Text.Trim();
            cmdtax.Parameters.Add("@taxper", SqlDbType.Decimal, 10).Value = txtper.Text.Trim();


            int i = my.insertCmd(cmdtax);
            if (i==1)
            {
                cmdtax.Dispose();
                cmdtax.Parameters.Clear();
                bind_tax();
                my.successful(lbltaxmsg);
                lbltaxmsg.Text = "Tax Inserted Successfully";
                MyClass.ClearTotalFields(Page.Controls);
                
            }
            else
            {
                throw new Exception("Sorry Operation Failed");
            }
            
        }
        catch (Exception ex)
        {
            my.error(lbltaxmsg);
            lbltaxmsg.Text = ex.Message;
        }


    }


        #endregion


   
}