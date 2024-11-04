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
            if (!IsPostBack)
            {
                if (Session["role"] == "admin")
                {https://localhost:44356/Site1.Master.cs
                    DropDownList1.Visible = true; // Show logout button
                    //BtnLogout.Visible = true;
                }


                else
                {
                    navDataPegawai.Visible = false;
                    navRDP.Visible = false;
                    DropDownList1.Visible = false;
    
                    A2.Visible = false;
                    //sidebar.Visible = false;
                    //navbar.Visible = false;
                }
            }

            // Determine the current page and set the active class
            string currentPage = Request.Path.ToLower();

            if (currentPage.Contains("homepage"))
            {
                A2.Attributes["class"] += " active";
            }
            else if (currentPage.Contains("data-rdp"))
            {
                navRDP.Attributes["class"] += " active";
            }
            else if (currentPage.Contains("employee-data"))
            {
                navDataPegawai.Attributes["class"] += " active";
            }
            else if (currentPage.Contains("Pages/Home/Home.aspx"))
            {
                A2.Attributes["class"] += " active";
            }
            else if (currentPage.Contains("menu-rdp"))
            {
                navRDP.Attributes["class"] += " active";
            }

            

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // Arahkan ke halaman login.aspx
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            // Optionally, you can abandon the session
            Session.Abandon();
            // Redirect to the login page

            Response.Redirect("~/Pages/Login/Login.aspx");

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "2")
            {
                // Your logout code goes here
                Session.Clear(); // Clear the session
                Session.Abandon(); // Abandon the session
                Response.Redirect("~/Pages/Login/Login.aspx"); // Redirect to the login page or any page you want
            }
        }

    }
}