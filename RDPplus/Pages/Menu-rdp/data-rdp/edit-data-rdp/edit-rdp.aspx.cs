using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd mm yyyy");
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
                    string query = @"SELECT * FROM rdp WHERE id_rdp = @id_rdp";
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
                        reader["nopek"].ToString(),
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
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    string query = "SELECT name FROM employee WHERE nopek = @nopek";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@nopek", selectedNopek);

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

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    string query = @"UPDATE rdp 
                                   SET id_status = @id_status,
                                       id_keterangan1 = @id_keterangan1,
                                       keterangan2 = @keterangan2,
                                       cluster = @cluster,
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
                    cmd.Parameters.AddWithValue("@rt", TextBoxRT.Text);
                    cmd.Parameters.AddWithValue("@rw", TextBoxRW.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    LabelMessage.Text = "Data updated successfully!";
                    LabelMessage.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("data-rdp");
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error updating data: " + ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}