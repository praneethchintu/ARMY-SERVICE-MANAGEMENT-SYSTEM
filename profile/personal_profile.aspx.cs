using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Text.RegularExpressions;


public partial class sales_personal_profile : System.Web.UI.Page
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
           Load_personal_details();
        
         //CalendarExtender1.StartDate = System.DateTime.Today;
            //CalendarExtender2.StartDate = System.DateTime.Today;
            //CalendarExtender3.StartDate = System.DateTime.Today;
            //CalendarExtender4.StartDate = System.DateTime.Today;
        }       
    }


    private void Load_personal_details()
    {
        SqlCommand cmdEmpDetails = new SqlCommand();
        cmdEmpDetails.CommandType = CommandType.StoredProcedure;
        cmdEmpDetails.CommandText = "ep_personal_info";
        cmdEmpDetails.Parameters.AddWithValue("@emp_id", HttpContext.Current.User.Identity.Name);
        
        DataTable dtDetails = hcls.ExecuteQueryDT(cmdEmpDetails);
       

        if (dtDetails.Rows.Count > 0)
        {
            lblEmpName.Text = dtDetails.Rows[0]["emp_name"].ToString();

            lblGender.Text = Convert.ToInt32(dtDetails.Rows[0]["gender"].ToString()) == 1 ? "Male" : "Female";
            lblDOB.Text = Convert.ToDateTime(dtDetails.Rows[0]["dateofbirth"].ToString()).Date.ToString("yyyy MMMM dd");
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
            for(int j=0;j<words.Length;j++)
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
}