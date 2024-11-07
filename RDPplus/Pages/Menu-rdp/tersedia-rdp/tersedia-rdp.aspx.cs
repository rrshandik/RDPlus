using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
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
                var periodeData = SqlDataSourcePeriodeLelang.Select(DataSourceSelectArguments.Empty) as DataView;
                if (periodeData != null && periodeData.Count > 0)
                {
                    DateTime startDate = Convert.ToDateTime(periodeData[0]["start_date"]);
                    DateTime endDate = Convert.ToDateTime(periodeData[0]["end_date"]);

                    // Mengubah teks pada header
                    string periodeLelangText = $" {startDate.ToShortDateString()} - {endDate.ToShortDateString()}";
                    lblPeriodeLelang.Text = periodeLelangText; // Menggunakan label untuk menampilkan
                    lblPeriodeLelang2.Text = periodeLelangText; // Menggunakan label untuk menampilkan

                }
            }

        }

        [System.Web.Services.WebMethod]
        public static string SaveAuctionPeriod(string startDate, string endDate)
        {
            try
            {
                // Convert date format from dd/MM/yyyy to yyyy-MM-dd for SQL Server
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
    }
}