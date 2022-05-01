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
            Response.Write("<script>alert('" + order + "');</script>");
        }
    }
}