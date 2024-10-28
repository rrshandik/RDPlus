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

                   
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void SqlDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}
