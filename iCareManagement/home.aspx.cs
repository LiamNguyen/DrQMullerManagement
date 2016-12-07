﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace iCareManagement
{
    public partial class home : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection cn;

        string cnString = System.Configuration.ConfigurationManager.ConnectionStrings["icaredbConnString"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            getAppointments();
            getAppointmentsManagement();
            if (isFirstLoad.Value == "true")
            {
                lockGeneralApp();
            }
            getDayTimeDataSource();
            getDayTimeDataSourceManagement();
            getVouchersAndLocationsDataSource();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        /*============================================================================
                                    APPOINTMENT PAGE START
          ============================================================================*/

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            grid_Appointment.PageIndex = e.NewPageIndex;
            grid_Appointment.DataBind();
        }

        private void getAppointments()
        {
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmd;
                MySql.Data.MySqlClient.MySqlDataAdapter ada;
                ada = new MySql.Data.MySqlClient.MySqlDataAdapter();
                DataTable dt = new DataTable();
                string sql = @"SELECT tbl_appointments.APPOINTMENT_ID, tbl_vouchers.VOUCHER, tbl_appointments.START_DATE, tbl_appointments.EXPIRED_DATE, tbl_locations.LOCATION_NAME, tbl_customers.CUSTOMER_NAME, tbl_appointments.CREATEDAT
                            FROM tbl_appointments INNER JOIN tbl_vouchers 
                            ON tbl_appointments.VOUCHER_ID = tbl_vouchers.VOUCHER_ID INNER JOIN tbl_locations
                            ON tbl_appointments.LOCATION_ID = tbl_locations.LOCATION_ID INNER JOIN tbl_customers
                            ON tbl_appointments.CUSTOMER_ID = tbl_customers.CUSTOMER_ID
                            WHERE tbl_appointments.ISCONFIRMED = '0' AND tbl_appointments.ACTIVE = '1'
                            ORDER BY tbl_appointments.CREATEDAT DESC";
                cn.Open();
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
                ada.SelectCommand = cmd;
                ada.Fill(dt);
                ada.Dispose();
                cmd.Dispose();
                cn.Close();
                if (dt.Rows.Count > 0)
                {
                    grid_Appointment.DataSource = dt;
                    grid_Appointment.DataBind();
                    grid_Appointment.DataSource = dt;
                    grid_Appointment.HeaderRow.TableSection = TableRowSection.TableHeader;
                    grid_Appointment.GridLines = GridLines.None;
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    grid_Appointment.DataSource = dt;
                    grid_Appointment.DataBind();
                    grid_Appointment.HeaderRow.TableSection = TableRowSection.TableHeader;
                    grid_Appointment.GridLines = GridLines.None;
                }
            }
            catch
            {
                alert("Không tải được dữ liệu. Vui lòng kiểm tra kết nối mạng.");
            }
        }

        private void lockGeneralApp()
        {
            txt_Customer.Enabled = false;
            cmb_Locations.Enabled = false;
            cmb_Vouchers.Enabled = false;
            from.Enabled = false;
            to.Enabled = false;
            cmb_DayOne.Enabled = false;
            cmb_DayTwo.Enabled = false;
            cmb_DayThree.Enabled = false;
            cmb_TimeOne.Enabled = false;
            cmb_TimeTwo.Enabled = false;
            cmb_TimeThree.Enabled = false;
            verification_Code.Enabled = false;

            txt_CustomerManagement.Enabled = false;
            cmb_LocationsManagement.Enabled = false;
            cmb_VouchersManagement.Enabled = false;
            fromManagement.Enabled = false;
            toManagement.Enabled = false;
            cmb_DayOneManagement.Enabled = false;
            cmb_TimeOneManagement.Enabled = false;
            cmb_DayTwoManagement.Enabled = false;
            cmb_TimeTwoManagement.Enabled = false;
            cmb_DayThreeManagement.Enabled = false;
            cmb_TimeThreeManagement.Enabled = false;
            verification_CodeManagement.Enabled = false;
        }

        private void unlockGeneralApp()
        {
            cmb_Locations.Enabled = true;
            cmb_Vouchers.Enabled = true;
            from.Enabled = true;
            to.Enabled = true;
            /*cmb_DayOne.Enabled = true;
            cmb_DayTwo.Enabled = true;
            cmb_DayThree.Enabled = true;
            cmb_TimeOne.Enabled = true;
            cmb_TimeTwo.Enabled = true;
            cmb_TimeThree.Enabled = true;*/
        }

        protected void grid_Appointment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                switch (e.Row.RowType)
                {
                    case DataControlRowType.DataRow:
                        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#eb99ff'; this.style.color='White'; this.style.cursor='pointer'");
                        e.Row.Attributes.Add("onmouseout", String.Format("this.style.color='Black';this.style.backgroundColor='White'"));
                        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grid_Appointment, "Select$" + e.Row.RowIndex);
                        e.Row.ToolTip = "Chọn dòng để xem chi tiết";
                        break;
                }
            }
            catch
            {
                //...throw
            }
        }

        protected void grid_Appointment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lockGeneralApp();
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
                GridViewRow PreviousRow = grid_Appointment.Rows[previousRowIndex];
                //Assign back color to previously selected row
                PreviousRow.BackColor = System.Drawing.Color.White;
            }
            //Get the Command Name
            // string currentCommand = e.CommandName;
            //Get the Selected RowIndex
            int currentRowIndex = Int32.Parse(e.CommandArgument.ToString());
            //Get the GridViewRow from Current Row Index
            GridViewRow row = grid_Appointment.Rows[currentRowIndex];
            //Assign the Back Color to Yellow
            //Change this color as per your need
            row.BackColor = System.Drawing.Color.Purple;
            //Assign the index as PreviousRowIndex
            Session["PreviousRowIndex"] = currentRowIndex;
            Session["APPOINTMENT_ID"] = row.Cells[0].Text;
            fillPanel(row);
        }

        private void alert(String msg)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + msg + "');", true);
        }

        private void fillPanel(GridViewRow row)
        {
            int appointment_ID = Convert.ToInt32(row.Cells[0].Text);
            try
            {
                /*==================
                  Detail Panel
                  ==================
                 */
                txt_Customer.Text = row.Cells[5].Text;
                cmb_Vouchers.ClearSelection();
                cmb_Vouchers.Items.FindByText(row.Cells[1].Text).Selected = true;
                cmb_Locations.ClearSelection();
                cmb_Locations.Items.FindByText(row.Cells[4].Text).Selected = true;
                from.Text = row.Cells[2].Text;
                to.Text = row.Cells[3].Text;
                /*==================
                  Time Panel
                  ==================
                 */
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmd;
                MySql.Data.MySqlClient.MySqlCommand cmdV;
                MySql.Data.MySqlClient.MySqlDataAdapter ada;
                MySql.Data.MySqlClient.MySqlDataAdapter adaV;
                ada = new MySql.Data.MySqlClient.MySqlDataAdapter();
                adaV = new MySql.Data.MySqlClient.MySqlDataAdapter();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string sql = @"SELECT DAY_ID, TIME_ID FROM tbl_AppointmentSchedule WHERE APPOINTMENT_ID = " + appointment_ID + " ORDER BY DAY_ID ASC";
                string sqlV = @"SELECT VERIFICATION_CODE FROM tbl_Appointments WHERE APPOINTMENT_ID = " + appointment_ID;
                cn.Open();
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
                cmdV = new MySql.Data.MySqlClient.MySqlCommand(sqlV, cn);
                ada.SelectCommand = cmd;
                adaV.SelectCommand = cmdV;
                ada.Fill(ds);
                adaV.Fill(dt);
                ada.Dispose();
                adaV.Dispose();
                cmd.Dispose();
                cmdV.Dispose();
                cn.Close();
                /*if (ds.Tables[0].Rows.Count > 0)
                {
                    cmb_DayOne.ClearSelection();
                    cmb_TimeOne.ClearSelection();
                    cmb_DayOne.Items.FindByValue(ds.Tables[0].Rows[0][0].ToString()).Selected = true;
                    cmb_TimeOne.Items.FindByValue(ds.Tables[0].Rows[0][1].ToString()).Selected = true;
                    cmb_DayTwo.Items.FindByValue("8").Selected = true;
                    cmb_TimeTwo.Items.FindByValue("40").Selected = true;
                    cmb_DayThree.Items.FindByValue("8").Selected = true;
                    cmb_TimeThree.Items.FindByValue("40").Selected = true;
                    verification_Code.Text = dt.Rows[0][0].ToString();

                    if (ds.Tables[0].Rows.Count >= 2) {
                        cmb_DayTwo.ClearSelection();
                        cmb_TimeTwo.ClearSelection();
                        cmb_DayTwo.Items.FindByValue(ds.Tables[0].Rows[1][0].ToString()).Selected = true;
                        cmb_TimeTwo.Items.FindByValue(ds.Tables[0].Rows[1][1].ToString()).Selected = true;
                    }

                    if (ds.Tables[0].Rows.Count >= 3)
                    {
                        cmb_DayThree.ClearSelection();
                        cmb_TimeThree.ClearSelection();
                        cmb_DayThree.Items.FindByValue(ds.Tables[0].Rows[2][0].ToString()).Selected = true;
                        cmb_TimeThree.Items.FindByValue(ds.Tables[0].Rows[2][1].ToString()).Selected = true;
                    }
                }*/

                if (ds.Tables[0].Rows.Count == 1)
                {
                    bindFirstCmb(ds);
                }

                if (ds.Tables[0].Rows.Count == 2)
                {
                    bindFirstCmb(ds);
                    bindSecondCmb(ds);
                }

                if (ds.Tables[0].Rows.Count == 3)
                {
                    bindFirstCmb(ds);
                    bindSecondCmb(ds);
                    bindThirdCmb(ds);
                }
                verification_Code.Text = dt.Rows[0][0].ToString();
            }
            catch (Exception)
            {
                alert("Không tải được dữ liệu. Vui lòng kiểm tra kết nối mạng.");
            }
        }

        private void bindFirstCmb(DataSet ds)
        {
            cmb_DayOne.ClearSelection();
            cmb_TimeOne.ClearSelection();
            cmb_DayOne.Items.FindByValue(ds.Tables[0].Rows[0][0].ToString()).Selected = true;
            cmb_TimeOne.Items.FindByValue(ds.Tables[0].Rows[0][1].ToString()).Selected = true;
        }

        private void bindSecondCmb(DataSet ds)
        {
            cmb_DayTwo.ClearSelection();
            cmb_TimeTwo.ClearSelection();
            cmb_DayTwo.Items.FindByValue(ds.Tables[0].Rows[1][0].ToString()).Selected = true;
            cmb_TimeTwo.Items.FindByValue(ds.Tables[0].Rows[1][1].ToString()).Selected = true;
        }

        private void bindThirdCmb(DataSet ds)
        {
            cmb_DayThree.ClearSelection();
            cmb_TimeThree.ClearSelection();
            cmb_DayThree.Items.FindByValue(ds.Tables[0].Rows[2][0].ToString()).Selected = true;
            cmb_TimeThree.Items.FindByValue(ds.Tables[0].Rows[2][1].ToString()).Selected = true;
        }

        private void getDayTimeDataSource()
        {
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmdT;
                MySql.Data.MySqlClient.MySqlCommand cmdD;
                MySql.Data.MySqlClient.MySqlDataAdapter adaT;
                MySql.Data.MySqlClient.MySqlDataAdapter adaD;
                adaT = new MySql.Data.MySqlClient.MySqlDataAdapter();
                adaD = new MySql.Data.MySqlClient.MySqlDataAdapter();
                DataTable dtT = new DataTable();
                DataTable dtD = new DataTable();
                string sqlT = @"SELECT TIME_ID, TIME FROM tbl_Time ORDER BY TIME ASC";
                string sqlD = @"SELECT DAY_ID, DAY FROM tbl_WeekDays ORDER BY DAY_ID ASC";
                cn.Open();
                cmdT = new MySql.Data.MySqlClient.MySqlCommand(sqlT, cn);
                cmdD = new MySql.Data.MySqlClient.MySqlCommand(sqlD, cn);

                adaT.SelectCommand = cmdT;
                adaD.SelectCommand = cmdD;

                adaT.Fill(dtT);
                adaD.Fill(dtD);
                adaT.Dispose();
                adaD.Dispose();
                cmdT.Dispose();
                cmdD.Dispose();
                cn.Close();
                if (dtT.Rows.Count > 0)
                {
                    cmb_TimeOne.DataSource = dtT;
                    cmb_TimeTwo.DataSource = dtT;
                    cmb_TimeThree.DataSource = dtT;

                    cmb_TimeOne.DataValueField = "TIME_ID";
                    cmb_TimeOne.DataTextField = "TIME";

                    cmb_TimeTwo.DataValueField = "TIME_ID";
                    cmb_TimeTwo.DataTextField = "TIME";

                    cmb_TimeThree.DataValueField = "TIME_ID";
                    cmb_TimeThree.DataTextField = "TIME";

                    cmb_TimeOne.DataBind();
                    cmb_TimeTwo.DataBind();
                    cmb_TimeThree.DataBind();
                }

                if (dtD.Rows.Count > 0)
                {
                    cmb_DayOne.DataSource = dtD;
                    cmb_DayTwo.DataSource = dtD;
                    cmb_DayThree.DataSource = dtD;

                    cmb_DayOne.DataValueField = "DAY_ID";
                    cmb_DayOne.DataTextField = "DAY";

                    cmb_DayTwo.DataValueField = "DAY_ID";
                    cmb_DayTwo.DataTextField = "DAY";

                    cmb_DayThree.DataValueField = "DAY_ID";
                    cmb_DayThree.DataTextField = "DAY";

                    cmb_DayOne.DataBind();
                    cmb_DayTwo.DataBind();
                    cmb_DayThree.DataBind();

                    cmb_DayOne.Items.FindByValue("8").Selected = true;
                    cmb_TimeOne.Items.FindByValue("40").Selected = true;
                    cmb_DayTwo.Items.FindByValue("8").Selected = true;
                    cmb_TimeTwo.Items.FindByValue("40").Selected = true;
                    cmb_DayThree.Items.FindByValue("8").Selected = true;
                    cmb_TimeThree.Items.FindByValue("40").Selected = true;
                }
            }
            catch (Exception)
            {
                alert("Không tải được dữ liệu. Vui lòng kiểm tra kết nối mạng.");
            }
        }

        private void getVouchersAndLocationsDataSource()
        {
            if (isFirstLoad.Value == "false")
            {
                return;
            }
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmdT;
                MySql.Data.MySqlClient.MySqlCommand cmdD;
                MySql.Data.MySqlClient.MySqlDataAdapter adaT;
                MySql.Data.MySqlClient.MySqlDataAdapter adaD;
                adaT = new MySql.Data.MySqlClient.MySqlDataAdapter();
                adaD = new MySql.Data.MySqlClient.MySqlDataAdapter();
                DataTable dtT = new DataTable();
                DataTable dtD = new DataTable();
                string sqlT = @"SELECT VOUCHER_ID, VOUCHER FROM tbl_vouchers ORDER BY VOUCHER_ID ASC";
                string sqlD = @"SELECT LOCATION_ID, LOCATION_NAME FROM tbl_locations ORDER BY LOCATION_ID ASC";
                cn.Open();
                cmdT = new MySql.Data.MySqlClient.MySqlCommand(sqlT, cn);
                cmdD = new MySql.Data.MySqlClient.MySqlCommand(sqlD, cn);

                adaT.SelectCommand = cmdT;
                adaD.SelectCommand = cmdD;

                adaT.Fill(dtT);
                adaD.Fill(dtD);
                adaT.Dispose();
                adaD.Dispose();
                cmdT.Dispose();
                cmdD.Dispose();
                cn.Close();
                if (dtT.Rows.Count > 0)
                {
                    cmb_Vouchers.DataSource = dtT;
                    cmb_Vouchers.DataValueField = "VOUCHER_ID";
                    cmb_Vouchers.DataTextField = "VOUCHER";
                    cmb_Vouchers.DataBind();
                }

                if (dtD.Rows.Count > 0)
                {
                    cmb_Locations.DataSource = dtD;
                    cmb_Locations.DataValueField = "LOCATION_ID";
                    cmb_Locations.DataTextField = "LOCATION_NAME";
                    cmb_Locations.DataBind();
                }

                isFirstLoad.Value = "false";
            }
            catch (Exception)
            {
                alert("Không tải được dữ liệu. Vui lòng kiểm tra kết nối mạng.");
            }
        }

        protected void btn_EditGeneralAppInfo_Click(object sender, EventArgs e)
        {
            unlockGeneralApp();
            saveDayTimeState();
            Session["isUpdating"] = true;
        }

        protected void btn_SaveGeneralAppInfo_Click(object sender, EventArgs e)
        {
            if (Session["isUpdating"] == null)
            {
                return;
            }
            if ((Boolean)Session["isUpdating"])
            {
                lockGeneralApp();
                updateAppointmentInfo();
                getAppointments();
                saveDayTimeState();
                Session["isUpdating"] = false;
            }
        }

        private void saveDayTimeState()
        {
            if (Session["PreviousRowIndex"] != null)
            {
                int previousRowIndex = (int)Session["PreviousRowIndex"];
                GridViewRow row = grid_Appointment.Rows[previousRowIndex];
                fillPanel(row);
            }
        }

        private void updateAppointmentInfo()
        {
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmd;
                string sql = @"UPDATE tbl_appointments SET VOUCHER_ID = " + cmb_Vouchers.SelectedValue + ", LOCATION_ID = "
                    + cmb_Locations.SelectedValue + ", START_DATE = DATE_FORMAT(STR_TO_DATE('" + from.Text + "', '%d.%m.%Y'), '%Y.%m.%d'), EXPIRED_DATE = DATE_FORMAT(STR_TO_DATE('" + to.Text + "', '%d.%m.%Y'), '%Y.%m.%d') WHERE APPOINTMENT_ID = "
                    + Session["APPOINTMENT_ID"];
                cn.Open();
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
                int result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    alert("Cập nhật thành công");
                }
                cmd.Dispose();
                cn.Close();
            }
            catch
            {
                alert("Cập nhât không thành công.");
            }
        }

        /*============================================================================
                                    APPOINTMENT PAGE END
          ============================================================================*/


        /*============================================================================
                               APPOINTMENT MANAGEMENT PAGE START
          ============================================================================*/

        private void getAppointmentsManagement()
        {
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmd;
                MySql.Data.MySqlClient.MySqlDataAdapter ada;
                ada = new MySql.Data.MySqlClient.MySqlDataAdapter();
                DataSet ds = new DataSet();
                string sql = @"SELECT tbl_appointments.APPOINTMENT_ID, tbl_vouchers.VOUCHER, tbl_appointments.START_DATE, tbl_appointments.EXPIRED_DATE, tbl_locations.LOCATION_NAME, tbl_customers.CUSTOMER_NAME, tbl_appointments.CREATEDAT
                            FROM tbl_appointments INNER JOIN tbl_vouchers 
                            ON tbl_appointments.VOUCHER_ID = tbl_vouchers.VOUCHER_ID INNER JOIN tbl_locations
                            ON tbl_appointments.LOCATION_ID = tbl_locations.LOCATION_ID INNER JOIN tbl_customers
                            ON tbl_appointments.CUSTOMER_ID = tbl_customers.CUSTOMER_ID
                            WHERE tbl_appointments.ISCONFIRMED = '1' AND tbl_appointments.ACTIVE = '1'
                            ORDER BY tbl_appointments.CREATEDAT DESC";
                cn.Open();
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
                ada.SelectCommand = cmd;
                ada.Fill(ds);
                ada.Dispose();
                cmd.Dispose();
                cn.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    grid_AppointmentManagement.DataSource = ds;
                    grid_AppointmentManagement.DataBind();
                    grid_AppointmentManagement.HeaderRow.TableSection = TableRowSection.TableHeader;
                    grid_AppointmentManagement.GridLines = GridLines.None;
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    grid_AppointmentManagement.DataSource = ds;
                    grid_AppointmentManagement.DataBind();
                    grid_AppointmentManagement.HeaderRow.TableSection = TableRowSection.TableHeader;
                    grid_AppointmentManagement.GridLines = GridLines.None;
                }
            }
            catch
            {
                alert("Không tải được dữ liệu. Vui lòng kiểm tra kết nối mạng.");
            }
        }

        private void getDayTimeDataSourceManagement()
        {
            /*if (isFirstLoad.Value == "false")
            {
                return;
            }*/
            try
            {
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmdT;
                MySql.Data.MySqlClient.MySqlCommand cmdD;
                MySql.Data.MySqlClient.MySqlDataAdapter adaT;
                MySql.Data.MySqlClient.MySqlDataAdapter adaD;
                adaT = new MySql.Data.MySqlClient.MySqlDataAdapter();
                adaD = new MySql.Data.MySqlClient.MySqlDataAdapter();
                DataTable dtT = new DataTable();
                DataTable dtD = new DataTable();
                string sqlT = @"SELECT TIME_ID, TIME FROM tbl_Time ORDER BY TIME ASC";
                string sqlD = @"SELECT DAY_ID, DAY FROM tbl_WeekDays ORDER BY DAY_ID ASC";
                cn.Open();
                cmdT = new MySql.Data.MySqlClient.MySqlCommand(sqlT, cn);
                cmdD = new MySql.Data.MySqlClient.MySqlCommand(sqlD, cn);

                adaT.SelectCommand = cmdT;
                adaD.SelectCommand = cmdD;

                adaT.Fill(dtT);
                adaD.Fill(dtD);
                adaT.Dispose();
                adaD.Dispose();
                cmdT.Dispose();
                cmdD.Dispose();
                cn.Close();
                if (dtT.Rows.Count > 0)
                {
                    cmb_TimeOneManagement.DataSource = dtT;
                    cmb_TimeTwoManagement.DataSource = dtT;
                    cmb_TimeThreeManagement.DataSource = dtT;

                    cmb_TimeOneManagement.DataValueField = "TIME_ID";
                    cmb_TimeOneManagement.DataTextField = "TIME";

                    cmb_TimeTwoManagement.DataValueField = "TIME_ID";
                    cmb_TimeTwoManagement.DataTextField = "TIME";

                    cmb_TimeThreeManagement.DataValueField = "TIME_ID";
                    cmb_TimeThreeManagement.DataTextField = "TIME";

                    cmb_TimeOneManagement.DataBind();
                    cmb_TimeTwoManagement.DataBind();
                    cmb_TimeThreeManagement.DataBind();
                }

                if (dtD.Rows.Count > 0)
                {
                    cmb_DayOneManagement.DataSource = dtD;
                    cmb_DayTwoManagement.DataSource = dtD;
                    cmb_DayThreeManagement.DataSource = dtD;

                    cmb_DayOneManagement.DataValueField = "DAY_ID";
                    cmb_DayOneManagement.DataTextField = "DAY";

                    cmb_DayTwoManagement.DataValueField = "DAY_ID";
                    cmb_DayTwoManagement.DataTextField = "DAY";

                    cmb_DayThreeManagement.DataValueField = "DAY_ID";
                    cmb_DayThreeManagement.DataTextField = "DAY";

                    cmb_DayOneManagement.DataBind();
                    cmb_DayTwoManagement.DataBind();
                    cmb_DayThreeManagement.DataBind();

                    cmb_DayOneManagement.Items.FindByValue("8").Selected = true;
                    cmb_TimeOneManagement.Items.FindByValue("40").Selected = true;
                    cmb_DayTwoManagement.Items.FindByValue("8").Selected = true;
                    cmb_TimeTwoManagement.Items.FindByValue("40").Selected = true;
                    cmb_DayThreeManagement.Items.FindByValue("8").Selected = true;
                    cmb_TimeThreeManagement.Items.FindByValue("40").Selected = true;
                }
            }
            catch (Exception)
            {
                alert("Không tải được dữ liệu. Vui lòng kiểm tra kết nối mạng.");
            }
        }

        protected void grid_AppointmentManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Page"))
            {
                Session["PreviousRowIndexManagement"] = 0;
                return;
            }
            //if (e.CommandName.Equals("select")) { }
            //Check if Session is null or not
            if (Session["PreviousRowIndexManagement"] != null)
            {
                //Get the Previously selected rowindex
                var previousRowIndex = (int)Session["PreviousRowIndexManagement"];
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
            Session["PreviousRowIndexManagement"] = currentRowIndex;
            Session["AppointmentIDManagement"] = row.Cells[0].Text;
            fillPanelManagement(row);
        }

        protected void grid_AppointmentManagement_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                switch (e.Row.RowType)
                {
                    case DataControlRowType.DataRow:
                        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#eb99ff'; this.style.color='White'; this.style.cursor='pointer'");
                        e.Row.Attributes.Add("onmouseout", String.Format("this.style.color='Black';this.style.backgroundColor='White'"));
                        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grid_AppointmentManagement, "Select$" + e.Row.RowIndex);
                        e.Row.ToolTip = "Chọn dòng để xem chi tiết";
                        break;
                }
            }
            catch
            {
                //...throw
            }
        }

        private void fillPanelManagement(GridViewRow row)
        {
            int appointment_ID = Convert.ToInt32(row.Cells[0].Text);
            try
            {
                /*==================
                  Detail Panel
                  ==================
                 */
                txt_CustomerManagement.Text = row.Cells[5].Text;
                cmb_VouchersManagement.ClearSelection();
                cmb_VouchersManagement.Items.FindByText(row.Cells[1].Text).Selected = true;
                cmb_LocationsManagement.ClearSelection();
                cmb_LocationsManagement.Items.FindByText(row.Cells[4].Text).Selected = true;
                fromManagement.Text = row.Cells[2].Text;
                toManagement.Text = row.Cells[3].Text;
                /*==================
                  Time Panel
                  ==================
                 */
                cn = new MySql.Data.MySqlClient.MySqlConnection(cnString);

                MySql.Data.MySqlClient.MySqlCommand cmd;
                MySql.Data.MySqlClient.MySqlCommand cmdV;
                MySql.Data.MySqlClient.MySqlDataAdapter ada;
                MySql.Data.MySqlClient.MySqlDataAdapter adaV;
                ada = new MySql.Data.MySqlClient.MySqlDataAdapter();
                adaV = new MySql.Data.MySqlClient.MySqlDataAdapter();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                string sql = @"SELECT DAY_ID, TIME_ID FROM tbl_AppointmentSchedule WHERE APPOINTMENT_ID = " + appointment_ID + " ORDER BY DAY_ID ASC";
                string sqlV = @"SELECT VERIFICATION_CODE FROM tbl_Appointments WHERE APPOINTMENT_ID = " + appointment_ID;
                cn.Open();
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, cn);
                cmdV = new MySql.Data.MySqlClient.MySqlCommand(sqlV, cn);
                ada.SelectCommand = cmd;
                adaV.SelectCommand = cmdV;
                ada.Fill(ds);
                adaV.Fill(dt);
                ada.Dispose();
                adaV.Dispose();
                cmd.Dispose();
                cmdV.Dispose();
                cn.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    cmb_DayOneManagement.ClearSelection();
                    cmb_TimeOneManagement.ClearSelection();
                    cmb_DayOneManagement.Items.FindByValue(ds.Tables[0].Rows[0][0].ToString()).Selected = true;
                    cmb_TimeOneManagement.Items.FindByValue(ds.Tables[0].Rows[0][1].ToString()).Selected = true;
                    cmb_DayTwoManagement.Items.FindByValue("8").Selected = true;
                    cmb_TimeTwoManagement.Items.FindByValue("40").Selected = true;
                    cmb_DayThreeManagement.Items.FindByValue("8").Selected = true;
                    cmb_TimeThreeManagement.Items.FindByValue("40").Selected = true;
                    verification_CodeManagement.Text = dt.Rows[0][0].ToString();

                    if (ds.Tables[0].Rows.Count >= 2)
                    {
                        cmb_DayTwoManagement.ClearSelection();
                        cmb_TimeTwoManagement.ClearSelection();
                        cmb_DayTwoManagement.Items.FindByValue(ds.Tables[0].Rows[1][0].ToString()).Selected = true;
                        cmb_TimeTwoManagement.Items.FindByValue(ds.Tables[0].Rows[1][1].ToString()).Selected = true;
                    }

                    if (ds.Tables[0].Rows.Count >= 3)
                    {
                        cmb_DayThreeManagement.ClearSelection();
                        cmb_TimeThreeManagement.ClearSelection();
                        cmb_DayThreeManagement.Items.FindByValue(ds.Tables[0].Rows[2][0].ToString()).Selected = true;
                        cmb_TimeThreeManagement.Items.FindByValue(ds.Tables[0].Rows[2][1].ToString()).Selected = true;
                    }
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    grid_AppointmentManagement.DataSource = ds;
                    grid_AppointmentManagement.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void grid_AppointmentManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_AppointmentManagement.PageIndex = e.NewPageIndex;
            grid_AppointmentManagement.DataBind();
        }

        /*============================================================================
                               APPOINTMENT MANAGEMENT PAGE END
          ============================================================================*/
    }
}