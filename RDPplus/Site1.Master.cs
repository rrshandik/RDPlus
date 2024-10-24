using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Reset active class for all navigation items
            navHome.Attributes["class"] = "nav-link";
            navDataPegawai.Attributes["class"] = "nav-link";
            navRDP.Attributes["class"] = "nav-link";

            // Determine the current page and set the active class
            string currentPage = Request.Path.ToLower();

            if (currentPage.Contains("home.aspx"))
            {
                navHome.Attributes["class"] += " active";
            }
            else if (currentPage.Contains("datapegawai.aspx"))
            {
                navDataPegawai.Attributes["class"] += " active";
            }
            else if (currentPage.Contains("rdp.aspx"))
            {
                navRDP.Attributes["class"] += " active";
            }

        }
    }
}