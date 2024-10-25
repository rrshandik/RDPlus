using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace RDPplus.Pages.Employee_Data
{
    public partial class employee_data : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                LoadEmployeeData(); // Load the employee data on initial load
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            // You can add any additional logic here if needed
        }

        private void LoadEmployeeData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT id_employee, email_employee, name, nopek, PRL, position, points, phone, section FROM employee", con);
                    SqlDataReader dr = cmd.ExecuteReader();

                    // No need to set DataSource here since we are using DataSourceID
                    //GridView1.DataSource = dr; // Remove this line
                    //GridView1.DataBind(); // Remove this line
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }


        

    }
}
