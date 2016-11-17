using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class sup_admn_Employee_report_status : System.Web.UI.Page
{
    helper_class hcls = new helper_class();
    SqlCommand cmdTypeGet = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection cn=new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select distinct(dm.designation_name),COUNT(erg.design_id)as total from designation_master dm,emp_reg_design erg where erg.design_id=dm.designation_id group by erg.design_id,dm.designation_name", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ListBox01.DataSource = ds.Tables[0];
        ListBox01.DataTextField = "designation_name";
        ListBox01.DataValueField = "total";
        ListBox01.DataBind();        
        databind();
        txtSearch.Focus();
    }
    private void databind()
    {
        cmdTypeGet.CommandText = "select e.emp_id,e.emp_name,dm.designation_name,e.father_name,e.dateofbirth,e.gender,e.present_address,e.contact_no1 from emp_reg e,designation_master dm,emp_reg_design er where er.emp_id=e.emp_id and er.design_id=dm.designation_id";
        hcls.Load_gridview(cmdTypeGet, grid_employees);
        cmdTypeGet.Dispose();
    }
    protected void grid_incident_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_employees.PageIndex = e.NewPageIndex;
        databind();
    }
    protected void grid_incident_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in grid_employees.Rows)
        {
            
          if (((Label)gr.FindControl("lblgender")).Text == "1")
            {
              ((Label)gr.FindControl("lblgender")).Text = "Male";
            }
            else
            {
              ((Label)gr.FindControl("lblgender")).Text = "Female";
            }

       }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        cmdTypeGet.CommandText = "select e.emp_id,e.emp_name,dm.designation_name,e.father_name,e.dateofbirth,e.gender,e.present_address,e.contact_no1 from emp_reg e,designation_master dm,emp_reg_design er where er.emp_id=e.emp_id and er.design_id=dm.designation_id and (dm.designation_name like '" + txtSearch.Text + "%' or e.emp_name like '" + txtSearch.Text + "%' or e.dateofbirth like '" + txtSearch.Text + "%' or e.father_name like '" + txtSearch.Text + "%' or e.present_address like '" + txtSearch.Text + "%' or e.contact_no1 like '" + txtSearch.Text + "%')";
        hcls.Load_gridview(cmdTypeGet, grid_employees);

        cmdTypeGet.Dispose();
    }
}