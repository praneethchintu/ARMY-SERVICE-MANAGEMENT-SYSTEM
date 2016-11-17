using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.IO;

public partial class sup_admn_Requests : System.Web.UI.Page
{
    helper_class hcls = new helper_class();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            panelRequests.Visible = false;
            get_request_details();


        }
    }

    #region Request Master
    //protected void btnCreateNewRequest_Click(object sender, EventArgs e)
    //{
    //    panelRequests.Visible = true;

    //}
    protected void btnRequestSave_Click(object sender, EventArgs e)
    {

        lblRequestResult.Text = string.Empty;
        if (ddlSMSReply.SelectedValue == "1")
        {
            SMS sss = new SMS("COM" + txtSMSPort.Text);
            try
            {
                sss.Opens();
            }
            catch (System.IO.IOException ex)
            {
                lblRequestResult.ForeColor = System.Drawing.Color.Red;
                lblRequestResult.Text = "Sorry Operation Failed Due To Device Not Found on port no COM" + txtSMSPort.Text;
                return;
            }
        }
                                      
        SqlCommand cmdTypeSave = new SqlCommand();
        cmdTypeSave.Parameters.Clear();
        cmdTypeSave.CommandType = CommandType.StoredProcedure;
        cmdTypeSave.CommandText = "cust_req_no";
        //if (lblPrefixId.Text == "")
        //{
        //    cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 1 for insertion
        //}
        if (lblPrefixId.Text != "" && txtPrefix.Text.Trim() != "" && ddlRequestStatus.SelectedValue != "-1")
        {
            cmdTypeSave.Parameters.AddWithValue("@op_type", 1);  // 2 for updation
        }
        cmdTypeSave.Parameters.AddWithValue("@id", lblPrefixId.Text.Trim() == "" ? "" : lblPrefixId.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@prefix", txtPrefix.Text.Trim().ToUpper());
        cmdTypeSave.Parameters.AddWithValue("@status", ddlRequestStatus.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@replay", ddlSMSReply.SelectedValue);
        cmdTypeSave.Parameters.AddWithValue("@sms_port", txtSMSPort.Text.Trim());
        cmdTypeSave.Parameters.AddWithValue("@description", txtRequestDescription.Text.Trim() == "" ? "" : txtRequestDescription.Text.Trim());

        ConfirmbtnRequestSave.TargetControlID = "btndummyRequest";

        int k = hcls.master_save(cmdTypeSave);

        if (k == 1)
        {
            helper_class.ClearTotalFields(panelRequests.Controls);
            lblRequestResult.ForeColor = Color.Green;
            lblRequestResult.Text = "Request saved..";
            ddlRequestStatus.SelectedIndex = 0;
            ddlSMSReply.SelectedIndex = 0;
            get_request_details();
            lblPrefixId.Text = "";
        }
        else if (k == 3)
        {
            lblRequestResult.ForeColor = Color.Red;
            lblRequestResult.Text = "<b>" + txtPrefix.Text.ToUpper() + "</b> is Duplicate Type entry..";
        }
        else
        {
            lblRequestResult.ForeColor = Color.Red;
            lblRequestResult.Text = "not saved.. try again..";
        }
        cmdTypeSave.Dispose();
    }
    private void get_request_details()
    {
        SqlCommand cmdTypeGet = new SqlCommand();
        cmdTypeGet.Parameters.Clear();
        cmdTypeGet.CommandType = CommandType.StoredProcedure;
        // cmdTypeGet.CommandText = "select P.p_type_id,P.p_type_name,P.status,T.type_id,T.type_name,C.cat_id,C.cat_name,P.comments from tbl_product_type_master P,tbl_type_master T,tbl_prod_category_master C where P.cat_id=C.cat_id and P.type_id=T.type_id";
        cmdTypeGet.CommandText = "cust_req_no";

        cmdTypeGet.Parameters.AddWithValue("@op_type",2);  // 1 for select all type values
        cmdTypeGet.Parameters.AddWithValue("@id", "");
        cmdTypeGet.Parameters.AddWithValue("@prefix", "");
        cmdTypeGet.Parameters.AddWithValue("@status", "");
        cmdTypeGet.Parameters.AddWithValue("@replay", "");
        cmdTypeGet.Parameters.AddWithValue("@sms_port", "");
        cmdTypeGet.Parameters.AddWithValue("@description", "");
       

        hcls.Load_gridview(cmdTypeGet, Grid_Request);
        cmdTypeGet.Dispose();
    }
    protected void btnRequestClear_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelRequests.Controls);
        ddlRequestStatus.SelectedIndex = 0;
        ddlSMSReply.SelectedIndex = 0;
        lblRequestResult.Text = String.Empty;
    }
    protected void btnRequestCancel_Click(object sender, EventArgs e)
    {
        helper_class.ClearTotalFields(panelRequests.Controls);
        panelRequests.Visible = false;
    }

    protected void Grid_Request_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Request.PageIndex = e.NewPageIndex;
        get_request_details();

    }
    protected void Grid_Request_DataBound(object sender, EventArgs e)
    {
        if (Grid_Request.Rows.Count > 0)
        {
            foreach (GridViewRow gr in Grid_Request.Rows)
            {
                if ((gr.FindControl("lblRequestStatus") as Label).Text == "1")
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgRequestStatus")).ImageUrl = "~/img/green.gif";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)gr.FindControl("imgRequestStatus")).ImageUrl = "~/img/red.gif";
                }
            }
        }
    }
    protected void imgbtnRequestEdit_Click(object sender, EventArgs e)  // to edit
    {
            panelRequests.Visible = true;
            lblRequestResult.Text = "";
            GridViewRow gr = (GridViewRow)((ImageButton)sender).Parent.Parent;

            lblPrefixId.Text = Grid_Request.DataKeys[gr.RowIndex].Value.ToString();
            txtPrefix.Text = (gr.FindControl("lblPrefix") as Label).Text;  //type name
            ddlRequestStatus.SelectedValue = (gr.FindControl("lblRequestStatus") as Label).Text;  //type id
            ddlSMSReply.SelectedValue = Grid_Request.DataKeys[gr.RowIndex]["replay"].ToString(); //Convert.ToString((gr.FindControl("lblSMSReply") as Label).Text);
            txtSMSPort.Text = (gr.FindControl("lblSMSPort") as Label).Text;
            txtRequestDescription.Text = (gr.FindControl("lblRequestDescription") as Label).Text;  //comments

           ConfirmbtnRequestSave.TargetControlID = "btnRequestSave";
      
    }
    #endregion
    protected void txtSMSPort_TextChanged(object sender, EventArgs e)
    {
        lblRequestResult.Text = string.Empty;
        if ( ddlSMSReply.SelectedValue=="1")
        {
            SMS sss = new SMS("COM" + txtSMSPort.Text);
            try
            {
                sss.Opens();
                sss.Closes();
            }
            catch (IOException ex)
            {
                lblRequestResult.ForeColor = System.Drawing.Color.Red;
                   lblRequestResult.Text = "please goto Control Panel\\Hardware and Sound and select Divice Manager in that select Modams Expand Rt+click select Properties in that select advace tab select Advanced Port setting inthat find  port " + ex.Message;
               // throw new Exception(" + ex.Message);
                return;
            }
         


            //catch (System.IO.IOException ex)
            //{
            //    
                
            //}
        }
    }
    protected void ddlSMSReply_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtSMSPort.Text))
        {
            lblRequestResult.Text = string.Empty;
        
        }
        else
        {
            if (ddlSMSReply.SelectedValue == "1")
            {
                SMS sss = new SMS("COM" + txtSMSPort.Text);
                try
                {
                    sss.Opens();
                }
                catch (System.IO.IOException ex)
                {
                    lblRequestResult.ForeColor = System.Drawing.Color.Red;
                    lblRequestResult.Text = "Device Not Found on port no COM" + txtSMSPort.Text;
                    return;
                }
            }
            else {

                lblRequestResult.Text = string.Empty;
            }

        }
    }
}