using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Data.SQLite;
using System.Web.Security;
using System.Configuration;
using System.Drawing;

public partial class incident_creation_incident : System.Web.UI.Page
{
    helper_class hcls = new helper_class();
    MyClass my= new MyClass();
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
        { //Page.MasterPageFile = "~/profile/MasterPage.master";
            Page.MasterPageFile = "~/incident_creation/MasterIncident.master";
        }

        if (HttpContext.Current.User.IsInRole("10"))
        { Page.MasterPageFile = "~/store_mngr/store_mngr_master.master"; }

        if (HttpContext.Current.User.IsInRole("1"))
        { Page.MasterPageFile = "~/sup_admn/sup_admn_master.master"; }
    }   // loading respective master page as per Employee Login
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            btnupdate.Visible = false;

        SqlCommand cmd=new SqlCommand();
        bind_sms_list();
        cmd = new SqlCommand("SELECT  [service_name],[service_id] from [tbl_flat_services] where status=1");
        my.FillDropDownTwocmd(cmd, ddlissuecode);

        cmd = new SqlCommand("select pocket_name,pocket_id from tbl_pocket_master where status=1");
        my.FillDropDownTwocmd(cmd, ddl_Pocket);
        creatstimer();
        }
    }

    protected void grid_edit_click(object sender, EventArgs e)
    {
        btnupdate.Visible = true;
        panelIncidents.Visible = true;
        lblIncidentResult.Text = "";
       
        GridViewRow row = ((ImageButton)sender).Parent.Parent as GridViewRow;

        Dictionary<string, string> Limode = new Dictionary<string, string>();
        Limode.Add("0","--select--");
        Limode.Add("1","Email");
        Limode.Add("2","Phone Call");
        Limode.Add("3","Web From");
        Limode.Add("4","SMS");

        ddlMode.Items.Clear();
        ddlMode.DataSource = Limode;
        ddlMode.DataTextField = "Value";
        ddlMode.DataValueField = "key";
        ddlMode.DataBind();
      
        ddlissuestatus.Items.Clear();
        Dictionary<string, string> Li = new Dictionary<string, string>();
        
     string iissuestatus_id=  grid_incident_list.DataKeys[row.DataItemIndex]["issuestatus_id"].ToString();
     if (iissuestatus_id == "0")
     {
         Li.Add("0", "Open");
         Li.Add("1", "On Hold");
     
     }
     else if (iissuestatus_id=="1")
     {
         Li.Add("0", "Open");
         Li.Add("1", "On Hold");
         Li.Add("2", "Resolved");
         
     }
     else if (iissuestatus_id == "2")
     {

         Li.Add("1", "On Hold");
         Li.Add("2", "Resolved");
         Li.Add("3", "Closed");
     
     }
     else
     {
         Li.Add("3", "Closed");

     }
     ddlMode.Enabled = false;
     txtsuject.Enabled = false;
     ddlissuecode.Enabled = false;
     txtphno.Enabled = false;
     txtDescription.Enabled = false;
     ddl_Pocket.Enabled = false;
     ddl_Block.Enabled = false;
     ddl_Floor.Enabled = false;
     ddlflatno.Enabled = false;
     ddlPriority.Enabled = false;


        ddlissuestatus.DataSource = Li;
        ddlissuestatus.DataTextField = "Value";
            ddlissuestatus.DataValueField="key";
        ddlissuestatus.DataBind();

        ddlissuestatus.SelectedValue = grid_incident_list.DataKeys[row.DataItemIndex]["issuestatus_id"].ToString();
        ddlMode.SelectedValue = grid_incident_list.DataKeys[row.DataItemIndex]["req_type_id"].ToString();
        txtsuject.Text = ((Label)row.FindControl("lblSubject")).Text;
        lblFlat_id.Text = grid_incident_list.DataKeys[row.DataItemIndex]["Flat_id"].ToString();
        load_txt_Addr();
        ddlissuecode.SelectedValue = grid_incident_list.DataKeys[row.DataItemIndex]["code"].ToString();
        txtphno.Text =  ((Label)row.FindControl("lblphone_no")).Text.Remove(0,3);
        ddlPriority.SelectedValue = grid_incident_list.DataKeys[row.DataItemIndex]["priority_type_id"].ToString();
        lblEmpid.Text= grid_incident_list.DataKeys[row.DataItemIndex]["emp_id"].ToString();       

        txtDescription.Text = ((Label)row.FindControl("lblDesc")).Text;
        txtT_Comments.Text = ((Label)row.FindControl("lbl_TComments")).Text;
        lblhide.Text = grid_incident_list.DataKeys[row.DataItemIndex]["auto_id"].ToString();



    }
    protected void btnIncidentCancel_Click(object sender, EventArgs e)
    {
        MyClass.ClearTotalFields(Page.Controls);
        panelIncidents.Visible = false;
        lblhide.Text = "";
    }
    protected void grid_incident_list_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_incident_list.PageIndex = e.NewPageIndex;
        bind_sms_list();
    }
    SQLiteConnection con = new SQLiteConnection(ConfigurationManager.AppSettings["sqlliteconn"].ToString());//"Data Source=C:\\Program Files\\MMX144F 3G USB Manager\\Data\\UserData.db;Version=3;");
    SqlConnection consql = new SqlConnection(MyClass.connectionString);// "Data Source=cannybee001-pc;Initial Catalog=army_db;User ID=sa;Password=123");
    //@priority_type int,@subject varchar(max)

    private void load_txt_Addr()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select ft.flat_number,ft.flat_id,flr.floor_name,ft.floor_id,blk.block_name,blk.block_id,pkt.pocket_name,pkt.pocket_id from tbl_flat_master ft,tbl_floor_master flr,tbl_block_master blk,tbl_pocket_master pkt where ft.floor_id=flr.floor_id and ft.block_id=blk.block_id and ft.pocket_id=pkt.pocket_id and ft.flat_id=" + Convert.ToInt32(lblFlat_id.Text);

        DataTable dtDetails = hcls.ExecuteQueryDT(cmd);
        ddl_Pocket.SelectedValue = dtDetails.Rows[0]["pocket_id"].ToString();
        load_blocks();
        ddl_Block.SelectedValue = dtDetails.Rows[0]["block_id"].ToString();
        load_floors();
        ddl_Floor.SelectedValue = dtDetails.Rows[0]["floor_id"].ToString();
        load_flats();
        ddlflatno.SelectedValue = dtDetails.Rows[0]["flat_id"].ToString();

    }

    private void creatstimer()
    {
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "cust_req_no";
        //if (lblPrefixId.Text == "")
        //{
        //    cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        //}
       
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation
        
        cmdTypeSave.Parameters.AddWithValue("@id","");
        cmdTypeSave.Parameters.AddWithValue("@prefix", "");
        cmdTypeSave.Parameters.AddWithValue("@status", "");
        cmdTypeSave.Parameters.AddWithValue("@replay", "");
        cmdTypeSave.Parameters.AddWithValue("@sms_port","");
        cmdTypeSave.Parameters.AddWithValue("@description", "");
        DataTable dt = my.Select(cmdTypeSave).Tables[0];
        foreach (DataRow row in dt.Rows)
        {
            if (row["replay"].ToString() == "1")
            {
                Timer1.Enabled = true;
                //Timer timer = new Timer();

                //updatepanel1.ContentTemplateContainer.Controls.Add(timer);
                //PlaceHolder1.Controls.Add(timer);
                //timer.Interval = 180000;
                //timer.Enabled = true;
                //timer.ID = "tri";
                //timer.Tick += new EventHandler<EventArgs>(Timer1_Tick);
                //PostBackTrigger ps = new PostBackTrigger();
                //ps.ControlID = "tri";
                //updatepanel1.Triggers.Add(ps);
            }
        }
        
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {

        //1 high,2medium,3low,4 normal
        // SqlTransaction trns = null;
        try
        {

            //sms should be first roomno 2ns word issue code, next is description
            SqlCommand cmdid = new SqlCommand("select max(id) id from tbl_service_req_list where req_type=@req_type", consql);
            cmdid.Parameters.Add("@req_type", SqlDbType.Int).Value = 4;
            cmdid.CommandType = CommandType.Text;
            SqlDataAdapter sqlda = new SqlDataAdapter(cmdid);
            DataTable dt = new DataTable();
            sqlda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                SQLiteCommand cmd = null;
                cmd.Connection = con;
                con.Open();
                string strcmd = "";
                if (string.IsNullOrEmpty(dt.Rows[0]["id"].ToString()))
                {
                    strcmd = string.Format("select id, datatime,phonenumber,smstext from smstable");
                }
                else
                {
                    strcmd = string.Format("select id, datatime,phonenumber,smstext from smstable where id >" + dt.Rows[0]["id"].ToString());

                }
                cmd = new SQLiteCommand(strcmd);
                cmd.Connection = con;
                DataSet ds = new DataSet();

                SQLiteDataAdapter da = new SQLiteDataAdapter(cmd);
                con.Close();
                da.Fill(ds, "tabsms");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow item in ds.Tables[0].Rows)
                    {//sms formate should be in roomno code desc

                        string[] smstext = item["smstext"].ToString().Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);//System.Text.RegularExpressions.Regex.Split(item["smstext"].ToString(), " ", System.Text.RegularExpressions.RegexOptions.IgnoreCase);

                        string desc = "";
                        for (int i = 2; i < smstext.Length; i++)
                        {

                            desc = desc + " " + smstext[i].ToString();
                        }


                        //  cmdinsert.Parameters.Add("@id", SqlDbType.Int).Value =
                        //cmdinsert.Parameters.Add("@date", SqlDbType.DateTime).Value =;
                        //cmdinsert.Parameters.Add("@roomno", SqlDbType.NVarChar, 50).Value =
                        //cmdinsert.Parameters.Add("@code", SqlDbType.NVarChar, 50).Value = 
                        //cmdinsert.Parameters.Add("@description", SqlDbType.NVarChar, 50).Value =
                        //cmdinsert.Parameters.Add("@phoneno", SqlDbType.NVarChar, 50).Value =
                        //cmdinsert.Parameters.Add("@reqno", SqlDbType.NVarChar, 50).Value =
                        //cmdinsert.Parameters.Add("@replay_status", SqlDbType.Int).Value = replaystatus;
                        //cmdinsert.Parameters.Add("@req_type", SqlDbType.Int).Value = 4;



                       // insert_service_req(item["id"].ToString().Trim(), item["datatime"].ToString().Trim(), smstext[0].ToString().Trim(), smstext[1].ToString().Trim(), desc.Trim(), item["phonenumber"].ToString().Trim(), 4,2,"sms");


                    }

                    bind_sms_list();

                }
                else
                {

                }

            }

        }
        catch (Exception ex)
        {
            //  trns.Rollback();
            my.error(lblIncidentResult);
            lblIncidentResult.Text = "Error in Sending message" + ex.Message.ToString();
        }

    }
    private void bind_sms_list()
    {
        try
        {
            string name = HttpContext.Current.User.Identity.Name;

            SqlCommand cmd = new SqlCommand("sp_get_emp_desi_with_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@emp_id", SqlDbType.NVarChar, 100).Value = name;
            string desi_id = my.Select(cmd).Tables[0].Rows[0]["designation_id"].ToString();
            if (string.IsNullOrEmpty(desi_id))
            {

            }
            else if (desi_id == "13")
            {
                trassign.Visible = true;
                grid_incident_list.Columns[14].Visible = true;
            }
            else if (desi_id == "14")
            {
                ddlflatno.Enabled = false;
                ddl_Floor.Enabled = false;
                ddl_Block.Enabled = false;
                ddl_Pocket.Enabled = false;
                txtphno.Enabled = false;
                ddlPriority.Enabled = false;
                trassign.Visible = true;
                
                grid_incident_list.Columns[14].Visible = false;

            }
            SqlCommand cmdid = new SqlCommand("sp_get_tbl_service_req_list", consql);
            cmdid.CommandType = CommandType.StoredProcedure;
            //if (desi_id == "14")
            //{
            //    cmdid.Parameters.Add("@op_type", SqlDbType.BigInt).Value = 2;
            //}
            //else
            cmdid.Parameters.Add("@op_type", SqlDbType.BigInt).Value = 2;

            cmdid.Parameters.Add("@id", SqlDbType.BigInt).Value = 0;
            cmdid.Parameters.Add("@emp_id", SqlDbType.NVarChar, 100).Value = name;
            DataSet ds = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter(cmdid);
            sqlda.Fill(ds, "tab");
            if (ds.Tables[0].Rows.Count > 0)
            {
                grid_incident_list.DataSource = ds.Tables[0];
                grid_incident_list.DataBind();
            }
            else
            {
                grid_incident_list.DataSource = ds.Tables[0];
                grid_incident_list.DataBind();

            }
        }
        catch (Exception ex)
        {
            lblIncidentResult.Text = "Error in Sending message" + ex.Message.ToString();

            //    FormsAuthentication.SignOut();
        //    FormsAuthentication.RedirectToLoginPage();
        }
    }
    protected void ddlflatno_SelectedIndexChanged(object sender, EventArgs e)
    {
       // SqlCommand cmd = new SqlCommand("sp_get_productname_by_flat_id");
        //cmd.Parameters.Add("@f_id", SqlDbType.BigInt).Value = ddlflatno.SelectedValue;
        //cmd.CommandType = CommandType.StoredProcedure;
        //my.FillDropDownTwocmd(cmd, ddlissuecode);
    }

    protected void ddl_Pocket_SelectedIndexChanged(object sender, EventArgs e)
    {
        load_blocks();
    }
    protected void ddl_Block_SelectedIndexChanged(object sender, EventArgs e)
    {
        load_floors();
    }
    protected void ddl_Floor_SelectedIndexChanged(object sender, EventArgs e)
    {
        load_flats();
           }

    private void load_blocks()
    {
        SqlCommand cmd = new SqlCommand("select block_name,block_id from tbl_block_master where block_status=1 and pocket_id=" + ddl_Pocket.SelectedValue);
        my.FillDropDownTwocmd(cmd, ddl_Block);
        cmd.Dispose();
    }

    private void load_floors()
    {
        SqlCommand cmd = new SqlCommand("select floor_name,floor_id from tbl_floor_master where floor_status=1 and block_id=" + ddl_Block.SelectedValue);
        my.FillDropDownTwocmd(cmd, ddl_Floor);
        cmd.Dispose();
    }

    private void load_flats()
    {
        SqlCommand cmd = new SqlCommand("select flat_number,flat_id from tbl_flat_master where status=1 and floor_id=" + ddl_Floor.SelectedValue);
        my.FillDropDownTwocmd(cmd, ddlflatno);
        cmd.Dispose();

    }


    protected void btnupdate_Click(object sender, EventArgs e)
        {
        if(ddlissuestatus.SelectedValue=="0")
        {
            my.error(lblIncidentResult);
            lblIncidentResult.Text = "please change Issue status Or Add Employee";
            return;
        }
        

        lblIncidentResult.Text = string.Empty;
        SqlCommand cmd = new SqlCommand("sp_assign_to_emp_tbl_service_req_list");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@emp_id", SqlDbType.NChar, 50).Value = lblEmpid.Text.Trim();
        
        cmd.Parameters.Add("@process_type", SqlDbType.Int).Value = 1;        
        cmd.Parameters.Add("@issue_status", SqlDbType.Int).Value = ddlissuestatus.SelectedValue;
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = lblhide.Text;
        cmd.Parameters.Add("@priority", SqlDbType.Int).Value = ddlPriority.SelectedValue;
        cmd.Parameters.Add("@comments", SqlDbType.NVarChar, 50).Value = "";
        if (ddlissuestatus.SelectedValue == "1" && txtT_Comments.Text != "")
        {
            foreach (GridViewRow gr in grid_incident_list.Rows)
            {
                gr.Cells[9].ForeColor = Color.Red;
            }
           cmd.Parameters.Add("@tehni_comments", SqlDbType.NVarChar, 50).Value = txtT_Comments.Text;
        }

        else
        cmd.Parameters.Add("@tehni_comments", SqlDbType.NVarChar, 50).Value = txtT_Comments.Text;

       int i=  my.insertCmd(cmd);
       if (i == 1)
       {
         //  MyClass.ClearTotalFields(Page.Controls);

           my.successful(lblIncidentResult);
           lblIncidentResult.Text = "<b>GBVSK00000"+lblhide.Text+"</b> incident closed";
           //MyClass.EnableTotalFields(Page.Controls);

           btnIncidentCancel_Click(null, null);
           bind_sms_list();


       }
       else
       {
           my.error(lblIncidentResult);
           lblIncidentResult.Text = "Sorrry Operation Fails";
       }



    }
   
}