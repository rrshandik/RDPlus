using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Laporan_pemilik
{
    public partial class laporan_pemilik : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, MMMM yyyy");
                GridView1.DataSource = GetDummyData();
                GridView1.DataBind();
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
        private DataTable GetDummyData()
        {
            DataTable dt = new DataTable();

            // Add columns
            dt.Columns.Add("id_employee", typeof(int));
            dt.Columns.Add("alamat", typeof(string));
            dt.Columns.Add("no_rdp", typeof(string));
            dt.Columns.Add("tipe", typeof(string));
            dt.Columns.Add("cluster", typeof(string));
            dt.Columns.Add("nopek", typeof(string));
            dt.Columns.Add("employee", typeof(string));
            dt.Columns.Add("keterangan", typeof(string));
            dt.Columns.Add("bukti", typeof(string));

            // Add dummy rows
            dt.Rows.Add(1, "Jl. Gatot Subroto No. 123", "RDP001", "Premium", "Cluster A", "EMP001", "John Doe", "Aktif", "Ada");
            dt.Rows.Add(2, "Jl. Sudirman No. 456", "RDP002", "Standard", "Cluster B", "EMP002", "Jane Smith", "Pending", "Belum Ada");
           

            return dt;
        }

        
    }
}