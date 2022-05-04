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
            bool flag = false;
            string uname = Request.Form["newuser"];
            if (uname != "")
            {
                string s = "UPDATE [User_Info] SET uname='" + uname + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
                Session["username"] = uname;
                flag = true;
            }
            string fname = Request.Form["firstname"];
            if (fname != "")
            {
                string s = "UPDATE [User_Info] SET fName='" + fname + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
                flag = true;
            }
            string lname = Request.Form["lastname"];
            if (lname != "")
            {
                string s = "UPDATE [User_Info] SET lname='" + lname + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
                flag = true;
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
                    flag = true;
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
                flag = true;
            }

            string bday = Request.Form["birthday"];
            if (bday != "")
            {
                string s = "UPDATE [User_Info] SET birthday='" + bday + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
                flag = true;
            }

            string loc = Request.Form["loc"];
            if (loc != "")
            {
                string s = "UPDATE [User_Info] SET location='" + loc + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
                flag = true;
            }

            string phone = Request.Form["start"] + Request.Form["num"];
            if (phone != "")
            {
                string s = "UPDATE [User_Info] SET phone='" + phone + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
                flag = true;
            }

            string gender = Request.Form["gender"];
            if (gender != null)
            {
                string s = "UPDATE [User_Info] SET gender='" + gender + "' WHERE uname='" + Session["username"] + "';";
                MyAdoHelper.DoQuery("Database.mdf", s);
                flag = true;
            }

            if (flag == true)
            {
                Response.Write("<script>alert('Succesfully updated');</script>");
            }
        }
    }
}