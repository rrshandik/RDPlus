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

                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    LoadRDPdata(id);
                }
            }
        }

        private void LoadRDPdata(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select * from rdp where id_rdp = @id", con);
                    cmd.Parameters.AddWithValue("id", id);  

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        LabelIDValue.Text = id.ToString();
                        TextBoxRT.Text = dr["rt"].ToString();
                        TextBoxRW.Text = dr["rw"].ToString();
                    }
                    else
                    {
                        LabelMessage.Text = "RDP not found";
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
                    SqlCommand cmd = new SqlCommand("update rdp SET rt = @rt, rw = @rw WHERE id_rdp = @id", con);
                    cmd.Parameters.AddWithValue("rt", TextBoxRT.Text);
                    cmd.Parameters.AddWithValue("rw", TextBoxRW.Text);
                    cmd.Parameters.AddWithValue("id", Convert.ToInt32(LabelIDValue.Text));
                    cmd.ExecuteNonQuery();

                    Response.Redirect("data-rdp");

                }
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}