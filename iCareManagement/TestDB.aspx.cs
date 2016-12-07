using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using Newtonsoft.Json;

namespace iCareManagement
{
    public partial class TestDB : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection cn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        MySql.Data.MySqlClient.MySqlDataAdapter ada;
        String cnString = System.Configuration.ConfigurationManager.ConnectionStrings["icaredbConnString"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            /*cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);
            ada = new MySql.Data.MySqlClient.MySqlDataAdapter();
            DataSet ds = new DataSet();
            string sql = "SELECT * FROM icaredb.tbl_time";
            cn.Open();
            cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
            ada.SelectCommand = cmd;
            ada.Fill(ds);
            ada.Dispose();
            cmd.Dispose();
            cn.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                grid_ASP.DataSource = ds;
                grid_ASP.DataBind();
                grid_ASP.HeaderRow.TableSection = TableRowSection.TableHeader;
                grid_ASP.GridLines = GridLines.None;
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                grid_ASP.DataSource = ds;
                grid_ASP.DataBind();
                grid_ASP.HeaderRow.TableSection = TableRowSection.TableHeader;
                grid_ASP.GridLines = GridLines.None;
            }*/
        }

        protected void btn_Test_Click(object sender, EventArgs e)
        {
            try
            {
                String cnString = System.Configuration.ConfigurationManager.ConnectionStrings["icaredbConnString"].ToString();

                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);
                cn.Open();

                String sql = "INSERT INTO icaredb.tbl_WeekDays (DAY) VALUE ('Testing')";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
                cmd.ExecuteReader();
                cn.Close();

            }
            catch (Exception)
            {
                throw;
            }
            
        }

        [WebMethod]
        public static string getTime()
        {
            String cnString = System.Configuration.ConfigurationManager.ConnectionStrings["icaredbConnString"].ToString();
            MySql.Data.MySqlClient.MySqlConnection cn;
            cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);
            DataSet ds = new DataSet();
            MySql.Data.MySqlClient.MySqlDataAdapter ada = new MySql.Data.MySqlClient.MySqlDataAdapter();

            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand();

            string sql = "SELECT * FROM icaredb.tbl_time";
            cn.Open();
            cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
            cmd.ExecuteNonQuery();
            ada.Fill(ds);
            ada.Dispose();
            cmd.Dispose();
            cn.Close();
            return Newtonsoft.Json.JsonConvert.SerializeObject(ds.Tables[0]);
        }
    }
}