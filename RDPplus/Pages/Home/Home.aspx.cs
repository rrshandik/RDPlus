using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using RDPplus.Pages.Menu_rdp.data_rdp;

namespace RDPplus
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GridView1.DataBind();
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
            }

            if (Session["username"] == null)
            {
                // Redirect to the login page if the user is not logged in
                Response.Redirect("~/adminLogin");
            }
            if (Session["role"] == "admin")
            {
                data_rdp.HRef = "~/data-rdp";
            }
            else if (Session["role"] == "assetmanager")
            {
                data_rdp.HRef = "~/am-data-rdp";

            }
        }
        
        
    }
}