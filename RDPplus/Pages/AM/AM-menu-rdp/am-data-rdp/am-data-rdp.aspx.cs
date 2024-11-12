using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.AM.AM_menu_rdp.am_data_rdp
{
    public partial class am_data_rdp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                BindGridView();

            }

            if (Session["username"] == null)
            {
                Response.Redirect("~/");
            }
        }

        private void BindGridView()
        {
            // Create a list of anonymous objects to hold our data
            var data = new List<object>
        {
            new {
                id_rdp = 1,
                alamat = "Jl. Sudirman No. 123",
                no_rdp = "RDP001",
                tipe = "Tipe A",
                cluster = "Cluster 1",
                nopek = "EMP001",
                employee = "John Doe",
                kondisi = "Baik",
                status = "Aktif",
                keterangan = "Rumah Dinas"
            },
            new {
                id_rdp = 2,
                alamat = "Jl. Thamrin No. 456",
                no_rdp = "RDP002",
                tipe = "Tipe B",
                cluster = "Cluster 2",
                nopek = "EMP002",
                employee = "Jane Smith",
                kondisi = "Perlu Perbaikan",
                status = "Dalam Review",
                keterangan = "Maintenance Scheduled"
            },
            new {
                id_rdp = 3,
                alamat = "Jl. Gatot Subroto No. 789",
                no_rdp = "RDP003",
                tipe = "Tipe A",
                cluster = "Cluster 1",
                nopek = "EMP003",
                employee = "Bob Johnson",
                kondisi = "Baik",
                status = "Aktif",
                keterangan = "Regular Check Complete"
            }
        };

            GridView1.DataSource = data;
            GridView1.DataBind();
            GridView2.DataSource = data;
            GridView2.DataBind();
            GridView3.DataSource = data;
            GridView3.DataBind();
            GridView4.DataSource = data;
            GridView4.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string kondisi = DataBinder.Eval(e.Row.DataItem, "kondisi")?.ToString();

                if (kondisi != "Baik")
                {
                    // This will color the entire row
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFE3E4");
                }
            }
        }


    }
}