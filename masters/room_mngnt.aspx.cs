using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Configuration;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
public partial class masters_room_mngnt : System.Web.UI.Page
{
    helper_class hcls = new helper_class();
    SqlCommand cmdTypeGet = new SqlCommand();

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
            panelFlatAmenity2.Visible = false;
            get_flat_Amenity_details();
            load_aminityforflat_clear();
            
            Panel1.Visible = false;
           // get_flatType_AmenityType_details();
            

            Panel_FlatType_gesig.Visible = false;
           get_flat_desg_details();
         

            PanelFlat.Visible = false;
            get_flat_details();

            panelFloor.Visible = false;
            get_floor_details();

            panelBlock.Visible = false;
            get_block_details();

            panelPocket.Visible = false;

            get_pocket_details();

            panelDesignation.Visible = false;
            get_desig_details();

            PanelFlatType.Visible = false;
            get_flat_type_details();

            load_Flat_Aminity_Pocket_list();
    //        load_chkbl_flatType_list();
            load_Desic_flatType_list();
          //  load_flatType_AmenityType_list();
            load_flat_types_list();
            load_AmenityType_list();
            load_flatFloor_list();
            load_flatPocket_list();
            load_flatBlock_list();
            load_floorPocket_list();
            load_blockPocket_list();


            //ddl_Flat_Aminity_Pocket.Items.Insert(0, new ListItem("--select--", "0"));
           // ddl_Flat_Aminity_Block.Items.Insert(0, new ListItem("--select--", "0"));
          //  ddl_Flat_Aminity_Floor.Items.Insert(0, new ListItem("--select--", "0"));
          //  ddl_Flat_Aminity_FlatType.Items.Insert(0, new ListItem("--select--", "0"));
        }
    }

    private void load_Desic_flatType_list()
    {
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
      //  cmdTypeGet.CommandText = "select desg_name,desg_id from tbl_army_designations_master";
        cmdTypeGet.CommandText = "sp_army_designation_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 6);  // 6 for active desg dropdownlist
        cmdTypeGet.Parameters.AddWithValue("@desg_id", "");
        cmdTypeGet.Parameters.AddWithValue("@desg_name", "");
        cmdTypeGet.Parameters.AddWithValue("@desg_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_DropDown(cmdTypeGet, ddlDesignation);
        cmdTypeGet.Dispose();

    }   
    private void load_chkbl_flatType_list()
    {      
        //cmdTypeGet.Parameters.Clear();
        SqlCommand cmdTypeGet1 = new SqlCommand();

       // cmdTypeGet1.CommandText = "select distinct(pl.prod_name),pl.prod_id, pt.p_type_name,af.status from tbl_available_amenities_for_flat af,tbl_product_list pl,tbl_product_type_master pt,tbl_flat_master fm where af.prod_id=pl.prod_id and pl.prod_type_id=pt.p_type_id and af.prod_type_id=pt.p_type_id and af.flat_id=fm.flat_id";
        cmdTypeGet1.CommandText = "select distinct(prod_name),prod_id from tbl_product_list";
        hcls.Load_CheckBoxList(cmdTypeGet1, chkAmenityType);
        cmdTypeGet1.Dispose();
    }
    private void load_aminityforflat_clear()
    {
        ddl_Flat_Aminity_Block.Items.Clear();
        ddl_Flat_Aminity_Floor.Items.Clear();
        if (!IsPostBack)
        {
            ddl_Flat_Aminity_Block.Items.Insert(0, new ListItem("--select--", "0"));
            ddl_Flat_Aminity_Floor.Items.Insert(0, new ListItem("--select--", "0"));
        }
        //ddl_Flat_Aminity_FlatType.Items.Insert(0, new ListItem("--select--", "0"));
    }
    private void load_chkblist_withflat_list()
    {
        //cmdTypeGet.Parameters.Clear();
        SqlCommand cmdTypeGet1 = new SqlCommand();

        // cmdTypeGet1.CommandText = "select distinct(pl.prod_name),pl.prod_id, pt.p_type_name,af.status from tbl_available_amenities_for_flat af,tbl_product_list pl,tbl_product_type_master pt,tbl_flat_master fm where af.prod_id=pl.prod_id and pl.prod_type_id=pt.p_type_id and af.prod_type_id=pt.p_type_id and af.flat_id=fm.flat_id";
       // cmdTypeGet1.CommandText = "(select distinct(p.prod_name),p.prod_id from tbl_product_list p full outer join  tbl_available_amenities_for_flat a on p.prod_id=a.prod_id where a.flat_id='" + lblFlat_id.Text + "') union all (select distinct(p.prod_name),p.prod_id from tbl_product_list p full outer join  tbl_available_amenities_for_flat a on p.prod_id=a.prod_id where a.status is null)";
        cmdTypeGet1.CommandText = "(select distinct(p.prod_name),p.prod_id from tbl_product_list p full outer join  tbl_available_amenities_for_flat a on p.prod_id=a.prod_id where a.flat_id='" + lblFlat_id.Text + "') union all (select distinct(p.prod_name),p.prod_id from tbl_product_list p full outer join  tbl_available_amenities_for_flat a on p.prod_id=a.prod_id where a.status is null and p.prod_type_id IN(select a.amenity_type_id from tbl_flat_type_amenities a,tbl_flat_master f where f.flat_type_id=a.flat_type_id and f.flat_id='" + lblFlat_id.Text + "'))";

        hcls.Load_CheckBoxList(cmdTypeGet1, chkAmenityType);
        cmdTypeGet1.Dispose();
    }
     
    private void load_flat_types_list()
    {
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_flat_type_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 3);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@flat_type_id", "");
        cmdTypeGet.Parameters.AddWithValue("@flat_type_name", "");
        cmdTypeGet.Parameters.AddWithValue("@flat_type_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
      //  hcls.Load_DropDown(cmdTypeGet, ddl_flat_Type);  //flat type Amenity tab dropdown 
       // cmdTypeGet.Dispose();

        hcls.Load_DropDown(cmdTypeGet, ddl_flat_types); //flat type Amenity tab dropdown 
        cmdTypeGet.Dispose();

        hcls.Load_DropDown(cmdTypeGet, ddlFlat_Type); //flat desig tab dropdown 
        cmdTypeGet.Dispose();

        hcls.Load_DropDown(cmdTypeGet, ddl_flat_flat_type); //flat tab dropdown 
        cmdTypeGet.Dispose();

        hcls.Load_DropDown(cmdTypeGet, ddl_Flat_Aminity_FlatType); // flat aminity tab dropdwon
        cmdTypeGet.Dispose();
      
    }
    string flat_type_id;
    private void load_AmenityType_list()
    {
        
        if (ddl_flat_types.SelectedValue == "0")        
            flat_type_id = "1";        
        else        
            flat_type_id = ddl_flat_types.SelectedValue;
        
     
        cmdTypeGet.Parameters.Clear();
        //cmdTypeGet.CommandText = "select p_type_name, p_type_id from tbl_product_type_master";
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_flat_type_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 7);
        cmdTypeGet.Parameters.AddWithValue("@flat_type_id", flat_type_id);
        cmdTypeGet.Parameters.AddWithValue("@flat_type_name", "");
        cmdTypeGet.Parameters.AddWithValue("@flat_type_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
       // hcls.Load_CheckBoxList(cmdTypeGet, cbl_Amenity_Type);
        cmdTypeGet.Dispose();
        hcls.Load_gridview(cmdTypeGet, grid_Amenity_Type_list);
        cmdTypeGet.Dispose();      
    }    
    private void load_flatFloor_list()
    {
        ddlFloorName_F.Items.Insert(0,new ListItem("--select--","0"));
    }
    private void load_flatBlock_list()
    {
        ddlBlockName_F.Items.Insert(0,new ListItem("--select--","0"));
        ddlBlockname.Items.Insert(0, new ListItem("--select--", "0"));
    }
    
    void pocket_name_and_pocket_id()
    {
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_pocket_master_selections";
        cmdTypeGet.Parameters.AddWithValue("@op_type",2);
        cmdTypeGet.Parameters.AddWithValue("@pocket_id","");
    }
    private void load_Flat_Aminity_Pocket_list()
    {
        //SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        //cmdTypeGet.CommandText = "select pocket_name,pocket_id from tbl_pocket_master";       
        pocket_name_and_pocket_id();
        hcls.Load_DropDown(cmdTypeGet, ddl_Flat_Aminity_Pocket);
        cmdTypeGet.Dispose();
    }
    private void load_flatPocket_list()
    {
        //SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        //cmdTypeGet.CommandText = "select pocket_name,pocket_id from tbl_pocket_master";
        pocket_name_and_pocket_id();
        hcls.Load_DropDown(cmdTypeGet, ddlPocket_Name_F);
        cmdTypeGet.Dispose();      
    }
    private void load_floorPocket_list()
    {
        //SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        //cmdTypeGet.CommandText = "select pocket_name,pocket_id from tbl_pocket_master";
        pocket_name_and_pocket_id();
        hcls.Load_DropDown(cmdTypeGet, ddlPocket_Name);
        cmdTypeGet.Dispose();
    }
    private void load_blockPocket_list()
    {
        //SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        //cmdTypeGet.CommandText = "select pocket_name,pocket_id from tbl_pocket_master";       
        pocket_name_and_pocket_id();
        hcls.Load_DropDown(cmdTypeGet, ddl_Pocketname);
        cmdTypeGet.Dispose();
    }
  
    #region Flat Amenity Master

    //protected void btnCreateNewFlatAmenity_Click(object sender, EventArgs e)
    //{      
    //  //  panelFlatAmenity2.Visible = true;
    //    //pnl_status.Visible = false; 
    //}
    protected void btnFlatNoSave_Click(object sender, EventArgs e)
    {
        DataTable dtAmenity = new DataTable();
        dtAmenity.Columns.Add("s_no", typeof(int));
        dtAmenity.Columns.Add("product_type_id", typeof(int));
        dtAmenity.Columns.Add("product_id", typeof(int));

        int t = 1;

        foreach (ListItem li in chkAmenityType.Items)
        {
            if (li.Selected == true)
            {
                DataRow drD = dtAmenity.NewRow();
                drD["s_no"] = t;
                string p_id = li.Value;
                drD["product_id"] = p_id;
                drD["product_type_id"] = 0;

                dtAmenity.Rows.InsertAt(drD, dtAmenity.Rows.Count);
                t++;
            }
        }
        SqlCommand cmd4 = new SqlCommand();
        cmd4.CommandType = CommandType.StoredProcedure;
        cmd4.CommandText = "sp_amenities_check_for_insertion";
        cmd4.Parameters.AddWithValue("@flat_id", lblFlat_id.Text);
        cmd4.Parameters.AddWithValue("@dtAmenity", dtAmenity);

        DataTable dt = hcls.ExecuteQueryDT(cmd4);
        if (dt.Rows.Count > 0)
        {
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                if (Convert.ToInt32(dt.Rows[j]["req_count"].ToString()) > Convert.ToInt32(dt.Rows[j]["actual_count"].ToString()))
                {
                    FLATAmenityResults.ForeColor = Color.Red;
                    FLATAmenityResults.Text = "Selected flat Type is : " + dt.Rows[j]["flat_type_name"].ToString() + ". Available " + dt.Rows[j]["p_type_name"].ToString() + " are " + dt.Rows[j]["actual_count"].ToString() + " only";
                    return;
                }
            }

        }
        dtAmenity.Dispose();
        dtAmenity.Clear();

        //DataTable dtAmenity = new DataTable();
        //dtAmenity.Columns.Add("s_no", typeof(int));
        //dtAmenity.Columns.Add("product_type_id", typeof(int));
        //dtAmenity.Columns.Add("product_id", typeof(int));

        int i = 1;
        foreach (ListItem li in chkAmenityType.Items)
        {
            if (li.Selected == true)
            {
                DataRow drD = dtAmenity.NewRow();
                drD["s_no"] = i;
                string p_id = li.Value;
                drD["product_id"] = p_id;
                
                  cmdTypeGet.CommandText= "select prod_type_id from tbl_product_list where prod_id=" + p_id;
                 SqlDataReader dr= hcls.ExecuteQueryDR(cmdTypeGet);
                 if (dr.Read())
                 {
                     string s = dr[0].ToString();
                     drD["product_type_id"] = s;                    
                     cmdTypeGet.Dispose();
                     dr.Dispose();
                 }

                dtAmenity.Rows.InsertAt(drD, dtAmenity.Rows.Count);
                i++;
            }
        }
        //if (i == 1)
        //{
        //    FLATAmenityResults.ForeColor = Color.Red;
        //    FLATAmenityResults.Text = "Check at list one CheckBox..";
        //    return;
        //}

        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "Amenity_adding_for_flat";
        if (lblFlat_id.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for inserting
        }
        if (lblFlat_id.Text != "" && ddl_Flat_Aminity_FlatType.SelectedValue != "" && chkAmenityType.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation
        }

        cmdTypeSave.Parameters.AddWithValue("@flat_id", lblFlat_id.Text);
        cmdTypeSave.Parameters.AddWithValue("@Amenities", dtAmenity);
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);


        int k = hcls.master_save(cmdTypeSave);
      //  ConfirmOnF_P_Type.TargetControlID = "btndummyFPType";

        if (k == 1)
        {
         //   chkAmenityType.ClearSelection();
           
            FLATAmenityResults.ForeColor = Color.Green;
            FLATAmenityResults.Text = "Amenity(s) added to the flat..";
            get_flat_Amenity_details();
           // load_chkblist_withflat_list();
        }
        else if (k == 3)
        {
            FLATAmenityResults.ForeColor = Color.Red;
            FLATAmenityResults.Text = "Dublicate Type entry..";
        }
        else
        {
            FLATAmenityResults.ForeColor = Color.Red;
            FLATAmenityResults.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    protected void btnFlatNoClear_Click(object sender, EventArgs e)
    {
       // helper_class.ClearTotalFields(panelFlatAmenity.Controls);
      //  helper_class.ClearTotalFields(panelFlatAmenity2.Controls);
        FLATAmenityResults.Text = "";
       // ddlFlatAmenityStatus.SelectedIndex = 0;
        chkAmenityType.ClearSelection();
     //   img_Flat_Aminity_FlatNo.Visible = false;
       // load_aminityforflat_clear();

    }
    protected void btnFlatNoCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelFlatAmenity2.Controls);
        FLATAmenityResults.Text = "";
        panelFlatAmenity2.Visible = false;
     //   ddlFlatAmenityStatus.SelectedIndex = 0;

    }
    protected void ddl_Flat_Aminity_Pocket_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddl_Flat_Aminity_Block.Items.Clear();
        ddl_Flat_Aminity_Floor.Items.Clear();
        ddl_Flat_Aminity_Floor.Items.Insert(0, new ListItem("--select--", "0"));
        FLATAmenityResults.Text = "";
        lbl_Flat_Aminity_Pocket.Text = ddl_Flat_Aminity_Pocket.SelectedValue;
        block_name_and_id(); //from floor master
        cmdTypeGet.Parameters.AddWithValue("@pocket_id", ddl_Flat_Aminity_Pocket.SelectedValue);
        hcls.Load_DropDown(cmdTypeGet, ddl_Flat_Aminity_Block);
        cmdTypeGet.Dispose();
        get_flat_Amenity_details();
        panelFlatAmenity2.Visible = false;
    }
    protected void ddl_Flat_Aminity_Block_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        ddl_Flat_Aminity_Floor.Items.Clear();
        FLATAmenityResults.Text = "";
        lbl_Flat_Aminity_Block.Text = ddl_Flat_Aminity_Block.SelectedValue;
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandText = "select floor_name,floor_id from tbl_floor_master where floor_status=1 and block_id=" + ddl_Flat_Aminity_Block.SelectedValue;
        hcls.Load_DropDown(cmdTypeGet, ddl_Flat_Aminity_Floor);
        cmdTypeGet.Dispose();
        get_flat_Amenity_details();
        panelFlatAmenity2.Visible = false;

    }
    protected void ddl_Flat_Aminity_Floor_SelectedIndexChanged(object sender, EventArgs e)
    {
        get_flat_Amenity_details();
        panelFlatAmenity2.Visible = false;

       // ddl_Flat_Aminity_FlatType.Items.Clear();
       //lbl_Flat_Aminity_Floor.Text = ddl_Flat_Aminity_Floor.SelectedValue;
       // SqlCommand cmdTypeGet = new SqlCommand();
       // cmdTypeGet.Parameters.Clear();
       // cmdTypeGet.CommandText = "select flat_number,flat_id from tbl_flat_master where status=1 and floor_id=" + ddl_Flat_Aminity_Floor.SelectedValue;
       // hcls.Load_DropDown(cmdTypeGet, ddl_Flat_Aminity_FlatType);
       // cmdTypeGet.Dispose();

    }
    protected void ddl_Flat_Aminity_Flat_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        get_flat_Amenity_details();
        FLATAmenityResults.Text = "";
        panelFlatAmenity2.Visible = false;
        //if (ddl_Flat_Aminity_FlatType.SelectedItem.Value=="0")
        //{
        //    img_Flat_Aminity_FlatNo.Visible = false;
        //}
        //else
        //    img_Flat_Aminity_FlatNo.Visible = true;
      
     //   checkboxlist_selection_items();       
       // get_flat_Amenity_details();
       
      //  pnl_status.Visible = false; 

    }
    private void get_flat_Amenity_details()
    {
        try
        {
            SqlCommand cmdTypeGet = new SqlCommand();
            cmdTypeGet.Parameters.Clear();
           // cmdTypeGet.CommandText = "select distinct(pl.prod_name),af.prod_id,fm.flat_number, pt.p_type_name,af.status from tbl_available_amenities_for_flat af,tbl_product_list pl,tbl_product_type_master pt,tbl_flat_master fm where af.prod_id=pl.prod_id and pl.prod_type_id=pt.p_type_id and af.prod_type_id=pt.p_type_id and af.flat_id=fm.flat_id and af.flat_id=" + ddl_Flat_Aminity_FlatType.SelectedValue;
            cmdTypeGet.CommandType = CommandType.StoredProcedure;
            cmdTypeGet.CommandText = "sp_flat_selection_amenity_list";
            cmdTypeGet.Parameters.AddWithValue("@pocket_id", ddl_Flat_Aminity_Pocket.SelectedValue == "" ? 0 : Convert.ToInt32(ddl_Flat_Aminity_Pocket.SelectedValue));  // 1 for select all type values
            cmdTypeGet.Parameters.AddWithValue("@block_id", ddl_Flat_Aminity_Block.SelectedValue == "" ? 0 : Convert.ToInt32(ddl_Flat_Aminity_Block.SelectedValue));
            cmdTypeGet.Parameters.AddWithValue("@floor_id", ddl_Flat_Aminity_Floor.SelectedValue == "" ? 0 : Convert.ToInt32(ddl_Flat_Aminity_Floor.SelectedValue));
            cmdTypeGet.Parameters.AddWithValue("@flat_type_id", ddl_Flat_Aminity_FlatType.SelectedValue == "" ? 0 : Convert.ToInt32(ddl_Flat_Aminity_FlatType.SelectedValue));
            cmdTypeGet.Parameters.AddWithValue("@flat_id", 0);
            hcls.Load_gridview(cmdTypeGet, grid_Flat_Amenity);
            if (grid_Flat_Amenity.Rows.Count == 0)
            {
                FLATAmenityResults.ForeColor = Color.Red;
                FLATAmenityResults.Text = "There are no Items...";
           //     img_Flat_Aminity_FlatNo.Visible = false;
                lblFlatId.Text = "";
            }
            else
            {
           //     img_Flat_Aminity_FlatNo.Visible = true; 
            }
            cmdTypeGet.Dispose();
        }
        catch
        {

        }
    }
    protected void grid_Flat_Amenity_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_Flat_Amenity.PageIndex = e.NewPageIndex;
        get_flat_Amenity_details();
    }
    protected void grid_Flat_Amenity_DataBound(object sender, EventArgs e)
    {
        if (grid_Flat_Amenity.Rows.Count > 0)
        {
            foreach (GridViewRow gr in grid_Flat_Amenity.Rows)
            {
                if ((gr.FindControl("lbl_flat_prod_Status") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgFlat_prod_Status")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgFlat_prod_Status")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void img_Flat_Aminity_FlatNo_Click(object sender, EventArgs e)  // to edit
     {
         panelFlatAmenity2.Visible = true;
       //  checkboxlist_selection_items();
       //  pnl_status.Visible = false;
    }
    //void checkboxlist_selection_items()
    //{
    //    chkAmenityType.ClearSelection();
    //    FLATAmenityResults.Text = "";
    //    lblFlatId.Text = ddl_Flat_Aminity_FlatType.SelectedValue;

    //    grid_Flat_Amenity.AllowPaging = false;
    //    SqlCommand cmdTypeGet = new SqlCommand();     
    //    cmdTypeGet.CommandText = "select distinct pl.prod_name,af.prod_id,fm.flat_number, pt.p_type_name,af.status from tbl_available_amenities_for_flat af,tbl_product_list pl,tbl_product_type_master pt,tbl_flat_master fm where af.prod_id=pl.prod_id and pl.prod_type_id=pt.p_type_id and af.prod_type_id=pt.p_type_id and af.flat_id=fm.flat_id and af.flat_id=" + ddl_Flat_Aminity_FlatType.SelectedValue;        
    //    hcls.Load_gridview(cmdTypeGet, grid_Flat_Amenity);
    //    cmdTypeGet.Dispose();
    //    foreach (GridViewRow gvRow in grid_Flat_Amenity.Rows)
    //    {
    //        Label userID = gvRow.Cells[2].FindControl("lbl_prod_name") as Label;
    //        for (int k = 0; k < chkAmenityType.Items.Count; k++)
    //        {
    //            if (chkAmenityType.Items[k].Text == userID.Text)
    //            {
    //                chkAmenityType.Items[k].Selected = true;
    //            }
    //        }
    //    }
    //    grid_Flat_Amenity.AllowPaging = true;
    //    SqlCommand cmdTypeGet1 = new SqlCommand();
    //    cmdTypeGet1.CommandText = "select distinct pl.prod_name,af.prod_id,fm.flat_number, pt.p_type_name,af.status from tbl_available_amenities_for_flat af,tbl_product_list pl,tbl_product_type_master pt,tbl_flat_master fm where af.prod_id=pl.prod_id and pl.prod_type_id=pt.p_type_id and af.prod_type_id=pt.p_type_id and af.flat_id=fm.flat_id and af.flat_id=" + ddl_Flat_Aminity_FlatType.SelectedValue;
      
    //    hcls.Load_gridview(cmdTypeGet1, grid_Flat_Amenity);
    //    cmdTypeGet.Dispose();
    //}
    Label lblflat_type_id;
    protected void imgbtnFlatNoEdit_Click(object sender, EventArgs e)
    {     
        panelFlatAmenity2.Visible = true;
        chkAmenityType.ClearSelection();
        FLATAmenityResults.Text = "";
        chkAmenityType.Items.Clear();
        // lblFlatId.Text = ddl_Flat_Aminity_FlatType.SelectedValue;
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;
        lblFlat_id.Text = grid_Flat_Amenity.DataKeys[gr.RowIndex].Value.ToString();
        lblflat_type_id = gr.Cells[1].FindControl("lbl_flat_type_id") as Label;
        load_chkblist_withflat_list();
        
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.CommandText = "select distinct pl.prod_name,af.prod_id,fm.flat_number, pt.p_type_name,af.status from tbl_available_amenities_for_flat af,tbl_product_list pl,tbl_product_type_master pt,tbl_flat_master fm where af.prod_id=pl.prod_id and pl.prod_type_id=pt.p_type_id and af.prod_type_id=pt.p_type_id and af.flat_id=fm.flat_id and af.flat_id=" + lblFlat_id.Text;
        hcls.Load_gridview(cmdTypeGet, Grid_flatsdx);
        cmdTypeGet.Dispose();
        foreach (GridViewRow gvRow in Grid_flatsdx.Rows)
        {
            Label userID = gvRow.Cells[2].FindControl("lbl_prod_id") as Label;
            for (int k = 0; k < chkAmenityType.Items.Count; k++)
            {
                if (chkAmenityType.Items[k].Value == userID.Text)
                {
                    chkAmenityType.Items[k].Selected = true;
                }
            }
        }
        Label lblflatno = gr.Cells[0].FindControl("lbl_flat_flat_number") as Label;
        lbl_flat_number_display.Text = lblflatno.Text;
    }
    protected void imgbtnFlatNoview_Click(object sender, EventArgs e)
    {
        panelView.Visible = true;
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;
        lblFlat_id.Text = grid_Flat_Amenity.DataKeys[gr.RowIndex].Value.ToString();
        // lblFlat_id.Text = (Convert.ToInt32("19")).ToString();
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandText = "select distinct pl.prod_name,af.prod_id,pt.p_type_name,pl.serial_no,af.flat_id from tbl_available_amenities_for_flat af,tbl_product_list pl,tbl_product_type_master pt where af.prod_id=pl.prod_id and pl.prod_type_id=pt.p_type_id and af.prod_type_id=pt.p_type_id and af.flat_id=" + lblFlat_id.Text;
        hcls.Load_gridview(cmdTypeGet, Grid_Popup);
        cmdTypeGet.Dispose();
        popUpView.Show();
        if (Grid_Popup.Rows.Count == 0)
        {
            lbl_pop_result.Visible = true;
            lbl_pop_result.ForeColor = Color.Red;
            lbl_pop_result.Text = "There are no Items in this FLAT";
        }
        else
            lbl_pop_result.Text = "";
    }
    protected void icon_minimise_click(object sender, EventArgs e)
    {
        panelView.Visible = false;
        popUpView.Hide();
    }     
    protected void chkAmenityType_TextChanged(object sender, EventArgs e)
    {

      
        FLATAmenityResults.Text = "checked chang";  
        
    }

    #endregion

    #region Flat Type and Amenity Type Master
    protected void btnCreateNewAmenityType_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        lbl_grid_result.Text = "";
    }
    protected void btnAmenityTypeSave_Click(object sender, EventArgs e)
    {
        DataTable dtAmenity = new DataTable();
        dtAmenity.Columns.Add("s_no", typeof(int));
        dtAmenity.Columns.Add("amenity_type_id", typeof(int));
        dtAmenity.Columns.Add("no_of_amenities", typeof(int));
        int i = 1;
        foreach (GridViewRow gvr in grid_Amenity_Type_list.Rows)
        {
            CheckBox ckbx = gvr.FindControl("chk_Amenity_Type") as CheckBox;
            TextBox txtbx = gvr.FindControl("txt_total_aminities") as TextBox;
            Label lbl = gvr.FindControl("lblProdId") as Label;
            if (ckbx.Checked == true)
            {

                DataRow drD = dtAmenity.NewRow();
                drD["s_no"] = i;               
               // string p_id = lbl.Text;
                drD["amenity_type_id"] = lbl.Text;
                drD["no_of_amenities"] = txtbx.Text == "" ? 0 : Convert.ToInt32(txtbx.Text);  
               
                dtAmenity.Rows.InsertAt(drD, dtAmenity.Rows.Count);              
                i++;
            }
        }

        if (i == 1)
        {
            lbl_grid_result.ForeColor = Color.Red;
            lbl_grid_result.Text = "Check at list one CheckBox..";
            return;
        }

        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_flat_type_Amenity_type";
        if (lbl_flat_Type_id.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for inserting
        }
        if (lbl_flat_Type_id.Text != "" && ddl_flat_types.SelectedValue != "")// && cbl_Amenity_Type.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation
        }
        cmdTypeSave.Parameters.AddWithValue("@flat_type_id", ddl_flat_types.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@Amenities", dtAmenity);
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        int k = hcls.master_save(cmdTypeSave);
        ConfirmOnF_P_Type.TargetControlID = "btndummyFPType";

        if (k == 1)
        {
          //  helper_class.ClearTotalFields(Panel1.Controls);
            lbl_grid_result.ForeColor = Color.Green;
            lbl_grid_result.Text = "Amenities are assigned to FlatType..";
            get_flatType_AmenityType_details();

        }
        else if (k == 3)
        {
            lbl_grid_result.ForeColor = Color.Green;
            lbl_grid_result.Text = "already created...";
        }
        else
        {
            lbl_grid_result.ForeColor = Color.Red;
            lbl_grid_result.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }  

    
    protected void btnAmenityTypeCancel_Click(object sender, EventArgs e)
    {
       // helper_class.ClearTotalFields(Panel1.Controls);
        Panel1.Visible = false;
        lbl_grid_result.Text = "";
    }
    protected void ddl_flat_types_SelectedIndexChanged(object sender, EventArgs e)
    {
        img_btn_AmenityEdit.Visible = true;   
        lbl_grid_result.Text = "";        
        get_flatType_AmenityType_details();
        load_AmenityType_list();
        Panel1.Visible = false;       
    }
    private void get_flatType_AmenityType_details()
    {
        try
        {
            SqlCommand cmdTypeGet = new SqlCommand();
            cmdTypeGet.Parameters.Clear();
            // cmdTypeGet.CommandType = CommandType.StoredProcedure;
            // cmdTypeGet.CommandText = "select FTA.flat_type_id,FTA.amenity_type_id,FTM.flat_type_name,PTM.p_type_name from  tbl_flat_type_amenities FTA,tbl_flat_type_master FTM,tbl_product_type_master PTM where FTA.flat_type_id=FTM.flat_type_id and FTA.amenity_type_id=PTM.p_type_id";
            cmdTypeGet.CommandText = "select FTA.amenity_type_id,FTA.flat_type_id,FTA.no_of_amenities,PTM.p_type_name from tbl_flat_type_amenities FTA,tbl_product_type_master PTM WHERE PTM.p_type_id=FTA.amenity_type_id and fta.flat_type_id=" + ddl_flat_types.SelectedValue;
            //cmdTypeGet.Parameters.AddWithValue("@op_type", 3);  // 1 for select all type values
            //cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
            hcls.Load_gridview(cmdTypeGet, Grid_flatType_AmenityType);

            if (Grid_flatType_AmenityType.Rows.Count > 0)
            {
                //lbl_grid_result.Text = ".......Items Avalable...";
            }
            else
            {
                lbl_grid_result.ForeColor = Color.Red;
                lbl_grid_result.Text = "There are no Items...";
               // img_btn_AmenityEdit.Visible = false;
            }
            cmdTypeGet.Dispose();
        }
        catch
        {

        }
    }
    protected void Grid_Amemity_type_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_flatType_AmenityType.PageIndex = e.NewPageIndex;
        get_flatType_AmenityType_details();
    }
    protected void imgbtnAmenityEdit_Click(object sender, EventArgs e)  // to edit
    {
        img_btn_AmenityEdit_Click(sender, e);
    }  
    protected void img_btn_AmenityEdit_Click(object sender,EventArgs e)
    {
      
        TextBox txt_totalanenity = grid_Amenity_Type_list.FindControl("txt_total_aminities") as TextBox;
        Label lbl_totalanenity = grid_Amenity_Type_list.FindControl("lbl_Amenity_Type_total_list") as Label;

        ConfirmOnF_P_Type.TargetControlID = "btnAmenityTypeSave";
        Panel1.Visible = true;
        lbl_flat_Type_id.Text = ddl_flat_types.SelectedValue;

        Grid_flatType_AmenityType.AllowPaging = false;
        get_flatType_AmenityType_details();
        foreach (GridViewRow gr in grid_Amenity_Type_list.Rows)
        {
            CheckBox chkBx = gr.Cells[1].FindControl("chk_Amenity_Type") as CheckBox;
            Label lbltypename = gr.Cells[2].FindControl("lbl_Amenity_Type_list") as Label;
            chkBx.Checked = false;

            foreach (GridViewRow gvRow in Grid_flatType_AmenityType.Rows)
            {
                Label userID = gvRow.Cells[2].FindControl("lblPTypeName") as Label;
                if (userID.Text == lbltypename.Text)
                {
                    chkBx.Checked = true;
                   
                }
            }
        }
       
        Grid_flatType_AmenityType.AllowPaging = true;    
        get_flatType_AmenityType_details();

    }
    protected void chk_Amenity_Type_checkedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = (GridViewRow)((CheckBox)sender).Parent.Parent;

       // lblPocketIdP.Text = Grid_Pocket.DataKeys[gr.RowIndex].Value.ToString();
        CheckBox cbk = gr.FindControl("chk_Amenity_Type") as CheckBox;
        TextBox txt_totalanenity = gr.FindControl("txt_total_aminities") as TextBox;
        Label lbl_totalanenity = gr.FindControl("lbl_Amenity_Type_total_list") as Label;
        txt_totalanenity.Text = lbl_totalanenity.Text;
        if (cbk.Checked == true)
        {
            txt_totalanenity.Visible = true;
            lbl_totalanenity.Visible = false;
        }
        else 
        {

            lbl_totalanenity.Text = "0";
            txt_totalanenity.Visible = false;
            lbl_totalanenity.Visible = true;

            lbl_grid_result.ForeColor = Color.Red;
            lbl_grid_result.Text = "if You Inactive this <b>Amenity</b> all the <b>Amenities</b> of this <b>Flat Type</b> will be deactivated.. if you  click on Save to continue";
            return;
        }

        
    }
    protected void grid_Amenity_Type_list_RowDataBound(object sender, EventArgs e)
    {
        if (grid_Amenity_Type_list.Rows.Count > 0)
        {
            foreach (GridViewRow gr in grid_Amenity_Type_list.Rows)
            {
                if ((gr.FindControl("lbl_Amenity_Type_total_list") as Label).Text !="0")
                {
                    (gr.FindControl("txt_total_aminities")).Visible = true;
                    (gr.FindControl("lbl_Amenity_Type_total_list")).Visible = false;
                }
                else
                {
                    (gr.FindControl("txt_total_aminities")).Visible = false;
                    (gr.FindControl("lbl_Amenity_Type_total_list")).Visible = true;
                }
            }
        }
    }
    #endregion

    #region Flat Designation Master
  
    protected void btnCreateNewFlat_Desg_Click(object sender, EventArgs e)
    {
        Panel_FlatType_gesig.Visible = true;        
    }
    protected void btnFlat_DesgSave_Click(object sender, EventArgs e)
    {

        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_designation_flat_type_mapping";
        if (lblDesignationId.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
         if (lblDesignationId.Text != "" && ddlDesignation.Text.Trim() != "" && ddlFlat_Type.SelectedValue != "-1")
        {
            

            cmdTypeSave.Parameters.AddWithValue("@op_type", 4);  // 4 for updation
            foreach (GridViewRow row in Grid_Flat_Designation.Rows)
            {
                string s = ((Label)row.FindControl("lblFlatTypeId")).Text;
                if (s == ddlFlat_Type.SelectedValue)
                {
                    if (lblFlat_DesgResult.Text == null || lblFlat_DesgResult.Text == "")
                    {
                        lblFlat_DesgResult.ForeColor = Color.Red;
                        lblFlat_DesgResult.Text = "If you Change here " + ddlDesignation.SelectedItem + " FlatType,This Designation flats FlatType changed ... if You want to proceed, press SAVE.";
                        return;

                    }
                }
            }     
         }
      
        cmdTypeSave.Parameters.AddWithValue("@desg_id", ddlDesignation.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@flat_type_id", ddlFlat_Type.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        ConfirmbtnFlat_DesgSave.TargetControlID = "btndummy2";
        
        int k = hcls.master_save(cmdTypeSave);
        if (k == 1)
        {
            helper_class.ClearTotalFields(Panel_FlatType_gesig.Controls);
            lblFlat_DesgResult.ForeColor = Color.Green;
            lblFlat_DesgResult.Text = "Designation assigned to the FlatType..";
            //ddlFloorStatus.SelectedIndex = 0;
            get_flat_desg_details();
            lblDesignationId.Text = "";            
        }
        else if (k == 3)
        {
            lblFlat_DesgResult.ForeColor = Color.Red;
            lblFlat_DesgResult.Text = "<b>"+ddlDesignation.SelectedItem.ToString().ToUpper() + "</b> is already created..."; //"already created... Type entry..";
        }
        else
        {
            lblFlat_DesgResult.ForeColor = Color.Red;
            lblFlat_DesgResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    private void get_flat_desg_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_designation_flat_type_mapping";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 5);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@desg_id", "");
        cmdTypeGet.Parameters.AddWithValue("@flat_type_id", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_gridview(cmdTypeGet, Grid_Flat_Designation);

        cmdTypeGet.Dispose();
    }
    protected void btnFlat_DesgClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(Panel_FlatType_gesig.Controls);
        ddlDesignation.SelectedIndex = 0;
    }
    protected void btnFlat_DesgCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(Panel_FlatType_gesig.Controls);
        Panel_FlatType_gesig.Visible = false;
    }
    protected void Grid_Flat_Designation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Flat_Designation.PageIndex = e.NewPageIndex;
        get_flat_desg_details();
    }
    protected void Grid_Flat_Designation_DataBound(object sender, EventArgs e)
    {

    }
    protected void imgbtnFlat_DesgEdit_Click(object sender, EventArgs e)  // to edit
    {
        Panel_FlatType_gesig.Visible = true;
        lblFlat_DesgResult.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

        lblDesignationId.Text = Grid_Flat_Designation.DataKeys[gr.RowIndex].Value.ToString();
        ddlDesignation.SelectedValue = (gr.FindControl("lblDesignationId") as Label).Text;  //type id
        ddlFlat_Type.SelectedValue = (gr.FindControl("lblFlatTypeId") as Label).Text;  //type id

        ConfirmbtnFlat_DesgSave.TargetControlID = "btnFlat_DesgSave";

    }
    #endregion

    #region FlatType Master

    protected void btnCreateNewFlatType_Click(object sender, EventArgs e)
    {
        PanelFlatType.Visible = true;
        ddlFlatTypeStatus.SelectedIndex = 0;
    }
    protected void btnFlatTypeSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_flat_type_master_operations";
        if (lbl_FlatType_Id.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lbl_FlatType_Id.Text != "" && txtFlatType.Text.Trim() != "" && ddlFlatTypeStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation

            if (ddlFlatTypeStatus.SelectedValue == "0")
            {
                if (ddlFlatTypeStatus.Text == null || lblFlatTypeResult.Text == "")
                {
                    lblFlatTypeResult.ForeColor = Color.Red;
                    lblFlatTypeResult.Text = "If you Inactivate this <b>FLAT TYPE</b>...,All FLATS which are of this FLAT TYPE will inactivated... if You want to proceed, press SAVE.";
                    return;

                }

            }

        }


        cmdTypeSave.Parameters.AddWithValue("@flat_type_id", lbl_FlatType_Id.Text == "" ? "" : lbl_FlatType_Id.Text);
        cmdTypeSave.Parameters.AddWithValue("@flat_type_name", txtFlatType.Text.Trim().Replace(" ", ""));
        cmdTypeSave.Parameters.AddWithValue("@status", ddlFlatTypeStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@flat_type_desc", txtFlatTypeDescription.Text == "" ? "" : txtFlatTypeDescription.Text);
        cmdTypeSave.Parameters.AddWithValue("@cr_id", "super admin");

        ConfirmbtnFlatTypeSave.TargetControlID = "btndummy4";

        int k = hcls.master_save(cmdTypeSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(PanelFlatType.Controls);
            lblFlatTypeResult.ForeColor = Color.Green;
            lblFlatTypeResult.Text = "Flat Type saved..";
            ddlFlatTypeStatus.SelectedIndex = 0;
            get_flat_type_details();
            lbl_FlatType_Id.Text = "";
            get_flat_details();
            load_flat_types_list();
        }
        else if (k == 3)
        {
            lblFlatTypeResult.ForeColor = Color.Red;
            lblFlatTypeResult.Text = "<b>" + txtFlatType.Text.Trim().ToUpper() + "</b> is already created...";
        }
        else
        {
            lblFlatTypeResult.ForeColor = Color.Red;
            lblFlatTypeResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    protected void btnFlatTypeClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(PanelFlatType.Controls);
        ddlFlatTypeStatus.SelectedIndex = 0;
    }
    protected void btnFlatTypeCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(PanelFlatType.Controls);
        PanelFlatType.Visible = false;
    }
    protected void Grid_FlatType_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_FlatType.PageIndex = e.NewPageIndex;
        get_flat_type_details();
    }
    private void get_flat_type_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_flat_type_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 6);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@flat_type_id", "");
        cmdTypeGet.Parameters.AddWithValue("@flat_type_name", "");
        cmdTypeGet.Parameters.AddWithValue("@flat_type_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_gridview(cmdTypeGet, GridView_FlatType);

        cmdTypeGet.Dispose();
    }
    protected void Grid_FlatType_DataBound(object sender, EventArgs e)
    {
        if (GridView_FlatType.Rows.Count > 0)
        {
            foreach (GridViewRow gr in GridView_FlatType.Rows)
            {
                if ((gr.FindControl("lblFlatTypeStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgFlatTypeStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgFlatTypeStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void imgbtnFlatTypeEdit_Click(object sender, EventArgs e)  // to edit
    {
        PanelFlatType.Visible = true;
        lblFlatTypeResult.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;
        lbl_FlatType_Id.Text = GridView_FlatType.DataKeys[gr.RowIndex].Value.ToString();
        txtFlatType.Text = (gr.FindControl("lblFlatType") as Label).Text;  //type name
        ddlFlatTypeStatus.SelectedValue = (gr.FindControl("lblFlatTypeStatus") as Label).Text;  //type id
        txtFlatTypeDescription.Text = (gr.FindControl("lblFlatTypeDescription") as Label).Text;  //comments


        ConfirmbtnFlatTypeSave.TargetControlID = "btnFlatTypeSave";

    }
    #endregion

    #region Flat Master
    protected void btnCreateNewFlat_Click(object sender, EventArgs e)
    {
        PanelFlat.Visible = true;
        ddl_FlatStatus.SelectedIndex=0;
    }
    protected void btnFlatSave_Click(object sender, EventArgs e)
    {

        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_flat_master_operations";
        if (lblFlatId_F.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblFlatId_F.Text != "" && txtFlatName.Text.Trim() != "" && ddl_FlatStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation
        }
        cmdTypeSave.Parameters.AddWithValue("@flat_id", lblFlatId_F.Text.Trim() == "" ? "" : lblFlatId_F.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@flat_number", txtFlatName.Text.Trim().Replace(" ", ""));
        cmdTypeSave.Parameters.AddWithValue("@status", ddl_FlatStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@flat_type_id", ddl_flat_flat_type.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@floor_id", ddlFloorName_F.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@block_id", ddlBlockName_F.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@pocket_id", ddlPocket_Name_F.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@flat_desc", txtFlatDescription.Text.Trim() == "" ? "" : txtFlatDescription.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        ConfirmbtnFlatSave.TargetControlID = "btndummy3";
       int k= hcls.master_save(cmdTypeSave);
        if (k == 1)
        {
            ddlBlockName_F.Items.Clear();
            ddlBlockName_F.Items.Insert(0, new ListItem("--select--", "0"));
            ddlFloorName_F.Items.Clear();
            ddlFloorName_F.Items.Insert(0, new ListItem("--select--", "0"));

            helper_class.ClearTotalFields(PanelFlat.Controls);
            lblFlatResult.ForeColor = Color.Green;
            lblFlatResult.Text = " Flat saved..";
            ddl_FlatStatus.SelectedIndex = 0;
            get_flat_details();
            //lblFlatResult.Text = "";
        }
        else if (k == 3)
        {
            lblFlatResult.ForeColor = Color.Red;
            lblFlatResult.Text = "<B>" + txtFlatName.Text.Trim().ToUpper() + "</B> already created..."; 
        }
        else
        {
            lblFlatResult.ForeColor = Color.Red;
            lblFlatResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }   
    protected void ddlPocket_Name_F_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlBlockName_F.Items.Clear();
        lblPocketName_F.Text = ddlPocket_Name_F.SelectedValue;
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        //cmdTypeGet.CommandText = "select block_name,block_id from tbl_block_master where pocket_id=" + ddlPocket_Name_F.SelectedValue;
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_block_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type",4);
        cmdTypeGet.Parameters.AddWithValue("@block_id", "");
        cmdTypeGet.Parameters.AddWithValue("@pocket_id", ddlPocket_Name_F.SelectedValue);
        cmdTypeGet.Parameters.AddWithValue("@block_name", "");
        cmdTypeGet.Parameters.AddWithValue("@block_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@block_status", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_date", "");

        hcls.Load_DropDown(cmdTypeGet, ddlBlockName_F);
        cmdTypeGet.Dispose();
    }
    protected void ddlBlockName_F_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlFloorName_F.Items.Clear();
        lblBlockName_F.Text = ddlBlockName_F.SelectedValue;
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandText = "select floor_name,floor_id from tbl_floor_master where floor_status=1 and block_id=" + ddlBlockName_F.SelectedValue;
        hcls.Load_DropDown(cmdTypeGet, ddlFloorName_F);
        cmdTypeGet.Dispose();
    }
    protected void btnFlatClear_Click(object sender, EventArgs e)
    {
        ddlBlockName_F.Items.Clear();
        ddlBlockName_F.Items.Insert(0, new ListItem("--select--", "0"));
        ddlFloorName_F.Items.Clear();
        ddlFloorName_F.Items.Insert(0, new ListItem("--select--", "0"));

        helper_class.ClearTotalFields(PanelFlat.Controls);
        ddl_FlatStatus.SelectedIndex = 0;
    }
    protected void btnFlatCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(PanelFlat.Controls);
        PanelFlat.Visible = false;
    }
    protected void Grid_Flat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Flat.PageIndex = e.NewPageIndex;
        get_flat_details();
    }
    private void get_flat_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        // cmdTypeGet.CommandType = CommandType.StoredProcedure;
        //cmdTypeGet.CommandText = "select * from tbl_flat_master";
        cmdTypeGet.CommandText = "select * from tbl_flat_master F,tbl_floor_master FR,tbl_block_master B,tbl_pocket_master P,tbl_flat_type_master ftm where P.pocket_id=B.pocket_id and B.block_id=FR.block_id and FR.floor_id=F.floor_id  and ftm.flat_type_id=F.flat_type_id";
        //cmdTypeGet.CommandText = "sp_pocket_master_selections";

        //cmdTypeGet.Parameters.AddWithValue("@op_type", 1);  // 1 for select all type values
        //cmdTypeGet.Parameters.AddWithValue("@pocket_id", "");
        //cmdTypeGet.Parameters.AddWithValue("@type_name", "");
        //cmdTypeGet.Parameters.AddWithValue("@status", "");
        //cmdTypeGet.Parameters.AddWithValue("@comments", "");
        //cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_gridview(cmdTypeGet, Grid_Flat);

        cmdTypeGet.Dispose();
    }
    protected void Grid_Flat_DataBound(object sender, EventArgs e)
    {
        if (Grid_Flat.Rows.Count > 0)
        {
            foreach (GridViewRow gr in Grid_Flat.Rows)
            {
                if ((gr.FindControl("lblFlatStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgFlatStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgFlatStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void imgbtnFlatEdit_Click(object sender, EventArgs e)  // to edit
    {
        try
        {
            PanelFlat.Visible = true;
            lblFlatResult.Text = "";
            GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

            lblFlatId_F.Text = Grid_Flat.DataKeys[gr.RowIndex].Value.ToString();
            txtFlatName.Text = (gr.FindControl("lblFlatNumber") as Label).Text;  //type name
            ddl_FlatStatus.SelectedValue = (gr.FindControl("lblFlatStatus") as Label).Text;  //type id     
            ddlPocket_Name_F.SelectedValue = (gr.FindControl("lbl_pocket_id") as Label).Text;


            //-------- Load Block List------//
            // SqlCommand cmdTypeGet = new SqlCommand();
            cmdTypeGet.Parameters.Clear();
            //cmdTypeGet.CommandType = CommandType.StoredProcedure;
            // cmdTypeGet.CommandText = "select block_name,block_id from tbl_block_master where pocket_id=" + ddlPocket_Name_F.SelectedValue;
            block_name_and_id();
            cmdTypeGet.Parameters.AddWithValue("@pocket_id", ddlPocket_Name_F.SelectedValue);
            hcls.Load_DropDown(cmdTypeGet, ddlBlockName_F);
            cmdTypeGet.Dispose();
            //---------end----------//

            ddlBlockName_F.SelectedValue = (gr.FindControl("lbl_Block_Id") as Label).Text;


            //-------- Load Block List------//        
            SqlCommand cmdTypeGet1 = new SqlCommand();
            cmdTypeGet1.Parameters.Clear();
            //cmdTypeGet.CommandType = CommandType.StoredProcedure;
            cmdTypeGet1.CommandText = "select floor_name,floor_id from tbl_floor_master where floor_status=1 and block_Id=" + ddlBlockName_F.SelectedValue;
            hcls.Load_DropDown(cmdTypeGet1, ddlFloorName_F);
            cmdTypeGet1.Dispose();
            //---------end----------//

            ddlFloorName_F.SelectedValue = (gr.FindControl("lbl_floor_Id") as Label).Text;
            txtFlatDescription.Text = (gr.FindControl("lblFlatDescription") as Label).Text;  //comments
            ddl_flat_flat_type.SelectedValue = (gr.FindControl("lblFlat_flattype_id") as Label).Text;
            ConfirmbtnFlatSave.TargetControlID = "btnFlatSave";
        }
        catch (Exception ex)
        {

            string strconfirm = "<script LANGUAGE='JavaScript' >alert('This FLOOR status is InActive...')</script>";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", strconfirm, false);
            helper_class.ClearTotalFields(PanelFlat.Controls);
            ddl_FlatStatus.SelectedIndex = 0;
        }
    }
    #endregion

    #region Floor Master

    protected void btnCreateNewFloor_Click(object sender, EventArgs e)
    {
        panelFloor.Visible = true;
        ddlFloorStatus.SelectedIndex = 0;
    }
    protected void btnFloorSave_Click(object sender, EventArgs e)
    {
      
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_floor_master_operations";
        if (lblFloorIdF.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblFloorIdF.Text != "" && txtFloorName.Text.Trim() != "" && ddlFloorStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation

            if (ddlFloorStatus.SelectedValue == "0")
            {
                if (lblFloorResult.Text == null || lblFloorResult.Text == "")
                {
                    if (ddlFloorStatus.SelectedValue != lblFloor_Status_Comp.Text && ddlFloorStatus.SelectedValue == "0")
                    {

                        lblFloorResult.ForeColor = Color.Red;
                        lblFloorResult.Text = "If you Inactivate this <b>FLOOR</b>...,All FLATS which are in this FLOORS will inactivated... if You want to proceed, press SAVE.";
                        return;
                    }
                }

            }
        }
        cmdTypeSave.Parameters.AddWithValue("@floor_id", lblFloorIdF.Text.Trim() == "" ? "" : lblFloorIdF.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@floor_name", txtFloorName.Text.Trim().Replace(" ", ""));
        cmdTypeSave.Parameters.AddWithValue("@floor_status", ddlFloorStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@block_id", ddlBlockname.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@pocket_id", ddlPocket_Name.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@flloor_desc", txtDescriptionF.Text.Trim() == "" ? "" : txtDescriptionF.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        //cmdTypeSave.Parameters.AddWithValue("@cr_date", "");

        ConfirmbtnFloorSave.TargetControlID = "btndummy5";

        int k = hcls.master_save(cmdTypeSave);
        

        if (k == 1)
        {
            ddlBlockname.Items.Clear();
            ddlBlockname.Items.Insert(0, new ListItem("--select--", "0"));
           
            helper_class.ClearTotalFields(panelFloor.Controls);
            lblFloorResult.ForeColor = Color.Green;
            lblFloorResult.Text = "Floor saved..";
            ddlFloorStatus.SelectedIndex = 0;
            get_floor_details();
            lblFloorIdF.Text = "";

            get_flat_details();   //flat table grid....

        }
        else if (k == 3)
        {
            lblFloorResult.ForeColor = Color.Red;
            lblFloorResult.Text = "<B>" + txtFloorName.Text.Trim().ToUpper() + "</B> already created...";
        }
        else
        {
            lblFloorResult.ForeColor = Color.Red;
            lblFloorResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    private void get_floor_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        //cmdTypeGet.CommandType = CommandType.StoredProcedure;
        //cmdTypeGet.CommandText = "select F.floor_id,F.floor_name,F.floor_status,B.block_id,B.block_name,P.pocket_id,P.pocket_name,F.flloor_desc from tbl_floor_master F,tbl_block_master B,tbl_pocket_master P where P.pocket_id=B.pocket_id and B.block_id=F.block_id";

        cmdTypeGet.CommandText = "select * from tbl_floor_master F,tbl_block_master B,tbl_pocket_master P where P.pocket_id=B.pocket_id and B.block_id=F.block_id";

        // cmdTypeGet.CommandText = "sp_pocket_master_selections";

        ////cmdTypeGet.Parameters.AddWithValue("@op_type", 1);  // 1 for select all type values
        ////cmdTypeGet.Parameters.AddWithValue("@pocket_id", "");
        ////cmdTypeGet.Parameters.AddWithValue("@type_name", "");
        ////cmdTypeGet.Parameters.AddWithValue("@status", "");
        ////cmdTypeGet.Parameters.AddWithValue("@comments", "");
        ////cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_gridview(cmdTypeGet, grid_Floor);

        cmdTypeGet.Dispose();
    }
    protected void pocketFlrSelectedIndexChanged(object sender, EventArgs e)
    {
        ddlBlockname.Items.Clear();
        lblPocketIdF.Text = ddlPocket_Name.SelectedValue;
        //cmdTypeGet.CommandText = "select block_name,block_id from tbl_block_master where pocket_id=" + ddlPocket_Name.SelectedValue;       
        block_name_and_id();
        cmdTypeGet.Parameters.AddWithValue("@pocket_id", ddlPocket_Name.SelectedValue);
        hcls.Load_DropDown(cmdTypeGet, ddlBlockname);
        cmdTypeGet.Dispose();
        
    }
    void block_name_and_id()
    {
      //  SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
         cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_block_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 4);
        cmdTypeGet.Parameters.AddWithValue("@block_id", "");
        cmdTypeGet.Parameters.AddWithValue("@block_name", "");
        cmdTypeGet.Parameters.AddWithValue("@block_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@block_status", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_date", "");
       
    }
    protected void btnFloorClear_Click(object sender, EventArgs e)
    {
        ddlBlockname.Items.Clear();
        ddlBlockname.Items.Insert(0, new ListItem("--select--", "0"));

        helper_class.ClearTotalFields(panelFloor.Controls);
        ddlFloorStatus.SelectedIndex = 0;
        ddlBlockname.ClearSelection();
    }
    protected void btnFloorCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelFloor.Controls);
        panelFloor.Visible = false;
    }
    protected void grid_Floor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_Floor.PageIndex = e.NewPageIndex;
        get_floor_details();
    }
    protected void grid_Floor_DataBound(object sender, EventArgs e)
    {
        if (grid_Floor.Rows.Count > 0)
        {
            foreach (GridViewRow gr in grid_Floor.Rows)
            {
                if ((gr.FindControl("lblFloorStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgFloorStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgFloorStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void imgbtnFloorEdit_Click(object sender, EventArgs e)  // to edit
    {
        //if()
        //{
        //string strconfirm = "<script LANGUAGE='JavaScript' >alert('This Packet is InActiveted...')</script>";
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", strconfirm, false);
        //helper_class.ClearTotalFields(panelBlock.Controls);
        //return;
        //}
        try
        {

        panelFloor.Visible = true;
        lblFloorResult.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

        string s1=(gr.FindControl("lbl_pocketId") as Label).Text;
        string s2=(gr.FindControl("lbl_BlockId") as Label).Text;
        lblFloorIdF.Text = grid_Floor.DataKeys[gr.RowIndex].Value.ToString();
        txtFloorName.Text = (gr.FindControl("lblFloorName") as Label).Text;  //type name
        ddlFloorStatus.SelectedValue = (gr.FindControl("lblFloorStatus") as Label).Text;
        lblFloor_Status_Comp.Text = (gr.FindControl("lblFloorStatus") as Label).Text;  
        ddlPocket_Name.SelectedValue = (gr.FindControl("lbl_pocketId") as Label).Text;

        //-------- Load Block List------//       
       // cmdTypeGet.CommandText = "select block_name,block_id from tbl_block_master where pocket_id=" + ddlPocket_Name.SelectedValue;
        block_name_and_id();
        cmdTypeGet.Parameters.AddWithValue("@pocket_id", ddlPocket_Name.SelectedValue);
        hcls.Load_DropDown(cmdTypeGet, ddlBlockname);
        cmdTypeGet.Dispose();

        //---------end----------//


        ddlBlockname.SelectedValue = (gr.FindControl("lbl_BlockId") as Label).Text;
        txtDescriptionF.Text = (gr.FindControl("lblFloorDescription") as Label).Text;  //comments

        ConfirmbtnFloorSave.TargetControlID = "btnFloorSave";
        }
        catch (Exception ex)
        {

            string strconfirm = "<script LANGUAGE='JavaScript' >alert('This BLOCK status is InActive...')</script>";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", strconfirm, false);
            btnFloorClear_Click(sender, e);

        }
    }
    #endregion

    #region Block Master
    protected void btnCreateNewBlock_Click(object sender, EventArgs e)
    {
        panelBlock.Visible = true;
        ddlBlockStatus.SelectedIndex = 0;
        //SqlCommand cmdTypeGet = new SqlCommand();
      //  cmdTypeGet.Parameters.Clear();
        //cmdTypeGet.CommandText = "select pocket_name,pocket_id from tbl_pocket_master";
     //   pocket_name_and_pocket_id();
     //  hcls.Load_DropDown(cmdTypeGet, ddl_Pocketname);
     //   cmdTypeGet.Dispose();
    }
    protected void ddl_Pocketname_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbl_PocketId.Text = ddl_Pocketname.SelectedValue;        
    }
    protected void btnBlockSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_block_master_operations";
        if (lbl_BlockId.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lbl_BlockId.Text != "" && txt_BlockName.Text.Trim() != "" && ddlBlockStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation

            if (ddlBlockStatus.SelectedValue == "0")
            {
                if (lblBlockDisplay.Text == null || lblBlockDisplay.Text == "")
                {
                    if (ddlBlockStatus.SelectedValue != lbl_BlockStatus_comp.Text && ddlBlockStatus.SelectedValue == "0")
                    {

                        lblBlockDisplay.ForeColor = Color.Red;
                        lblBlockDisplay.Text = "If you Inactivate this <b>BLOCK</b>....,All FLOORS  and FLATS which are in this BLOCK will inactivated... if You want to proceed, press SAVE.";
                        return;
                    }
                }
           
            }
        }

      
        cmdTypeSave.Parameters.AddWithValue("@block_id", lbl_BlockId.Text.Trim() == "" ? "" : lbl_BlockId.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@block_name", txt_BlockName.Text.Trim().Replace(" ", ""));
        cmdTypeSave.Parameters.AddWithValue("@block_status", ddlBlockStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@pocket_id", lbl_PocketId.Text);
        cmdTypeSave.Parameters.AddWithValue("@block_desc", txtBlockDescription.Text.Trim() == "" ? "" : txtBlockDescription.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        cmdTypeSave.Parameters.AddWithValue("@cr_date", "");

        ConfirmbtnBlockSave.TargetControlID = "btndummy6";

        int k = hcls.master_save(cmdTypeSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(panelBlock.Controls);
            lblBlockDisplay.ForeColor = Color.Green;
            lblBlockDisplay.Text = "Block saved..";
            ddlBlockStatus.SelectedIndex = 0;
            get_block_details();
            lbl_BlockId.Text = "";


            get_floor_details();  //floor table grid...
            get_flat_details();   //flat table grid....
        }
        else if (k == 3)
        {
            lblBlockDisplay.ForeColor = Color.Red;
            lblBlockDisplay.Text = "<B>" + txt_BlockName.Text.Trim().ToUpper() + "</B> already created...";
        }
        else
        {
            lblBlockDisplay.ForeColor = Color.Red;
            lblBlockDisplay.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    private void get_block_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
         cmdTypeGet.CommandType = CommandType.StoredProcedure;        
        cmdTypeGet.CommandText = "sp_block_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type",3);
        cmdTypeGet.Parameters.AddWithValue("@block_id", "");
        cmdTypeGet.Parameters.AddWithValue("@block_name", "");
        cmdTypeGet.Parameters.AddWithValue("@block_status", "");
        cmdTypeGet.Parameters.AddWithValue("@pocket_id", "");
        cmdTypeGet.Parameters.AddWithValue("@block_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_date", "");
        hcls.Load_gridview(cmdTypeGet, Grid_Block);

        cmdTypeGet.Dispose();
    }
    protected void btnBlockClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelBlock.Controls);
        ddlBlockStatus.SelectedIndex = 0;
    }
    protected void btnBlockCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelBlock.Controls);
        panelBlock.Visible = false;
    }
    protected void Grid_Block_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Block.PageIndex = e.NewPageIndex;
        get_block_details();
    }
    protected void Grid_Block_DataBound(object sender, EventArgs e)
    {
        if (Grid_Block.Rows.Count > 0)
        {
            foreach (GridViewRow gr in Grid_Block.Rows)
            {
                if ((gr.FindControl("lblBlockStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgBlockStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgBlockStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void imgbtnBlockEdit_Click(object sender, EventArgs e)  // to edit
    {
        try
        {
            panelBlock.Visible = true;
            lblBlockDisplay.Text = "";
            GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

            lbl_BlockId.Text = Grid_Block.DataKeys[gr.RowIndex].Value.ToString();
            txt_BlockName.Text = (gr.FindControl("lblBlockName") as Label).Text;  //type name
            ddlBlockStatus.SelectedValue = (gr.FindControl("lblBlockStatus") as Label).Text;
            lbl_BlockStatus_comp.Text = (gr.FindControl("lblBlockStatus") as Label).Text;  
            ddl_Pocketname.SelectedValue = (gr.FindControl("lblPocketid2") as Label).Text;  //type id

            // lblBlockDisplay.Text = (gr.FindControl("lblPocketid2") as Label).Text;

            txtBlockDescription.Text = (gr.FindControl("lblBlockDescription") as Label).Text;  //comments

            ConfirmbtnBlockSave.TargetControlID = "btnBlockSave";
        }
        catch (Exception ex)
        {
            
                string strconfirm="<script LANGUAGE='JavaScript' >alert('This PACKET status is InActiveted...')</script>";
                ScriptManager.RegisterClientScriptBlock(this,this.GetType(), "", strconfirm, false);
                btnBlockClear_Click(sender, e);
           
        }
    }
    #endregion

    #region Pocket Master
    protected void btnCreateNewPocket_Click(object sender, EventArgs e)
    {
        panelPocket.Visible = true;
        ddlPocketStatus.SelectedIndex = 0;
    }
    protected void btnPocketSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_pocket_master_operations";
        if (lblPocketIdP.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblPocketIdP.Text != "" && txt_PocketName.Text.Trim() != "" && ddlPocketStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation

            if (ddlPocketStatus.SelectedValue == "0")
            {
                if(lblPocketResult.Text == null || lblPocketResult.Text == "")
                {
                    if (ddlPocketStatus.SelectedValue != lblPocket_Status_Comp.Text && ddlPocketStatus.SelectedValue=="0")
                    {
                        lblPocketResult.ForeColor = Color.Red;
                        lblPocketResult.Text = "If you Inactivate this <b>POCKET</b>..., All BLOCKS, FLOORS and FLATS which are in this POCKET will inactivated... if You want to proceed, press SAVE.";
                        return;
                    }
                }
             //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirmation", "if(confirm('If you Inactivate this Pocket..., All Blocks, Floors  and flats which are in this Pocket will be inactivated...You want to proceed...?')==true){ConfirmFunction();}", true);

                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirmation", "ConfirmEdit()", true);

                //if (Request.Form["confirm_value"] == "0")
                //{
                //    return;
                //}
            }

        }
        cmdTypeSave.Parameters.AddWithValue("@pocket_id", lblPocketIdP.Text.Trim() == "" ? "" : lblPocketIdP.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@pocket_name", txt_PocketName.Text.Trim().Replace(" ", ""));
        cmdTypeSave.Parameters.AddWithValue("@status", ddlPocketStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@address_1", txtAddress1.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@address_2", txtAddress2.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@city", txtCity.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@state", txtState.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@country", txtCountry.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@pincode", txtPincode.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@pocket_desc", txtPocketDescription.Text.Trim() == "" ? "" : txtPocketDescription.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        ConfirmbtnPocketSave.TargetControlID = "btndummy7";

        int k = hcls.master_save(cmdTypeSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(panelPocket.Controls);
            lblPocketResult.ForeColor = Color.Green;
            lblPocketResult.Text = "Pocket saved..";
            ddlPocketStatus.SelectedIndex = 0;
            get_pocket_details();
            lblPocketIdP.Text = "";


            get_block_details();  //block table grid...
            get_floor_details();  //floor table grid...
            get_flat_details();   //flat table grid....



            //pocket list Dropdown for BLOCK  start.....
            load_blockPocket_list();
            helper_class.ClearTotalFields(panelBlock.Controls);
            ddlBlockStatus.SelectedIndex = 0;
            //pocket list Dropdown for Block End//

            //pocket list Dropdown for FLOOR start.....
            load_floorPocket_list();
            helper_class.ClearTotalFields(panelFloor.Controls);
            ddlFloorStatus.SelectedIndex = 0;
            //pocket list Dropdown for FLOOR End//

            //pocket list Dropdown for FLAT start.....
            load_flatPocket_list();
            helper_class.ClearTotalFields(PanelFlat.Controls);
            ddl_FlatStatus.SelectedIndex = 0;
            //pocket list Dropdown for FLAT End//

            //flat aminity pocket Dropdown list START
            load_Flat_Aminity_Pocket_list();
            //flat aminity pocket Dropdown list END
            
        }
        else if (k == 3)
        {
            lblPocketResult.ForeColor = Color.Red;
            lblPocketResult.Text = "<b>" + txt_PocketName .Text.Trim().ToUpper()+ "</b> is already created...";
        }
        else
        {
            lblPocketResult.ForeColor = Color.Red;
            lblPocketResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    protected void btnPocketClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelPocket.Controls);
        ddlPocketStatus.SelectedIndex = 0;

    }
    protected void btnPocketCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelPocket.Controls);
        panelPocket.Visible = false;
    }
    private void get_pocket_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
       cmdTypeGet.CommandType = CommandType.StoredProcedure;
        cmdTypeGet.CommandText = "sp_pocket_master_operations";
        cmdTypeGet.Parameters.AddWithValue("@op_type", 3);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@pocket_id", "");
        cmdTypeGet.Parameters.AddWithValue("@pocket_name", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@address_1", "");
        cmdTypeGet.Parameters.AddWithValue("@address_2", "");
        cmdTypeGet.Parameters.AddWithValue("@city", "");
        cmdTypeGet.Parameters.AddWithValue("@state", "");
        cmdTypeGet.Parameters.AddWithValue("@country", "");
        cmdTypeGet.Parameters.AddWithValue("@pincode", "");
        cmdTypeGet.Parameters.AddWithValue("@pocket_desc", "");
        cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_gridview(cmdTypeGet, Grid_Pocket);

        cmdTypeGet.Dispose();
    }
    protected void Grid_Pocket_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Pocket.PageIndex = e.NewPageIndex;
        get_pocket_details();
    }
    protected void Grid_Pocket_DataBound(object sender, EventArgs e)
    {
        if (Grid_Pocket.Rows.Count > 0)
        {
            foreach (GridViewRow gr in Grid_Pocket.Rows)
            {
                if ((gr.FindControl("lblPocketStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgPocketStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgPocketStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void imgbtnPocketEdit_Click(object sender, EventArgs e)  // to edit
    {
        panelPocket.Visible = true;
        lblPocketResult.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

        lblPocketIdP.Text = Grid_Pocket.DataKeys[gr.RowIndex].Value.ToString();
        txt_PocketName.Text = (gr.FindControl("lblPocketName") as Label).Text;  
        ddlPocketStatus.SelectedValue = (gr.FindControl("lblPocketStatus") as Label).Text;
        lblPocket_Status_Comp.Text = (gr.FindControl("lblPocketStatus") as Label).Text;  
        txtAddress1.Text = (gr.FindControl("lblAddress1") as Label).Text;
        txtAddress2.Text = (gr.FindControl("lblAddress2") as Label).Text;
        txtCity.Text = (gr.FindControl("lblCity") as Label).Text;
        txtState.Text = (gr.FindControl("lblState") as Label).Text;
        txtCountry.Text = (gr.FindControl("lblCountry") as Label).Text;
        txtPincode.Text = (gr.FindControl("lblPincode") as Label).Text;
        txtPocketDescription.Text = (gr.FindControl("lblPocketDescription") as Label).Text;  //comments
      
       ConfirmbtnPocketSave.TargetControlID = "btnPocketSave";

    }
    #endregion

    #region Designation Master
    protected void btnCreateNewDesig_Click(object sender, EventArgs e)
    {
        panelDesignation.Visible = true;
        ddlDesigStatus.SelectedIndex = 0;
    }
    protected void btnDesigSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "sp_army_designation_master_operations";
        if (lblDesigId.Text == "")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        }
        if (lblDesigId.Text != "" && txtDesig.Text.Trim() != "" && ddlDesigStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 2);  // 2 for updation
           // btnDesigSave.OnClientClick = "return UserUpdateConfirmation();";
           // ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "UserUpdateConfirmation();", true);
        }
        cmdTypeSave.Parameters.AddWithValue("@desg_id", lblDesigId.Text.Trim() == "" ? "" : lblDesigId.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@desg_name", txtDesig.Text.Trim().Replace(" ",""));
        cmdTypeSave.Parameters.AddWithValue("@status", ddlDesigStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@desg_desc", txtDesigDescription.Text.Trim() == "" ? "" : txtDesigDescription.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@cr_id", HttpContext.Current.User.Identity.Name);

        ConfirmbtnDesigSave.TargetControlID = "btndummy9"; // btndummy button in PanelFlatType

        int k = hcls.master_save(cmdTypeSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(panelDesignation.Controls);
            lblDesgDisplay.ForeColor = Color.Green;
            lblDesgDisplay.Text = "Designation saved..";
            ddlDesigStatus.SelectedIndex = 0;
            get_desig_details();
            lblDesigId.Text = "";

            //Flat Designation Master  START***
            load_Desic_flatType_list();
            get_flat_desg_details();
            //Flat Designation Master END***
        }
        else if (k == 3)
        {
            lblDesgDisplay.ForeColor = Color.Red;
            lblDesgDisplay.Text ="<b>"+ txtDesig.Text.ToUpper()+"</b> is already created...";
        }
        else
        {
            lblDesgDisplay.ForeColor = Color.Red;
            lblDesgDisplay.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    private void get_desig_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
         cmdTypeGet.CommandType = CommandType.StoredProcedure;
       cmdTypeGet.CommandText = "sp_army_designation_master_operations";
       cmdTypeGet.Parameters.AddWithValue("@op_type", 3);  // 1 for select all type values
       cmdTypeGet.Parameters.AddWithValue("@desg_id", "");
       cmdTypeGet.Parameters.AddWithValue("@desg_name", "");
       cmdTypeGet.Parameters.AddWithValue("@desg_desc", "");
       cmdTypeGet.Parameters.AddWithValue("@status", "");
       cmdTypeGet.Parameters.AddWithValue("@cr_id", "");
        hcls.Load_gridview(cmdTypeGet, Grid_Desig);

        cmdTypeGet.Dispose();
    }
    protected void btnDesigClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelDesignation.Controls);
        ddlDesigStatus.SelectedIndex = 0;
    }
    protected void btnDesigCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelDesignation.Controls);
        panelDesignation.Visible = false;
    }
    protected void Grid_Desig_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Desig.PageIndex = e.NewPageIndex;
        get_desig_details();

    }
    protected void Grid_Desig_DataBound(object sender, EventArgs e)
    {
        if (Grid_Desig.Rows.Count > 0)
        {
            foreach (GridViewRow gr in Grid_Desig.Rows)
            {
                if ((gr.FindControl("lblDesigStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgDesigStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgDesigStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void imgbtnDesigEdit_Click(object sender, EventArgs e)  // to edit
    {

        panelDesignation.Visible = true;
        lblDesgDisplay.Text = "";
        GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

        lblDesigId.Text = Grid_Desig.DataKeys[gr.RowIndex].Value.ToString();
        txtDesig.Text = (gr.FindControl("lblDesigName") as Label).Text;  //type name
        ddlDesigStatus.SelectedValue = (gr.FindControl("lblDesigStatus") as Label).Text;  //type id
        txtDesigDescription.Text = (gr.FindControl("lblDesigDescription") as Label).Text;  //comments

        ConfirmbtnDesigSave.TargetControlID = "btnDesigSave"; 


    }
    #endregion

    protected void Tab_Index_Changed(object sender, EventArgs e)
    {
        try
        {          
                helper_class.ClearTotalFields(Container_Rooms.ActiveTab.Controls);
        }
        catch(Exception ex)
        { }
    }
}