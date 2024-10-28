using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Employee_Data.employee_edit
{
    public partial class employee_edit : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");

                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    LoadEmployeeData(id);
                }
            }
        }
        private void LoadEmployeeData(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT email_employee, name FROM employee WHERE id_employee = @id", con);
                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        LabelIDValue.Text = id.ToString();
                        TextBoxEmail.Text = dr["email_employee"].ToString();
                        TextBoxName.Text = dr["name"].ToString();
                    }
                    else
                    {
                        LabelMessage.Text = "Employee not found.";
                    }
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error: " + ex.Message;
            }
        }


        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE employee SET email_employee = @Email, name = @Name WHERE id_employee = @id", con);
                    cmd.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    cmd.Parameters.AddWithValue("@Name", TextBoxName.Text);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(LabelIDValue.Text));

                    cmd.ExecuteNonQuery();
                    Response.Redirect("employee-data");
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error: " + ex.Message;
            }

        }
    }
}