using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Menu_rdp.lelang_rdp
{
    public partial class lelang_rdp : System.Web.UI.Page
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblRowNumber = (Label)e.Row.FindControl("lblRowNumber");
                if (lblRowNumber != null)
                {
                    lblRowNumber.Text = (e.Row.RowIndex + 1).ToString();
                }
            }
        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblRowNumber = (Label)e.Row.FindControl("lblRowNumber");
                if (lblRowNumber != null)
                {
                    lblRowNumber.Text = (e.Row.RowIndex + 1).ToString();
                }
            }
        }
    }
}