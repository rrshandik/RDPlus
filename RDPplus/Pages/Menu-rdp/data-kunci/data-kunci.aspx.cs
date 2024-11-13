using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RDPplus.Pages.Menu_rdp.pengembalian_kunci_rdp
{
    public partial class pengembalian_kunci_rdp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyyy");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Status = DataBinder.Eval(e.Row.DataItem, "Status")?.ToString();
                if (Status != null && Status == "Open")
                {

                    foreach (TableCell cell in e.Row.Cells)
                    {
                        cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFE3E4");
                    }
                    e.Row.CssClass = "not-layak-row";

                    // Find and check the checkbox
                    CheckBox chk = e.Row.FindControl("StatusCheckBox") as CheckBox;
                    if (chk != null)
                    {
                        chk.Checked = true;
                        chk.Enabled = false; 
                    }
                }
            }
        }
    }
}