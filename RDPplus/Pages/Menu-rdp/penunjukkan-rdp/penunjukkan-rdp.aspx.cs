using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Menu_rdp.penunjukkan_rdp
{
    public partial class penunjukkan_rdp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                LoadNopek();
                // Ensure panel is hidden initially
                ActionPanel.Visible = false;
            }
        }

        private void LoadNopek()
        {
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT nopek, name FROM employee";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DropDownListNopek.Items.Clear();
                DropDownListNopek.Items.Add(new ListItem("-- Select NOPEK --", ""));
                while (reader.Read())
                {
                    ListItem item = new ListItem(
                        $"{reader["nopek"]} - {reader["name"]}",
                        reader["nopek"].ToString()
                    );
                    DropDownListNopek.Items.Add(item);
                }
            }
        }

        protected void DropDownListNopek_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedNopek = DropDownListNopek.SelectedValue;

            if (!string.IsNullOrEmpty(selectedNopek))
            {

                var employeeDetails = GetEmployeeDetails(selectedNopek);
                if (employeeDetails != null)
                {
                    // panel muncul setelah tidak null
                    ActionPanel.Visible = true;
                    // get data from sql
                    SelectedEmployeeInfo.Text = $"Nopek: {employeeDetails.Nopek}<br/>Name: {employeeDetails.Name}<br/>Position: {employeeDetails.Position}<br/>PRL: {employeeDetails.PRL}";
                }
            }
            else
            {
                ActionPanel.Visible = false;
                SelectedEmployeeInfo.Text = string.Empty;
            }
        }

        private int? GetEmployeeIdFromNopek(string nopek)
        {
            if (string.IsNullOrEmpty(nopek))
                return null;
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT id_employee FROM employee WHERE nopek = @nopek";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@nopek", nopek);
                conn.Open();
                object result = cmd.ExecuteScalar();
                return result != null ? Convert.ToInt32(result) : (int?)null;
            }
        }

        private EmployeeDetails GetEmployeeDetails(string nopek)
        {
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = @"SELECT nopek, name, position, prl 
                               FROM employee 
                               WHERE nopek = @nopek";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@nopek", nopek);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return new EmployeeDetails
                        {
                            Nopek = reader["nopek"].ToString(),
                            Name = reader["name"].ToString(),
                            Position = reader["position"].ToString(),
                            PRL = reader["prl"].ToString()
                        };
                    }
                }
                return null;
            }
        }

        protected void ProcessButton_Click(object sender, EventArgs e)
        {
            string selectedNopek = DropDownListNopek.SelectedValue;
            if (!string.IsNullOrEmpty(selectedNopek))
            {
                // Add your RDP processing logic here

                // Example: Show success message
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    "alert('RDP process initiated for NOPEK: " + selectedNopek + "');", true);
            }
        }

        //
        private class EmployeeDetails
        {
            public string Nopek { get; set; }
            public string Name { get; set; }
            public string Position { get; set; }
            public string PRL { get; set; }

        }
    }
}