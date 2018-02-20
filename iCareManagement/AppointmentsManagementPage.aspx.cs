using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCareManagement
{
    public partial class AppointmentsManagementPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var masterPage = (MasterPage)Page.Master;

            if (masterPage == null) return;
            var sideBar = (Menu)masterPage.FindControl("SideBar");

            var item = sideBar.FindItem("appointmentsManagement");

            if (item == null) return;
            item.Selected = true;

        }
        protected void Grid_AppointmentManagement_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType != DataControlRowType.DataRow) return;

                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#eb99ff'; this.style.color='White'; this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", string.Format("this.style.color='Black';this.style.backgroundColor='White'"));
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grid_AppointmentManagement, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Chọn dòng để xem chi tiết";
            }
            catch
            {
                //...throw
            }
        }

        protected void Grid_AppointmentManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Page"))
            {
                Session["PreviousRowIndex"] = 0;
                return;
            }
            //if (e.CommandName.Equals("select")) { }
            //Check if Session is null or not
            if (Session["PreviousRowIndex"] != null)
            {
                //Get the Previously selected rowindex
                var previousRowIndex = (int)Session["PreviousRowIndex"];
                //Get the previously selected row
                GridViewRow PreviousRow = grid_AppointmentManagement.Rows[previousRowIndex];
                //Assign back color to previously selected row
                PreviousRow.BackColor = System.Drawing.Color.White;
            }
            //Get the Command Name
            // string currentCommand = e.CommandName;
            //Get the Selected RowIndex
            int currentRowIndex = Int32.Parse(e.CommandArgument.ToString());
            //Get the GridViewRow from Current Row Index
            GridViewRow row = grid_AppointmentManagement.Rows[currentRowIndex];
            //Assign the Back Color to Yellow
            //Change this color as per your need
            row.BackColor = System.Drawing.Color.Purple;
            //Assign the index as PreviousRowIndex
            Session["PreviousRowIndex"] = currentRowIndex;
            Session["APPOINTMENT_ID"] = row.Cells[0].Text;
            //fillPanel(row);
        }

        protected void Grid_AppointmentManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_AppointmentManagement.PageIndex = e.NewPageIndex;
            grid_AppointmentManagement.DataBind();
        }
    }
}