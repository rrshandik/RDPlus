using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Login
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Hardcoded usernames, passwords, and roles
        private const string AdminUsername = "admin";
        private const string AdminPassword = "admin123";
        private const string AdminEmail = "admin@example.com";
        private const string AdminRole = "admin";

        private const string AssetManagerUsername = "assetmanager";
        private const string AssetManagerPassword = "asset123";
        private const string AssetManagerEmail = "assetmanager@example.com";
        private const string AssetManagerRole = "assetmanager";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //login button
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Check if the entered username and password match either user
                if (TextBox1.Text.Trim() == AdminUsername && TextBox2.Text.Trim() == AdminPassword)
                {
                    // Admin login
                    Response.Write("<script>alert('Login Success!');</script>");
                    Session["username"] = AdminUsername;
                    Session["email"] = AdminEmail;
                    Session["role"] = AdminRole;
                    Response.Redirect("~/Pages/Home/Home.aspx");
                }
                else if (TextBox1.Text.Trim() == AssetManagerUsername && TextBox2.Text.Trim() == AssetManagerPassword)
                {
                    // Asset Manager login
                    Response.Write("<script>alert('Login Success!');</script>");
                    Session["username"] = AssetManagerUsername;
                    Session["email"] = AssetManagerEmail;
                    Session["role"] = AssetManagerRole;
                    Response.Redirect("~/Pages/Home/Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Pengguna tidak ditemukan!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
