using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

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
        }
        
        
    }
}