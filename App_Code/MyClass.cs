using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.IO;
using System.Text;

using System.Web.UI;
using System.Web.UI.HtmlControls;
/// <summary>
/// Summary description for MyClass
/// </summary>
public class MyClass
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ToString());
    SqlCommand cmd;

    public static string connectionString
    {
        get { return ConfigurationManager.ConnectionStrings["constring"].ToString(); }
    }
    public void Enablecntrl(System.Web.UI.Control ctrl)
    {
        foreach (System.Web.UI.Control ctrls in ctrl.Controls)
        {
            if (ctrls is TextBox)
            {
                TextBox t = ctrls as TextBox;
                if (t != null)
                {
                    t.Enabled = true;
                }
            }
            else if (ctrl is DropDownList)
            {
                DropDownList drop = ctrl as DropDownList;
                if (drop != null)
                {
                    drop.Enabled = true;
                }

            }
            else
            {
                if (ctrls.Controls.Count > 0)
                {
                    ClearTextBox(ctrls);
                }
            }

        }
    }
    public void ClearTextBox(System.Web.UI.Control ctrl)
    {
        foreach (System.Web.UI.Control ctrls in ctrl.Controls)
        {
            if (ctrls is TextBox)
            {
                TextBox t = ctrls as TextBox;
                if (t != null)
                {
                    t.Text = string.Empty;
                }
            }
            else
            {
                if (ctrls.Controls.Count > 0)
                {
                    ClearTextBox(ctrls);
                }
            }
        }
    }

    public static void PrintWebControl(Control ControlToPrint)
    {
        StringWriter stringWrite = new StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
        if (ControlToPrint is WebControl)
        {
            Unit w = new Unit(100, UnitType.Percentage);
            ((WebControl)ControlToPrint).Width = w;
        }
       
        Page pg = new Page();
        pg.EnableEventValidation = false;
        HtmlForm frm = new HtmlForm();
        pg.Controls.Add(frm);
        frm.Attributes.Add("runat", "server");
        //frm.Controls.Add(ControlToPrint);
       
        pg.DesignerInitialize();
        pg.RenderControl(htmlWrite);
        string strHTML = stringWrite.ToString();
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Write(strHTML);
        HttpContext.Current.Response.Write("<script>window.print();</script>");
        HttpContext.Current.Response.End();
    }

    public int FillDropDown(string str, DropDownList drp)
    { 
    try{
   
            SqlCommand cmd1 = new SqlCommand(str, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataSet dsEvents = new DataSet();
            da1.Fill(dsEvents, "dd");
            con.Close();
            drp.Items.Clear();
            drp.AppendDataBoundItems = true;
           
            if (dsEvents.Tables[0].Rows.Count > 0)
            {
                drp.DataSource = dsEvents.Tables[0];
                drp.DataTextField = dsEvents.Tables[0].Columns[0].ColumnName;
                //drp.DataValueField=dsEvents.Tables[0].Columns[1].ColumnName;
                drp.DataBind();
            }
            drp.Items.Insert(0, new ListItem("--Select--", "0"));
           drp.Items[0].Value = "0";
            drp.SelectedIndex = 0;


            return 1;
             
        }
    catch(Exception ex)
    {
        throw ex;

      
    }
    
    
    }

    public int FillDropDownTwo(string str, DropDownList drp)
    {
        try
        {
            SqlCommand cmd1 = new SqlCommand(str, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataSet dsEvents = new DataSet();
            da1.Fill(dsEvents, "dd");
            con.Close();
            drp.Items.Clear();
            drp.AppendDataBoundItems = true;

            if (dsEvents.Tables[0].Rows.Count > 0)
            {
                drp.DataSource = dsEvents.Tables[0];
                drp.DataTextField = dsEvents.Tables[0].Columns[0].ColumnName;
                drp.DataValueField = dsEvents.Tables[0].Columns[1].ColumnName;
                drp.DataBind();
            }
            drp.Items.Insert(0, new ListItem("--Select--", "0"));
            drp.Items[0].Value = "0";
            drp.SelectedIndex = 0;


            return 1;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public int FillDropDownTwocmd(SqlCommand cmd1, DropDownList drp)
    {
        try
        {
            //SqlCommand cmd1 = new SqlCommand(str, con);
            cmd1.Connection = con;
            if (con.State == ConnectionState.Closed) ;
                con.Open();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataSet dsEvents = new DataSet();
            da1.Fill(dsEvents, "dd");
            con.Close();
            drp.Items.Clear();
            drp.AppendDataBoundItems = true;

            if (dsEvents.Tables[0].Rows.Count > 0)
            {
                drp.DataSource = dsEvents.Tables[0];
                drp.DataTextField = dsEvents.Tables[0].Columns[0].ColumnName;
                drp.DataValueField = dsEvents.Tables[0].Columns[1].ColumnName;
                drp.DataBind();
            }
            drp.Items.Insert(0, new ListItem("--Select--", "0"));
            drp.Items[0].Value = "0";
            drp.SelectedIndex = 0;


            return 1;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void fillchbx(string str, CheckBoxList ckbx)
    {
        ckbx.AppendDataBoundItems = true;

        // chkList.Items.Add("--Select Vendor Type--");
        String strQuery4 = str;
        SqlCommand cmd4 = new SqlCommand();
        cmd4.CommandType = CommandType.Text;
        cmd4.CommandText = strQuery4;
        cmd4.Connection = con;
        ckbx.Items.Clear();
        ckbx.AppendDataBoundItems = true;
        try
        {
            con.Open();
           DataSet ds=new DataSet();
           SqlDataAdapter da = new SqlDataAdapter(cmd4);
           da.Fill(ds, "tab");
           if (ds.Tables[0].Rows.Count > 0)
           {
               ckbx.DataSource = ds.Tables[0];
               

               ckbx.DataTextField = ds.Tables[0].Columns[0].ColumnName;// "filename";
               ckbx.DataBind();
           }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }



    }

    public void fillchbxcmd(SqlCommand cmd, CheckBoxList ckbx)
    {
        ckbx.AppendDataBoundItems = true;

        // chkList.Items.Add("--Select Vendor Type--");
      
        cmd.CommandType = CommandType.Text;
        
        ckbx.Items.Clear();
        ckbx.AppendDataBoundItems = true;
        try
        {
            
            if(con.State==ConnectionState.Closed)
            con.Open();

            DataSet ds = new DataSet();
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "tab");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ckbx.DataSource = ds.Tables[0];


                ckbx.DataTextField = ds.Tables[0].Columns[0].ColumnName;// "filename";
                ckbx.DataValueField = ds.Tables[0].Columns[1].ColumnName;// "filename";
                ckbx.DataBind();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
          //  con.Dispose();
        }



    }

    public int LoginCheck(SqlCommand cmd)
    {
        


        cmd.Connection = con;
        if (con.State == ConnectionState.Closed)
            con.Open();

        int i = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        cmd.Dispose();
        return i;


    }

    public DataSet Select(SqlCommand cmd)
    {
        cmd.Connection = con;
        
        if (con.State == ConnectionState.Closed)
            con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Tab");
        con.Close();
        return ds;
    
    
    }  

    public int delete(string str)
    {
        try
        {
            cmd = new SqlCommand(str, con);

            if (con.State == ConnectionState.Closed)
                con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return i;
        }
        catch (SqlException ex1)
        {
            return 0;
        }
        //finally
        //{
        //}
    
    }

    public int insertCmd(SqlCommand cmd1)
    {
        try
        {
         
            cmd1.Connection = con;
            if (con.State == ConnectionState.Closed)
                con.Open();
            // cmd.CommandText=cmd;
            int i = cmd1.ExecuteNonQuery();
            con.Close();
            cmd1.Dispose();
            return i;
        }

        catch (SqlException ex)
        {
            return 0;

        }

        catch (Exception ex)
        {

            return 3;
        }
        //finally
        //{

        //}
    }

    public int insert(string str)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            cmd = new SqlCommand(str, con);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return i;
        }

        catch (SqlException ex)
        {
            return 2;

        }
        catch (Exception ex)
        {

            return 3;
        }
    }

    public object GetScalarValue(SqlCommand cmd)
    {
        if (con.State != ConnectionState.Open)
            con.Open();
        cmd.Connection = con;

        try
        {

            object obj = cmd.ExecuteScalar();
            cmd.Dispose();
            return obj;
        }
        catch (SqlException ex)
        {
            object obj = (object)ex.Message;

            return obj;

        }
        finally
        {

            if (con.State != ConnectionState.Closed)
                con.Close();
        }
      
    }

    public DataSet GrdBind(string str)
    {
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ToString());
        if (con1.State == ConnectionState.Closed)
            con1.Open();
        cmd = new SqlCommand(str, con1);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Tab");
        return ds;    
    
    
    }

    public decimal total(DataTable dt, string field)
    {
        decimal debit2 = 0;
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            decimal debit = 0;

            debit = Convert.ToDecimal(dt.Rows[i][field]);
            debit2 = debit + debit2;

        }
        return debit2;


    }

    public static string Encrypt(string pstrText, string key)
    {
        // string pstrEncrKey = "Srikanth";
        //string pstrEncrKey = key;
        byte[] byKey = { };
        byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
        byKey = System.Text.Encoding.UTF8.GetBytes(key.Substring(0, 8));
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        byte[] inputByteArray = Encoding.UTF8.GetBytes(pstrText);
        MemoryStream ms = new MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();
        return Convert.ToBase64String(ms.ToArray());
    }

    public static string Decrypt(string pstrText, string key)
    {
        pstrText = pstrText.Replace(" ", "+");
        //string pstrDecrKey = "Srikanth";
        //string pstrDecrKey = "1239;[pewGKG)srikanth";
        byte[] byKey = { };
        byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
        byte[] inputByteArray = new byte[pstrText.Length];

        byKey = System.Text.Encoding.UTF8.GetBytes(key.Substring(0, 8));
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        inputByteArray = Convert.FromBase64String(pstrText);
        MemoryStream ms = new MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);
        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();
        System.Text.Encoding encoding = System.Text.Encoding.UTF8;
        return encoding.GetString(ms.ToArray());
    }

    public string getRole(SqlCommand cmd)
    {
        SqlDataReader dr;
        string Role = "";
        cmd.Connection = con;
        if (con.State == ConnectionState.Closed)
            con.Open();
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Role = dr["Role"].ToString();

        }
        con.Close();
        return Role;
    }

    public int Scalar(string str)
    {
        cmd = new SqlCommand(str,con);
        if (con.State == ConnectionState.Closed)
            con.Open();
        int count =Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        cmd.Dispose();
        return count;
    
    
    }

   public Boolean  ChckDate(string MfdDate,string ExDate)
   {
    DateTime Mfddate1 =DateTime.ParseExact(MfdDate,"dd/MM/yyyy",System.Globalization.CultureInfo.CurrentCulture);
    DateTime ExpDate = DateTime.ParseExact(ExDate, "dd/MM/yyyy", System.Globalization.CultureInfo.CurrentCulture);

        if (Mfddate1 < ExpDate)
        {
            return true;
        }
        else {

            return false;
        }
   
   
   }

       public static void ClearTotalFields(ControlCollection pageControls)
{
foreach (Control contl in pageControls)
{
string strCntName = (contl.GetType()).Name;
switch (strCntName)
{
case "TextBox":
TextBox tbSource = (TextBox)contl;
tbSource.Text = "";
break;
case "RadioButtonList":
RadioButtonList rblSource = (RadioButtonList)contl;
rblSource.SelectedIndex = -1;
break;
case "DropDownList":
DropDownList ddlSource = (DropDownList)contl;
ddlSource.SelectedIndex = -1;
break;
case "ListBox":
ListBox lbsource = (ListBox)contl;
lbsource.SelectedIndex = -1;
break;
}
ClearTotalFields(contl.Controls);
}
}

       public Label error(Label lbl)
       {
           lbl.ForeColor = System.Drawing.Color.Red;
           return lbl;
       }

       public Label successful(Label lbl)
       {
           lbl.ForeColor = System.Drawing.Color.Green;
           return lbl;
       }

}