using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCareManagement
{
    public partial class SchedulePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var masterPage = (MasterPage)Page.Master;

            if (masterPage == null) return;
            var sideBar = (Menu)masterPage.FindControl("SideBar");

            var item = sideBar.FindItem("schedule");

            if (item == null) return;
            item.Selected = true;
        }
    }
}