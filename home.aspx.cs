using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("Guest<br />");
        }
        else
        {
            Response.Write("Hello, " + Session["username"] + "!<br />");
        }
        if(Session["FirstView"] == null)
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
    }
}