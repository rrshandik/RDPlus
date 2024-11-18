using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Menu_rdp.data_rdp.edit_data_rdp
{
    public partial class edit_rdp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                LoadStatus();
                LoadKondisi();
                LoadResidence();
                LoadRDPData();
                LoadNopek();

                //if (Request.QueryString["id"] != null)
                //{
                //    int id = Convert.ToInt32(Request.QueryString["id"]);
                //    LoadRDPdata(id);
                //}
            }
        }

        private void LoadStatus()
        {
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT id_status, nama_status FROM status";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                RadioButtonListStatus.Items.Clear();
                while (reader.Read())
                {
                    ListItem item = new ListItem(
                        reader["nama_status"].ToString(),
                        reader["id_status"].ToString()
                    );
                    RadioButtonListStatus.Items.Add(item);
                }
            }
        }
        private void LoadKondisi()
        {
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT id_ket1, keterangan1 FROM keterangan1";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                DropDownListKondisi.Items.Clear();
                DropDownListKondisi.Items.Add(new ListItem("-- Select Keterangan --", ""));
                while (reader.Read())
                {
                    ListItem item = new ListItem(
                        reader["keterangan1"].ToString(),
                        reader["id_ket1"].ToString()
                    );
                    DropDownListKondisi.Items.Add(item);
                }
            }
        }

        private void LoadResidence()
        {
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT id_residence, residence FROM residence";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                DropDownListResidence.Items.Clear();
                DropDownListResidence.Items.Add(new ListItem("-- Select Residence --", ""));
                while (reader.Read())
                {
                    ListItem item = new ListItem(
                        reader["residence"].ToString(),
                        reader["id_residence"].ToString()
                    );
                    DropDownListResidence.Items.Add(item);
                }
            }
        }

        private void LoadRDPData()
        {
            if (Request.QueryString["id"] != null)
            {
                string id_rdp = Request.QueryString["id"];
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    string query = @"SELECT r.*, e.nopek 
                                   FROM rdp r 
                                   LEFT JOIN employee e ON r.id_employee = e.id_employee 
                                   WHERE r.id_rdp = @id_rdp";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id_rdp", id_rdp);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        LabelIDValue.Text = reader["id_rdp"].ToString();
                        RadioButtonListStatus.SelectedValue = reader["id_status"].ToString();
                        DropDownListKondisi.SelectedValue = reader["id_keterangan1"].ToString();
                        TextBoxKeterangan2.Text = reader["keterangan2"].ToString();
                        TextBoxCluster.Text = reader["cluster"].ToString();
                        DropDownListResidence.SelectedValue = reader["id_residence"].ToString();
                        TextBoxRT.Text = reader["rt"].ToString();
                        TextBoxRW.Text = reader["rw"].ToString();
                        string nopek = reader["nopek"].ToString();
                        if (!string.IsNullOrEmpty(nopek))
                        {
                            DropDownListNopek.SelectedValue = nopek;
                            LoadEmployeeName(nopek);
                        }
                    }
                }
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
            LoadEmployeeName(selectedNopek);
        }
        private void LoadEmployeeName(string nopek)
        {
            if (!string.IsNullOrEmpty(nopek))
            {
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    string query = "SELECT name FROM employee WHERE nopek = @nopek";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@nopek", nopek);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        LabelEmployeeName.Text = reader["name"].ToString();
                    }
                    else
                    {
                        LabelEmployeeName.Text = "Employee not found";
                    }
                }
            }
            else
            {
                LabelEmployeeName.Text = "Select NOPEK to view name";
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

        private bool IsNopekAlreadyAssigned(string nopek, string currentRdpId)
        {
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = @"SELECT COUNT(*) 
                           FROM rdp r 
                           JOIN employee e ON r.id_employee = e.id_employee 
                           WHERE e.nopek = @nopek 
                           AND r.id_rdp != @currentRdpId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@nopek", nopek);
                cmd.Parameters.AddWithValue("@currentRdpId", currentRdpId);

                conn.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                string selectedNopek = DropDownListNopek.SelectedValue;

                // Skip validation if no NOPEK is selected
                if (!string.IsNullOrEmpty(selectedNopek))
                {
                    // Check if NOPEK is already assigned to another RDP
                    if (IsNopekAlreadyAssigned(selectedNopek, LabelIDValue.Text))
                    {
                        LabelMessage.Text = $"Error: NOPEK {selectedNopek} is already assigned to another RDP record!";
                        LabelMessage.ForeColor = Color.Red;

                        // Add JavaScript alert
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
                            $"alert('NOPEK {selectedNopek} is already assigned to another RDP record!');", true);

                        return; // Stop the save process
                    }
                }

                // Get the employee ID from the selected NOPEK
                int? employeeId = GetEmployeeIdFromNopek(selectedNopek);

                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    string query = @"UPDATE rdp 
                               SET id_status = @id_status,
                                   id_keterangan1 = @id_keterangan1,
                                   keterangan2 = @keterangan2,
                                   cluster = @cluster,
                                   id_employee = @id_employee,
                                   id_residence = @id_residence,
                                   rt = @rt,
                                   rw = @rw
                               WHERE id_rdp = @id_rdp";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id_rdp", LabelIDValue.Text);
                    cmd.Parameters.AddWithValue("@id_status", RadioButtonListStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@id_keterangan1", DropDownListKondisi.SelectedValue);
                    cmd.Parameters.AddWithValue("@keterangan2", TextBoxKeterangan2.Text);
                    cmd.Parameters.AddWithValue("@cluster", TextBoxCluster.Text);
                    cmd.Parameters.AddWithValue("@id_residence", DropDownListResidence.SelectedValue);
                    cmd.Parameters.AddWithValue("@id_employee", (object)employeeId ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@rt", TextBoxRT.Text);
                    cmd.Parameters.AddWithValue("@rw", TextBoxRW.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    LabelMessage.Text = "Data updated successfully!";
                    LabelMessage.ForeColor = Color.Green;

                    // Add success message alert
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
                        "alert('Data updated successfully!'); window.location='data-rdp';", true);
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error updating data: " + ex.Message;
                LabelMessage.ForeColor = Color.Red;

                // Add error alert
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
                    $"alert('Error updating data: {ex.Message}');", true);
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            try
            {

                Response.Redirect("data-rdp");
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error: " + ex.Message;
            }

        }
    }
}