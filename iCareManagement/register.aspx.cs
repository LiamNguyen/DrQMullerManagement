using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iCareManagement
{
    public partial class register : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection cn;

        String cnString = System.Configuration.ConfigurationManager.ConnectionStrings["icaredbConnString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {

        }

        private void registration()
        {
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmd;
                MySql.Data.MySqlClient.MySqlDataAdapter ada;
                MySql.Data.MySqlClient.MySqlCommand cmd1;
                MySql.Data.MySqlClient.MySqlDataAdapter ada1;

                ada = new MySql.Data.MySqlClient.MySqlDataAdapter();
                ada1 = new MySql.Data.MySqlClient.MySqlDataAdapter();

                DataSet ds1 = new DataSet();
                /* ============
                    CONTINUE HERE
                   ============*/
                //string sql1 = @"Select ";
                DataSet ds = new DataSet();
                string sql = @"INSERT INTO tbl_Users(LOGIN_ID, PASSWORD, AUTHID)";
                cn.Open();
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
                ada.SelectCommand = cmd;
                ada.Fill(ds);
                ada.Dispose();
                cmd.Dispose();
                cn.Close();
                if (ds.Tables[0].Rows[0][0].ToString() == "1")
                {
                    Server.Transfer("home.aspx");
                }
                else
                {
                    alert("Không thành công");
                }
            }
            catch
            {
                alert("Không tải được dữ liệu. Vui lòng kiểm tra kết nối mạng.");
            }
        }
        public void alert(String msg)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + msg + "');", true);
        }
    }
}
