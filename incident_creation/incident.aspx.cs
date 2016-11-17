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
            btnIncidentSave.Visible = true;

        SqlCommand cmd=new SqlCommand();
        //my.FillDropDownTwocmd(cmd,ddlflatno);
        //cmd.Dispose();
        bind_sms_list();
       // my.FillDropDownTwo("SELECT [flat_number], [flat_id] FROM [tbl_flat_master] where status=1", ddlflatno);
        cmd = new SqlCommand("SELECT  [service_name],[service_id] from [tbl_flat_services] where status=1");
        my.FillDropDownTwocmd(cmd, ddlissuecode);
        cmd.CommandText = "SELECT er.[emp_name],er.[emp_id] FROM emp_reg_design erd,emp_reg er where erd.emp_id=er.emp_id and erd.design_id=14";
        my.FillDropDownTwocmd(cmd, ddlemp);

        cmd = new SqlCommand("select pocket_name,pocket_id from tbl_pocket_master where status=1");
        my.FillDropDownTwocmd(cmd, ddl_Pocket);
        creatstimer();
        }
    }

    protected void btnIncidentSave_Click(object sender, EventArgs e)
    {
        string date= DateTime.Now.ToString();
        //@priority_type int,@subject varchar(max)
        insert_service_req("0",date, ddlflatno.SelectedItem.Text, ddlissuecode.SelectedValue, txtDescription.Text, "+91"+txtphno.Text, int.Parse(ddlMode.SelectedValue),ddlPriority.SelectedIndex ,txtsuject.Text);

    }
    protected void btnNewIncident_Click(object sender, EventArgs e)
    {
        panelIncidents.Visible = true;
        btnIncidentClear_Click(null, null);
        ddlemp.Visible = false;
        tdassign.Visible = false;
     //   txtDescription.Width=200PX;

    }
    protected void grid_edit_click(object sender, EventArgs e)
    {
        lblIncidentResult.Text = "";
        btnIncidentSave.Visible = false;
        btnupdate.Visible = true;
        panelIncidents.Visible = true;

        if (HttpContext.Current.User.IsInRole("14"))
        {
            btnIncidentClear.Visible = false;
            ddlemp.Visible = false;
            tdassign.Visible = false;
        }
        else
        {
            btnIncidentClear.Visible = true;
        }
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
      
        ddlissuestatus.DataSource = Li;
        ddlissuestatus.DataTextField = "Value";
            ddlissuestatus.DataValueField="key";
        ddlissuestatus.DataBind();

        ddlissuestatus.SelectedValue = grid_incident_list.DataKeys[row.DataItemIndex]["issuestatus_id"].ToString();
        ddlMode.SelectedValue = grid_incident_list.DataKeys[row.DataItemIndex]["req_type_id"].ToString();
        ddlMode.Enabled=false;
        txtsuject.Text = ((Label)row.FindControl("lblSubject")).Text;
        txtsuject.Enabled = false;
        lblFlat_id.Text = grid_incident_list.DataKeys[row.DataItemIndex]["Flat_id"].ToString();
        load_txt_Addr();
        ddlissuecode.SelectedValue = grid_incident_list.DataKeys[row.DataItemIndex]["code"].ToString();
        ddlissuecode.Enabled = false;
        txtphno.Text =  ((Label)row.FindControl("lblphone_no")).Text.Remove(0,3);
        txtphno.Enabled = false;
        ddlPriority.SelectedValue = grid_incident_list.DataKeys[row.DataItemIndex]["priority_type_id"].ToString();
        string emp_id = grid_incident_list.DataKeys[row.DataItemIndex]["emp_id"].ToString();
       
        if(string.IsNullOrEmpty(emp_id))
        {
       ddlemp.SelectedValue="0";
       ddlemp.Visible = false;
       tdassign.Visible = false;
           }
        else
	{
        try
        {
            ddlemp.SelectedValue = emp_id.Trim();
        }
        catch (Exception)
        {

            ddlemp.SelectedValue = "0";
            my.error(lblIncidentResult);
            lblIncidentResult.Text = "Sorry Employee Not Available";
        }
        
	}

        txtDescription.Text = ((Label)row.FindControl("lblDesc")).Text;
        lblhide.Text = grid_incident_list.DataKeys[row.DataItemIndex]["auto_id"].ToString();



    }
    protected void btnIncidentClear_Click(object sender, EventArgs e)
    {
        
        
        lblIncidentResult.Text=string.Empty;

        MyClass.ClearTotalFields(Page.Controls);
        my.Enablecntrl(panelIncidents);
        btnupdate.Visible = false;
        btnIncidentSave.Visible = true;
      //  MyClass.EnableTotalFields(Page.Controls);
        ddlMode.Enabled = true;
        
        ddlissuecode.Enabled = true;
        ddlflatno.Enabled = true;

        ddlissuestatus.Items.Clear();
        Dictionary<string, string> Li = new Dictionary<string, string>();
        Li.Add("0", "Open");
         Li.Add("1", "On Hold");
         Li.Add("2", "Resolved");
         Li.Add("3", "Closed");
     
    
      
        ddlissuestatus.DataSource = Li;
        ddlissuestatus.DataTextField = "Value";
            ddlissuestatus.DataValueField="key";
        ddlissuestatus.DataBind();
    }
    protected void btnIncidentCancel_Click(object sender, EventArgs e)
    {
        lblIncidentResult.Text = "";
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
    protected void insert_service_req(string ID, string crdate, string roomno, string code, string desc, string phoneno, int req_typeid,int prioryty_type,string subject)
    {
        string reqno = "", sms_port_no = "COM28";
        int replaystatus = 0;
        string desc1 = "";
        lblFlat_id.Text = ddlflatno.SelectedValue;
        SqlCommand cmdid = new SqlCommand("[cust_req_no]", consql);
        cmdid.Parameters.Add("@prefix", SqlDbType.NVarChar,100).Value="";


        cmdid.Parameters.Add("@op_type", SqlDbType.Int).Value=3;
        cmdid.Parameters.Add("@status", SqlDbType.Int).Value = 0;
        cmdid.Parameters.Add("@sms_port",SqlDbType.NVarChar,100).Value="";
        cmdid.Parameters.Add("@replay", SqlDbType.Int).Value = 0;
        cmdid.Parameters.Add("@description", SqlDbType.NVarChar, 100).Value = "";
        cmdid.Parameters.Add("@id", SqlDbType.Int).Value = 0;
                
        cmdid.CommandType = CommandType.StoredProcedure;
        if (consql.State == ConnectionState.Closed)
            consql.Open();
        SqlDataReader dr = cmdid.ExecuteReader();
        while (dr.Read())
        {
            reqno = dr[0].ToString();
            replaystatus = int.Parse(dr[1].ToString());
            desc1 = dr[2].ToString();
            sms_port_no = dr[3].ToString().Trim();
        }

        if (consql.State == ConnectionState.Open)
            consql.Close();
        dr.Close();
        cmdid.Dispose();
        cmdid.Parameters.Clear();




        bool status;
        if (replaystatus == 1)
        {
            try
            {
                creatstimer();
                
                SMS sm = new SMS(sms_port_no);
                
                sm.Opens();
                status = sm.sendSMS(phoneno.ToString().Remove(0, 3), desc1 + reqno);
                sm.Closes();
                if (status)
                {

                }
                else
                {
                    replaystatus = 0;  // throw new Exception("Message is not sent");
                }
            }
            catch (IOException ex)
            {

                throw new Exception("please goto Control Panel\\Hardware and Sound and select Divice Manager in that select Modams Expand Rt+click select Properties in that select advace tab select Advanced Port setting inthat find port no "+ex.Message);
            }
         
                replaystatus = 0;



            
        }


        SqlCommand cmdinsert = new SqlCommand("sp_insert_tbl_service_req_list");

        cmdinsert.Connection = consql;
        // trns = consql.BeginTransaction();
        // cmdid.Transaction = trns;
        cmdinsert.CommandType = CommandType.StoredProcedure;
        if (consql.State == ConnectionState.Closed)
            consql.Open();
        cmdinsert.Parameters.Add("@smsid", SqlDbType.Int).Value = ID.Trim();
        cmdinsert.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Parse(crdate).ToString("yyyy-MM-dd HH:mm:ss");
        cmdinsert.Parameters.Add("@Flat_id", SqlDbType.Int).Value = Convert.ToInt32(lblFlat_id.Text);
        cmdinsert.Parameters.Add("@roomno", SqlDbType.NVarChar, 50).Value = roomno.ToString().Trim();
        cmdinsert.Parameters.Add("@code", SqlDbType.NVarChar, 50).Value = code.ToString().Trim();
        cmdinsert.Parameters.Add("@description", SqlDbType.NVarChar, 50).Value = desc.Trim();
        cmdinsert.Parameters.Add("@phoneno", SqlDbType.NVarChar, 50).Value = phoneno.ToString().Trim();
        cmdinsert.Parameters.Add("@reqno", SqlDbType.NVarChar, 50).Value = reqno.Trim(); ;
        cmdinsert.Parameters.Add("@replay_status", SqlDbType.Int).Value = replaystatus;
        cmdinsert.Parameters.Add("@req_type", SqlDbType.Int).Value = req_typeid;
        cmdinsert.Parameters.Add("@priority_type", SqlDbType.Int).Value = prioryty_type;
        cmdinsert.Parameters.Add("@subject", SqlDbType.VarChar, 500).Value = subject;
        cmdinsert.Parameters.Add("@tr_user", SqlDbType.VarChar, 500).Value = HttpContext.Current.User.Identity.Name; 


        // int,@subject varchar(max)
    int i=    cmdinsert.ExecuteNonQuery();
        if (consql.State == ConnectionState.Closed)
            consql.Close();
        my.successful(lblIncidentResult);
  lblIncidentResult.Text = "</br> incident created on id <b>" + reqno+"</b>";
  MyClass.ClearTotalFields(Page.Controls);
  bind_sms_list();
        //trns.Commit();

    }

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



                        insert_service_req(item["id"].ToString().Trim(), item["datatime"].ToString().Trim(), smstext[0].ToString().Trim(), smstext[1].ToString().Trim(), desc.Trim(), item["phonenumber"].ToString().Trim(), 4,2,"sms");


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
                btnNewIncident.Visible = true;
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
                ddlemp.Enabled = false;
                trassign.Visible = true;
                
                grid_incident_list.Columns[14].Visible = false;
                btnNewIncident.Visible = false;

            }
            SqlCommand cmdid = new SqlCommand("sp_get_tbl_service_req_list", consql);
            cmdid.CommandType = CommandType.StoredProcedure;
            if (desi_id == "14")
            {
                cmdid.Parameters.Add("@op_type", SqlDbType.BigInt).Value = 2;
            }
            else
            cmdid.Parameters.Add("@op_type", SqlDbType.BigInt).Value = 1;

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
        if(ddlissuestatus.SelectedValue=="0" || ddlemp.SelectedValue=="0")
        {
            my.error(lblIncidentResult);
            lblIncidentResult.Text = "please change Issue status Or Add Employee";
            return;
        }
        lblIncidentResult.Text = string.Empty;
        SqlCommand cmd = new SqlCommand("sp_assign_to_emp_tbl_service_req_list");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@emp_id", SqlDbType.NChar, 50).Value = ddlemp.SelectedValue;
        cmd.Parameters.Add("@issue_status", SqlDbType.Int).Value = ddlissuestatus.SelectedValue;
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = lblhide.Text;
        cmd.Parameters.Add("@priority", SqlDbType.Int).Value = ddlPriority.SelectedValue;


       int i=  my.insertCmd(cmd);
       if (i == 1)
       {
         //  MyClass.ClearTotalFields(Page.Controls);

           my.successful(lblIncidentResult);
           lblIncidentResult.Text = "Operation Done Successfully";
           //MyClass.EnableTotalFields(Page.Controls);

           btnIncidentClear_Click(null, null);
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