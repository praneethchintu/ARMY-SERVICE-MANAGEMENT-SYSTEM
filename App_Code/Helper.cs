using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Helper
/// </summary>
public class Helper
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
    SqlCommand cmd = null;
    SqlDataAdapter da = null;
    DataSet ds = null;
	public Helper()
	{
        //
		// TODO: Add constructor logic here
		//
    }

//string must contains two coloumns(value feild and text feild)
    public int FillDropDownTwo(string str, DropDownList ddl)
    {
        try
        {
            cmd = new SqlCommand(str, con);
            if (con.State != ConnectionState.Open)
                con.Open();
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds, "tabel");
            if (con.State != ConnectionState.Closed)
                con.Close();
            cmd.Dispose();
            ddl.Items.Clear();
            ddl.AppendDataBoundItems = true;
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl.DataSource = ds;
                ddl.DataTextField = ds.Tables[0].Columns[0].ColumnName;
                ddl.DataValueField = ds.Tables[0].Columns[1].ColumnName;
                ddl.DataBind();
            }
            ddl.Items.Insert(0, new ListItem("--Select--", "0"));
            return 1;
        }

        catch (Exception ex)
        {
            throw ex;
        }
    }


    public int ExecuteNonQuery(SqlCommand cmd1)
    {
        try
        {        
            cmd1.Connection = con;
            if (con.State != ConnectionState.Open)
                con.Open();
            int i = cmd1.ExecuteNonQuery();         
            return i;
        }
        catch (SqlException ex)
        {
            return 0;
        }
        finally
        {
            if (con.State != ConnectionState.Closed)
                con.Close();    
            cmd1.Dispose();
        }

    }

    public DataSet BindGrid(string str)
    {
        DataSet ds = null;
        try
        {
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd = new SqlCommand(str, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds, "table1");
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally
        {
            if (con.State != ConnectionState.Closed)
                con.Close();
            cmd.Dispose();
        }
        return ds;        
    }



    public DataSet Select(SqlCommand cmd)
    {
        cmd.Connection = con;
        if (con.State == ConnectionState.Closed)
            con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Table1");
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
            return i;
        }
        catch (SqlException ex1)
        {
            return 0;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }

    }
}