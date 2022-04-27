using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
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
        }
        if (Request.Form["submit"] != null)
        {
            string firstname = Request.Form["firstname"];
            string lastname = Request.Form["lastname"];
            string newuser = Request.Form["newuser"];
            string newpass = Request.Form["newpass"];
            string mail = Request.Form["mail"];
            string birthday = Request.Form["birthday"];
            string loc = Request.Form["loc"];
            string phone = Request.Form["start"] + Request.Form["num"];
            string gender = Request.Form["gender"];
            string mailcheck = "SELECT * FROM [User_Info] WHERE mail='" + mail + "';";
            string usercheck = "SELECT * FROM [User_Info] WHERE uname='" + newuser + "';";
            string sql = "INSERT INTO[User_Info] (fName, lname, uname, pass, mail, phone, birthday, gender, location) VALUES('" +
                firstname + "', '" + lastname + "', '" + newuser + "', '" + newpass + "', '" +
                mail + "', '" + phone + "', '" + birthday + "', '" + gender + "', '" + loc + "');";
            if (MyAdoHelper.IsExist("Database.mdf", mailcheck))
            {
                Response.Write("<script>alert('User already exists with that email')</script>");
            }
            else
            {
                if (MyAdoHelper.IsExist("Database.mdf", usercheck))
                {
                    Response.Write("<script>alert('User already exists with that username')</script>");
                }
                else
                {
                    MyAdoHelper.DoQuery("Database.mdf", sql);
                    Session["username"] = newuser;
                    Response.Redirect("http://localhost:64046/home.aspx");
                }
            }
        }
    }
}