using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public string tb;
    public string ord;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["username"] == "ysman")
        {
            if (Request["submit"] != null)
            {
                string table = Request.Form["table"];

                string del_id = Request.Form["del"];
                if (del_id != "")
                {
                    string sqlDel = "DELETE FROM " + table + " WHERE Id = " + del_id + ";";
                    MyAdoHelper.DoQuery("database.mdf", sqlDel);
                }
                string update_row = Request.Form["updaterow"];
                string update_column = Request.Form["colname"];
                string new_val = Request.Form["colval"];
                if (update_row != "")
                {
                    string sqlquery = "UPDATE " + table + " SET " + update_column + " = '" + new_val + "' WHERE Id = " + update_row + ";";
                    MyAdoHelper.DoQuery("Database.mdf", sqlquery);
                }
            }
            string ordercol = Request.Form["order"];
            string sql = "SELECT * FROM [User_Info];";
            string sqlfood = "SELECT * FROM [Orders];";
            if (ordercol != null)
            {
                sql = "SELECT * FROM [User_Info] ORDER BY " + ordercol + ";";
                if (Int32.Parse(ordercol) < 6)
                {
                    sqlfood = "SELECT * FROM [Orders] ORDER BY " + ordercol + ";";
                }
            }

            tb = MyAdoHelper.printDataTable1("database.mdf", sql);
            ord = MyAdoHelper.printDataTable2("Databse.mdf", sqlfood);
            Response.Write("Hello, " + Session["username"] + "!</br>");
            Response.Write("Number of total visits to the site: " + Application["ViewCount"]);
        }
        else
        {
            Response.Redirect("http://localhost:64046/protecteditem.aspx");
            Response.Write("<script>alert('Must be admin to view this page')</script>");
        }
    }
}