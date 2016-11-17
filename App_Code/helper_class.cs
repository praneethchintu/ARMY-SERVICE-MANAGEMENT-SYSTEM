using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections;
using System.Globalization;

/// <summary>
/// Summary description for helper_class
/// </summary>
public class helper_class
{
    SqlConnection con;
    SqlCommand cmd;
    DataSet ds;
    DataTable dt;
    SqlDataAdapter da;
    SqlDataReader dr;

	public helper_class()
	{
        string constr = ConfigurationManager.ConnectionStrings["constring"].ConnectionString;
        con = new SqlConnection();
        con.ConnectionString = constr;
	}

    public void Load_gridview(SqlCommand cmd, GridView gv)
    {
      
        DataTable dt = ExecuteQueryDT(cmd);
        if (dt.Rows.Count > 0)
        {
            gv.DataSource = dt;
            gv.DataBind();
        }
        else
        {
            gv.DataSource = null;
            gv.DataBind();
        }
        dt.Dispose();
        cmd.Dispose();
    }
  public void Load_CheckBoxList(SqlCommand cmd, CheckBoxList cbl)
    {
        DataTable dt = ExecuteQueryDT(cmd);
        if (dt.Rows.Count > 0)
        {
            cbl.DataTextField = dt.Columns[0].ToString();
            cbl.DataValueField = dt.Columns[1].ToString();
            cbl.DataSource = dt;
            cbl.DataBind();
        }
        else
        {
            cbl.DataSource = null;
            cbl.DataBind();
        }
        dt.Dispose();
        cmd.Dispose();
    }

    public void Load_DropDown(SqlCommand cmd, DropDownList ddl)
    {
        ddl.Items.Clear();
        ddl.SelectedValue = null;
        DataTable dt = ExecuteQueryDT(cmd);
        if (dt.Rows.Count > 0)
        {
            ddl.DataTextField = dt.Columns[0].ToString();
            ddl.DataValueField = dt.Columns[1].ToString();
            ddl.DataSource = dt;
            ddl.DataBind();
        }
        else
        {
            ddl.DataSource = null;
            ddl.DataBind();
        }
        ddl.Items.Insert(0, new ListItem("--select--", "0"));
        dt.Dispose();
        cmd.Dispose();
    }
    public void Guestbind(DropDownList ddl)
    {
        SqlCommand cmddrop = new SqlCommand();
        cmddrop.CommandType = CommandType.Text;
        cmddrop.CommandText = "select roomno,Id from guestinfo where status=1";
        cmddrop.Connection = con;
        dt = new DataTable();
        if (con.State == ConnectionState.Closed)
            con.Open();
        da = new SqlDataAdapter(cmddrop);
        da.Fill(dt);
        con.Close();
        ddl.DataSource = dt;
        ddl.DataTextField = "roomno";
        ddl.DataValueField = "Id";
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("--Room--", "0"));
        ddl.SelectedIndex = 0;

        dt.Dispose();
        cmddrop.Dispose();
    }

    public void categorybind(DropDownList ddl)
    {
       SqlCommand  cmddrop = new SqlCommand();
        cmddrop.CommandType = CommandType.Text;
        cmddrop.CommandText = "select  * from category";
        cmddrop.Connection = con;
        dt = new DataTable();
        if (con.State == ConnectionState.Closed)
            con.Open();
        da = new SqlDataAdapter(cmddrop);
        da.Fill(dt);
        con.Close();
        ddl.DataSource = dt;
        ddl.DataBind();
        ddl.DataTextField = "cat_name";
        ddl.DataValueField = "cat_id";
        dt.Dispose();
        cmddrop.Dispose();  
    }

    public object ExecuteScalar(SqlCommand cmd)
    {
        cmd.Connection = con;
        object obj;
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            obj = cmd.ExecuteScalar();
        }
        catch
        {
            obj = "";
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return obj;
    }

    public DataTable ExecuteQueryDT(SqlCommand cmd)
    {
        cmd.Connection = con;
        ds = new DataSet();      
            if (con.State == ConnectionState.Closed)
                con.Open();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds, "table");
            con.Close();
            cmd.Dispose();
        return ds.Tables["table"];
        //ds.Dispose();       
    }

    public DataSet ExecuteQueryDS(SqlCommand cmd)
    {
        cmd.Connection = con;
        ds = new DataSet();
        //try
        //{
       if (con.State == ConnectionState.Closed)
                con.Open();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds, "table");
        //}
        //catch
        //{
        //}
        //finally
        //{
            con.Close();
            cmd.Dispose();
        //}
        return ds;
        //ds.Dispose();       
    }

    public SqlDataReader ExecuteQueryDR(SqlCommand cmd)
    {
        cmd.Connection = con;
       if (con.State == ConnectionState.Closed)
            con.Open();
       return cmd.ExecuteReader();
    }

    public int ExecuteNonQuery(SqlCommand cmd)
    {
        int i;
       cmd.Connection = con;
        try
        {
            if(con.State==ConnectionState.Closed)
            con.Open();
            i=cmd.ExecuteNonQuery();
        }
        catch(Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return i;
    }

    public int master_save(SqlCommand cmd)
    {
        int k = 0;
        try
        {
            cmd.Connection = con;
            if (con.State == ConnectionState.Closed)
                con.Open();
         k= cmd.ExecuteNonQuery();
           k = 1;                //k=1 for save        
        }
        catch(SqlException exptn)
        {
            k = 2;                      // k=2 for normal error. 

            if (exptn.Number == 2627 || exptn.Number == 2601)   // Duplicate Exception Number 2601
            {
                k = 3;                  // k=3 for Duplicate value
            }
        }

        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return k;
    }

    public string bulkCopy(DataTable dt, string destination_table, String query)
    { 
        string result="";
       
            SqlCommand cmdsql = new SqlCommand();
            cmdsql.Connection = con;
            if (con.State == ConnectionState.Closed)
                con.Open();
            using (SqlBulkCopy bulkcopy = new SqlBulkCopy(con))      //Create object to BulkCopy
            {                
                bulkcopy.DestinationTableName = destination_table;   //Add destination table(Database Table) to bulkcopy
                try
                {
                    bulkcopy.WriteToServer(dt);                      //Copy to DataBase Table
                    result = "Operation completed successfully";
                }
                catch (SqlException e)
                {
                    result = "Operation failed...";
                    cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = query; 
                        
                    if (ExecuteNonQuery(cmd) == 0)
                    {
                        result = "Process failed...";
                    }                   
                }
                finally
                {
                    con.Close();
                }       
            }
            cmdsql.Dispose();
        
        return result;
    }
    
    public string trasactioncmd(SqlCommand cmd1)
    {
       string k = "";
       
        if (con.State == ConnectionState.Closed)
            con.Open();
        SqlTransaction mytrans = con.BeginTransaction();
        cmd1.Connection = con;
        cmd1.Transaction = mytrans;

        try
        {
           k= cmd1.ExecuteScalar().ToString();
            mytrans.Commit();            
        }
        catch (SqlException e)
        {
            try
            {
                mytrans.Rollback();                
            }
            catch (SqlException ex)
            {
               k = "";                
            }
        }
        finally
        {
            con.Close();
        }
        return k;
    }

    public int Transaction_1(SqlCommand cmd1, SqlCommand cmd2, SqlCommand cmd3)
    {
        int k=0;
        //string message = null;
        if(con.State==ConnectionState.Closed)
        con.Open();
        SqlTransaction mytrans = con.BeginTransaction();
        cmd1.Connection = con;
        cmd2.Connection = con;
        cmd3.Connection = con;

        cmd1.Transaction = mytrans;
        cmd2.Transaction = mytrans;
        cmd3.Transaction = mytrans;

        try
        {
            cmd1.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            cmd3.ExecuteNonQuery();
            mytrans.Commit();
            k = 1;
        }
        catch (SqlException e)
        {
            try
            {
                mytrans.Rollback();
            }
            catch (SqlException myex)
            {
                k = 0;
            }           
        }
        finally
        {
            con.Close();
        }
        return k;
    }

    public string TwoCmd_transaction(SqlCommand cmd1, SqlCommand cmd2)
    {
        string message = null;
        if (con.State == ConnectionState.Closed)
        con.Open();
        SqlTransaction Acctrans = con.BeginTransaction();
        cmd1.Connection = con;
        cmd2.Connection = con;

        cmd1.Transaction = Acctrans;
        cmd2.Transaction = Acctrans;

        try
        {
            cmd1.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            Acctrans.Commit();
            message = "Operation Succesfully Completed";
        }
        catch (SqlException e)
        {
            try
            {
                Acctrans.Rollback();
            }
            catch (SqlException myex)
            {
                message = "An exception Of type :" + myex.Message;
            }

            message += "An exception :" + e.Message;
        }
        finally
        {
            con.Close();
        }
        return message;
    }

    public object Num2WordConverter(string Number)
    {
        string Words = null;
        int Length = 0;
        decimal Whole = default(decimal);
        decimal Fraction = default(decimal);
        Whole = Math.Floor(Convert.ToDecimal(Number));
        Number = (Convert.ToDecimal(Number) - Whole).ToString();
        Fraction = Convert.ToDecimal(Number.ToString() + "000");
        Length = Whole.ToString().Length;
        //coz if the fraction part is just 0 it will generate error in substring
        if (Fraction.ToString().Length >= 4)
        {
            Fraction = Convert.ToInt32(Fraction.ToString().Substring(2, 2));
        }
        //For 10 to 99 Crores
        if (Length == 9)
        {
            Words = MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 2))) + " Crore(s)";
            if (Convert.ToInt32(Whole.ToString().Substring(2, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(2, 2))) + " Lac(s)";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(4, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(4, 2))) + " Thousand";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(6, 1)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(6, 1))) + " Hundred";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(7, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(7, 2)));
            }
            Words += " Rupee(s) And " + MakeWord(Convert.ToInt32(Fraction)) + " Paise Only.";
        }
        else if (Length == 8)
        {
            Words = MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 1))) + " Crore(s)";
            if (Convert.ToInt32(Whole.ToString().Substring(1, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(1, 2))) + " Lac(s)";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(3, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(3, 2))) + " Thousand";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(5, 1)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(5, 1))) + " Hundred";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(6, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(6, 2)));
            }
            Words += " Rupee(s) And " + MakeWord(Convert.ToInt32(Fraction)) + " Paise Only.";
        }
        else if (Length == 7)
        {
            Words = MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 2))) + " Lac(s)";
            if (Convert.ToInt32(Whole.ToString().Substring(2, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(2, 2))) + " Thousand";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(4, 1)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(4, 1))) + " Hundred";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(5, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(5, 2)));
            }
            Words += " Rupee(s) And " + MakeWord(Convert.ToInt32(Fraction)) + " Paise Only.";
        }
        else if (Length == 6)
        {
            Words = MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 1))) + " lac(s)";
            if (Convert.ToInt32(Whole.ToString().Substring(1, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(1, 2))) + " Thousand";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(3, 1)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(3, 1))) + " Hundred";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(4, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(4, 2)));
            }
            Words += " Rupee(s) And " + MakeWord(Convert.ToInt32(Fraction)) + " Paise Only.";
        }
        else if (Length == 5)
        {
            Words = MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 2))) + " Thousand";
            if (Convert.ToInt32(Whole.ToString().Substring(2, 1)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(2, 1))) + " Hundred";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(3, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(3, 2)));
            }
            Words += " Rupee(s) And " + MakeWord(Convert.ToInt32(Fraction)) + " Paise Only.";
        }
        else if (Length == 4)
        {
            Words = MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 1))) + " Thousand";
            if (Convert.ToInt32(Whole.ToString().Substring(1, 1)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(1, 1))) + " Hundred";
            }
            if (Convert.ToInt32(Whole.ToString().Substring(2, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(2, 2)));
            }
            Words += " Rupee(s) And " + MakeWord(Convert.ToInt32(Fraction)) + " Paise Only.";
        }
        else if (Length == 3)
        {
            Words = MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 1))) + " Hundred";
            if (Convert.ToInt32(Whole.ToString().Substring(1, 2)) != 0)
            {
                Words += " " + MakeWord(Convert.ToInt32(Whole.ToString().Substring(1, 2)));
            }
            Words += " Rupee(s) And " + MakeWord(Convert.ToInt32(Fraction)) + " Paise Only.";
        }
        else if (Length <= 2)
        {
            Words = MakeWord(Convert.ToInt32(Whole)) + " Rupee(s) And " + MakeWord(Convert.ToInt32(Fraction)) + " Paise Only.";
        }
        else
        {
            Words = "Range Exceeded.";
        }
        return Words;
    }

    private object MakeWord(int Number)
    {
        switch (Number)
        {
            case 0: return "Zero";
            case 1: return "One";
            case 2: return "Two";
            case 3: return "Three";
            case 4: return "Four";
            case 5: return "Five";
            case 6: return "Six";
            case 7: return "Seven";
            case 8: return "Eight";
            case 9: return "Nine";
            case 10: return "Ten";
            case 11: return "Eleven";
            case 12: return "Twelve";
            case 13: return "Thirteen";
            case 14: return "Fourteen";
            case 15: return "Fifteen";
            case 16: return "Sixteen";
            case 17: return "Seventeen";
            case 18: return "Eighteen";
            case 19: return "Nineteen";
            case 20: return "Twenty";
            case 21: return "Twenty One";
            case 22: return "Twenty Two";
            case 23: return "Twenty Three";
            case 24: return "Twenty Four";
            case 25: return "Twenty Five";
            case 26: return "Twenty Six";
            case 27: return "Twenty Seven";
            case 28: return "Twenty Eight";
            case 29: return "Twenty Nine";
            case 30: return "Thirty";
            case 31: return "Thirty One";
            case 32: return "Thirty Two";
            case 33: return "Thirty Three";
            case 34: return "Thirty Four";
            case 35: return "Thirty Five";
            case 36: return "Thirty Six";
            case 37: return "Thirty Seven";
            case 38: return "Thirty Eight";
            case 39: return "Thirty Nine";
            case 40: return "Forty";
            case 41: return "Forty One";
            case 42: return "Forty Two";
            case 43: return "Forty Three";
            case 44: return "Forty Four";
            case 45: return "Forty Five";
            case 46: return "Forty Six";
            case 47: return "Forty Seven";
            case 48: return "Forty Eight";
            case 49: return "Forty Nine";
            case 50: return "Fifty";
            case 51: return "Fifty One";
            case 52: return "Fifty Two";
            case 53: return "Fifty Three";
            case 54: return "Fifty Four";
            case 55: return "Fifty Five";
            case 56: return "Fifty Six";
            case 57: return "Fifty Seven";
            case 58: return "Fifty Eight";
            case 59: return "Fifty Nine";
            case 60: return "Sixty";
            case 61: return "Sixty One";
            case 62: return "Sixty Two";
            case 63: return "Sixty Three";
            case 64: return "Sixty Four";
            case 65: return "Sixty Five";
            case 66: return "Sixty Six";
            case 67: return "Sixty Seven";
            case 68: return "Sixty Eight";
            case 69: return "Sixty Nine";
            case 70: return "Seventy";
            case 71: return "Seventy One";
            case 72: return "Seventy Two";
            case 73: return "Seventy Three";
            case 74: return "Seventy Four";
            case 75: return "Seventy Five";
            case 76: return "Seventy Six";
            case 77: return "Seventy Seven";
            case 78: return "Seventy Eight";
            case 79: return "Seventy Nine";
            case 80: return "Eighty";
            case 81: return "Eighty One";
            case 82: return "Eighty Two";
            case 83: return "Eighty Three";
            case 84: return "Eighty Four";
            case 85: return "Eighty Five";
            case 86: return "Eighty Six";
            case 87: return "Eighty Seven";
            case 88: return "Eighty Eight";
            case 89: return "Eighty Nine";
            case 90: return "Ninety";
            case 91: return "Ninety One";
            case 92: return "Ninety Two";
            case 93: return "Ninety Three";
            case 94: return "Ninety Four";
            case 95: return "Ninety Five";
            case 96: return "Ninety Six";
            case 97: return "Ninety Seven";
            case 98: return "Ninety Eight";
            case 99: return "Ninety Nine";
            default: return "Error";
        }
    }

    public static void ClearTotalFields(ControlCollection pageControls)
    {
        foreach (Control contl in pageControls)
        {
            string strCntName = (contl.GetType()).Name;
            switch (strCntName)
            {
                case "Label":
                    Label lbl = (Label)contl;
                    lbl.Text = "";
                    break;
                case "TextBox":
                    TextBox tbSource = (TextBox)contl;
                    tbSource.Text = "";
                    break;
                case "RadiaButton":
                    RadioButton ss = (RadioButton)contl;
                    ss.Checked = false;
                    break;
                case "CheckBox":
                    CheckBox ckbx = (CheckBox)contl;
                    ckbx.Checked = false;
                    break;
                case "RadioButtonList":
                    RadioButtonList rblSource = (RadioButtonList)contl;
                    rblSource.SelectedIndex = -1;
                    break;
                case "DropDownList":
                    DropDownList ddlSource = (DropDownList)contl;                     
                    if(ddlSource.Items.Count>0)
                    ddlSource.SelectedValue = "0";
                    ddlSource.SelectedIndex = 0;
                    break;
                case "ListBox":
                    ListBox lbsource = (ListBox)contl;
                    lbsource.SelectedIndex = -1;
                    break;
            }
            if ((contl.GetType()).Name != "GridView")
            ClearTotalFields(contl.Controls);
        }
    }

    public void load_months(int m1, int m2, DropDownList ddlMonth)
    {
        ddlMonth.Items.Clear();
        DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
        ListItem li = new ListItem();
        int a, b;
        if (m1 < m2)
        {
            a = m1;
            b = m2;
        }
        else
        {
            a = m2;
            b = m1;
        }
        if (m1 == 12)
        {
            ddlMonth.Items.Add(new ListItem(info.GetMonthName(12), "12"));
            a = 1;
            b = m2;
        }
        ddlMonth.Items.Insert(0, new ListItem("--select--", "0"));
        for (int k = a; k <= b; k++)
        {
            ddlMonth.Items.Add(new ListItem(info.GetMonthName(k), k.ToString()));
        }
       
    }

    public void load_Years(int y1, int y2, DropDownList ddlYear)
    {
        ddlYear.Items.Clear();
        ddlYear.Items.Insert(0, new ListItem("--select--", "0"));
        for (int i = y1; i <= y2; i++)
        {
            ListItem li = new ListItem();
            li.Text = DateTime.Now.Year.ToString();
            li.Value = (Convert.ToInt32(DateTime.Now.Year.ToString())).ToString();
            ddlYear.Items.Add(li);
        }
       
    }

    public void load_monthYear(DropDownList ddlMonth, DropDownList ddlYear, DropDownList ddlQuarterYear)
    {
        DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
        ListItem li = new ListItem();
        for (int k = 1; k < 13; k++)
        {
            ddlMonth.Items.Add(new ListItem(info.GetMonthName(k), k.ToString()));
        }
        ddlMonth.Items.Insert(0, new ListItem("--select--", "0"));
        for (int i = 0; i < 8; i++)
        {
            li = new ListItem();
            li.Text = (Convert.ToInt32(DateTime.Now.Year.ToString()) - i).ToString();
            li.Value = (Convert.ToInt32(DateTime.Now.Year.ToString()) - i).ToString();
            ddlYear.Items.Add(li);
            ddlQuarterYear.Items.Add(li);
        }

        ddlYear.Items.Insert(0, new ListItem("--select--", "0"));
        ddlQuarterYear.Items.Insert(0, new ListItem("--select--", "0"));
    }

    public void load_quarter(DropDownList ddlQuarter)
    {
        
            ////ddlQuarter.Items.Clear();
            ////ddlQuarter.Items.Insert(0, new ListItem("--Select--", "0"));
            ////if (DateTime.Now.Month <= 3)
            ////{
            ////    ddlQuarter.Items.Insert(1, new ListItem("First Quarter", "1"));
            ////}
            ////else if (DateTime.Now.Month <= 6)
            ////{
            ////    ddlQuarter.Items.Add(new ListItem("First Quarter", "1"));
            ////    ddlQuarter.Items.Add(new ListItem("Second Quarter", "2"));
            ////}
            ////else if (DateTime.Now.Month <= 9)
            ////{
            ////    ddlQuarter.Items.Add(new ListItem("First Quarter", "1"));
            ////    ddlQuarter.Items.Add(new ListItem("Second Quarter", "2"));
            ////    ddlQuarter.Items.Add(new ListItem("Third Quarter", "3"));
            ////}
            ////else
            ////{
        //        ddlQuarter.Items.Add(new ListItem("First Quarter", "1"));
        //        ddlQuarter.Items.Add(new ListItem("Second Quarter", "2"));
        //        ddlQuarter.Items.Add(new ListItem("Third Quarter", "3"));
        //        ddlQuarter.Items.Add(new ListItem("Fourth Quarter", "4"));
        //   // }
        //}
        //else
        //{
            ddlQuarter.Items.Clear();
            ddlQuarter.Items.Insert(0, new ListItem("--Select--", "0"));
            ddlQuarter.Items.Add(new ListItem("First Quarter", "1"));
            ddlQuarter.Items.Add(new ListItem("Second Quarter", "2"));
            ddlQuarter.Items.Add(new ListItem("Third Quarter", "3"));
            ddlQuarter.Items.Add(new ListItem("Fourth Quarter", "4"));
       
    }

    public void emp_attend_load_monthYear(DropDownList ddlMonth, DropDownList ddlYear)
    {
        DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
        ListItem li = new ListItem();
        int count = 0;
        for (int k = 1; k < 13; k++)
        {
            ddlMonth.Items.Add(new ListItem(info.GetMonthName(k), k.ToString()));
        }
        ddlMonth.Items.Insert(0, new ListItem("--select--", "0"));
        try
        {
            SqlCommand cmdyear = new SqlCommand("select YEAR(getdate())- year(MIN(cr_date))+1 yearcount from emp_reg", con);
            if (con.State != ConnectionState.Open)
                con.Open();
            count = Convert.ToInt32(cmdyear.ExecuteScalar());
        }
        catch (SqlException ex1)
        {

        }
        finally
        {
            if (con.State != ConnectionState.Closed)
                con.Close();
        }

        for (int i = 0; i < count; i++)
        {
            li = new ListItem();
            li.Text = (Convert.ToInt32(DateTime.Now.Year.ToString()) - i).ToString();
            li.Value = (Convert.ToInt32(DateTime.Now.Year.ToString()) - i).ToString();
            ddlYear.Items.Add(li);
            // ddlQuarterYear.Items.Add(li);
        }

        ddlYear.Items.Insert(0, new ListItem("--select--", "0"));
        // ddlQuarterYear.Items.Insert(0, new ListItem("--select--", "0"));
    }

    public void load_mont_year_quarteryear(DropDownList ddlMonth, DropDownList ddlYear, DropDownList ddlQuarterYear)
    {
        DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
        ListItem liobj = new ListItem();
        int count = 0;
        for (int k = 1; k < 13; k++)
        {
            ddlMonth.Items.Add(new ListItem(info.GetMonthName(k), k.ToString()));
        }
        ddlMonth.Items.Insert(0, new ListItem("--Select--", "0"));

        try
        {
            SqlCommand cmdyear = new SqlCommand("select YEAR(getdate())- year(MIN(cr_date))+1 yearcount from emp_reg", con);
            if (con.State != ConnectionState.Open)
                con.Open();
            count = Convert.ToInt32(cmdyear.ExecuteScalar());
        }
        catch (SqlException ex1) { }
        finally
        {
            if (con.State != ConnectionState.Closed)
                con.Close();
        }

        for (int i = 0; i < count; i++)
        {
            liobj = new ListItem();
            liobj.Text = (Convert.ToInt32(DateTime.Now.Year.ToString()) - i).ToString();
            liobj.Value = (Convert.ToInt32(DateTime.Now.Year.ToString()) - i).ToString();
            ddlYear.Items.Add(liobj);
            ddlQuarterYear.Items.Add(liobj);
        }

        ddlYear.Items.Insert(0, new ListItem("--Select--", "0"));
        ddlQuarterYear.Items.Insert(0, new ListItem("--Select--", "0"));

    }
}