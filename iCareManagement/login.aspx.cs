using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace iCareManagement
{
    public partial class login : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection cn;

        String cnString = System.Configuration.ConfigurationManager.ConnectionStrings["icaredbConnString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Signin_Click(object sender, EventArgs e)
        {
            authentication();
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            Server.Transfer("register.aspx");
        }

        private void authentication()
        {
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmd;
                MySql.Data.MySqlClient.MySqlDataAdapter ada;
                ada = new MySql.Data.MySqlClient.MySqlDataAdapter();
                DataSet ds = new DataSet();
                string sql = @"SELECT COUNT(LOGIN_ID) FROM tbl_users u WHERE u.LOGIN_ID = CAST('" + txt_Username.Text 
                    + "' AS BINARY) and u.PASSWORD = CAST('" + txt_Password.Text + "' AS BINARY) ";
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
                    alert("Tên đăng nhập hoặc mật khẩu sai");
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