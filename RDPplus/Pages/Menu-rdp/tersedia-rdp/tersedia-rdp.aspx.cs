using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Menu_rdp.tersedia_rdp
{
    public partial class tersedia_rdp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                LoadPeriodeLelang();
            }

            if (Session["username"] == null)
            {
                Response.Redirect("~/adminLogin");
            }
        }

        private void LoadPeriodeLelang()
        {
            var periodeData = SqlDataSourcePeriodeLelang.Select(DataSourceSelectArguments.Empty) as DataView;
            if (periodeData != null && periodeData.Count > 0)
            {
                DateTime startDate = Convert.ToDateTime(periodeData[0]["start_date"]);
                DateTime endDate = Convert.ToDateTime(periodeData[0]["end_date"]);
                string periodeLelangText = $" {startDate.ToShortDateString()} - {endDate.ToShortDateString()}";
                lblPeriodeLelang.Text = periodeLelangText;
                lblPeriodeLelang2.Text = periodeLelangText;
                lblPeriodeLelang3.Text = periodeLelangText;
                lblPeriodeLelang4.Text = periodeLelangText;


            }
        }

        [System.Web.Services.WebMethod]
        public static string SaveAuctionPeriod(string startDate, string endDate)
        {
            try
            {
                DateTime start = DateTime.ParseExact(startDate, "dd/MM/yyyy", null);
                DateTime end = DateTime.ParseExact(endDate, "dd/MM/yyyy", null);

                string connectionString = ConfigurationManager.ConnectionStrings["RDPlusConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(@"
                        INSERT INTO periode_lelang (start_date, end_date, created_at)
                        VALUES (@StartDate, @EndDate, GETDATE())", conn))
                    {
                        cmd.Parameters.AddWithValue("@StartDate", start);
                        cmd.Parameters.AddWithValue("@EndDate", end);
                        cmd.ExecuteNonQuery();
                    }
                }
                return "success";
            }
            catch (Exception ex)
            {
                return "error: " + ex.Message;
            }
        }

        protected void btnTawarkan_Click(object sender, EventArgs e)
        {
            List<int> selectedRDPs = new List<int>();

            // Process GridView1
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkTawarkan = row.FindControl("chkTawarkan") as CheckBox;
                if (chkTawarkan != null && chkTawarkan.Checked)
                {
                    int idRdp = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    selectedRDPs.Add(idRdp);
                }
            }

            // Process GridView2
            foreach (GridViewRow row in GridView2.Rows)
            {
                CheckBox chkTawarkan = row.FindControl("chkTawarkan") as CheckBox;
                if (chkTawarkan != null && chkTawarkan.Checked)
                {
                    int idRdp = Convert.ToInt32(GridView2.DataKeys[row.RowIndex].Value);
                    selectedRDPs.Add(idRdp);
                }
            }

            if (selectedRDPs.Count > 0)
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RDPlusConnectionString"].ConnectionString))
                    {
                        conn.Open();
                        foreach (int idRdp in selectedRDPs)
                        {
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO lelang (id_rdp, opened_at) VALUES (@idRdp, @openedAt)", conn))
                            {
                                cmd.Parameters.AddWithValue("@idRdp", idRdp);
                                cmd.Parameters.AddWithValue("@openedAt", DateTime.Now);
                                cmd.ExecuteNonQuery();
                            }
                        }
                    }

                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Data berhasil ditawarkan!'); window.location.reload();", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Silakan pilih RDP untuk ditawarkan.');", true);
            }
        }
    }
}