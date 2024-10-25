using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Login
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //login button
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('testing');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from admin_login where email='" + TextBox1.Text.Trim() + "' AND password='" + TextBox2.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows)
                {
                    while(dr.Read())
                    {
                        Response.Write("<script>alert('Login Success!');</script>");
                        Session["username"] = dr.GetValue(3).ToString();
                        Session["email"] = dr.GetValue(1).ToString();
                        Session["role"] = "admin";
                        Response.Redirect("~/Pages/Home/Home.aspx");

                    }
                }
                else
                {
                    Response.Write("<script>alert('gaada');</script>"); 
                }
            }
            catch (Exception ex)
            {

            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}