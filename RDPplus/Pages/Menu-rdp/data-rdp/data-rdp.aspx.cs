using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Menu_rdp.data_rdp
{
    public partial class data_rdp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");

            }

            if (Session["username"] == null)
            {
                // Redirect to the login page if the user is not logged in
                Response.Redirect("~/adminLogin");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string keterangan1 = DataBinder.Eval(e.Row.DataItem, "keterangan1")?.ToString();
                if (keterangan1 != null && keterangan1 == "Tidak Layak")
                {

                    foreach (TableCell cell in e.Row.Cells)
                    {
                        cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFE3E4");
                    }

                    e.Row.CssClass = "not-layak-row";
                }
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string keterangan1 = DataBinder.Eval(e.Row.DataItem, "keterangan1")?.ToString();
                if (keterangan1 != null && keterangan1 == "Tidak Layak")
                {

                    foreach (TableCell cell in e.Row.Cells)
                    {
                        cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFE3E4");
                    }

                    e.Row.CssClass = "not-layak-row";
                }
            }
        }
        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string keterangan1 = DataBinder.Eval(e.Row.DataItem, "keterangan1")?.ToString();
                if (keterangan1 != null && keterangan1 == "Tidak Layak")
                {

                    foreach (TableCell cell in e.Row.Cells)
                    {
                        cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFE3E4");
                    }

                    e.Row.CssClass = "not-layak-row";
                }
            }
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string keterangan1 = DataBinder.Eval(e.Row.DataItem, "keterangan1")?.ToString();
                if (keterangan1 != null && keterangan1 == "Tidak Layak")
                {

                    foreach (TableCell cell in e.Row.Cells)
                    {
                        cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFE3E4");
                    }

                    e.Row.CssClass = "not-layak-row";
                }
            }
        }
    }
}