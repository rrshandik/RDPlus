using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Menu_rdp.detail_rdp
{
    public partial class detail_rdp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
            }

            //if (Session["username"] == null)
            //{
            //    // Redirect to the login page if the user is not logged in
            //    Response.Redirect("~/adminLogin");
            //}
        }
    }
}