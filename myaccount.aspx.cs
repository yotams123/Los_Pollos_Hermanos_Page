using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("http://localhost:64046/home.aspx");
        }

        Response.Write("Number of total visits to the site: " + Application["ViewCount"]);

        if (Request.Form["submit"] != null)
        {
            string uname = Request.Form["newuser"];
            if (uname != "")
            {
                string s = "UPDATE [User_Info] SET uname='" + uname + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
                Session["username"] = uname;
            }
            string fname = Request.Form["firstname"];
            if (fname != "")
            {
                string s = "UPDATE [User_Info] SET fName='" + fname + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
            }
            string lname = Request.Form["lastname"];
            if (lname != "")
            {
                string s = "UPDATE [User_Info] SET lname='" + lname + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
            }
            string newpass = Request.Form["newpass"];
            if (newpass != "")
            {
                string currpass = Request.Form["currpass"];
                string passcheck = "SELECT * FROM [User_Info] WHERE uname = '" + Session["username"] + "' AND pass = '" + currpass + "';";
                if (MyAdoHelper.IsExist("Database.mdf", passcheck))
                {
                    string s = "UPDATE [User_Info] SET pass='" + newpass + "' WHERE uname='" + Session["username"] + "';";
                    MyAdoHelper.DoQuery("Database.mdf", s);
                }
                else
                {
                    Response.Write("<script>alert('Current password incorrect')</script>");
                }
            }
            string mail = Request.Form["mail"];
            if (mail != "")
            {
                string s = "UPDATE [User_Info] SET mail='" + mail + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
            }
        }
    }
}