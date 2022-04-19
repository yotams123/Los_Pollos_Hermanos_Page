using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstView"] == null)
        {
            Application.Lock();
            if (Application["ViewCount"] == null)
            {
                Application["ViewCount"] = 1;
            }
            else
            {
                Application["ViewCount"] = (int)Application["ViewCount"] + 1;
            }
            Application.UnLock();
            Session["FirstView"] = "no";
        }
        Response.Write("Number of total visits to the site: " + Application["ViewCount"]);

        if (Session["username"] != null)
        {
            Response.Redirect("http://localhost:64046/home.aspx");
            Response.Redirect("<script>alert('Already logged in')</script>");
        }
        else
        {
            if (Request.Form["submit"] != null)
            {
                string user = Request.Form["user"];
                string pass = Request.Form["pass"];
                string logcheck = "SELECT * FROM [User_Info] WHERE uname = '" + user + "' AND pass = '" + pass + "';";
                if (MyAdoHelper.IsExist("Database.mdf", logcheck))
                {
                    Session["username"] = user;
                    Response.Redirect("http://localhost:64046/protecteditem.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Wrong username or password')</script>");
                }
            }
        }
    }
}