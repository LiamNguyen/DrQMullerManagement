using System;
using System.Web.UI.WebControls;

namespace iCareManagement
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var masterPage = (MasterPage) Page.Master;

            if (masterPage == null) return;
            var sideBar = (Menu) masterPage.FindControl("SideBar");

            var item = sideBar.FindItem("home");

            if (item == null) return;
            item.Selected = true;
        }
    }
}