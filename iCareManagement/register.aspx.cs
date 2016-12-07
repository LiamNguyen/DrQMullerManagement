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
            registration();
        }

        private void registration()
        {
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmd;
                MySql.Data.MySqlClient.MySqlDataAdapter ada1;
                MySql.Data.MySqlClient.MySqlDataAdapter ada2;
                MySql.Data.MySqlClient.MySqlDataAdapter ada3;

                DataTable dt1 = new DataTable(); //Authentication
                DataTable dt2 = new DataTable(); //Check Username Existence
                DataTable dt3 = new DataTable(); //Check Authentication Code Existence

                string sql1 = @"SELECT AUTHID FROM tbl_authentication WHERE AUTHID = '" + txt_AuthID.Text + "'";
                string sql = @"INSERT INTO tbl_users(LOGIN_ID, PASSWORD, AUTHID) VALUES ('" + txt_Username.Text + "', '" + txt_Password.Text + "', '" + txt_AuthID.Text + "')";
                string sql2 = @"SELECT USER_ID FROM tbl_users WHERE LOGIN_ID = '" + txt_Username.Text + "'";
                string sql3 = @"SELECT USER_ID FROM tbl_users WHERE AUTHID = '" + txt_AuthID.Text + "'";

                cn.Open();
                ada1 = new MySql.Data.MySqlClient.MySqlDataAdapter(sql1, cn);
                ada1.Fill(dt1);
                ada1.Dispose();

                ada2 = new MySql.Data.MySqlClient.MySqlDataAdapter(sql2, cn);
                ada2.Fill(dt2);
                ada2.Dispose();

                ada3 = new MySql.Data.MySqlClient.MySqlDataAdapter(sql3, cn);
                ada3.Fill(dt3);
                ada3.Dispose();

                if (dt1.Rows.Count <= 0)
                {
                    alert("Xin vui lòng kiểm tra lại mã bảo mật của bạn hoặc bạn không có quyền truy cập vào trang web này");
                    return;
                }

                if (dt2.Rows.Count > 0)
                {
                    alert("Tên đăng nhập đã được sử dụng, xin vui lòng chọn tên đăng nhập khác");
                }

                if (dt3.Rows.Count > 0)
                {
                    alert("Xin vui lòng kiểm tra lại mã bảo mật");
                }

                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
                int result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                if (result == 1)
                {
                    Server.Transfer("home.aspx");
                }
                else
                {
                    alert("Đăng ký không thành công");
                }
                cn.Close();
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
