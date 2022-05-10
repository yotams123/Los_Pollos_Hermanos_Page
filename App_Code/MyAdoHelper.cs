using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// Summary description for MyAdoHelper
/// SQL SERVER
///  App_Data 

public class MyAdoHelper
{
    public MyAdoHelper()
    {

    }

    public static SqlConnection ConnectToDb(string fileName)
    {
        string path = HttpContext.Current.Server.MapPath("App_Data/");
        path += fileName;
        //string path = HttpContext.Current.Server.MapPath("App_Data/" + fileName);
        string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\yotam\OneDrive\Desktop\Computer Science\Y11\YotamSoudryWebPage\App_Data\Database.mdf';Integrated Security=True";

        SqlConnection conn = new SqlConnection(connString);
        return conn;

    }

    public static void DoQuery(string fileName, string sql)
    {

        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand com = new SqlCommand(sql, conn);
        com.ExecuteNonQuery();
        com.Dispose();
        conn.Close();
    }

    /// To Execute update / insert / delete queries
    public static int RowsAffected(string fileName, string sql)
    {

        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand com = new SqlCommand(sql, conn);
        int rowsA = com.ExecuteNonQuery();
        conn.Close();
        return rowsA;
    }

    public static bool IsExist(string fileName, string sql)
    {
        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand com = new SqlCommand(sql, conn);
        SqlDataReader data = com.ExecuteReader();
        bool found;
        found = (bool)data.Read();
        conn.Close();
        return found;
    }

    public static DataTable ExecuteDataTable(string fileName, string sql)
    {
        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlDataAdapter tableAdapter = new SqlDataAdapter(sql, conn);
        DataTable dt = new DataTable();
        tableAdapter.Fill(dt);
        return dt;
    }

    public static void ExecuteNonQuery(string fileName, string sql)
    {
        SqlConnection conn = ConnectToDb(fileName);
        conn.Open();
        SqlCommand command = new SqlCommand(sql, conn);
        command.ExecuteNonQuery();
        conn.Close();
    }

    public static string printDataTable(string fileName, string sql)
    {
        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {
                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";
        return printStr;
    }

    public static string printDataTable1(string fileName, string sql)
    {
        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        printStr += "<tr>";
        printStr += "<td>Id</td>";
        printStr += "<td>fName</td>";
        printStr += "<td>lname</td>";
        printStr += "<td>uname</td>";
        printStr += "<td>pass</td>";
        printStr += "<td>mail</td>";
        printStr += "<td>phone</td>";
        printStr += "<td>birthday</td>";
        printStr += "<td>gender</td>";
        printStr += "<td>location</td>";
        printStr += "</tr>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {
                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";
        return printStr;
    }

    public static string printDataTable2(string fileName, string sql)
    {
        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        printStr += "<tr>";
        printStr += "<td>Id</td>";
        printStr += "<td>Content</td>";
        printStr += "<td>TotalPrice</td>";
        printStr += "<td>Name</td>";
        printStr += "<td>Location</td>";
        printStr += "<td>Phone</td>";
        printStr += "</tr>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {
                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";
        return printStr;
    }
}