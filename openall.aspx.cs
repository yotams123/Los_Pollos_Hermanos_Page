using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class openall : System.Web.UI.Page
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
        

        if (Session["username"] == null)
        {
            Response.Write("Guest <br />");
        }
        else
        {
            Response.Write("Hello, " + Session["username"] + "!<br />");
        }
        Response.Write("Number of total visits to the site: " + Application["ViewCount"]);
    }
}