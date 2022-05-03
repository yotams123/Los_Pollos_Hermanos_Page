using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class protecteditem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("http://localhost:64046/home.aspx");
            Response.Write("<script>alert('Must be logged in to view this page')</script>");
        }
        Response.Write("Hello, " + Session["username"] + "!<br />");
        Response.Write("Number of total visits to the site: " + Application["ViewCount"]);

        if (Request.Form["submit"] != null)
        {            
            string order = Request.Form["ordersend"];
            string price = Request.Form["price"];
            
            string sqlname = "SELECT fName FROM [User_Info] WHERE uname='" + Session["username"] + "';";
            string name = MyAdoHelper.printDataTable("Database.mdf", sqlname);
            name = name.Substring(26);
            name = name.Substring(0, name.Length - 18);
            
            string sqlLoc = "SELECT location FROM [User_Info] WHERE uname='" + Session["username"] + "';";
            string loc = MyAdoHelper.printDataTable("Database.mdf", sqlLoc);
            loc = loc.Substring(26);
            loc = loc.Substring(0, loc.Length - 18);

            string sqlphone = "SELECT phone FROM [User_Info] WHERE uname='" + Session["username"] + "';";
            string phone = MyAdoHelper.printDataTable("Database.mdf", sqlphone);
            phone = phone.Substring(26);
            phone = phone.Substring(0, phone.Length - 18);

            string sqlInsertOrder = "INSERT INTO [Orders] VALUES ('" + order + "', '" + price + "', '" + name + "', '"
                + loc + "', '"  + phone + "');";
            MyAdoHelper.DoQuery("Database.mdf", sqlInsertOrder);
        }
    }
}